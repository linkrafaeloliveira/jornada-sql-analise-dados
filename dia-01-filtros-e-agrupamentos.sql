SELECT BillingCity,
       SUM(Total) AS Soma_Total,
       AVG(Total) AS Media_Total
FROM Invoice
GROUP BY BillingCity 
ORDER BY SUM(Total) DESC;
