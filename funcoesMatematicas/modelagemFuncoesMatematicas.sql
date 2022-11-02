create database projeto1semestre;

use projeto1semestre;


CREATE TABLE professor (
    idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(45),
    disciplina VARCHAR(45)
)  AUTO_INCREMENT=10000;

CREATE TABLE grupo (
    idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nomeGrupo VARCHAR(45),
    descProjeto VARCHAR(45)
);


CREATE TABLE avaliacao (
    fkGrupo INT,
    fkProfessor INT,
    nota DECIMAL(4 , 2 ),
    dataHoraInicio DATETIME,
    primary key(fkGrupo, fkProfessor),
    FOREIGN KEY (fkGrupo)
        REFERENCES grupo (idGrupo),
    FOREIGN KEY (fkProfessor)
        REFERENCES professor (idProfessor)
);


CREATE TABLE aluno (
    raAluno INT PRIMARY KEY,
    nomeAluno VARCHAR(45),
    emailAluno VARCHAR(45),
    fkGrupo INT,
    FOREIGN KEY (fkGrupo)
        REFERENCES grupo (idGrupo)
);

alter table aluno add constraint chkEmail CHECK (emailAluno like '%@%');
alter table grupo modify column descProjeto varchar(150);

insert into professor values 
	(null, 'Roberto Carlos', 'Matemática'),
    (null, 'Viviano Almeida', 'Física'),
    (null, 'Julia Salvatore', 'Geografia'),
    (null, 'José Francisco', 'Algoritmos');
    
    
insert into grupo values
	(null, 'Grupo 1', 'Monitoramente da temperatura em DataCenters'),
    (null, 'Grupo 2', 'Monitoramente da umidade em Plantações de trigo'),
    (null, 'Grupo 3', 'Monitoramente da temperatura e umidade no armazenamento de medicamentos oncológicos'),
    (null, 'Grupo 4', 'Monitoramente da temperatura e umidade no transporte de carnes bovinas');
    
    
insert into avaliacao values
	( 1, 10000, 10.00, '2022-10-26 14:00:00'),
    ( 1, 10001, 5.50, '2022-10-26 14:30:00'),
    ( 2, 10002, 6.80, '2022-10-26 15:00:00'),
    ( 2, 10003, 9.00, '2022-10-26 15:30:00'),
    ( 3, 10001, 8.75, '2022-10-26 16:00:00'),
    ( 3, 10003, 9.50, '2022-10-26 16:30:00');
    
insert into aluno values
	('01222060', 'Marcos Henrique', 'marcos.boas@sptech.school', 1),
    ('01892061', 'Maria Eduarda', 'maria.eduarda@sptech.school', 1),
    ('01652062', 'Nilton Farias', 'nilton.farias@sptech.school', 2),
    ('01122063', 'Roberto Edgar', 'roberto.edgar@sptech.school', 2),
    ('01012064', 'Luis Inacio', 'luis.inacio@sptech.school', 3),
    ('01002065', 'Josana Figueiredo', 'josana.figueiredo@sptech.school', 3),
    ('01552066', 'Geovana Farias', 'geovana.farias@sptech.school', 4),
    ('01662067', 'Lucia Helena', 'lucia.helena@sptech.school', 4);
    


-- 3.
select * from professor;
select * from grupo;
select * from avaliacao;
select * from aluno;


-- 5
select * from grupo join aluno
	on idGrupo = fkGrupo;
    
-- 6 
select * from grupo join aluno
	on idGrupo = fkGrupo
		where nomeGrupo = 'Grupo 1';
        
-- 7 
select avg(nota) 'Média Geral dos Grupos' from avaliacao;

-- 8
select nota 'Nota mínima e máxima' from avaliacao
	where nota = (select max(nota) from avaliacao) or nota = (select min(nota) from avaliacao);
    
-- 9 
select sum(nota) from avaliacao;


-- 10
select p.*, g.*, a.dataHoraInicio from professor as p join avaliacao as a
	on idProfessor = fkProfessor join grupo as g
		on idGrupo = fkGrupo;
        
-- 11
select p.*, g.*, a.dataHoraInicio from professor as p join avaliacao as a
	on idProfessor = fkProfessor join grupo as g
		on idGrupo = fkGrupo
			where nomeGrupo = 'Grupo 1';
            
-- 12
select nomeGrupo from grupo join avaliacao
	on idGrupo = fkGrupo join professor
		on idProfessor = fkProfessor
			where nomeProfessor = 'Viviano Almeida';
            
-- 13
select * from aluno join grupo
	on idGrupo = aluno.fkGrupo join avaliacao as a
		on idGrupo = a.fkGrupo join professor
			on idProfessor = fkProfessor;
            
-- 14
select count(distinct nota) 'Qtd notas distintas'from avaliacao;

-- 15
select nomeProfessor, avg(nota) 'Média das notas', sum(nota) 'Soma das notas' from professor join avaliacao
	on idProfessor = fkProfessor
		group by idProfessor;
        
-- 16
select nomeGrupo, avg(nota) 'Média das notas', sum(nota) 'Soma das notas' from grupo join avaliacao
	on idGrupo = fkGrupo
		group by idGrupo;
        
-- 17
select nomeProfessor, max(nota) 'Maior nota', min(nota) 'Menor nota' from professor join avaliacao
	on idProfessor = fkProfessor
		group by idProfessor;
        
-- 18
select nomeGrupo, max(nota) 'Maior nota', min(nota) 'Menor nota' from grupo join avaliacao
	on idGrupo = fkGrupo
		group by idGrupo;
    
    




