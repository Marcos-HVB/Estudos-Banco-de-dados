-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table curso(
	idCurso int primary key not null,
    nomeCurso varchar(50),
    siglaCurso varchar(3),
    coordenadorCurso varchar(40)
);	

-- inserindo dados na tabela curso
insert into curso values 
	(1, 'Tecnologia da Informação', 'TI', 'Clodoaldo'),
    (2, 'Técnico em Nutrição', 'TN', 'Roberta'),
    (3, 'Edificações', 'EDI', 'José Alberto'),
    (4, 'Engenharia', 'EN', 'Flávia');
    
-- Exibir todos os dados da tabela
select * from curso;

-- Exibir apenas os coordenadores dos cursos
select coordenadorCurso from curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla
select * from curso
	where siglaCurso = 'EN';
    
-- Exibir os dados da tabela ordenados pelo nome do curso
select * from curso
	order by nomeCurso;
    
-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente
select * from curso
	order by coordenadorCurso desc;
    
-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra
select * from curso
	where nomeCurso like 't%';
    
-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra
select * from curso
	where nomeCurso like '%o';
    
-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra
select * from curso
	where nomeCurso like '_e%';
    
-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra
select * from curso
	where nomeCurso like '%e_';
    
-- Eliminar tabela
drop table curso;



    