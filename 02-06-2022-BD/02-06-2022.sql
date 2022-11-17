create database Atividade0206_2022;

use Atividade0206_2022;

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
CodDeptoFK INTEGER,
FOREIGN KEY(CodDeptoFK) REFERENCES Departamento(CodDepto)
)

------------INSERT DEPARTAMENTO-----------------------------------------------------------------------------------------------

INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (1,'ADM','rua maranhão');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (2,'Logística','rua amazonas');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (3,'Operários','rua sergipe');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (4,'diretoria','rua berimbau');
INSERT into Departamento (CodDepto,Nome,Localizacao) VALUES (5,'Recursos Humanos','rua Brasil');
-------------------INSERT FUNCIONARIO--------------------------------------------------------------------------------------------------

INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,CodDeptoFK) VALUES (1,'Jose','Cleber','Sousa','06/01/2002','112.450.099-23','78.888.999-9','Rua dos Bobo','18900-000','palmares','189987886',10000,1);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,CodDeptoFK) VALUES (2,'Pedro','Gabriel','bauermann','12/23/2005','324.564.096-70','84.777,570-1','Rua Maranhão ','89300-010','Catanduva','189567890',1100,2);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,CodDeptoFK) VALUES (3,'Kaue','Kevin','pereira','08/09/2002','512.444.222-23','87.888.878-0','Rua dos Bobo','18900-999','pindorama','119987886',9000,3);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,CodDeptoFK) VALUES (4,'Matheus','Januario','marcio','07/05/2004','312.490.111-23','90.798.777-6','Rua dos Bobo','18999-767','castropina','874948786',3000,4);
INSERT into Funcionarios (CodFunc,PrimeiroNome,SegundoNome,UltimoNome,DataNasci,CPF,RG,Endereco,CEP,Cidade,Telefone,Salario,CodDeptoFK) VALUES (5,'Lucas','Antonio','Rodriguez','09/23/2003','212.830.000-23','23.456.000-2','Rua dos Bobo','57677-111','juazeiro','189987006',900,5);

select * from Departamento;
select * from Funcionarios;

------------------------2-----------------------------------------

select PrimeiroNome, UltimoNome from Funcionarios
order by UltimoNome;

-----------------------3--------------------------------------



----------------------4-----------------------------------------------
select* from Funcionarios where Salario > 1000
order by PrimeiroNome, SegundoNome, UltimoNome;
---------------------5----------------------------------------------
select sum(Salario) as total from Funcionarios;