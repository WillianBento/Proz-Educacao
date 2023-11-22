CREATE TABLE [dbo].[pedidos] (
    [id_pedido]  INT          NOT NULL,
    [id_cliente] INT          NULL,
    [produto]    VARCHAR (50) NULL,
    [quantidade] INT          NULL,
    PRIMARY KEY CLUSTERED ([id_pedido] ASC),
    FOREIGN KEY ([id_cliente]) REFERENCES [dbo].[clientes] ([id_cliente])
);


GO

