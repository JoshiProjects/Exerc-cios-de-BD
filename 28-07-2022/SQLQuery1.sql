create database Escola1;
use Escola1; 

create table Responsavel(
cod_responsa INTEGER PRIMARY KEY,
nome VARCHAR (200),
RG VARCHAR (12),
endereco VARCHAR (200),
nascimento DATE,
r_fk_codaluno INTEGER,
);

create table Aluno (
codaluno INTEGER PRIMARY KEY,
nomeescola VARCHAR (200),
nome VARCHAR (200),
nascimento DATE,
sala VARCHAR (10),
a_fk_codescola INTEGER,
a_fk_codresponsa INTEGER,
);

create table Escola (
codescola INTEGER PRIMARY KEY,
nome VARCHAR (200),
endereco VARCHAR (200),
cidade VARCHAR (200),
e_fk_codaluno INTEGER,
e_fk_codprofessor INTEGER,
);


create table Professor(
codprofessor INTEGER PRIMARY KEY,
nome VARCHAR(200),
disciplina VARCHAR(200),
salario MONEY,
nascimento DATE,
p_fk_codescola INTEGER,
);


---------- RESPONSÁVEL -------------------
ALTER TABLE Responsavel ADD FOREIGN KEY(r_fk_codaluno) REFERENCES Aluno (codaluno);

-------------- ALUNO -----------------------
ALTER TABLE Aluno ADD FOREIGN KEY(a_fk_codresponsa) REFERENCES Responsavel (cod_responsa);
ALTER TABLE Aluno ADD FOREIGN KEY (a_fk_codescola) REFERENCES  Escola (codescola);

---------------- ESCOLA  ---------------
ALTER TABLE Escola ADD FOREIGN KEY (e_fk_codaluno) REFERENCES Aluno (codaluno);
ALTER TABLE Escola ADD FOREIGN KEY (e_fk_codprofessor) REFERENCES Professor (codprofessor);

--------------- PROFESSOR --------------
ALTER TABLE Professor ADD FOREIGN KEY (p_fk_codescola) REFERENCES Escola (codescola);

-----------------------------------------INSERT--------------------------------------------------------------------

INSERT INTO Responsavel (cod_responsa, nome, RG, endereco, nascimento, r_fk_codaluno) VALUES (1, 'Dona Maria', '11 111 111-1', 'Rua Magogue', '10/25/1998', 1);
INSERT INTO Responsavel (cod_responsa, nome, RG, endereco, nascimento, r_fk_codaluno) VALUES (2, 'Dona Rosangêla', '22 222 222-2', 'Rua Magogue', '03/09/1982', 2);
INSERT INTO Responsavel (cod_responsa, nome, RG, endereco, nascimento, r_fk_codaluno) VALUES (3, 'Dona Rosangêla', '33 333 333-3', 'Rua of jackson', '10/11/2006', 3);

INSERT INTO Aluno(codaluno, nomeescola, nome, nascimento, sala) VALUES (1,'Ulisses Contreira', 'Mateus Souza', '11/05/2008', '8º ano'); 
INSERT INTO Aluno(codaluno, nomeescola, nome, nascimento, sala) VALUES (2,'Escola Humberto Gomiere', 'Fernando Souza', '11/27/2007', '9º ano');
INSERT INTO Aluno(codaluno, nomeescola, nome, nascimento, sala) VALUES (3,'Eti-integral', 'Mateus Souza', '11/05/2010', '6º ano');

INSERT INTO Escola (codescola ,nome, endereco, cidade) VALUES (1,'Ulisses Contreira', 'rua macabal','Pindorama');  
INSERT INTO Escola (codescola ,nome, endereco, cidade) VALUES (2,'Escola Humberto', 'rua dos bobo','Catanduva'); 
INSERT INTO Escola (codescola ,nome, endereco, cidade) VALUES (3,'ETIM', 'rua dos maloca','Palmares'); 

INSERT INTO Professor (codprofessor ,nome, disciplina, salario, nascimento) VALUES (1,'sérgia', 'PW-2','5000','05/23/2022');
INSERT INTO Professor (codprofessor ,nome, disciplina, salario, nascimento) VALUES (2,'Alee', 'DS','5000','06/23/1999');
INSERT INTO Professor (codprofessor ,nome, disciplina, salario, nascimento) VALUES (3,'Pelicano', 'Arduino','5000','05/09/2000');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Responsavel (cod_responsa) values(4);

DELETE FROM Responsavel;
DELETE FROM Aluno;

UPDATE
  Escola
SET
  e_fk_codaluno = 3
WHERE
  codescola = 3


SELECT * FROM Responsavel
SELECT * FROM Aluno
SELECT * FROM Escola
SELECT * FROM Professor

Select r.*, a.codaluno
from Responsavel r, Aluno a
where r.cod_responsa= a.codaluno