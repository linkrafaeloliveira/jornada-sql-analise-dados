-- Script 1: Ranking das Músicas Mais Vendidas por Gênero (ROW_NUMBER)
-- Aplicação: Ranqueamento de itens dentro de categorias sem colapsar as linhas.
WITH faturamento_faixas AS (
    SELECT 
        g.name AS genero,
        t.name AS musica,
        SUM(il.unit_price * il.quantity) AS total_faturado
    FROM invoice_line il
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY g.name, t.name
)
SELECT 
    genero,
    musica,
    total_faturado,
    ROW_NUMBER() OVER(PARTITION BY genero ORDER BY total_faturado DESC) AS ranking_genero
FROM faturamento_faixas
ORDER BY genero, ranking_genero;

-- Script 2: Variação Mês a Mês (MoM) do Faturamento (LAG)
-- Aplicação: Análise de crescimento ou queda de vendas em relação ao período anterior.
WITH faturamento_mensal AS (
    SELECT 
        DATE_TRUNC('month', invoice_date) AS mes,
        SUM(total) AS faturamento_atual
    FROM invoice
    GROUP BY DATE_TRUNC('month', invoice_date)
)
SELECT 
    CAST(mes AS DATE) AS mes_ano,
    faturamento_atual,
    LAG(faturamento_atual, 1) OVER(ORDER BY mes) AS faturamento_mes_anterior,
    faturamento_atual - LAG(faturamento_atual, 1) OVER(ORDER BY mes) AS diferenca_faturamento
FROM faturamento_mensal
ORDER BY mes_ano;

-- Script 3: Total Acumulado por Cliente ao Longo do Tempo (SUM OVER)
-- Aplicação: Acompanhamento do Lifetime Value (LTV) e comportamento de compra individual.
SELECT 
    i.customer_id,
    c.first_name || ' ' || c.last_name AS nome_cliente,
    CAST(i.invoice_date AS DATE) AS data_compra,
    i.total AS valor_compra,
    SUM(i.total) OVER(PARTITION BY i.customer_id ORDER BY i.invoice_date) AS total_acumulado_cliente
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id
ORDER BY i.customer_id, i.invoice_date;
