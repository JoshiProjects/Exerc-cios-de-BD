create database Zedo_Coco
on primary
(name= 'ZedoCoco1', filename ='E:\ze do coco\10-03-2022\ZedoCoco1.mdf' )
log on
(name= 'ZedoCoco1_log', filename ='E:\ze do coco\10-03-2022\ZedoCoco1_log.ldf' )
go
--------------------------------------------------------------------------------------------------------

use Zedo_Coco

-------------------------------------------------------------------


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

--------------------------------------------------------------------------------------------
--DML (Linguagem de Manipulação de Dados)-
--É um conjunto de instruções usada nas consultas e
--modificações dos dados armazenados nas tabelas do banco de dados.

INSERT INTO marca(CodMarca, Nomemarca) VALUES (1, 'Coca-Cola')
INSERT INTO marca(CodMarca, Nomemarca) VALUES (2, 'Poty')
INSERT INTO marca(CodMarca, Nomemarca) VALUES (3, 'Cotuba')
INSERT INTO marca(CodMarca, Nomemarca) VALUES (4, 'Pepsi')

-------------------------------------------------------------------------------------------

Select * from marca
Select * from Cliente
Select * from Produto
-------------------------------------------------------------------------------------------
INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email) 
VALUES (1, 'Alessandro Sandrini','123456','rua xxxxxxx','alessandro@terra.com');

INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email) 
VALUES (2, 'José Reinaldo','123456','rua Aurélio Augostinho Ruette','Jose@fogo.com');

INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email) 
VALUES (3, 'Kauê S. Fernandes','1517','rua Onório Ramos da Silva','kaue@ar.com');

INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email) 
VALUES (4, 'Ana Maria','123456','rua aaaaaaa','ana@agua.com');

--insert do produto--

INSERT INTO Produto(CodProduto,CodMarca,preco,estoque,descricao)
VALUES (1,1,8.00,5000,'Coca-Cola dois litro');

INSERT INTO Produto(CodProduto,CodMarca,preco,estoque,descricao)
VALUES (2,2,7.00,4000,'Poty litro');

INSERT INTO Produto(CodProduto,CodMarca,preco,estoque,descricao)
VALUES (3,3,6.50,1000,'Cotuba dois litro');

INSERT INTO Produto(CodProduto,CodMarca,preco,estoque,descricao)
VALUES (4,4,7.50,4500,'Pepsi dois litro');