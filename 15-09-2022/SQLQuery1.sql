/* Execicios
1)
 A) Trigger para dar baixa no estoque
 B) Trigger para dar uma entrada no estoque */

CREATE DATABASE BDProcedure1
USE BDProcedure1

CREATE TABLE Produto (
CodProd INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Descricao VARCHAR (100),
QtdEstoque NUMERIC (10,2),
Preco NUMERIC (10,2))


-- Criando a tabela VendaProd --

CREATE TABLE VendaProd (
CodVenda INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
DataVenda DATE NULL,
ValorVenda MONEY NULL,
CodProd INT,
QtdeProd NUMERIC (5,2),
FOREIGN KEY (CodProd) REFERENCES Produto(CodProd)
)

INSERT INTO Produto (Descricao, QtdEstoque, Preco) VALUES ('Arroz', 100,20);
INSERT INTO Produto (Descricao, QtdEstoque, Preco) VALUES ('Feijão', 200,10);

SELECT * FROM Produto


-- Criando a trigger baixaestoque --

CREATE TRIGGER BaixarEstoque
ON VendaProd
FOR Insert
AS
BEGIN
	DECLARE 
	@IdProd INT,
	@QtdeVendida DECIMAL (10,2)

	SELECT @IdProd= CodProd, @QtdeVendida= QtdeProd FROM inserted
	UPDATE Produto SET QtdEstoque= QtdEstoque - @QtdeVendida
	WHERE CodProd=@IdProd

END

/*Inserindo na tabela VendaProd e executando a trigger BaixaEstoque ***/

INSERT INTO VendaProd VALUES (GETDATE(),109.00,1,10)
INSERT INTO VendaProd VALUES (GETDATE(),1047.60,2,20)
SELECT * FROM Produto;


------------------------------tabela de compra------------------------------------------------
 create table CompraProd (
 CodCompra int primary key identity(1,1) NOT NULL,
 DataCompra DATE NULL,
 ValorCompra MONEY NULL,
 CodProd INT,
 QtdeProd NUMERIC (5,2),

 FOREIGN KEY (CodProd) REFERENCES Produto(CodProd)
 )


 CREATE TRIGGER adicionarEstoque
ON VendaProd
FOR Insert
AS
BEGIN
	DECLARE 
	@IdProd INT,
	@QtdeVendida DECIMAL (10,2)

	SELECT @IdProd= CodProd, @QtdeVendida= QtdeProd FROM inserted
	UPDATE Produto SET QtdEstoque= QtdEstoque - @QtdeVendida
	WHERE CodProd=@IdProd

END


