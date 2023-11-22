-- Criar o banco de dados "casa_nova"
--CREATE DATABASE casa_nova;
USE casa_nova;

-- Criar a tabela "Casas"
CREATE TABLE Casas (
    id_casa INT PRIMARY KEY,
    endereco VARCHAR(100),
    numero_quartos INT,
    numero_banheiros INT,
    numero_andares INT,
    numero_moradores INT DEFAULT 0
);

-- Criar a tabela "Moradores"
CREATE TABLE Moradores (
    id_morador INT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    id_casa INT,
    FOREIGN KEY (id_casa) REFERENCES Casas(id_casa)
);

-- Criar um trigger para atualizar o número de moradores após a inserção de um novo morador
CREATE TRIGGER after_insert_moradores
ON Moradores
AFTER INSERT
AS
BEGIN
    UPDATE Casas
    SET numero_moradores = numero_moradores + 1
    WHERE id_casa IN (SELECT id_casa FROM inserted);
END;

-- Inserir dados na tabela "Casas"
INSERT INTO Casas (id_casa, endereco, numero_quartos, numero_banheiros, numero_andares)
VALUES
    (1, 'Rua A, 123', 3, 2, 2),
    (2, 'Rua B, 456', 4, 3, 1);

-- Inserir dados na tabela "Moradores"
INSERT INTO Moradores (id_morador, nome, idade, id_casa)
VALUES
    (1, 'João Silva', 30, 1),
    (2, 'Maria Oliveira', 25, 1),
    (3, 'Carlos Santos', 35, 2);

-- Consultar dados para verificar o número de moradores em cada casa
SELECT * FROM Casas;

-- Inserir um novo morador na tabela "Moradores"
INSERT INTO Moradores (id_morador, nome, idade, id_casa)
VALUES (4, 'Ana Souza', 28, 1);

-- Consultar dados novamente para verificar a atualização do número de moradores
SELECT * FROM Casas;
