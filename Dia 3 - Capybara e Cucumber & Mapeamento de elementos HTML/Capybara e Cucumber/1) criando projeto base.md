## 1) Criando Projeto Base

Olá pessoal, finalmente nós iremos dar o primeiro passo em direção a automação com ruby e capybara, é óbvio que ainda é uma longa jornada, ainda iremos evoluir bastante mas nós vamos começar simples, com o capybara e o cucumber puro, sem nenhum outro padrão envolvido.

Basicamente o que nós iremos precisar da documentação do capybara, a documentação dele é bem rica, tudo o que a gente vai precisar é possível encontrar no github deles [teamcapybara](https://github.com/teamcapybara/capybara).

Então a primeira coisa que nós iremos fazer é começar a configurar o nosso projeto, então é muito importante prestar atenção nas instruções a seguir.

Você vai acessar o seu computador, ir até o disco c, lá você deve criar uma pasta chamada Projetos, dentro desta pasta você irá criar outra pasta chamada CapybaraCucumber.

Dentro da pasta CapybaraCucumber você irá clicar com o botão direito de seu mouse e apertar em abrir o terminal, no meu caso eu utilizo o PowerShell, pois já tenho familiaridade, porém também recomendo o Cmder.
___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/26b7651f-a042-4f60-9baa-961962b738fb)
___

Agora dentro do terminal você deve executar o comando `code .` e abrir o VS Code.
___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/5f269ecf-32ec-4a31-8f98-4de772195135)
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/a50c5374-f7ed-424a-93a7-0cd9738d3092)
___

Uma vez dentro do VS Code nós iremos criar um arquivo chamado "Gemfile", aqui nós iremos colocar as gems que iremos utilizar ao decorrer do projeto.
___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/34980d03-bbbf-426b-9edc-d58938ffc64c)
___

As gems que utilizaremos hoje são: Claro, vou falar um pouco sobre cada uma das gems de teste que você mencionou: Cucumber, Capybara, Selenium WebDriver e RSpec. Essas gems são amplamente utilizadas na área de desenvolvimento de software para a criação e execução de testes automatizados em projetos.

Confira logo abaixo um breve resumo sobre as principais características das gems com as quais iremos trabalhar.

1. **Cucumber**:
O Cucumber é uma ferramenta de teste de comportamento (Behavior-Driven Development - BDD) que permite que equipes de desenvolvimento e testes escrevam testes em linguagem natural, usando a sintaxe "Given-When-Then". Ele permite criar descrições legíveis de cenários de teste que são compreensíveis tanto para desenvolvedores quanto para não desenvolvedores. Cada cenário escrito em Cucumber é traduzido em código executável que interage com o sistema sob teste. Ele ajuda a garantir que o software atenda aos requisitos especificados e que os comportamentos esperados sejam mantidos.

2. **Capybara**:
Capybara é uma biblioteca de automação de testes especialmente projetada para simular a interação do usuário com um aplicativo da web. Ela oferece uma API simples para escrever testes de integração e aceitação em um estilo semelhante ao BDD. Capybara permite que você escreva testes que navegam pelo aplicativo, preencham formulários, cliquem em botões e verifiquem resultados. Essa gem é frequentemente usada com outras ferramentas, como RSpec e Selenium WebDriver, para criar testes robustos e abrangentes.

3. **Selenium WebDriver**:
O Selenium WebDriver é uma ferramenta popular para automação de testes de interface do usuário em aplicativos da web. Ele fornece uma API para interagir com navegadores da web como se fosse um usuário real. Isso permite a execução de ações como clicar em botões, preencher campos, navegar entre páginas e verificar elementos na página. O Selenium WebDriver suporta vários navegadores, como Chrome, Firefox, Safari, entre outros, permitindo testar a compatibilidade multi-navegador de um aplicativo.

4. **RSpec**:
O RSpec é um framework de teste para a linguagem de programação Ruby. Ele permite escrever testes unitários e de integração de maneira legível e organizada. O RSpec segue uma sintaxe "describe-it" que se aproxima da linguagem natural, facilitando a compreensão dos cenários de teste. Ele ajuda os desenvolvedores a especificar o comportamento esperado de seus componentes e classes, garantindo que o código funcione corretamente. Além disso, o RSpec é altamente extensível e pode ser combinado com outras gems, como o Capybara, para testes de aceitação e integração.

Em resumo, essas gems são ferramentas essenciais para a criação de testes automatizados eficazes em projetos de desenvolvimento de software. Cada uma delas desempenha um papel específico no processo de teste, desde a descrição de comportamentos até a simulação de interações do usuário e a verificação do funcionamento correto do código.

Agora que nós já temos uma melhor noção sobre o papel de cada gem, vamos retornar ao nosso arquivo "Gemfile" no VS Code.

Primeiro nós começamos com:

```ruby
source 'http://rubygems.org'
```

Agora iremos declarar as demais gems:

```ruby
gem 'cucumber'
gem 'capybara'
gem 'selenium-webdriver', '~> 3.142'
gem 'rspec'
```

Após isso nós salvamos o arquivo e em nosso terminal nós executamos o comando `bundle install`, esse comando irá instalar as depêndencias das gems para conseguirmos executar o projeto.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/a200ded2-545e-4c70-a26c-556706b72825)

Após você pressionar enter ele irá começar a instalar as dependências, você verá o seguinte processo ocorrendo:

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/f0dc3d77-1135-4ec8-957c-12e41ea9acb2)


