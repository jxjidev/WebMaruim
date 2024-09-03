CREATE TABLE ItemPedido (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PedidoId INT NOT NULL,
    ProdutoId INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Desconto DECIMAL(10, 2) DEFAULT 0, -- Desconto no item
    Total DECIMAL(10, 2) NOT NULL, -- Calculado como Quantidade * (Preco - Desconto)
    FOREIGN KEY (PedidoId) REFERENCES Pedido(Id),
    FOREIGN KEY (ProdutoId) REFERENCES Produto(Id),
    CONSTRAINT CK_Quantidade CHECK (Quantidade > 0), -- Quantidade deve ser positiva
    CONSTRAINT CK_Preco CHECK (Preco >= 0) -- Preço não pode ser negativo
);

