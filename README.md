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

## Como rodar

1. schema.sql
Para a construção do banco de dados
  
2. seeds.sql
Para inserir os dados
   
3. sql/metrics/*.sql
Para executar as queries

---

## Modelagem e decisões

- `customers` e `products` são tratados como dados mestres  
- `orders` e `order_items` representam eventos transacionais  
- Valores financeiros históricos são armazenados em `order_items`  
- O preço atual do produto não é utilizado em análises passadas  

Essas decisões evitam inconsistências comuns em análises históricas.

---


## Perguntas respondidas

Perguntas analíticas exploradas:

- Qual a taxa de pedidos cancelados por mês?
- Quais clientes concentram o maior volume de receita?
- Qual o ticket médio por mês?
- Qual categoria de produto gerou mais receita?
- Quanto a empresa faturou por mês?


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

Antes de uma query, é importante entender se TODOS os pedidos serão considerados ou apenas os pagos. Isso evita uma inflação errônea nos resultados.

- como a modelagem simplifica (ou complica) o SQL

Não ter 'total' em orders gera consistência, mas complexifica o código. 

- a importância da prevenção de possíveis erros

É necessário prever a possibilidade de um 'NULL' em um cálculo levar toda uma conta a 0, por exemplo.
Desta mesma forma, o arredondamento automático do POSGRESQL pode atrapalhar o cálculo de taxas.
