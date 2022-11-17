CREATE DATABASE ATIVIDADE_AVALIATIVA_OCTOBER;

USE ATIVIDADE_AVALIATIVA_OCTOBER;


-----------------------------------------------------------------------------------------------------------//

CREATE TABLE cliente (
endereco VARCHAR(250),
CPF_CNPJ VARCHAR(14),
email VARCHAR(60),
nome VARCHAR(250),
cod_cliente INTEGER PRIMARY KEY IDENTITY
)

CREATE TABLE pedido (
data_pedido date,
total INTEGER,
cod_pedido INTEGER PRIMARY KEY IDENTITY,
cod_cliente INTEGER,
FOREIGN KEY(cod_cliente) REFERENCES cliente (cod_cliente)
)

CREATE TABLE item_pedido (
subtotal INTEGER,
qtd INTEGER,
cod_Item INTEGER PRIMARY KEY IDENTITY,
cod_pedido INTEGER,
cod_produto INTEGER,
FOREIGN KEY(cod_pedido) REFERENCES pedido (cod_pedido)
)

CREATE TABLE produto (
preco INTEGER,
estoque INTEGER,
descricao VARCHAR(2500),
cod_produto INTEGER PRIMARY KEY IDENTITY,
cod_marca INTEGER
)

CREATE TABLE marca (
nome_marca VARCHAR(250),
cod_marca INTEGER PRIMARY KEY IDENTITY
)

ALTER TABLE item_pedido ADD FOREIGN KEY(cod_produto) REFERENCES produto (cod_produto)
ALTER TABLE produto ADD FOREIGN KEY(cod_marca) REFERENCES marca (cod_marca)


------------------------------------- INSERÇÃO DE VALORES---------------------------------------//
                                /*inserção de valores na tabela pedido*/
INSERT INTO pedido(data_pedido, total) VALUES (GETDATE(), 10)

select * from pedido


------------------------------------- INSERÇÃO DE VALORES---------------------------------------//
                                /*inserção de valores na tabela cliente*/

INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos cria','117.451.582-45','josereinaldo@gmail.com','Jose Reinaldo');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos bobo','745.483.498-85','kauekevin@gmail.com','Kaue Kevin');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos legais','584.871.153-54','lubernadi@gmail.com','Luiz Bernadi');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos feio','186.948.651-78','felipealmeida@gmail.com','Felipe Almeida');

select * from cliente;

-------------------------------------------------------------------------------------------------//
                                /*inserção de valores na tabela produto*/

INSERT INTO produto(preco, estoque, descricao) values (10,100,'pacote de arroz - 5kg');
INSERT INTO produto(preco, estoque, descricao) values (18,67,'pacote de feijão - 1kg');
INSERT INTO produto(preco, estoque, descricao) values (2,69,'detergente - 650 Ml');
INSERT INTO produto(preco, estoque, descricao) values (5,250,'óleo de girassol - 500 Ml');
INSERT INTO produto(preco, estoque, descricao) values (4,400,'macarrão - 500g');
INSERT INTO produto(preco, estoque, descricao) values (6,130,'chips - 250g');
INSERT INTO produto(preco, estoque, descricao) values (5,50,'bisnaguinha - 350g');

select * from produto;

-----------------------------------------------------------------------------------------------------------//
                                /*inserção de valores na tabela marca*/

INSERT INTO marca  values ('URBANO') 
INSERT INTO marca values ('FANDANGOS')
INSERT INTO marca values ('YPE')
INSERT INTO marca values ('CARIOQUINHA')
INSERT INTO marca values ('BRASIL OLEOS')
INSERT INTO marca values ('SOJA')
INSERT INTO marca values ('BISNAGA')
select * from marca;

--------------------------------------------------------------------------------------------------------------------------//
                                  /*insert do item pedido*/
INSERT INTO item_pedido(qtd, cod_produto) Values (2,2)
INSERT INTO item_pedido(qtd, cod_produto) Values (2,4)
INSERT INTO item_pedido(qtd, cod_produto) Values (2,5)
INSERT INTO item_pedido(qtd, cod_produto) Values (2,3)


select * from item_pedido

----------------------------------------------------------------------------------------------------------
delete from item_pedido where cod_Item = 2
delete from item_pedido where cod_Item = 3
delete from item_pedido where cod_Item = 4
delete from item_pedido where cod_Item = 5
---------------------------------------------CRIANDO TRIGGER PARA SUBTOTAL(DESCONSIDERE)-----------------------------------------------------------------------------------------------

drop trigger calculo_Subtotal
/*
create trigger calculo_Subtotal
on item_pedido
FOR INSERT 
AS
BEGIN
DECLARE
   @iditem int,
   @idprod int,
   @qtdvendida decimal(10,2),
   @preco decimal(20,2),
   @Resultado Decimal (20,2)


   select cod_produto=@idprod, preco= @preco from produto
  

   UPDATE item_pedido set subtotal = @preco * qtd
   where cod_Item = @iditem
   end */

  ----------outra tentativa ---------------------------------
create trigger calculo_Subtotal
on item_pedido
FOR INSERT 
AS
BEGIN
DECLARE
   @iditem INTEGER,
   @idprod INTEGER,
   @qtdvendida INTEGER,
   @preco INTEGER,
   @Resultado INTEGER


   select @iditem=cod_Item, @qtdvendida=qtd from inserted
   select @preco=preco from produto where @idprod= cod_produto
    
   UPDATE item_pedido set subtotal = @qtdvendida * @preco
   where @iditem=cod_Item

   end

--------------------------------------------------------------------------------------------------------------
select * from item_pedido
---------------------------------------------
drop trigger baixa_estoque
---------- --------------------
create trigger baixa_estoque
on item_pedido
FOR INSERT 
AS
BEGIN
DECLARE
   @idprod int,
   @qtdvendida int

   select @idprod = cod_produto, @qtdvendida = qtd from inserted
   UPDATE produto set estoque = estoque - @qtdvendida
   where cod_produto = @idprod
   end

-----------------------------CRIANDO UM PROCEDURE QUE BUSCA E MOSTRA DOIS DADOS(ALém do nome) DO CLIENTE----------------------------------------------------------------------------------------------
  
CREATE PROCEDURE chamaCLIENTE
@BuscaDEcampos varchar(200)
as
select nome, CPF_CNPJ, endereco from cliente
where nome LIKE '%'	+ @BuscaDEcampos + '%'

-----------------------------EXECUTAÇÃO DO PROCEDURE ACIMA--------------------------------------------------------------------------------------

execute chamaCLIENTE 'Jose'

-----------------------------CRIAÇÃO DE UM PROCEDURE DE EDIÇÃO DO CAMPOS DE CLIENTE-------------------------------------------------------------
CREATE PROCEDURE EditCliente
@IdCLient int,
@nomeclient varchar(250), 
@emailClient Varchar(250),
@enderecoClient Varchar(300)
AS
 update cliente set nome= @nomeclient, email= @emailClient, endereco=@enderecoClient where cod_cliente= @IdCLient

 ---------------------------EXECUÇÃO---------------------------------------------------------------------------------------------------------------

execute EditCliente 4, 'Felipe Almeida','felipealmeida@gmail.com','Rua São Paulo'

----------------------PROCEDURE PARA DELETE PARA PRODUTOS-------------------------------------------------------------

create procedure Excluir_marca

@Idmarca int
as

DELETE FROM marca WHERE cod_marca = @Idmarca

execute Excluir_Marca 1


