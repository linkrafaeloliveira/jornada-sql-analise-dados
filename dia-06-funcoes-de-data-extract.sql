SELECT 
    InvoiceId,
    CustomerId,
    CAST(InvoiceDate AS DATE) AS Data_Faturamento,
    EXTRACT(MONTH FROM InvoiceDate) AS Mes,
    EXTRACT(YEAR FROM InvoiceDate) AS Ano,
    CURRENT_DATE AS Data_Hoje,
    CURRENT_DATE - CAST(InvoiceDate AS DATE) AS Dias_Desde_Faturamento
FROM Invoice
LIMIT 15;
