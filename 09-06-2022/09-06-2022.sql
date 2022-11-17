create database Atividade02_06_2022;
use Atividade02_06_2022;


CREATE TABLE Departamento(
CodDepto INTEGER PRIMARY KEY,
Nome VARCHAR(100),
Localizacao VARCHAR(100),
)

CREATE TABLE Funcionarios(
CodFunc INTEGER PRIMARY KEY,
PrimeiroNome VARCHAR(50),
SegundoNome VARCHAR(50),
UltimoNome VARCHAR(50),
DataNasci DATE,
CPF VARCHAR(14),
RG VARCHAR(12),
Endereco VARCHAR(100),
CEP  VARCHAR(9),
Cidade VARCHAR(100),
Telefone INTEGER,
Salario NUMERIC,
funcao VARCHAR(100),
CodDeptoFK INTEGER,
FOREIGN KEY(CodDeptoFK) REFERENCES Departamento(CodDepto)
)

------------INSERT DEPARTAMENTO-----------------------------------------------------------------------------------------------

INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (1,'Administração','Rua Maranhão');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (2,'Logística','Rua Amazonas');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (3,'Operários','Rua Sergipe');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (4,'Diretoria','Rua Berimbau');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (5,'Recursos Humanos','Rua Brasil');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (6,'Comercial','Rua 1984');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (7,'Servidoria','Rua Jucelino Kubstchek');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (8,'Limpeza','Rua Moraes de Prudente');
-------------------INSERT FUNCIONARIO--------------------------------------------------------------------------------------------------

INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (1,'Jose','Cleber','Sousa','06/01/2002','112.450.099-23','78.888.999-9','Rua dos Bobo','18900-000','Recife','189987886',10000,'Operário',1);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario, funcao, CodDeptoFK) VALUES (2,'Pedro','Gabriel','Bauermann','12/23/2005','324.564.096-70','84.777,570-1','Rua Maranhão ','89300-010','Catanduva','189567890',1100,'Telefonista',2);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (3,'Kaue','Kevin','Pereira','08/09/2002','512.444.222-23','87.888.878-0','Rua dos Bobo','18900-999','Pindorama','119987886', 9000,'Operário',3);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (4,'Matheus','Januario','Márcio','07/05/2004','312.490.111-23','90.798.777-6','Rua dos Bobo','18999-767','Castropina','874948786',3000,'Gerente',4);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (5,'Lucas','Antonio','Rodriguez','04/07/2003','212.830.000-23','23.456.000-2','Rua dos Bobo','57677-111','Juazeiro','189987006',900,'Supervisor',5);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (6,'Marcos','Antonio','Rodriguez','11/17/1984','092.730.010-87','23.096.666-3','Rua 6 de julho','65177-213','Recife','189987006',700,'Telefonista',6);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (7,'João','Antony','Vário','10/10/1994','042.730.010-87','23.996.666-3','Rua 8','65187-213','Salvador','186987006',700,'Zelador',6);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,funcao,CodDeptoFK) VALUES (8,'Lucas','Stonielle','Buzzi','10/06/1990','042.732.010-87','23.996.776-3','Rua 9','65187-675','Aparecida do Norte','986987006',1000,'Gerente',7);


select * from Departamento;
select * from Funcionarios;

------------------------2-----------------------------------------

select PrimeiroNome, UltimoNome from Funcionarios
order by UltimoNome;

-----------------------3--------------------------------------

select* from Funcionarios
order by cidade;

----------------------4-----------------------------------------------

select* from Funcionarios where Salario > 1000
order by PrimeiroNome, SegundoNome, UltimoNome;

---------------------5----------------------------------------------

select sum(Salario) as total from Funcionarios;

--------------------6-----------------------------------------------

SELECT c.PrimeiroNome, d.Nome, c.funcao
FROM Funcionarios c, Departamento d
WHERE c.CodFunc = d.CodDepto

----------------------------7------------------------------------------

SELECT c.Nome, f.funcao 
FROM Funcionarios f  
INNER JOIN  Departamento c
ON c.CodDepto= f.CodFunc
where funcao='Supervisor'

----------------------8----------------------------------------------

select COUNT(*) AS total_registros from Funcionarios;

---------------------9----------------------------------------
Select AVG( Salario) AS Salario_medio from Funcionarios;

--------------------10-----------------------------------------------

Select MIN(Salario) AS Menor_Salario from Funcionarios;

---------------------11---------------------------------------
 
 select  PrimeiroNome,funcao,Cidade from Funcionarios where funcao='telefonista' and Cidade='Recife';

---------------------------by kaue, jose, kaue---------------

-------------- Quatro exemplos de SELECT ------ 23/06/2022 -------------------

select PrimeiroNome, SegundoNome, UltimoNome from Funcionarios
order by DataNasci;
-------------------------------------------------------------------------------

SELECT f.PrimeiroNome, f.DataNasci 
FROM Funcionarios f
WHERE funcao='Operário'
ORDER BY DataNasci
-------------------------------------------------------------------------------

SELECT f.PrimeiroNome, f.SegundoNome, f.UltimoNome 
FROM Funcionarios f
WHERE CodFunc < 5
ORDER BY CodDeptoFK
-------------------------------------------------------------------------------
SELECT  f.funcao, f.PrimeiroNome, f.SegundoNome
FROM Funcionarios f
order by funcao;
