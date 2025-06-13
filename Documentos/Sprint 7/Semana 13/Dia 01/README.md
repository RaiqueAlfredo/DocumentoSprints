# ✅ Este repositório é referente as atividades realizadas no dia 01, da semana 13 do estágio na Compass UOL

# Estratégia de Mapeamento da Tarefa em Grupo:
A equipe utilizou uma abordagem colaborativa e sistemática para mapear os elementos da página Challenging DOM. 

O mapeamento foi feito com base em três critérios principais:
* Identificação do Tipo de Elemento (ex: botão, tabela, linha, cabeçalho).
* Seletores específicos para garantir precisão na automação, utilizando XPath e seletores CSS conforme a estrutura do HTML.
* Divisão de tarefas entre os membros da equipe, permitindo foco e produtividade em cada grupo de elementos.

### Estratégias específicas:
* Para os botões, foram utilizados seletores CSS baseados em classes, observando que o texto visível nesses botões é dinâmico, o que exige cuidado na automação.
* Os elementos da tabela foram mapeados com XPath e seletores diretos (ex: thead, tbody), visando facilitar ações como leitura, edição e exclusão de registros.
* Foi considerada a estrutura hierárquica da tabela, separando cabeçalho (TBL_HEADER), corpo (TBL_BODY) e linhas (TBL_LINHA) para maior controle e clareza nos testes.

### Divisão do trabalho:
* Gabriel: mapeou os botões principais da página.
* Isadora: cuidou da estrutura geral da tabela e das ações de edição/exclusão.
* Raique: focou nos elementos de corpo e cabeçalho da tabela.
* Thais: ficou responsável pelas linhas da tabela.

# Estrátegia de Mapeamento da Tarefa Individual:
O site escolhido para o mapeamento foi a Nuvemshop. O mapeamento foi realizado com base em três critérios principais:
* Identificação do tipo de elemento.
* Uso de seletores específicos para garantir precisão na automação, utilizando operadores avançados em CSS e XPath conforme a estrutura do HTML.
* Priorização de atributos estáveis, como data-action, href e class, para criar seletores robustos e resilientes a mudanças na estrutura do DOM.

### Estratégias Específicas:
* Para o link de login (LINK_LOGIN):
    * Foi utilizado um seletor CSS com base no atributo data-action e no operador $= para localizar o elemento cujo valor termina com &lt;button Login&gt;
    * Essa abordagem garante flexibilidade, considerando possíveis mudanças no prefixo do atributo.

* Para o link de criação de loja (LINK_CREATESTORE):
    * A seleção foi feita combinando classes específicas com o atributo href e utilizando o operador $= para localizar URLs que terminam com monte-sua-loja-virtual.
    * Além disso, foi aplicado o combinador > para selecionar apenas os elementos diretamente filhos da classe definida, aumentando a precisão do mapeamento.

* Para o cabeçalho do site (HDR_NAV):
    * Foi adotado um seletor que utiliza operadores avançados como ^= para identificar classes que começam com home e $= para localizar subelementos cujas classes terminam com full. 
    * Essa estratégia também utilizou o combinador > para mapear a hierarquia do DOM de forma clara e eficiente.
---
### Para consultar as tabelas dos mapeamentos, acesse o arquivo "Tarefas dia 01.pdf"