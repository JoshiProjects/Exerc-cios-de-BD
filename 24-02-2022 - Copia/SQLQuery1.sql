create database Zedo_Coco
on primary
(name= 'ZedoCoco1', filename ='E:\ze do coco\24-02-2022\ZedoCoco1.mdf' )
log on
(name= 'ZedoCoco1_log', filename ='E:\ze do coco\24-02-2022ZedoCoco1_log.ldf' )
go
--------------------------------------------------------------------------------------------------------

CREATE TABLE Cliente (
CodCliente INTEGER PRIMARY KEY,
email VARCHAR (100),
endereco VARCHAR (40),
nome VARCHAR (40),
CPF_CNPJ VARCHAR (10)
)

CREATE TABLE Pedido (
total DECIMAL (10,2),
data DATE,
CodPedido INTEGER PRIMARY KEY,
CodCliente INTEGER,
FOREIGN KEY(CodCliente) REFERENCES Cliente (CodCliente)
)

CREATE TABLE ItemPedido (
CodItem INTEGER PRIMARY KEY,
subtotal DECIMAL (10,2),
quantidade DECIMAL (10,2),
CodPedido INTEGER,
CodProduto INTEGER,
FOREIGN KEY(CodPedido) REFERENCES Pedido (CodPedido)
)

CREATE TABLE Produto (
CodProduto INTEGER PRIMARY KEY,
preco DECIMAL (10,2),
descricao VARCHAR (100),
estoque DECIMAL (10,2),
CodMarca INTEGER 
)

CREATE TABLE Marca (
CodMarca INTEGER  PRIMARY KEY,
Nomemarca VARCHAR (25)
)

ALTER TABLE ItemPedido ADD FOREIGN KEY(CodProduto) REFERENCES Produto (CodProduto)
ALTER TABLE Produto ADD FOREIGN KEY(CodMarca) REFERENCES Marca (CodMarca)