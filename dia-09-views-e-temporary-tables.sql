-- ============================================================
-- AULA 09 — VIEWS E TEMPORARY TABLES
-- Projeto: Chinook Database
-- PostgreSQL / DBeaver
-- ============================================================

-- 1. VIEW
CREATE VIEW vw_analise_clientes AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS cliente,
    c.country AS pais,
    COUNT(i.invoice_id) AS quantidade_compras,
    SUM(i.total) AS total_gasto
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country;


-- 2. Consulta da VIEW
SELECT *
FROM vw_analise_clientes;


-- 3. Análise dos 10 maiores clientes
SELECT
    cliente,
    pais,
    total_gasto
FROM vw_analise_clientes
ORDER BY total_gasto DESC
LIMIT 10;


-- 4. TEMP TABLE
CREATE TEMP TABLE tmp_cliente_faturamento AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS cliente,
    c.country AS pais,
    SUM(i.total) AS total_gasto
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country;


-- 5. Consulta da TEMP TABLE
SELECT *
FROM tmp_cliente_faturamento;


-- 6. Desafio final — VIEW reutilizável
CREATE VIEW vw_top_clientes AS
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS cliente,
    c.country AS pais,
    COUNT(i.invoice_id) AS quantidade_compras,
    SUM(i.total) AS total_gasto
FROM customer c
JOIN invoice i
    ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country;


-- 7. Os 5 clientes que mais gastaram
SELECT
    cliente,
    pais,
    quantidade_compras,
    total_gasto
FROM vw_top_clientes
ORDER BY total_gasto DESC
LIMIT 5;
