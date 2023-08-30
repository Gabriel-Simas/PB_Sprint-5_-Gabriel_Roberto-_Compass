## 1) Criando Projeto Base

Olá pessoal, finalmente nós iremos dar o primeiro passo em direção a automação com ruby e capybara, é óbvio que ainda é uma longa jornada, ainda iremos evoluir bastante mas nós vamos começar simples, com o capybara e o cucumber puro, sem nenhum outro padrão envolvido.

Basicamente o que nós iremos precisar da documentação do capybara, a documentação dele é bem rica, tudo o que a gente vai precisar é possível encontrar no github deles [teamcapybara](https://github.com/teamcapybara/capybara).

Então a primeira coisa que nós iremos fazer é começar a configurar o nosso projeto, então é muito importante prestar atenção nas instruções a seguir.

Você vai acessar o seu computador, ir até o disco c, lá você deve criar uma pasta chamada Projetos, dentro desta pasta você irá criar outra pasta chamada CapybaraCucumber.

Dentro da pasta CapybaraCucumber você irá clicar com o botão direito de seu mouse e apertar em abrir o terminal.
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
