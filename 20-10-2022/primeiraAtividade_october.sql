CREATE DATABASE ATIVIDADE_AVALIATIVA_OCTOBER1;

USE ATIVIDADE_AVALIATIVA_OCTOBER1;


//-----------------------------------------------------------------------------------------------------------//

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

//------------------------------------- INSERÇÃO DE VALORES---------------------------------------//
                                /*inserção de valores na tabela cliente*/

INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos cria','117.451.582-45','josereinaldo@gmail.com','Jose Reinaldo');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos bobo','745.483.498-85','kauekevin@gmail.com','Kaue Kevin');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos legais','584.871.153-54','lubernadi@gmail.com','Luiz Bernadi');
INSERT INTO cliente(endereco,CPF_CNPJ, email, nome) Values ('rua dos feio','186.948.651-78','felipealmeida@gmail.com','Felipe Almeida');

select * from cliente;

//-------------------------------------------------------------------------------------------------//
                                /*inserção de valores na tabela produto*/

INSERT INTO produto(preco, estoque, descricao) values (10,100,'pacote de arroz - 5kg');
INSERT INTO produto(preco, estoque, descricao) values (18,67,'pacote de feijão - 1kg');
INSERT INTO produto(preco, estoque, descricao) values (2,69,'detergente - 650 Ml');
INSERT INTO produto(preco, estoque, descricao) values (5,250,'óleo de girassol - 500 Ml');
INSERT INTO produto(preco, estoque, descricao) values (4,400,'macarrão - 500g');
INSERT INTO produto(preco, estoque, descricao) values (6,130,'chips - 250g');
INSERT INTO produto(preco, estoque, descricao) values (5,50,'bisnaguinha - 350g');

select * from produto;

//-----------------------------------------------------------------------------------------------------------//
                                /*inserção de valores na tabela marca*/

INSERT INTO marca values ('URBANO')
INSERT INTO marca values ('FANDANGOS')
INSERT INTO marca values ('YPE')
INSERT INTO marca values ('CARIOQUINHA')
INSERT INTO marca values ('BRASIL OLEOS')