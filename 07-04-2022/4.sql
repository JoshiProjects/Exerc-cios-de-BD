-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE Biblioteca2;

USE Biblioteca2;

CREATE TABLE Cliente (
nome VARCHAR(30),
CEP VARCHAR (9),
rua VARCHAR (30),
bairro VARCHAR (20),
rg VARCHAR (12),
CodCliente INTEGER PRIMARY KEY,
);

CREATE TABLE Exemplares (
datAaquisicao DATE,
CodEX INTEGER PRIMARY KEY,
ISBN INTEGER,
)

CREATE TABLE Livros (
titulo VARCHAR(20),
edicao VARCHAR (50),
custo MONEY,
ISBN INTEGER PRIMARY KEY,
codEditora INTEGER,
);

CREATE TABLE Autores (
codAutor INTEGER PRIMARY KEY,
nome VARCHAR(30),
)

CREATE TABLE Editora (
codEditora INTEGER PRIMARY KEY,
nome VARCHAR (30), 
)

CREATE TABLE emailCliente (
email VARCHAR(30),
CodCliente INTEGER
FOREIGN KEY(CodCliente) REFERENCES Cliente (CodCliente)
)


CREATE TABLE EmailAutores (
email VARCHAR(30),
)

CREATE TABLE emprestimo (
CodCliente INTEGER ,
CodEX INTEGER ,
FOREIGN KEY(CodEX) REFERENCES Exemplares (CodEX),
FOREIGN KEY(CodCliente) REFERENCES Cliente (CodCliente)
)

CREATE TABLE autoria (
codAutor INTEGER,
ISBN INTEGER,
FOREIGN KEY(codAutor) REFERENCES Autores (codAutor),
FOREIGN KEY(ISBN) REFERENCES Livros (ISBN)
)

ALTER TABLE Exemplares ADD FOREIGN KEY(ISBN) REFERENCES Livros (ISBN)
ALTER TABLE Livros ADD FOREIGN KEY(codEditora) REFERENCES Editora (codEditora)
