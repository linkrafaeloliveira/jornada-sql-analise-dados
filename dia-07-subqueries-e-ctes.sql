--
--Aplicação: Filtragem dinâmica sem precisar 'chumbar' valores manuais na query.
-- SCRIPT 1: Clientes com gasto superior à média geral
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome_cliente,
    SUM(i.total) AS total_gasto
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(i.total) > (
    SELECT AVG(total_por_cliente)
    FROM (
        SELECT SUM(total) AS total_por_cliente 
        FROM invoice 
        GROUP BY customer_id
    ) AS sub_media
)
ORDER BY total_gasto DESC;
--
--Aplicação: Regras de negócio modularizadas para relatórios de inteligência comercial.
-- SCRIPT 2: Classificação RFV/Perfil de Cliente via CTE
WITH metrica_cliente AS (
    SELECT 
        customer_id,
        COUNT(invoice_id) AS total_compras,
        SUM(total) AS valor_total_gasto
    FROM invoice
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome_cliente,
    mc.total_compras,
    mc.valor_total_gasto,
    CASE 
        WHEN mc.valor_total_gasto >= 45 THEN 'Cliente VIP / Alto Valor'
        WHEN mc.valor_total_gasto BETWEEN 38 AND 44.99 THEN 'Cliente Médio'
        ELSE 'Cliente de Baixo Recorrência'
    END AS categoria_cliente
FROM metrica_cliente mc
JOIN customer c ON mc.customer_id = c.customer_id
ORDER BY mc.valor_total_gasto DESC;
--
--Aplicação: Auditoria de catálogo.
-- SCRIPT 3: Músicas sem nenhuma venda registrada
SELECT 
    t.track_id,
    t.name AS nome_musica,
    a.title AS nome_album
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE NOT EXISTS (
    SELECT 1 
    FROM invoice_line il 
    WHERE il.track_id = t.track_id
)
ORDER BY t.name ASC;
