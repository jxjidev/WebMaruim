CREATE TABLE Pedido (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UsuarioId INT NOT NULL,
    Data DATETIME NOT NULL,
    StatusPedidoId INT NOT NULL, -- Status atual do pedido
    Total DECIMAL(10, 2) NOT NULL, -- Total do pedido
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    FOREIGN KEY (StatusPedidoId) REFERENCES StatusPedido(Id)
);

