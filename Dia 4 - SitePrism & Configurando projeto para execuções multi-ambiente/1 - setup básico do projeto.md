## 1) Setup Básico do Projeto

Sejam bem-vindos a mais um módulo da nossa Sprint, nesse módulo nós iremos aprender as configurações iniciais de um projeto com o SitePrism.

### O que é o SitePrism?

O SitePrism é um DSL de page objects model para o Capybara, quer dizer que ele é como se fosse uma abstração além do que o próprio Capybara faz, a ideia do SitePrism é facilitar a nossa vida na hora de mapear elementos, lidar com page objects, principalmente quando se trata de projetos de automação com Ruby, ainda mais quando a gente fala de um projeto de maiores proporções.

### Início

Vamos começar dentro da pasta projetos, lá nós iremos criar uma pasta "siteprismcucumber", tendo criado está pasta vamos abrir o terminal, lembrando clicando na pasta com o botão direito e descendo até a opção de abrir com o terminal.

Uma vez no terminal, execute o comando `code .` para abrir o VS Code, agora nós já estamos com o VS Code e o Terminal abertos em nossa pasta.

Agora dentro do VS Code, crie um arquivo "Gemfile", nele nós iremos colocar as gems que utilizaremos nesse projeto.

Deve ficar dessa forma:

**Gemfile**
```ruby
source 'https://rubygems.org'

gem 'cucumber'
gem 'capybara'
gem 'site_prism'
gem 'selenium-webdriver', '~> 3.142'
gem 'rspec'
```

Lembre de salvar o arquivo, agora no terminal, execute `bundle install`, dessa forma iremos instalar todas as gems contidas no arquivo **Gemfile**.

Após executar esse comando, aguarde enquanto ele instala as gems, após execute o comando `ls` no terminal, esse comando lista as pastas e arquivos no local, você pode ver que foi gerado um arquivo **Gemfile.lock**, isso significa que a instalação correu bem.

Prosseguindo, agora vamos retornar ao terminal nele execute `cucumber --init`, esse comando irá preparar o ambiente para nós.

Após alguns segundos, execute `ls` novamente, você verá que foi criado uma pasta **features**.

Voltando ao VS Code, vamos abrir a features/support/env.rb lá em **env.rb** nós iremos copiar o que escrevemos na **Gemfile** e colar no arquivo **env.rb**.

Ficaria dessa forma:

**env.rb**
```ruby
source 'https://rubygems.org'

gem 'cucumber'
gem 'capybara'
gem 'site_prism'
gem 'selenium-webdriver', '~> 3.142'
gem 'rspec'
```

Agora nós iremos retirar o `source 'https://rubygems.org'`, substituir o termo `gem` por `require` e adicionar mais um `require 'capybara/cucumber'`, logo abaixo do `require 'capybara'`.

Deve ficar dessa forma:

**env.rb**
```ruby
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec'
```

Agora vamos definir o driver e o endereço web padrão da aplicação.

**env.rb**
```ruby
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.google.com.br'
```

Dentro de **features** vamos criar uma pasta **specs**, dentro de **specs** vamos criar um arquivo **google.feature**, nele nós iremos colocar o nosso Gherkin, utilizar todo aquele sistema de funcionalidade e cenários.


**google.feature**
```gherkin
Feature: Google

Scenario: Carregar a página do Google
    Given que esteja na home
    Then deverá apresentar o logo da Google
```

Vamos rodar o programa no terminal `cucumber`, ele vai nos informar que nós não definimos ações concretas, copie o texto de exemplo que aparecerá na tela.

Exemplo do terminal.

```ruby
Given('que esteja na home') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('deverá apresentar o logo da Google') do
    pending # Write code here that turns the phrase above into concrete actions
end
```

Agora dentro de **step_definitions** crie um arquivo **google.rb**, nele nós iremos colar o trecho de código que nós copiamos acima.

**google.rb**
```ruby
Given('que esteja na home') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('deverá apresentar o logo da Google') do
    pending # Write code here that turns the phrase above into concrete actions
end
```

Vamos dar uma modificada nele, vamos apagar esse `pending # Write code here that turns the phrase above into concrete actions`.

**google.rb**
```ruby
Given('que esteja na home') do
    
end
  
Then('deverá apresentar o logo da Google') do
    
end
```

Deixaremos ele dessa forma, vamos em **feature** nele nós iremos criar uma pasta **page_objects**, dentro dela criar um arquivo **home.rb**, nesse arquivo nós iremos colocar aquela barra que falta para a url lá no **env.rb** no `Capybara.app_host = 'https://www.google.com.br'`, dessa forma quando carregarmos essa página nós iremos carregar a página do google. Nós também iremos setar ele para herdar do `SitePrism::Page`.

**home.rb**
```ruby
class Home < SitePrism::Page
    set_url '/'

end
```

Agora nós iremos usar um ferramenta do SitePrism que nos permite setar uma varivel que carregará as informações do nosso elemento, no nosso caso a gente quer verificar se a página carregou e se o logo do Google está visível, então nós iremos até a página de início do Google e inspecionar o logo para conseguirmos mais informações para nossa ferramenta de busca.

![2](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/57ca9440-785a-4927-9155-ebe5521786d6)
___

Você pode observar na print que a `class` do nosso logo da Google é `lnXdpd`, agora só para garantir que não ajam outros elementos com a mesma classe nós realizaremos uma breve pesquisa, lembrando atalho (**Ctrl** + **F**).

![2](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/f4bd3c7b-f45f-4456-8bd8-e1ad587867f8)
___

Ok, nós podemos observar que de fato só existe um elemento `img` com a `class="lnXdpd"`, nós iremos utilizar essas informações que colhemos na página inicial do Google em nossa ferramenta de busca do SitePrism.

A ferramenta funciona assim `element :um_nome_que_inventamos_para_o_elemento, 'img[class="lnXdpd"]'`.

Ficaria dessa forma.

**home.rb**
```ruby
class Home < SitePrism::Page
    set_url '/'

    element :logo, 'img[class="lnXdpd"]'
end
```

Retornando ao arquivo **google.rb** nós iremos preencher aquelas duas lacunas agora.

Vamos nos atentar ao `Given` primeiramente, nele nós iremos chamar a `class Home` e definir um comando para carregá-la, consequentemente carregando a nossa página do Google também.

```ruby
Given('que esteja na home') do
    @home_page = Home.new
    @home_page.load
end
```

Ok, agora iremos prosseguir para o `Then`, nele iremos realizar a verificação do nosso logo.

```ruby
Then('deverá apresentar o logo da Google') do
    expect(@home_page).to have_logo
end
```

O documento ficaria dessa forma:

**google.rb**
```ruby
Given('que esteja na home') do
    @home_page = Home.new
    @home_page.load
end
  
Then('deverá apresentar o logo da Google') do
    expect(@home_page).to have_logo
end
```

Executando `cucumber` no terminal, podemos constatar que os testes passarão.
