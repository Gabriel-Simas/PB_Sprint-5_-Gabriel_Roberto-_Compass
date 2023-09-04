Feature: Google

Scenario: Carregar a página do Google
    Given que acesse a home
    Then deverá exibir o logo da Google

Scenario: Buscar por Compass
    Given que acesse a home
    When buscar por "Compass"
    Then deverão ser encontrados resultados
