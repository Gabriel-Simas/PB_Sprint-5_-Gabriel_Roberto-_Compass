## 3) Page Objects com Capybara II

Sejam muito bem-vindos a mais um módulo, iremos dar prosseguimento ao conteúdo de page objects com Capybara, lembrando que nós não iremos nos aprofundar muito no Capybara, pois o objetivo não é utilizar o Capybara puro, nas próximas aulas também utilizaremos de outras ferramentas.

Antes de prosseguirmos para os próximos conteúdos, nós iremos realizar mais uma melhoria em nosso código.

Reelembrando:

**env.rb**
```ruby
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'capybara/cucumber'

Capybara.default_driver = :selenium_chrome
```

**google.feature**
```gherkin
Feature: Google

Scenario: Carregar a página do Google
    Given que acesse a home
    Then deverá exibir o logo da Google

Scenario: Buscar por Compass
    Given que acesse a home
    When buscar por "Compass"
    Then deverão ser encontrados resultados
```

**google.rb**
```ruby
Given('que acesse a home') do
    @google_home = GoogleHome.new
    @google_home.load
end
  
Then('deverá exibir o logo da Google') do
    expect(@google_home).to have_css '.lnXdpd'
end

When('buscar por {string}') do |termo|
    @google_home.search_for(termo)
    @google_results = GoogleResults.new
end
  
Then('deverão ser encontrados resultados') do
    expect(@google_results).to have_content 'Jeep Compass'
end
```

**google_home.rb**
```ruby
class GoogleHome
    include Capybara::DSL

    def load
        visit('https://www.google.com.br/')
    end

    def search_for(query)
        find("textarea[name='q']").set query
        find(".UUbT9 .gNO89b").click
    end
end
```

**google_results.rb**
```ruby
class GoogleResults
    include Capybara::DSL

end
```

Incialmente nós faremos alguns ajustes no "env.rb" e no "google_home.rb".

Lá no nosso "env.rb" a gente definiu o nosso `default_driver`, na documentação do Capybara ele recomenda que a gente defina também `app_host` onde teriamos um endereço padrão e com base nessa url a gente complementa com o que a gente quer, algo como um path relative, porém aplicado a nossa url.

Então primeiro nós precisamos adicionar o seguinte código no "env.rb":

```ruby
Capybara.app_host = 'https://www.google.com.br'
```

E em nosso arquivo "google_home.rb" nós substituímos o visit `'https://www.google.com.br/'` por `/`, ficando dessa forma.

```ruby
visit('/')
```

Após isso os 2 devem ficar assim:

**env.rb**
```ruby
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'capybara/cucumber'

Capybara.default_driver = :selenium_chrome
Capybara.app_host = 'https://www.google.com.br'
```

**google_home.rb**
```ruby
class GoogleHome
    include Capybara::DSL

    def load
        visit('/')
    end

    def search_for(query)
        find("textarea[name='q']").set query
        find(".UUbT9 .gNO89b").click
    end
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/e91d236c-d361-48fe-baba-6f4fc83d848c)
___

Tudo correu bem.

Uma conceito importante quando se trata de page objects, é criar uma "base_page" com métodos padrão para que a gente possa aproveitar nas demais páginas, e a gente não fez isso aqui, a gente criou logo o "google_home.rb" e o "google_results.rb", então agora vamos fazer isso.

Esse trecho inicial nós iremos copiar lá do "google_home.rb".

```ruby
class GoogleHome
    include Capybara::DSL

    def load
        visit('https://www.google.com.br/')
    end

    def search_for(query)
        find("textarea[name='q']").set query
        find(".UUbT9 .gNO89b").click
    end
end
```

Ok, agora nós mudaremos o nome da classe para `BasePage`, vamos apagar o `def search_for(query)` e deixar só o `def load`.
