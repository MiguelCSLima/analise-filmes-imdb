# Análise de Desempenho de Filmes (IMDb)

## Sobre o projeto

Este projeto tem como objetivo explorar e analisar dados de filmes ao longo do tempo, utilizando uma base pública do IMDb disponibilizada pela plataforma Base dos Dados.

A ideia principal é entender quais fatores influenciam o sucesso de um filme, tanto em termos de receita quanto de avaliação do público. Para isso, são analisadas variáveis como orçamento, arrecadação, notas, gênero, duração e premiações.

Além disso, o projeto prevê a integração com uma segunda base de dados, com o objetivo de enriquecer as análises e permitir comparações mais consistentes entre diferentes períodos.

---

## Base de dados

- Dataset: IMDb - Top Movies per Year  
- Fonte: https://basedosdados.org/dataset/6ba4745d-f131-4f8e-9e55-e8416199a6af?table=79de8c5e-9c21-4398-a9fb-bc40e6d6e77f  

### Principais características:
- Filmes organizados por ano  
- Cobertura aproximada: 1960 até 2024  
- Centenas de filmes por ano  
- Informações disponíveis incluem:
  - Orçamento e receita
  - Nota no IMDb e número de votos
  - Diretores, atores e gêneros
  - Premiações (incluindo Oscar)

---

## Objetivo

Investigar os fatores que influenciam o desempenho de filmes, considerando:

- Sucesso financeiro (receita)
- Avaliação do público (IMDb)
- Influência do orçamento
- Impacto de gênero e duração
- Relação com premiações

Também será realizada a integração com uma segunda base de dados para ampliar o contexto das análises.

---

## Etapas do projeto

- Exploração inicial da base  
- Identificação de problemas de qualidade  
- Limpeza e transformação dos dados  
- Modelagem relacional  
- Integração com uma segunda base  
- Análises utilizando SQL  

---

## Perguntas de pesquisa

- Existe relação entre orçamento e receita mundial?  
- Filmes com mais votos têm notas mais altas?  
- Certos gêneros têm maior chance de ganhar Oscar?  
- Filmes mais longos tendem a ter notas melhores?  
- A relação entre orçamento e receita mudou ao longo das décadas?  

---

## Estrutura do projeto (VERIFICAR)

```
analise-filmes-imdb/
│
├── sql/
│ ├── create_tables.sql
│ ├── cleaning.sql
│ ├── integration.sql
│ └── analysis.sql
│
├── docs/
│ └── modelo_relacional.png
│
├── data/
│
└── README.md
```

---

## Tecnologias utilizadas

- SQL (BigQuery)  
- Git e GitHub  
- Base dos Dados  

---

## Autores

- @MiguelCSLima
- @Fernando-Gama
- @RonAlffrson
