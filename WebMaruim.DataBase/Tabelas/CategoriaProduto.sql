CREATE TABLE CategoriaProduto (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProdutoId INT NOT NULL,
    CategoriaId INT NOT NULL,
    FOREIGN KEY (ProdutoId) REFERENCES Produto(Id),
    FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id)
);

