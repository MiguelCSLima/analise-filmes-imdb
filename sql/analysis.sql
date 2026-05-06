-- 1. Relação entre orçamento e receita (valores corrigidos)
-- Objetivo:
-- Verificar se filmes que gastam mais tendem a arrecadar mais
-- e medir lucro médio e retorno sobre investimento (ROI).

SELECT
    COUNT(*) AS total_filmes,
    CORR(budget_adjusted, gross_adjusted) AS correlacao_orcamento_receita,
    AVG(gross_adjusted - budget_adjusted) AS lucro_medio,
    AVG(SAFE_DIVIDE(gross_adjusted - budget_adjusted, budget_adjusted)) AS roi_medio
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE budget_adjusted IS NOT NULL
  AND gross_adjusted IS NOT NULL
  AND budget_adjusted > 0;


-- Top 20 filmes com maior retorno proporcional (ROI)
-- Útil para identificar filmes que gastaram pouco e lucraram muito

SELECT
    title,
    year,
    budget_adjusted,
    gross_adjusted,
    gross_adjusted - budget_adjusted AS lucro,
    SAFE_DIVIDE(gross_adjusted - budget_adjusted, budget_adjusted) AS roi
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE budget_adjusted IS NOT NULL
  AND gross_adjusted IS NOT NULL
  AND budget_adjusted > 0
ORDER BY roi DESC
LIMIT 20;


-- 2. Relação entre número de votos e nota IMDb
-- Objetivo:
-- Verificar se filmes mais populares tendem a receber
-- melhores avaliações do público.

SELECT
    COUNT(*) AS total_filmes,
    CORR(vote, rating_imdb) AS correlacao_votos_nota,
    AVG(vote) AS media_votos,
    AVG(rating_imdb) AS media_nota
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE vote IS NOT NULL
  AND rating_imdb IS NOT NULL;


-- Comparação por faixas de popularidade
-- Útil para observar se filmes com mais votos têm, em média, nota maior

SELECT
    CASE
        WHEN vote < 10000 THEN 'Baixa popularidade'
        WHEN vote < 100000 THEN 'Media popularidade'
        ELSE 'Alta popularidade'
    END AS faixa_votos,
    COUNT(*) AS total_filmes,
    AVG(rating_imdb) AS media_nota
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE vote IS NOT NULL
  AND rating_imdb IS NOT NULL
GROUP BY faixa_votos
ORDER BY media_nota DESC;


-- 3. Associação entre gênero e Oscar
-- Objetivo:
-- Verificar quais gêneros possuem maior média de premiações.
-- Observação:
-- Esta consulta assume que os gêneros estão separados por vírgula.

SELECT
    TRIM(g) AS genero,
    COUNT(*) AS total_filmes,
    AVG(oscar) AS media_oscar,
    SUM(oscar) AS total_oscars
FROM `atividade2-493819.imdb_project.movies_enriched`,
UNNEST(SPLIT(genre, ',')) AS g
WHERE genre IS NOT NULL
  AND oscar IS NOT NULL
GROUP BY genero
ORDER BY media_oscar DESC, total_oscars DESC;


-- 4. Relação entre duração do filme e nota IMDb
-- Considera apenas durações plausíveis, removendo valores extremos
-- e registros nulos para evitar distorções na análise.

SELECT
    COUNT(*) AS total_filmes,
    CORR(duration, rating_imdb) AS correlacao_duracao_nota,
    AVG(duration) AS duracao_media,
    AVG(rating_imdb) AS nota_media
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE duration IS NOT NULL
  AND rating_imdb IS NOT NULL
  AND duration BETWEEN 40 AND 300;


--  Nota média por faixa de duração
-- Classifica os filmes em curtos, médios e longos para comparar
-- como a avaliação média varia entre as categorias.

SELECT
    CASE
        WHEN duration < 90 THEN 'Curto'
        WHEN duration <= 120 THEN 'Medio'
        ELSE 'Longo'
    END AS faixa_duracao,
    COUNT(*) AS total_filmes,
    AVG(rating_imdb) AS media_nota
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE duration IS NOT NULL
  AND rating_imdb IS NOT NULL
  AND duration BETWEEN 40 AND 300
GROUP BY faixa_duracao
ORDER BY media_nota DESC;


-- 5. Evolução temporal de orçamento e receita ao longo das décadas
-- com filtro de valores plausíveis para reduzir o efeito de outliers

SELECT
    CAST(FLOOR(year / 10) * 10 AS INT64) AS decade,
    COUNT(*) AS total_filmes,
    AVG(budget_adjusted) AS avg_budget,
    APPROX_QUANTILES(budget_adjusted, 100)[OFFSET(50)] AS mediana_budget,
    AVG(gross_adjusted) AS avg_gross,
    APPROX_QUANTILES(gross_adjusted, 100)[OFFSET(50)] AS mediana_gross,
    AVG(gross_adjusted - budget_adjusted) AS avg_lucro,
    AVG(SAFE_DIVIDE(gross_adjusted - budget_adjusted, budget_adjusted)) AS avg_roi
FROM `atividade2-493819.imdb_project.movies_enriched`
WHERE year IS NOT NULL
  AND budget_adjusted IS NOT NULL
  AND gross_adjusted IS NOT NULL
  AND budget_adjusted > 0
  AND budget_adjusted BETWEEN 10000 AND 1000000000
  AND gross_adjusted BETWEEN 10000 AND 5000000000
GROUP BY decade
ORDER BY decade;
