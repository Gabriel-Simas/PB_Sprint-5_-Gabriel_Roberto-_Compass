## Inspeção de Elementos HTML

### 1) O que são seletores e para que vamos utiliza-los?
- São identificadores dos elementos ou componentes de uma página web ou mobile.
- São utilizados como alvo das ações do usuário ou de um navegador automatizado.

Então aqui mesmo nessa página nós podemos observar diversos elementos, nós podemos inspecionar esses elementos utilizando o atalho (**Ctrl** + **Shift** + **I**) ou você pode apertar com o botão direito do mouse e descer até a opção **Inspecionar**.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/55a1441c-6f7b-4b2c-ad3a-1e1a9f05e601)
___

Ao acessar essa ferramenta aparecerá um menu com diversas opções para identificar os elementos da página, clicando na secção **Elements** nós podemos ver cada parte do codo HTML da página.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/126b1a42-0dfb-40c5-9ed2-82cf6d829d4e)
___

Dentro do menu da ferramenta também existe um ícone que ao ser clicado nos permite inspecionar os elementos conforme você passa o mouse sobre a página.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/94f99492-c8d9-43c5-bffd-7453192f02af)
___

Essa ferramenta apresenta um maior proveito quando você já tem conhecimentos básicos sobre front-end.

Ainda dentro da ferramenta nós podemos realizar a pesquisa de alguns elementos utilizando o atalho (**Ctrl** + **F**), basta inserir o que se procura no campo de busca e pesquisar, isso é muito útil para verificar se o nome desse elemento é único, para evitar erros quando formos realizar os testes automatizados.

### SauceDemo para exemplos:

Agora eu vou mostrar alguns exemplos para vocês aqui na página da Swag Labs, [SauceDemo](https://www.saucedemo.com/), uma aplicação pra testes que imita uma página de e-commerce. Logo que a gente entra no site nós podemos notar 3 elementos, um campo **username**, outro chamado **password** e **login**.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/182303e3-a82d-4758-a295-6069790980ba)
___

Inspecionando o campo **username**, nós podemos obter diversas informações, tais como `class`, `placeholder`, `type`, `id` e `name`.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/4da02794-12f6-4145-be6a-a6838bb5dabc)
___

Outra ferramenta que a gente tem aqui na própria inspeção de elementos, é a ferramenta para copiar elementos, clicando com o botão direito, basta descer até a opção **Copy**, **Copy element**.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/6dec31e1-1fec-40ba-bf32-9f8bbefe97c0)
___

**Copy element:**
```html
<input class="input_error form_input" placeholder="Username" type="text" data-test="username" id="user-name" name="user-name" autocorrect="off" autocapitalize="none" value="">
```

Como você pode conferir existem outras opções de como copiar o trecho.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/6dec31e1-1fec-40ba-bf32-9f8bbefe97c0)
___

Outras opções para poder comparar com a **Copy element**.

1. **Copy outerHTML (Copiar outerElement)**:
   - Esta opção copia o código HTML completo do elemento selecionado, incluindo o próprio elemento e todos os seus filhos. Isso pode ser útil para copiar o código-fonte de um elemento específico para uso posterior.

```html
<input class="input_error form_input" placeholder="Username" type="text" data-test="username" id="user-name" name="user-name" autocorrect="off" autocapitalize="none" value="">
```

2. **Copy selector (Copiar seletor)**:
   - Isso copia um seletor CSS único que pode ser usado para selecionar o elemento na página. O seletor é geralmente baseado nas classes, IDs e hierarquia do elemento, tornando mais fácil aplicar estilos ou interagir com ele via JavaScript.

```html
#user-name
```

3. **Copy JS Path (Copiar caminho JS)**:
   - Essa opção fornece um caminho JavaScript para acessar o elemento usando o console do navegador. Pode ser útil ao escrever scripts personalizados para interagir com a página, como automatizar ações do usuário.

```html
document.querySelector("#user-name")
```

4. **Copy styles (Copiar estilos)**:
   - Isso copia todos os estilos CSS aplicados ao elemento, incluindo propriedades como cores, tamanhos de fonte, margens, preenchimentos e outros. Pode ser usado para entender ou reproduzir estilos em outros lugares.

```html
<style>
    -webkit-font-smoothing: antialiased;
    appearance: none;
    border-radius: 0;
    color: #484c55;
    font-family: DM Sans,Arial,Helvetica,sans-serif;
    font-size: 14px;
    width: 100%;
    border: 0;
    border-bottom: 1px solid #ededed;
    outline: none;
    padding: 10px 0;
</style>
```

5. **Copy XPath (Copiar XPath)**:
   - O XPath é um meio de localizar elementos em uma página da web com base em sua posição na árvore do documento XML (ou HTML). Esta opção copia um XPath específico para o elemento selecionado, que pode ser útil para automação ou teste de web.

```html
//*[@id="user-name"]
```

6. **Copy full XPath (Copiar XPath completo)**:
   - Similar ao "Copy XPath", esta opção copia o caminho XPath completo até o elemento, incluindo todos os elementos pai até a raiz do documento. Isso torna o caminho XPath mais específico, o que pode ser útil em casos em que vários elementos têm XPath semelhantes.

```html
/html/body/div/div/div[2]/div[1]/div/div/form/div[1]/input
```

Essas opções ajudam os desenvolvedores web a depurar, estilizar e interagir com elementos específicos em uma página da web durante o desenvolvimento ou testes. Cada uma delas desempenha um papel diferente no acesso e manipulação de elementos da página.

Mas para esses elementos na SauceDemo os desenvolvedores da página criaram seletores costumizados e esses seletores costumizados normalmente começam com a palavra `data`, no caso do campo **username** nós temos `data-test="username"`.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/9f6666d4-b199-4c25-9c0f-23da90111ca8)
___

Nós podemos copiar esse seletor `data-test="username"` e utilizar o atalho (**Ctrl** + **F**), então eu vou abrir e fechar colchetes e colar o trecho `[data-test="username"]`.

![image](https://github.com/Gabriel-Simas/PB_Sprint-5_-Gabriel_Roberto-_Compass/assets/128181261/77f2ed5b-92ae-4171-a7c4-b83a798c06e7)
___

Podemos ver que houve só um resultado, ou seja, ele é um elemento único.
