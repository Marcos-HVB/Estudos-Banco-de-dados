-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table musica(
	idMusica int primary key not null,
    artistaMusica varchar(40),
    tituloMusica varchar(40),
    generoMusica varchar(40)
);

-- inserindo valores na tabela musica
insert into musica values
	(1, 'Bring Me The Horizon', 'Can You Feel My Heart', 'Rock'),
    (2, 'Matuê', 'Drown', 'Rock'),
    (3, 'Bring Me The Horizon', 'Vampiro', 'Trap'),
    (4, 'Matuê', 'Anos Luz', 'Trap'),
    (5, 'Exalta Samba', 'Reliquia', 'Samba'),
    (6, 'Exalta Samba', 'Almoço', 'Samba'),
    (7, 'Zeca Pagodinho', 'Camarão', 'Samba');
    
    
-- Exibir todos os dados da tabela
select * from musica;

-- Exibir apenas os títulos e os artistas das músicas
select artista, titulo from musica;

-- Exibir apenas os dados das músicas de um determinado gênero
select * from musica 
	where genero = 'Rock';
    
-- Exibir apenas os dados das músicas de um determinado artista
select * from musica 
	where artista = "Matue";
    
-- Exibir os dados da tabela ordenados pelo título da música
select * from musica 
	order by titulo;
    
-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
select * from musica 
	order by artista desc;
    
-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
select * from musica
	where titulo like "a%";
    
-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
select * from musica
	where titulo like "%o";
    
-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
select * from musica
	where titulo like "_a%";
    
-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
select * from musica
	where titulo like "%r_";
    
-- Elimine a tabela.
drop table musica;

    