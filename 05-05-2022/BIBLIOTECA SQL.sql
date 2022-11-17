CREATE DATABASE Biblioteca2;

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
titulo VARCHAR(20),
codEditora INTEGER,
FOREIGN KEY(codEditora) REFERENCES Editora (codEditora)
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
emailClie_PK INTEGER PRIMARY KEY,
emailCiente VARCHAR(20),
codCliente INTEGER,
FOREIGN KEY(codCliente) REFERENCES Cliente (codCliente)
)

CREATE TABLE autoria (
ISBN NUMERIC(13),
codAutores INTEGER,
FOREIGN KEY(ISBN) REFERENCES Livros (ISBN),
FOREIGN KEY(codAutores) REFERENCES Autores (codAutores)
)

CREATE TABLE emprestimo (
data DATE,
codExemp INTEGER,
codCliente INTEGER,
FOREIGN KEY(codExemp) REFERENCES Exemplares (codExemp),
FOREIGN KEY(codCliente) REFERENCES Cliente (codCliente)
)

ALTER TABLE Exemplares ADD FOREIGN KEY(ISBN) REFERENCES Livros (ISBN);

-----------------------------INSET INTO --------------------------------------------

INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (1,'João Vitor','1234567','Prudente Soares','15830111','Jardim das Palmeiras');
INSERT into Cliente(codCliente,nome,rg,rua,CEP,bairro) values (2,'sua linda','7654321','Morais de Prudente','003015','Palemiras das Jardim');
-----------------------------------------------------------------------------------------------------------------------------------------------
INSERT into emailCLiente(emailClie_PK,emailCiente, codCliente) values(1,'joao1@zinhogmail.com',1);
INSERT into emailCLiente(emailClie_PK,emailCiente, codCliente) values(2,'joao2@zinhogmail.com',1);
INSERT into emailCLiente(emailClie_PK,emailCiente, codCliente) values(3,'joao3@zinhogmail.com',1);
INSERT into emailCLiente(emailClie_PK,emailCiente, codCliente) values(4,'kaatotoso@gmail.com',2);
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
SELECT * FROM emailCLiente
SELECT * FROM Autores
SELECT * FROM emailAutores

