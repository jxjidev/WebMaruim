CREATE TABLE Produto (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Descricao TEXT,
    ImagemUrl VARCHAR(255),
    CategoriaId INT,
    Estoque INT NOT NULL, -- Controle de estoque do produto
    Ativo BIT NOT NULL DEFAULT 1, -- Indica se o produto está ativo
    FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id),
    CONSTRAINT CK_Estoque CHECK (Estoque >= 0) -- Estoque não pode ser negativo
);

