Feature: Página do Produto
    SENDO um usuário do AdvantageOnlineShopping
    QUERO poder personalizar os produtos que ireir comprar na página do produto
    PARA ter uma melhor experiência de compra

Background: Estar na página de um produto
    Given que esteja na home
    When realizar uma busca por um produto existente
    And acessar a página do produto

Scenario: Trocar a cor do produto na PDP
    When alterar a cor do produto
    Then deverá alterar a imagem apresentada na PDP

Scenario: Aumentar a quantidade do produto na PDP
    When aumentar a quantidade do produto
    Then deverá alterar a quantidade exibida na PDP

Scenario: Aumentar a quantidade de produto na PDP aumenta no carrinho
    When aumentar a quantidade do produto
    Then o produto deverá ser adicionado ao carrinho com a quantidade aumentada

Scenario: Adicionar o produto ao carrinho pela PDP
    When adicionar o produto ao carrinho
    Then o produto deverá ser adicionado ao carrinho com sucesso
