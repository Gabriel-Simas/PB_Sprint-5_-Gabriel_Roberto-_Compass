## 2) Page Objects com Capybara I
Oi galera, dando continuidade ao conteúdo dos módulos anteriores, nós seguimos nos aprofundando no Capybara, nesse módulo iremos falar um pouco sobre page objects, posteriomente iremos migrar para outras bibliotecas, mas no momento veremos page objects com Capybara.

Reelembrando do programa que nós fizemos no módulo anterior ele ficou dessa forma.

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
    visit('https://www.google.com.br/')
end
  
Then('deverá exibir o logo da Google') do
    expect(page).to have_css '.lnXdpd'
end

When('buscar por {string}') do |termo|
    find("textarea[name='q']").set termo
    find(".UUbT9 .gNO89b").click 
end
  
Then('deverão ser encontrados resultados') do
    expect(page).to have_content 'Jeep Compass'
end
```

Os testes estão funcionando, o código está correto, porém nós iremos realizar algumas melhorias e deixa-lo mais polido.

Vamos começar ali no `When`, vamos colocar um `#` na frente de `find(".UUbT9 .gNO89b").click`, para transformar essa linha em um comentário, enquanto isso inserimos um `click_button "Pesquisa Google"`.

Ficaria dessa forma.

```ruby
When('buscar por {string}') do |termo|
    find("textarea[name='q']").set termo
    #find(".UUbT9 .gNO89b").click
    click_button "Pesquisa Google"
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/ca67a1bb-b81b-425b-a4b9-ae5eef35dc9d)
___

Tudo correu bem, então podemos descartar aquela linha de código comment.

```ruby
When('buscar por {string}') do |termo|
    find("textarea[name='q']").set termo
    #find(".UUbT9 .gNO89b").click
    click_button "Pesquisa Google"
end
```

Agora vamos para a pasta "features", criar uma pasta "pages", dentro da pasta "pages" vamos criar "google_home.rb".

Já que estamos falando de page objects nós vamos criar classes no Ruby para as páginas que vamos interagir.

```ruby
class GoogleHome
    include Capybara::DSL

    def load
        visit('https://www.google.com.br/')
    end
end
```
Vamos retirar o visit do "google.rb", agora nós ire delegar essa tarefa de carregar a página.

```ruby
Given('que acesse a home') do
    @google_home = GoogleHome.new
    @google_home.load
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/6e50efdd-fcc2-4eef-a3d9-2f2b41b18be3)
___

Parece que existe outro termo chamado "Pesquisa Google", vou ir lá no `When` e colocar o trecho antigo pra ver se funciona.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/fc34015d-d925-4178-972e-ef2dbdfbe5fd)
___

O problema isso mesmo então, agora o `When` atual é esse.

```ruby
When('buscar por {string}') do |termo|
    find("textarea[name='q']").set termo
    find(".UUbT9 .gNO89b").click
end
```

Retornando ao assunto do "google_home.rb", parece que está tudo certo.

Basicamente o que a gente fez aqui foi meio que terceirizar o que seria feito nesse arquivo para o outro documento.

Ok, agora vamos para o nosso `Then`.

```ruby
Then('deverá exibir o logo da Google') do
    expect(page).to have_css '.lnXdpd'
end
```

Vamos só susbstituir o `page` por `@google_home`.

```ruby
Then('deverá exibir o logo da Google') do
    expect(@google_home).to have_css '.lnXdpd'
end
```

Vamos ver.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/019cad67-7aca-4b3b-8e32-e94a2673af9d)
___

Tranquilo passou, agora o `When` nós podemos criar um método específico assim como o `Given`.

Voltando pro "google_home.rb", nós vamos fazer o nosso método.

```ruby
    def search_for(query)
        find("textarea[name='q']").set termo
        find(".UUbT9 .gNO89b").click
    end
```

Já no "google.rb" nós iremos colocar uma trecho para que ele delegue para o "google_home.rb".

```ruby
When('buscar por {string}') do |termo|
    @google_home.search_for(termo)
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/09fe7682-8a4f-4428-b25a-11de0922560b)
___

Ok, vamos agora verificar o outro `Then`.

```ruby
Then('deverão ser encontrados resultados') do
    expect(page).to have_content 'Jeep Compass'
end
```

Vamos substituir `page` por `@google_home`.

```ruby
Then('deverão ser encontrados resultados') do
    expect(@google_home).to have_content 'Jeep Compass'
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/62fe076b-44c6-49cd-949a-e3f71f9358c2)
___

Uma observação interessante é que a partir do momento em que a gente faz uma pesquisa a gente sai do Google Home, então nós iremos criar um arquivo específico para a página de resultados, o nome será "google_results.rb".

Nós vamos copiar a estrutura do base do "google_home.rb" e colar no "google_results.rb", só iremos mudar o nome da classe e não iremos utilizar os mesmos métodos.

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

Lá no último `Then` do nosso "google.rb" nós iremos alterar `@google_home`, por `@google_results`.

```ruby
Then('deverão ser encontrados resultados') do
    expect(@google_results).to have_content 'Jeep Compass'
end
```

Aqui no `When` vamos declarar o `@google_results`.

```ruby
When('buscar por {string}') do |termo|
    @google_home.search_for(termo)
    @google_results = GoogleResults.new
end
```

Vamos testar.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/1a266b94-426a-4324-a7a3-d70bc950423d)
___

Ok, tudo está funcionando perfeitamente, no próximo módulo nós iremos continuar aprendendo mais sobre page objects.
