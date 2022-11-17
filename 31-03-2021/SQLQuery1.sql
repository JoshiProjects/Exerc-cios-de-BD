create database Zedo_Coco1
on primary
(name= 'ZedoCoco1', filename ='E:\ze do coco\10-03-2022\ZedoCoco1.mdf' )
log on
(name= 'ZedoCoco1_log', filename ='E:\ze do coco\10-03-2022\ZedoCoco1_log.ldf' )
go
--------------------------------------------------------------------------------------------------------

use Zedo_Coco1

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
CodMarca INTEGER,
)

CREATE TABLE Marca (
CodMarca INTEGER  PRIMARY KEY,
Nomemarca VARCHAR (25)
)

ALTER TABLE ItemPedido ADD FOREIGN KEY(CodProduto) REFERENCES Produto (CodProduto)


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
Select * from Pedido
Select * from ItemPedido

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

--insert do Pedido--

INSERT INTO Pedido(CodPedido,CodCliente,data,total)
VALUES (1,2,'03/07/2022',1000);

INSERT INTO Pedido(CodPedido,CodCliente,data,total)
VALUES (2,3,GETDATE(),2000);

INSERT INTO Pedido(CodPedido,CodCliente,data,total)
VALUES (3,3,'03/01/2022',11000);

INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (1,2,1,10,100);
INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (2,2,2,10,150);
INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (3,2,3,20,200);

INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (4,1,1,20,1000);
INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (5,1,2,30,1502);
INSERT ItemPedido(CodItem,CodPedido,CodProduto,quantidade,subtotal)
VALUES (6,1,3,40,2001);


----------------------------- 24/03/2022 ------------------------------------------------

DELETE FROM Marca WHERE CodMarca= 3;
INSERT INTO Marca (CodMarca, Nomemarca) VALUES (3, 'Cotuba');
SELECT * FROM Cliente WHERE CodCliente= 1;
SELECT * FROM Cliente WHERE CodCliente >= 1 AND CodCliente <= 3;
SELECT Nome, Endereco FROM Cliente WHERE CodCliente BETWEEN 1 AND 3;
SELECT CodCliente, Nome, Endereco FROM Cliente WHERE CodCliente NOT BETWEEN 1 AND 2;

-----------------------insert do atributo cidade----------------------------------------

ALTER TABLE Cliente ADD Cidade VARCHAR(50);
SELECT * FROM Cliente;

---------------------insert de cidade---------------------------------------------------

INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email,Cidade)
VALUES (5, 'Ana Maria','123456','rua aaaaaaa','ana@agua.com','Catanduva');

INSERT INTO Cliente(CodCliente, Nome, CPF_CNPJ,endereco,email,Cidade)
VALUES (6, 'Rafael Moreira','777','rua Skrrrrr','ganggang@lean.com','Catanduva');

----------------------------------------------------------------------------------------------

UPDATE Cliente SET nome= 'kanYE west' WHERE CPF_CNPJ= '123456'; 


 ----------------------------------------------------------------------------------------------

 Select getdate (); ---- RETORNA DATA ATUAL
 Select Datepart (MONTH, '03/31/2022'); ---- RETORNA O NÚMERO DO MÊS DA DATA PASSADA
 SELECT Datepart  (YEAR, '12/29/2019'); ---- RETORNA O NÚMERO DO ANO DA DATA PASSADA
 SELECT DATEPART (DAY, '12/31/2019'); ---- RETORNA DIA
 SELECT DATEADD (YEAR, 1, '12/29/2019'); ---- ADICIONA UM ANO NA DATA PASSADA
 SELECT DATEADD (MONTH, 1, '12/29/2019'); --- ADICIONA UM MÊS NA DATA PASSADA
 SELECT DATEADD (DAY, 1, '12/20/2019'); ---- ADICIONA UM DIA NA DATA PASSADA
 SELECT DATEDIFF (DAY, '12/10/2019', '12/10/2019');  ----- RETORNA DIFERENÇA ENTRE DUAS DATAS PASSADAS

