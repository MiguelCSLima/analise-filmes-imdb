# AT01 — Exploração e Diagnóstico da Base



## 1. Base de dados



- Dataset: IMDb - Top Movies per Year  
- Fonte: https://basedosdados.org/dataset/6ba4745d-f131-4f8e-9e55-e8416199a6af?table=79de8c5e-9c21-4398-a9fb-bc40e6d6e77f
  


---



## 2. Variáveis estudadas



| Variável | Significado |
|----------|------------|
| id | Identificador único do filme |
| title | Nome do filme |
| link | Link para a página do filme |
| year | Ano de lançamento do filme |
| duration | Duração do filme em minutos |
| rating_mpa | Classificação indicativa |
| rating_imdb | Nota média no IMDb |
| vote | Número de votos |
| budget | Orçamento de produção |
| gross_world_wide | Receita total mundial |
| gross_us_canada | Receita nos EUA e Canadá |
| gross_opening_weekend | Receita no fim de semana de estreia |
| director | Diretor(es) |
| writer | Roteirista(s) |
| star | Principais atores |
| genre | Gênero(s) |
| country_origin | País(es) de origem |
| filming_location | Local(is) de filmagem |
| production_company | Empresa(s) produtora(s) |
| language | Idioma(s) |
| win | Número de prêmios ganhos |
| nomination | Número de indicações |
| oscar | Número de Oscars |



---



## 3. Dicionário de dados (consulta SQL)



``` 
SELECT
    dados.id,
    dados.title,
    dados.link,
    dados.year,
    dados.duration,
    dados.rating_mpa,
    dados.rating_imdb,
    dados.vote,
    dados.budget,
    dados.gross_world_wide,
    dados.gross_us_canada,
    dados.gross_opening_weekend,
    dados.director,
    dados.writer,
    dados.star,
    dados.genre,
    dados.country_origin,
    dados.filming_location,
    dados.production_company,
    dados.language,
    dados.win,
    dados.nomination,
    dados.oscar
FROM `basedosdados.world_imdb_movies.top_movies_per_year` AS dados
```

---

## 4. Problemas de qualidade encontrados

A análise da base identificou os seguintes problemas:

- **Dados ausentes (missing values):** presença significativa de valores nulos em variáveis como `budget`, `gross_world_wide`, `gross_opening_weekend`, `filming_location` e `language`.

- **Campos multivalorados não normalizados:** variáveis como `genre`, `director`, `star`, `country_origin` e `language` apresentam múltiplos valores em uma única célula, dificultando análises categóricas.

- **Dados monetários em formato textual:** os campos financeiros contêm símbolos e separadores (ex: `$`, `,`), exigindo limpeza e conversão para formato numérico.

- **Ausência de ajuste por inflação:** valores de orçamento e receita não são corrigidos ao longo do tempo, comprometendo comparações entre diferentes períodos.

- **Possíveis outliers:** filmes com valores extremamente altos de orçamento, receita ou votos podem distorcer análises estatísticas.

---

## 5. Proposta de aplicação

Desenvolver um sistema de análise de desempenho de filmes, com foco em:

- Identificação de fatores que influenciam:
  - Sucesso financeiro (receita)
  - Avaliação crítica (nota IMDb)

- Apoio à tomada de decisão para produtoras e estúdios, como:
  - Estimativa de receita esperada
  - Probabilidade de premiações

- Possível evolução do projeto para:
  - Dashboard interativo (Business Intelligence)
  - Modelos preditivos (Machine Learning)

---

## 6. Perguntas de pesquisa e tipos de análise

### 6.1 Existe relação entre orçamento e receita mundial?
- Limpeza e conversão dos dados monetários
- Análise: correlação e regressão linear

### 6.2 Filmes com maior número de votos têm notas mais altas?
- Tratamento de outliers e padronização dos dados
- Análise: correlação e gráfico de dispersão

### 6.3 Certos gêneros têm maior chance de ganhar Oscar?
- Normalização dos campos multivalorados
- Análise: agrupamento por gênero e cálculo de proporção

### 6.4 Filmes mais longos tendem a ter notas melhores?
- Conversão da duração para formato numérico
- Análise: correlação

### 6.5 A relação entre orçamento e receita mudou ao longo das décadas?
- Criação de variável de década a partir do ano
- Análise: comparação temporal (correlação/regressão por período)
