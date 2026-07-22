SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS Nome_Cliente,
    i.InvoiceId,
    i.Total
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;
