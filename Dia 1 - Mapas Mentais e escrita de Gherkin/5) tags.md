## 5) Tags

Em Gherkin, as tags são rótulos que você pode associar a cenários ou recursos para fins de organização, filtragem e marcação. As tags começam com o símbolo "@" e podem ser usadas para agrupar cenários relacionados, executar testes específicos ou definir metadados para cenários ou recursos. As tags não afetam a execução dos testes por si só, mas podem ser usadas pelas ferramentas de automação para identificar e filtrar cenários durante a execução.

Aqui estão alguns exemplos de como as tags podem ser usadas em Gherkin:

1. **Tags de Cenário**:

Você pode adicionar tags a um cenário específico para indicar sua finalidade, ambiente ou qualquer outro atributo relevante.

```gherkin
@regressão @login
Cenário: Login bem-sucedido com credenciais válidas
  Dado que o usuário está na página de login
  Quando o usuário insere as credenciais válidas
  Então o usuário deve ser redirecionado para o painel
```

2. **Tags de Recurso**:

As tags também podem ser adicionadas ao nível do recurso, o que pode ser útil para agrupar cenários relacionados.

```gherkin
@regressão @login
Recurso: Login

  Cenário: Login bem-sucedido com credenciais válidas
    Dado que o usuário está na página de login
    Quando o usuário insere as credenciais válidas
    Então o usuário deve ser redirecionado para o painel

  Cenário: Tentativa de login com senha incorreta
    Dado que o usuário está na página de login
    Quando o usuário insere uma senha incorreta
    Então uma mensagem de erro deve ser exibida
```

3. **Filtragem usando Tags**:

Ferramentas de automação geralmente permitem que você execute cenários com base em tags específicas. Por exemplo, se você quiser executar apenas os cenários marcados com "@regressão", você pode usar um comando de linha de comando ou configuração de ferramenta adequada.

4. **Convenções de Nomenclatura**:

Embora não haja regras rígidas quanto às tags que você deve usar, é uma boa prática adotar convenções de nomenclatura consistentes para que suas tags sejam fáceis de entender e usar. Isso pode incluir tags relacionadas a tipos de teste (regressão, aceitação), a áreas funcionais (login, carrinho de compras) ou a metadados específicos do ambiente (dev, produção).
