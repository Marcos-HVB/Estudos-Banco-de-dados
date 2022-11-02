-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table Atleta(
	idAtleta int primary key not null,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalhas int
);

-- inserindo dados na tabela
insert into atleta values
	(1 ,'Araujo Bonfim', 'Vôlei', 5),
    (2, 'Marcos Henrique', 'Skate', 10),
    (3, 'Veôrica Lobos', 'Futebol', 7 ),
    (4, 'Laís Silva', 'Vôlei', 4),
    (5, 'Roberto Santos', 'Skate', 6),
    (6, 'Vitor Ferreira', 'Vôlei', 11);

-- exibindo todos os dados da tabela
select * from Atleta;

-- exibindo apenas os nomes e quantidade de medalhas dos atletas
select nome, qtdMedalhas from atleta;

-- Exibindo apenas os dados dos atletas de uma determinada modalidade
select * from atleta 
	where modalidade = 'Skate';
    
-- Exibindo os dados da tabela ordenados pela modalidade
select * from atleta
	order by modalidade;
    
-- Exibindo os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
select * from atleta
	order by qtdMedalhas desc;
    
-- Exibindo os dados da tabela, dos atletas cujo nome contenha a letra s
select * from atleta
	where nome like '%s%';
    
-- Exibindo os dados da tabela, dos atletas cujo nome comece com uma determinada letra
select * from atleta
	where nome like 'M%';
    
-- Exibindo os dados da tabela, dos atletas cujo nome termine com a letra a
select * from atleta
	where nome like '%a';
    
-- Exibindo os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from atleta
	where nome like '%r_';
    
-- Eliminando a tabela
drop table atleta;
