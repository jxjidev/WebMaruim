CREATE TABLE StatusPedido (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL, -- Ex: Pendente, Enviado, Entregue, Cancelado
    Descricao VARCHAR(255)
);

