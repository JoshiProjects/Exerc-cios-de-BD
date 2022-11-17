CREATE DATABASE Biblioteca;

CREATE TABLE Exemplares (
Dataaquisicao DATE,
codExemp INTEGER PRIMARY KEY,
ISBN NUMERIC(13),
)

CREATE TABLE Editora (
nome VARCHAR(30),
codEditora INTEGER PRIMARY KEY,
)


CREATE TABLE Livros (
ISBN NUMERIC(13) PRIMARY KEY,
edicao VARCHAR(7),
custo REAL,
titulo VARCHAR(200),
codEditoraFK INTEGER,
FOREIGN KEY(codEditoraFK) REFERENCES Editora (codEditora)
)

CREATE TABLE Autores (
nome VARCHAR(30),
codAutores INTEGER PRIMARY KEY
)

CREATE TABLE Cliente (
nome VARCHAR(100),
rg VARCHAR (7),
codCliente INTEGER PRIMARY KEY,
CEP VARCHAR (8),
rua VARCHAR (20),
bairro VARCHAR (20),
)

CREATE TABLE emailAutores (
emailAutorPK INTEGER PRIMARY KEY,
emailAutor VARCHAR (20),
codAutorFK INTEGER,
FOREIGN KEY(codAutorFK) REFERENCES Autores (codAutores)
)

CREATE TABLE emailCLiente (
emailCliePK INTEGER PRIMARY KEY,
emailCiente VARCHAR(20),
codClienteFK INTEGER,
FOREIGN KEY(codClienteFK) REFERENCES Cliente (codCliente)
)

CREATE TABLE autoria (
ISBN NUMERIC(13),
codAutoresFK INTEGER,
FOREIGN KEY(ISBN) REFERENCES Livros (ISBN),
FOREIGN KEY(codAutoresFK) REFERENCES Autores (codAutores)
)

CREATE TABLE emprestimo (
data DATE,
codExempFK INTEGER,
codClienteFK INTEGER,
FOREIGN KEY(codExempFK) REFERENCES Exemplares (codExemp),
FOREIGN KEY(codClienteFK) REFERENCES Cliente (codCliente)
)

ALTER TABLE Exemplares ADD FOREIGN KEY(ISBN) REFERENCES Livros (ISBN);

-----------------------------INSET INTO --------------------------------------------

INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (1,'João Vitor','1234567','Prudente Soares','15830111','Jardim das Palmeiras');
INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (2,'sua linda','7654321','Morais de Prudente','003015','Palemiras das Jardim');
INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (3,'Raul Rota','3464321','Zé Guimarães','043015','São Paulo');
INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (4,'Natalia Cruz','6467321','Rafael Moreira','103015','Trap Bar');
INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (5,'José Batataí','6467671','Rui Barbosa','189015','Santo Magistério');

-----------------------------------------------------------------------------------------------------------------------------------------------
INSERT into emailCLiente(emailCliePK,emailCiente, codClienteFK) values(1,'joao1@zinhogmail.com',1);
INSERT into emailCLiente(emailCliePK,emailCiente, codClienteFK) values(2,'joao2@zinhogmail.com',1);
INSERT into emailCLiente(emailCliePK,emailCiente, codClienteFK) values(3,'joao3@zinhogmail.com',1);
INSERT into emailCLiente(emailCliePK,emailCiente, codClienteFK) values(4,'kaatotoso@gmail.com',2);
---------------------------------------------------------------------------------------------------------------
INSERT into Autores(codAutores,nome) values(1,'Machado de Assis');
INSERT into Autores(codAutores,nome) values(2,'Fiodor Dostoievski');
INSERT into Autores(codAutores,nome) values(3,'Willian Shakespeare');
INSERT into Autores(codAutores,nome) values(4,'Graciliano Ramos');
------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO emailAutores(emailAutorPK,emailAutor,codAutorFK) values(1,'domcasmurro@uol.com',1);
INSERT INTO emailAutores(emailAutorPK,emailAutor,codAutorFK) values(2,'karamazov@gmail.com',2);
INSERT INTO emailAutores(emailAutorPK,emailAutor,codAutorFK) values(3,'hamlet@otelo.com',3);
INSERT INTO emailAutores(emailAutorPK,emailAutor,codAutorFK) values(4,'vidassecas@gmail.com',4);

