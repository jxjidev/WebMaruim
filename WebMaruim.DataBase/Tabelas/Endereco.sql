CREATE TABLE Endereco (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Bairro VARCHAR(100),
    Rua VARCHAR(255),
    Numero VARCHAR(10),
    Complemento VARCHAR(255), -- Complemento opcional
    TipoEndereco VARCHAR(50) NOT NULL, -- Ex: Residencial, Comercial
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

