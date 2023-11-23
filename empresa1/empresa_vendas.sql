-- Criar o banco de dados
CREATE DATABASE empresa1;
USE empresa1;

-- Criar a tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(50),
    quantidade INT,
    preco DECIMAL(10, 2),
    data_compra DATE
);

-- Inserir dados de exemplo
INSERT INTO produtos (nome, quantidade, preco, data_compra) VALUES
('Produto A', 5, 10.99, '2023-11-23'),
('Produto B', 8, 15.75, '2023-11-23'),
('Produto C', 12, 8.50, '2023-11-22'),
('Produto D', 3, 20.00, '2023-11-22'),
('Produto E', 10, 12.99, '2023-11-21'),
('Produto F', 6, 18.50, '2023-11-21'),
('Produto G', 7, 9.99, '2023-11-20'),
('Produto H', 4, 14.25, '2023-11-20'),
('Produto I', 9, 11.75, '2023-11-19'),
('Produto J', 2, 22.00, '2023-11-19');

-- Criar a stored procedure para gerar o relatório diário
CREATE PROCEDURE relatorio_diario
AS
BEGIN
    SELECT
        data_compra AS Dia,
        SUM(quantidade) AS Quantidade_Total,
        SUM(quantidade * preco) AS Valor_Total
    FROM produtos
    GROUP BY data_compra;
END;

-- Executar a stored procedure para gerar o relatório diário
EXEC relatorio_diario;
