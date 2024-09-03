CREATE TABLE Pagamento (
    Id INT PRIMARY KEY IDENTITY(1,1),
    PedidoId INT NOT NULL,
    MetodoPagamento VARCHAR(50) NOT NULL, -- Ex: Cartão, Boleto, Pix
    StatusPagamento VARCHAR(50) NOT NULL DEFAULT 'Pendente',
    Valor DECIMAL(10, 2) NOT NULL,
    DataPagamento DATETIME,
    FOREIGN KEY (PedidoId) REFERENCES Pedido(Id)
);

