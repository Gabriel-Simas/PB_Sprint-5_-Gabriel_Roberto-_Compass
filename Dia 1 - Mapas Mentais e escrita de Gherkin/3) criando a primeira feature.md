## 3) Criando a Primeira Feature

Retornando de onde paramos, agora que nós já montamos o nosso mapa mental inicial, nós inserimos neles algumas funcionalidades básicas.

___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/2efe8ca6-5511-4b0a-809e-2434588b9563)
___

Em relação a funcionalidade, podemos destacar a busca e dentro dela os campos das categorias vão servir como exemplos para o nosso cenário de teste.

___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/e0f9292c-6700-4dcf-8dcd-3b3d429324de)
___

Já na parte dos produtos, nós temos a página do produto, que é uma área mais específica e nós podemos criar cenários de testes para cada funcionalidade.

___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/e4d6f2b5-8540-4d34-802c-ef264f413c1e)
___

Agora nesse momento é muito importante que você tenha instalado as extensões citadas anteriormente para prosseguir para a próxima etapa.

Caso queira retornar e ver as extensões [clique aqui](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/tree/develop/Dia%201%20-%20Mapas%20Mentais%20e%20escrita%20de%20Gherkin).
___

Prosseguindo, dentro do VS Code você deve criar uma pasta, no meu caso eu coloquei o nome de GHERKINS, para facilitar a identificação.

___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/bbb2eca7-a414-4f6f-bdfc-16fb122e78a5)
___

Uma vez dentro da nossa pasta nós iremos criar o nosso primeiro exemplo, nós vamos começar pela funcionalidade da busca, o arquivo terá a extensão .feature, o nome que eu coloquei foi “busca.feature”

___
![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/3f878f7a-3d25-42fb-9332-14beac5e8974)
___

Como dito anteriormente Gherkin é uma linguagem de domínio específico (DSL) utilizada para escrever especificações de comportamento em uma forma compreensível por humanos. Essas especificações são frequentemente usadas em testes de comportamento automatizados, como testes de aceitação, em desenvolvimento de software. Os cenários escritos em Gherkin descrevem como um sistema deve se comportar em diferentes situações.

Aqui estão os principais elementos e comandos utilizados em Gherkin:

1. **Feature**: Define o recurso (ou funcionalidade) que está sendo descrito. Cada arquivo Gherkin geralmente começa com uma declaração `Feature`, seguida pelo nome do recurso.
    
    Exemplo:
    
    ```
    Feature: Login
    
    ```
    
2. **Scenario**: Define um cenário específico que descreve uma sequência de ações e resultados esperados. Cada cenário é iniciado com a palavra-chave `Scenario`, seguida pelo nome do cenário.
    
    Exemplo:
    
    ```
    Scenario: Successful login with valid credentials
    
    ```
    
3. **Given, When, Then**: Essas são as palavras-chave principais que estruturam os cenários em Gherkin.
    - **Given**: Define o estado inicial do sistema ou os pré-requisitos para o cenário.
    - **When**: Define a ação que está sendo realizada no sistema.
    - **Then**: Define o resultado esperado após a ação.
    
    Exemplo:
    
    ```
    Given the user is on the login page
    When the user enters valid credentials
    Then they should be redirected to the dashboard
    
    ```
    
4. **And, But**: Além das palavras-chave principais, você pode usar `And` e `But` para melhorar a legibilidade e adicionar mais detalhes ao cenário.
    
    Exemplo:
    
    ```
    Given the user is on the login page
    And the user has entered their username
    And the user has entered their password
    When the user clicks the login button
    Then they should be redirected to the dashboard
    
    ```
    
5. **Background**: Define etapas de cenário comuns que podem ser usadas como contexto para vários cenários em um arquivo Gherkin. Isso ajuda a evitar repetições.
    
    Exemplo:
    
    ```
    Background:
      Given the user is on the login page
      And the user has entered their username
      And the user has entered their password
    
    Scenario: Successful login with valid credentials
      When the user clicks the login button
      Then they should be redirected to the dashboard
    
    Scenario: Invalid login with incorrect password
      When the user clicks the login button
      Then an error message should be displayed
    
    ```
    
6. **Scenario Outline**: Usado para criar cenários parametrizados, onde você define um cenário genérico com placeholders e, em seguida, fornece exemplos específicos usando a palavra-chave `Examples`.
    
    Exemplo:
    
    ```
    Scenario Outline: User registration with different email domains
      Given the user is on the registration page
      When they enter "<email>"
      Then a confirmation email should be sent
    
    Examples:
      | email                |
      | user@example.com     |
      | user@gmail.com       |
      | user@company.net     |
    
    ```
    

Estes são os elementos básicos da linguagem Gherkin. Eles ajudam a estruturar cenários de teste de uma forma que seja clara e compreensível tanto para pessoas não técnicas quanto para ferramentas de automação.

___

Para mais informações quanto aos elementos e comandos acesse o link abaixo.

link para mais informações: https://blog.onedaytesting.com.br/gherkin/

___

Após isso você pode conferir o documento [busca.feature](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/blob/develop/Dia%201%20-%20Mapas%20Mentais%20e%20escrita%20de%20Gherkin/busca.feature).
