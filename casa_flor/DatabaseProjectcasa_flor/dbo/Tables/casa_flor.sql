-- Crie o banco de dados 
CREATE DATABASE casa_flor;

-- Use o banco de dados
USE casa_flor;

-- Crie a tabela "clientes"
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50)
);

-- Crie a tabela "pedidos"
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    produto VARCHAR(50),
    quantidade INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserir dados nas tabelas "clientes"
INSERT INTO clientes VALUES
(1, 'João Silva', 'joao@email.com'),
(2, 'Maria Oliveira', 'maria@email.com');

-- Inserir dados na tabela "pedidos"
INSERT INTO pedidos VALUES
(101, 1, 'Produto A', 3),
(102, 1, 'Produto B', 2),
(103, 2, 'Produto C', 1);

-- Consulta utilizando INNER JOIN para combinar dados das tabelas "clientes" e "pedidos"
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;
