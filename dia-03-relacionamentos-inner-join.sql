SELECT c.FirstName || ' ' || c.LastName AS Nome_Cliente,
       SUM(i.Total) AS Total_Gasto
FROM Invoice i
INNER JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY Total_Gasto DESC;
