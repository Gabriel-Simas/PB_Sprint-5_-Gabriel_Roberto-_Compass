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

