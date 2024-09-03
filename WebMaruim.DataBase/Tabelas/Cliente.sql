CREATE TABLE Cliente (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE, -- Email único por cliente
    Telefone VARCHAR(20),
    DataCadastro DATETIME DEFAULT GETDATE(), -- Data de cadastro do cliente
    Ativo BIT NOT NULL DEFAULT 1 -- Indica se o cliente está ativo
);
