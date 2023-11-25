-- Criar a base de dados
CREATE DATABASE loja1;
USE loja1;

-- Criar a tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

-- Inserir produtos
INSERT INTO produtos (nome, valor) VALUES
('Smartphone', 1500.00),
('Notebook', 2500.00),
('Smart TV', 2000.00),
('Fone de Ouvido', 100.00),
('Tablet', 800.00);

-- Criar a tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50) NOT NULL
);

-- Inserir clientes
INSERT INTO clientes (nome) VALUES
('Cliente1'),
('Cliente2'),
('Cliente3');

-- Criar a tabela de compras
CREATE TABLE compras (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT,
    id_produto INT,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Inserir compras
INSERT INTO compras (id_cliente, id_produto, quantidade, data_compra) VALUES
(1, 1, 2, '2023-11-25'),
(2, 3, 1, '2023-11-25'),
(3, 2, 1, '2023-11-25'),
(1, 4, 3, '2023-11-25'),
(2, 5, 2, '2023-11-25');

-- Criar a função para somar as compras dos clientes durante um dia
CREATE FUNCTION somarComprasDoDia(@dataCompra DATE) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE @total DECIMAL(10, 2);
    
    SELECT @total = SUM(produtos.valor * compras.quantidade)
    FROM compras
    JOIN produtos ON compras.id_produto = produtos.id
    WHERE compras.data_compra = @dataCompra;
    
    RETURN @total;
END;


-- Criar a função para somar as compras de todos os clientes durante um dia
CREATE FUNCTION dbo.somarComprasClientesDoDia(@dataCompra DATE) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE @total DECIMAL(10, 2);

    SELECT @total = SUM(produtos.valor * compras.quantidade)
    FROM compras
    JOIN produtos ON compras.id_produto = produtos.id
    WHERE compras.data_compra = @dataCompra;

    RETURN @total;
END;
GO

--função para somar as compras do dia 2023-11-25
DECLARE @dataCompra DATE = '2023-11-25';

SELECT
    clientes.nome AS NomeCliente,
    dbo.somarComprasClientesDoDia(@dataCompra) AS TotalCompras
FROM
    clientes;