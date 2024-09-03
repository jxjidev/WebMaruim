CREATE TABLE Usuario (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClienteId INT NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL, -- Nome de usuário único
    SenhaHash VARCHAR(255) NOT NULL, -- Armazena a hash da senha para segurança
    DataCriacao DATETIME DEFAULT GETDATE(),
    Ativo BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

