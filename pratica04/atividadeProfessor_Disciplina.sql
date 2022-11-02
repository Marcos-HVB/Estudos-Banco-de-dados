create database sprint1;

use sprint1;


create table professor(
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(50),
    sobrenomeProfessor varchar(30),
    especialidade1 varchar(40),
    especialidade2 varchar(40)
);

create table disciplina(
	idDisc int primary key auto_increment,
    nomeDisc varchar(45),
    fkProfessor int not null,
    foreign key (fkProfessor) references professor(idProfessor)
);


insert into professor(nomeProfessor, sobrenomeProfessor, especialidade1, especialidade2) values
	('Francisco', 'Souza', 'Matemática', 'Economia'),
    ('Pedro', 'Medeiros', 'Engenharia', 'Física'),
    ('Paulo', 'Rodrigues', 'Mandarim', 'Biologia'),
    ('João', 'Maia', 'Administração', 'Química'),
    ('Flávia', 'Silva', 'Ciências da Computação', 'Geografia'),
    ('Fernanda', 'Farias', 'Inglês', 'Sociologia');
    
insert into disciplina(nomeDisc, fkProfessor) values
	('Espanhol',2 ),
    ('Matemática', 1),
    ('Japonês', 3),
    ('Química', 4),
    ('Português', 5),
    ('Italiano', 6);
    
    
-- Exibir os professores e suas respectivas disciplinas
select * from professor JOIN disciplina 
	on idProfessor = fkProfessor;
    
-- Exibir apenas o nome da disciplina e o nome do respectivo professor
select professor.nomeProfessor, disciplina.nomeDisc from professor join disciplina
	on idProfessor = fkProfessor;
    
-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome
select * from professor join disciplina
	ON idProfessor = fkProfessor
		where professor.sobrenomeProfessor = 'Silva';
        
-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1
select professor.especialidade1, disciplina.nomeDisc from professor join disciplina
	ON idProfessor = fkProfessor
		where professor.nomeProfessor = 'Francisco'
		order by especialidade1;
        



