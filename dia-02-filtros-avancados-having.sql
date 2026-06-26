SELECT BillingCity, SUM(Total) AS Faturamento_Total
FROM Invoice
GROUP BY BillingCity
HAVING SUM(Total) > 40
ORDER BY Faturamento_Total DESC;
