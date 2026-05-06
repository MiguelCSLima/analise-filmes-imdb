-- Criação da Tabela "movies_clean" -- 

CREATE OR REPLACE TABLE `atividade2-493819.imdb_project.movies_clean` AS
SELECT
    id,
    title,
    year,
    CASE
        WHEN duration IS NULL THEN NULL
        ELSE
            COALESCE(SAFE_CAST(REGEXP_EXTRACT(duration, r'(\d+)h') AS INT64), 0) * 60
            + COALESCE(SAFE_CAST(REGEXP_EXTRACT(duration, r'(\d+)m') AS INT64), 0)
    END AS duration,
    rating_imdb,
    vote,
    budget,
    gross_world_wide,
    genre,
    oscar
FROM `basedosdados.world_imdb_movies.top_movies_per_year`
WHERE year IS NOT NULL;

-- Criação da Tabela Integrada "movies_enriched" --

CREATE OR REPLACE TABLE `atividade2-493819.imdb_project.movies_enriched` AS
SELECT
    m.*,
    c.cpi,
    m.budget * (100 / c.cpi) AS budget_adjusted,
    m.gross_world_wide * (100 / c.cpi) AS gross_adjusted
FROM `atividade2-493819.imdb_project.movies_clean` AS m
LEFT JOIN `atividade2-493819.imdb_project.cpi` AS c
ON m.year = c.year;

-- VERIFICAR TABELA CPI (inflação EUA) APÓS IMPORTAR E CRAIR A TABELA A PARTIR DO CSV  -- 

SELECT * FROM `atividade2-493819.imdb_project.cpi`
LIMIT 50;