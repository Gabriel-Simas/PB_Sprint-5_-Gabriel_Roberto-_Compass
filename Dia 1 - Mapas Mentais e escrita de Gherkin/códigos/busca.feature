Feature: Busca
    COMO um usuário do Ecommerce AdvantageOnlineShopping
    QUERO poder buscar por diferentes produtos
    PARA poder personalizar minhas compras

    Background: Estar na home
        Given que esteja na home

    Scenario: Buscar por um produto existente
        When realizar uma busca por um produto existente
        Then deverão ser retornados resultados na busca

    Scenario Outline: Buscar por produtos existentes
        When buscar pelo produto "<produto>"
        Then deverão ser retornados resultados na busca

        Examples:
        |     produto   |
        | Speakers      |
        | Tablets       |
        | Laptops       |
        | Mice          |
        | Headphones    |

        # primeira execução = Speakers
        # segunda execução = Tablets
        # terceira execução = Laptops
        # ...