Depois desse processo será gerado um arquivo "Gemfile.lock", significa que tudo correu bem, agora vamos partir para o cucumber.

Para iniciar o cucumber utilize o comando:

```powershell
cucumber --init
```

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/91d4ac42-dfa3-4adb-b066-5a9ddcb2b032)
___

Como a gente já instalou as gems o cucumber pode ser chamado dessa forma, mas caso não funcione utilize esse outro método:

```powershell
bundle exec cucumber --init
```

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/c650d7f5-99e0-4a91-8edb-5bcef2efab6e)
___

Ele irá retornar algo como:

```powershell
create  features
create  features/step_definitions
create  features/support
create  features/support/env.rb
```

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/f5d7d96b-512f-4142-a369-f3ac5edabc0d)
___

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/95d0ec45-49cd-48c3-9c90-15f7c384cacd)
___

Criados os arquivos, nós podemos ir lá no VS Code conferir tudo isso, agora a gente já tem uma estrutura base para criar os nosso primeiros testes, o "env.rb" é o nosso arquivo de configuração padrão, o que nós teremos que fazer, nós temos que dar um require em tudo o que iremos utilizar nesse projeto, não necessáriamente tudo, existem algumas exceções.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/5f726519-9046-4fd1-a72a-f9e08dfde03f)
___

Mas vamos logo pra ação, nós começamos com:

```ruby
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
```

Como dito anteriormente existem algumas exceções, no caso do capybara é informado em sua [página do GitHub](https://github.com/teamcapybara/capybara) que para se utilizar o capybara em conjunto com o cucumber deve se utilizar esse método:

```ruby
require 'capybara/cucumber'
```

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/1a9e112c-a280-41b7-8490-56adbf05121d)
___

Ok, agora iremos configurar o nosso driver, vamos utilizar o seguinte driver:

```ruby
Capybara.default_driver = :selenium_chrome
```

Deve ficar dessa forma:

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/96139edb-f3ae-4eef-9831-8931ef6b508a)
___

Feito isso, agora nós iremos apertar com o botão direito do mouse e ir até o campo criar uma nova pasta, o nome dessa pasta será "specs".

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/fa8a26ae-f734-421c-be4f-b88f09aa7f3c)
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/16256b7f-02ec-45d0-b7a7-eaf60e254c9d)
___

Novamente utilizando o botão direito, desta vez nós iremos criar um arquivo, seu nome será "google" e a extensão ".feature".

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/ad8cce76-a2af-40ce-8871-094f2b13fba8)
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/fed33aca-972c-47e5-8ca3-41afe635b9e2)

Agora que criamos o arquivo eu irei descrever o cenário em Gherkin, recomendo que caso tenha dúvidas quanto ao próximo passo, retorne e reveja os conteúdos dos módulos anteriores.

O documento ficou da seguinte forma:

```gherkin
Feature: Google

Scenario: Carregar a página do Google
    Given que acesse a home
    Then deverá exibir o logo da Google
```

Já descrevemos o nosso cenário, fica claro que a intenção é testar se o browser irá abrir, então vamos testar em nosso terminal.

Para rodar nosso amiguinho em nosso terminal basta executar o seguinte comando:

```powershell
bundle exec cucumber
```

Ele me retornou o seguinte:

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/b3887f18-a906-471e-8002-7862d70a4935)
___

Parece que ocorreu um erro, mas isso já era esperado, nós ainda não colocamos nada de concreto, o programa precisa de uma série de etapas para poder executar esses testes, o gherkin sozinho não é capaz de faze-lo, portanto vamos explicar para o computador passo a passo o que ele deve fazer.

O terminal inclusive nos orienta como nós podemos implementar esse processo.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/d3777b55-3fe7-4842-89b6-8ce8720e1dc7)
___

Então vamos em "steps_definitions", nós vamos criar um arquivo "google.rb", nele nós iremos colar o seguinte código.

```ruby
Given('que acesse a home') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('deverá exibir o logo da Google') do
    pending # Write code here that turns the phrase above into concrete actions
end
```

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/c0a7f7fd-0f2d-4dff-a30f-1827cef98717)
___

Agora nós só precisamos preencher esses campos com os códigos que permitiram o programa executar os testes.

No caso de acessar a página do Google, o capybara utiliza o `visit`, ficaria dessa forma.

```ruby
visit('https://www.google.com.br/')
```

Ficaria dessa forma:

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/26264b62-2019-4209-9b01-e2fa81a00dab)
___

Agora vamos testar novamente, `bundle exec cucumber`.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/ac9cf260-2fd8-4ee0-81d2-c38dbf54e2ab)
___

Como vocês podem ver agora ele funcionou, devemos agorar preencher o nosso segundo passo.

Primeiro para isso você precisa Inspecionar a página do Google e descobrir o id ou a classe do logo da Google.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/a4e6dddb-c6c9-4046-b915-73513a40fc49)
___

Aqui é possível observar que a class do logo da Google é "lnXdpd".

Agora cole código abaixo ele irá verificar alguns se encontra essa classe em meio ao css da página inicial do Google.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/1406fde0-95bc-4b51-9349-0e12eed1c76a)
___

Vamos executar, `bundle exec cucumber`.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/c6e1e230-3bea-4139-b9ad-96070ba28dfa)
___
