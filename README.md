# Análise de Desempenho de Filmes (IMDb)

## Sobre o projeto

Este projeto tem como objetivo explorar e analisar dados de filmes ao longo do tempo, utilizando uma base pública do IMDb disponibilizada pela plataforma Base dos Dados.

A ideia principal é entender quais fatores influenciam o sucesso de um filme, tanto em termos de receita quanto de avaliação do público. Para isso, são analisadas variáveis como orçamento, arrecadação, notas, gênero, duração e premiações.

Além disso, o projeto prevê a integração com uma segunda base de dados, com o objetivo de enriquecer as análises e permitir comparações mais consistentes entre diferentes períodos.

---

## Base de dados primária

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

## Base de dados secundária

- Dataset: Consumer Price Index (CPI) – United States (2010 = 100)  
- Fonte: https://data.worldbank.org/indicator/FP.CPI.TOTL  

### Principais características:
- Índice de preços ao consumidor (CPI) com base 2010 = 100  
- Dados anuais  
- Cobertura: aproximadamente de 1960 até 2024  
- Unidade: índice (não monetário)  
- Representa a variação média dos preços ao longo do tempo  
- Permite ajuste de valores monetários para inflação  

### Tratamento realizado:
- Filtragem para manter apenas os dados dos Estados Unidos  
- Remoção de colunas não relevantes (nome do país, código e indicador)  
- Transformação da estrutura (anos como colunas → anos como linhas)  
- Criação de duas variáveis principais:
  - `year`: ano
  - `cpi`: índice de inflação  
- Remoção de valores ausentes (ex: 2025)  
- Exportação para CSV limpo  
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
  
### Exploração inicial da base

### Identificação de problemas de qualidade  

### Limpeza e transformação dos dados  

### Modelagem relacional  

### Integração com uma segunda base  

### Análises utilizando SQL  

---

## Perguntas de pesquisa

- Existe relação entre orçamento e receita mundial?  
- Filmes com mais votos têm notas mais altas?  
- Certos gêneros têm maior chance de ganhar Oscar?  
- Filmes mais longos tendem a ter notas melhores?  
- A relação entre orçamento e receita mudou ao longo das décadas?  

---

## Estrutura do projeto (VERIFICAR)
### *todo*: colocar arquivos novos
```
analise-filmes-imdb/
│
├── .gitignore
|
├── sql/
│ ├── new_tables.sql
│ ├── cleaning.sql
│ ├── integration.sql
│ └── analysis.sql
│
├── Modelo_relacional_ATIVIDADE_2.jpg
|
├── CSV_ANTES.csv
|
├── CSV_DEPOIS.csv
|    
├── csv_cleaner.py
|
├── atividade_1_docs/
│ └── at01_exploracao.md
│
└── README.md
```

---

## Tecnologias utilizadas

- SQL (BigQuery)  
- Git e GitHub  
- Base dos Dados (basedosdados.org) 
- Python

---

## Autores

- @MiguelCSLima
- @Fernando-Gama
- @RonAlffrson
