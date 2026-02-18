# Transactional-Sales-Analysis-with-SQL
A SQL-first project that simulates a realistic analytics workflow: relational modeling, business rules definition, and analytical queries over transactional sales data.

## Motivação

Ao estudar SQL, percebi que a maior dificuldade não estava nos comandos em si, mas em entender:

- onde o SQL se encaixa em um fluxo real de dados
- como decisões de modelagem impactam as consultas
- como regras de negócio devem ser definidas antes de qualquer visualização

Este projeto surgiu para consolidar esses pontos em um cenário simples, porém realista.

---

## Escopo

O domínio escolhido foi **Vendas / Pedidos**, com um modelo relacional básico composto por:

- customers
- orders
- products
- order_items

O escopo é propositalmente reduzido. A intenção não foi simular um sistema completo, mas trabalhar bem os fundamentos.

---

## Modelagem e decisões

- `customers` e `products` são tratados como dados mestres  
- `orders` e `order_items` representam eventos transacionais  
- Valores financeiros históricos são armazenados em `order_items`  
- O preço atual do produto não é utilizado em análises passadas  

Essas decisões evitam inconsistências comuns em análises históricas.

---

## Regras de negócio adotadas

Para manter as análises consistentes:

- apenas pedidos com `status = 'paid'` são considerados
- pedidos cancelados são excluídos
- métricas financeiras refletem apenas transações concluídas

Todas as regras são aplicadas no SQL.

---

## Perguntas respondidas

Algumas das perguntas analíticas exploradas:

1. Quantidade de pedidos pagos por mês  
2. Valor médio dos produtos efetivamente comprados  
3. Clientes com maior volume de receita  
4. Clientes com maior volume de pedidos  
5. Produto com maior recorrência de compra  

As queries foram escritas explicitando granularidade, filtros e critérios de inclusão.

---

## Uso do Power BI

O Power BI é utilizado apenas para visualização.

- não há transformações no BI
- não há regras de negócio fora do SQL
- os dashboards apenas consomem o resultado das consultas

O objetivo é separar claramente análise de visualização.

---

## Limitações conhecidas

Este projeto não aborda:

- grandes volumes de dados
- otimizações avançadas de performance
- pipelines de ingestão ou processamento

Esses pontos ficaram fora do escopo por decisão consciente.

---

## O que aprendi com este projeto

- a importância de definir regras antes de escrever queries
- como a modelagem simplifica (ou complica) o SQL
- como estruturar consultas pensando em consumo posterior
- como documentar decisões técnicas, mesmo em projetos simples
