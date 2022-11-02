create database sprint2;

use sprint2;

create table curso(
	idCurso int primary key auto_increment,
    nomeCurso varchar(50),
    sigla char(3),
    coordenador varchar(40)
);

create table aluno(
	idAluno int primary key auto_increment,
    nomeAluno varchar(40),
    sobrenomeAluno varchar(40),
    fkCurso int not null
);

insert into curso(nomeCurso, sigla, coordenador) values
	('Engenharia', 'ENG', 'Valério'),
    ('Análise e Desenvolvimento de Sistemas', 'ADS', 'Rodrigo'),
    ('Economia', 'ECN', 'Roberta');
    
insert into aluno(nomeAluno, sobrenomeAluno, fkCurso) values
	('Isaias', 'Roberto', 1),
    ('Leonardo', 'Farias', 2),
    ('Matheus', 'Prado', 3),
    ('Maria', 'Eduarda', 1),
    ('Viviana', 'Ferreira', 2),
    ('João', 'Rocha', 3);
    
-- Faça um JOIN entre as duas tabelas
select * from curso join aluno 
	ON idCurso = fkCurso;
    
-- Faça um JOIN com WHERE entre as duas tabelas
select * from curso join aluno
	ON idCurso = fkCurso
		where curso.nomeCurso = 'Engenharia';
        
-- Crie um campo com a restrição (constraint) de CHECK
alter table curso add column modalidade varchar(15);
alter table curso add constraint chkModalidade check (modalidade in('Distância', 'Presencial'));

update curso set modalidade = 'Presencial'
	where idCurso in (1,2);
    
update curso set modalidade = 'Distância'
	where idCurso in (3);