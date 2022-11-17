CREATE DATABASE BDProcedure2;
USE BDProcedure2

CREATE TABLE Caixa (
Data DATE,
Saldo_inicial DECIMAL (10,2),
Saldo_final DECIMAL (10,2)
)
----------------------------------------------
INSERT INTO Caixa VALUES (GETDATE(),100,100)
/* Inserindo um registro e inseridno a data com função nativa SQL Server*/


----------------------------------------------
SELECT * FROM Caixa


----------------------------------------------
CREATE TABLE Vendas (
Data DATE,
Codigo INT,
Valor DECIMAL(10,2)
)


-----------------------------------------------
SELECT * FROM Vendas


-----------------------------------------------

/* Criando a tigger "Adicionar" - 
OSB: O nome da trigger pode ser qualquer um*/

CREATE TRIGGER Adicionar /*Adiciona o saldo  final do caixa*/
ON Vendas
FOR INSERT 
AS
BEGIN 
	DECLARE 
	@Valor DECIMAL (10,2),
	@Data DATE

	SELECT @Data= DATA,@Valor = valor FROM inserted

	UPDATE Caixa SET Saldo_final = Saldo_final + @Valor
	WHERE DATA = @Data

END


------------------------------------------------
INSERT INTO Vendas VALUES (GETDATE(),1,200) /*Executa a trigger*/


------------------------------------------------
SELECT * FROM Caixa


--------------DELETAR---------------------------
CREATE TRIGGER deletar  /*Adiciona o saldo  final do caixa*/
ON Vendas
FOR DELETE 
AS
BEGIN 
	DECLARE 
	@Valor DECIMAL (10,2),
	@Data DATE

	SELECT @Data= DATA,@Valor = Valor FROM deleted

	UPDATE Caixa SET Saldo_final = Saldo_final - @Valor
	WHERE DATA = @Data

END


------------------------------------------------
delete from Vendas WHERE Codigo=1


------------------------------------------------
ALTER TABLE Vendas ADD estoque INTEGER;

-------------------------------------------------

CREATE TRIGGER adicionarEST /* EST respresenta estoque, adiciona ao estoque*/
ON Vendas
FOR INSERT
AS 
BEGIN
   DECLARE


END

