CREATE DATABASE BDProcedure

USE BDProcedure

CREATE TABLE Cliente (
ID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nome VARCHAR(60) NULL, 
Endereco VARCHAR (60) NULL,
Bairro VARCHAR (40) NULL,
Cidade VARCHAR (40),
UF VARCHAR (2) NULL,
CPF VARCHAR (14) NULL,
Email VARCHAR (60) NULL,
)

--------------------------------------------------------------
INSERT INTO Cliente (Nome, Endereco, Bairro, Cidade, UF, CPF, Email)
VALUES ('Cliente 01', 'Rua 01, nº 100', 'Bairro I', 'Catanduva', 'SP', '123.456.789-01', 'cliente01@email.com')

INSERT INTO Cliente (Nome, Endereco, Bairro, Cidade, UF, CPF, Email)
VALUES ('Cliente 02', 'Rua 02, nº 200', 'Bairro II', 'Curituba', 'PR', '123.456.789-02', 'cliente02@email.com')

INSERT INTO Cliente (Nome, Endereco, Bairro, Cidade, UF, CPF, Email)
VALUES ('Cliente 03', 'Rua 03, nº 300', 'Bairro III', 'Uberaba', 'MG', '123.456.789-03', 'cliente03@email.com')

--------------------------------------------------------------

CREATE TABLE Marca (
ID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nome VARCHAR(60) NULL)

INSERT INTO Marca(Nome) VALUES ('Marca 01')
INSERT INTO Marca(Nome) VALUES ('Marca 02')
INSERT INTO Marca(Nome) VALUES ('Marca 03')

--------------------------------------------------------------

CREATE TABLE Funcionario (
ID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Nome VARCHAR(60) NULL, 
Endereco VARCHAR (60) NULL,
Bairro VARCHAR (40) NULL,
Cidade VARCHAR (40),
UF VARCHAR (2) NULL,
CPF VARCHAR (14) NULL,
Email VARCHAR (60) NULL,
DataCont DATETIME NULL
)
-------------------------------------------------------------
INSERT INTO Funcionario (Nome, Endereco, Bairro, Cidade, UF, CPF, Email, DataCont)
VALUES ('Funcionario 01','Rua 01, n° 100','Bairro I','Catanduva','SP','123.456.789-01','Funcionario01@gmail.com','12/25/2019');

INSERT INTO Funcionario (Nome, Endereco, Bairro, Cidade, UF, CPF, Email, DataCont)
VALUES ('Funcionario 02','Rua 02, n° 200','Bairro II','Catanduva','SP','123.456.789-02','Funcionario02@gmail.com','03/09/2019'); 

INSERT INTO Funcionario (Nome, Endereco, Bairro, Cidade, UF, CPF, Email, DataCont)
VALUES ('Funcionario 03','Rua 03, n° 300','Bairro III','Catanduva','SP','123.456.789-03','Funcionario03@gmail.com','10/10/2019'); 

INSERT INTO Funcionario (Nome, Endereco, Bairro, Cidade, UF, CPF, Email, DataCont)
VALUES ('Funcionario 04','Rua 04, n° 400','Bairro IV','Catanduva','SP','123.456.789-04','Funcionario04@gmail.com','05/11/2019') 

INSERT INTO Funcionario (Nome, Endereco, Bairro, Cidade, UF, CPF, Email, DataCont)
VALUES ('Funcionario 05','Rua 05, n° 500','Bairro V','Catanduva','SP','123.456.789-05','Funcionario05@gmail.com','12/12/2019'); 

select * from Cliente
select * from Marca
select * from Funcionario

--listagem---------------------------------------------------------------------------------------------------------------------------------------------------

create procedure BuscaCliente  --- Declarando o nome da procedure
@CampoBusca varchar(25) --- Declarando variavel (note que utilizamos o @ antes do nome da variavel
as
select CPF ,Nome --- consulta
from Cliente
where nome LIKE '%' + @CampoBusca + '%' 
----------------------------------------------------------------------------------------------------
execute BuscaCliente 'liente' --- Chamado a procedure Buscal e passando o parametro de pesquisa
-------------------------------------------------------------------------------------------------------

/*editar---------------------------------------------------------------------------------------------*/


create procedure EditarCliente --- Declarando o nome do procedure
@IDClie int, --- Declarando as variaveis (note que utilizamos o @ antes do nome das variaveis
@NomeCli varchar(60),
@EndCli varchar(60)

as 

update Cliente set Nome= @NomeCli, Endereco= @EndCli where ID= @IDClie

-------------------------------------------------------------------------------------------------------

execute EditarCliente 1,'josé da Silva Sauro Lopes', 'Rua 7 de Setembro, nº400'

-excluir-------------------------------------------------------------------------------------------------------

create procedure Excluir /*----declarando o nome do "procedure"*/
@IDclie int

as
delete from Cliente where ID= @IDclie

-----------------------------------------------------------------------------------------------------------
execute Excluir 2 

/*inserir--------------------------------------------------------------------------------------------------*/

create procedure Inserir ------------nome do procedimento

@nomeclien varchar(200),
@endereco varchar(200),
@Bairro varchar (200),
@city varchar(200),
@uf varchar (2),
@cpf varchar (14),
@email varchar(200)

as
INSERT INTO Cliente (Nome, Endereco, Bairro, Cidade, UF, CPF, Email) 
VALUES (@nomeclien,@endereco,@Bairro,@city,@uf,@cpf,@email)

execute Inserir 'jose', 'rua dos bobo', 'multirao', 'palmares','sp','2286328628','jose@email.com'

-----------------------------------------------------------------------------------------------------------
/* Criando a funco no select passando a data que sera usada como parametro*/
create function RetornarDataAcima(@data datetime)
returns table
as
return (select *
        from Funcionario
		where DataCont >= @data);
--------------------------------------------------------------------------------------------------------------

/* chamando a funcao no select passando a data que sera usada como parametro*/
select * from RetornarDataAcima('10/10/2019')
------------------------------------------------------------------------------------------------------------
drop function RetornarDataAcima

/* criando a funçaõ que subtrai de dois valores passados como parâmetros */
create function Subtrair(@Valor1 as int, @Valor2 as int)
returns int
as 
 begin
  declare @Retorno as int
  set @Retorno = @Valor1 - @Valor2
  return @Retorno
end

/* chamando a função no select passando os dois valores que será usada como parâmetro */
select dbo.Subtrair(3,18)

/*excluindo uma função*/

drop function Subtrair
 

----------------------------------------------------25/08/2022---------------------------------------------------------------------------------------