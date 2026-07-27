SELECT 
    CustomerId,
    FirstName || ' ' || LastName AS Nome_Cliente,
    Phone AS Telefone_Original,
    REPLACE(REPLACE(REPLACE(Phone, '(', ''), ')', ''), '-', '') AS Telefone_Limpo
FROM Customer;