SELECT * FROM Cliente
SELECT * FROM emailCliente
SELECT * FROM Autores
SELECT * FROM emailAutores

---------------------------------------------12-05-2022-----------------------------------------------------------------------------------
INSERT INTO Editora(codEditora,nome) values (1,'Nova era');
INSERT INTO Editora(codEditora,nome) values (2,'sucesso');
INSERT INTO Editora(codEditora,nome) values (3,'Catanduva SM');
INSERT INTO Editora(codEditora,nome) values (4,'Brasil');

----------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Livros(ISBN,titulo,edicao,custo,codEditoraFK) values ('123456','Verdade sobre T.i','2020',59.99,2);
INSERT INTO Livros(ISBN,titulo,edicao,custo,codEditoraFK) values ('123457','Rad 10','2021',78.99,3);
INSERT INTO Livros(ISBN,titulo,edicao,custo,codEditoraFK) values ('123459','Contato','2019',49.99,4);
------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (1, '05/12/2022', '123456'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (2, '05/12/2022', '123456'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (3, '05/12/2022', '123457'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (4, '05/12/2022', '123457'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (5, '05/12/2022', '123457'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (6, '05/12/2022', '123459'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (7, '05/12/2022', '123459'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (8, '05/12/2022', '123459'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (9, '05/12/2022', '123459'); 
INSERT INTO Exemplares (codExemp, Dataaquisicao, ISBN) VALUES (10, '05/01/2022', '123459'); 
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO autoria(ISBN, codAutoresFK) VALUES ('123456', 1);
INSERT INTO autoria(ISBN, codAutoresFK) VALUES ('123457', 2);
INSERT INTO autoria(ISBN, codAutoresFK) VALUES ('123459', 3);
-----------------------------------------------------------------------------------------------------------

select * from Cliente;

INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',1,1);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',2,1);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',3,1);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',4,1);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',5,1);

INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',6,2);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',7,2);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/12/2022',8,2);

INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('01/01/2022',9,3);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('05/01/2022',10,3);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('25/03/2022',11,3);
INSERT INTO emprestimo(data,codExempFK,codClienteFK) values ('25/05/2022',12,4);
----------------------------------------------------------------------------

Select * from Autores;
Select * from autoria;
Select * from Cliente;
Select * from Editora;
Select * from emailCLiente;
Select * from emailAutores;
Select * from emprestimo;
Select * from Exemplares;
Select * from Livros;
----------------------------------------------------------------------------
select * from Cliente where nome like 'j%';
select * from Cliente where nome like '%Sil%';
select * from Cliente where nome like '%A';

-----------------------------------------------------------------------------
select * from emailCLiente where codClienteFK =1;
select * from emailCLiente where codClienteFK =2;

SELECT <select_list>
FROM Tabela A
INNER JOIN Tabela B
ON A.Key - B.Key
------------------------------------------------------------------------------------------------------------------------
/* a cláusula INNER JOIN compara cada linha da tabela A com as linhas da tabela B para encontrar
todos os pares de linhas que sastifazem a condição de junção. Se a condição de junção for avaliado 
como TRUE, os valores da coluna das linhas correspondente das tabelas A e B serão combinados em uma
nova linha e incluidos no conjunto de resultados.*/


SELECT e.*, c.nome
FROM emailCLiente e
INNER JOIN Cliente c
ON c.codCliente= e.codClienteFK
-----------------------------------------------------------------------------------------------------------------------

SELECT e.*, c.nome
FROM emailCLiente e, Cliente c
WHERE e.codClienteFK = c.codCliente

-----------------------------------------------------------------------------------------------------------------------
SELECT e.*, l.titulo
FROM  Exemplares e, Livros l
WHERE e.ISBN = l.ISBN

------------------------------------------26/05/2022---------------------------------------------------------------------------------
---------------exercício 1-----------------------------------

select * from Livros where titulo like 'r%';

---------------exercício 2-----------------------------------

select * from Cliente where nome like '%ta%';

---------------exercício 3-----------------------------------

SELECT l.*, e.nome
FROM Editora e, Livros l
WHERE l.codEditoraFK = e.codEditora

---------------exercício 4-----------------------------------
SELECT * FROM emprestimo WHERE data >= '01/01/2022' AND data <= '05/25/2022';

---------------exercício 5-----------------------------------

SELECT e.*, l.titulo
FROM Exemplares e, Livros l
WHERE l.ISBN = e.ISBN