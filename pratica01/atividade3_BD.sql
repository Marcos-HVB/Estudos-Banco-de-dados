-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table filme(
	idFilme int primary key not null,
    tituloFilme varchar(50),
    generoFilme varchar(40),
    diretorFilme varchar(40)
);

-- inserindo valores na tabela filme
insert into filme values
	(1, 'Marvel 1', 'terror', 'Jeff Bezos'),
    (2, 'Marvel 2', 'comedia', 'Elon Musk'),
    (3, 'Viagem ao centro da terra', 'aventura', 'Mark Zuckemberg'),
    (4, 'Aquario', 'suspense', 'Steve Jobs'),
    (5, 'Guerra Civil', 'terror', 'Steve Jobs'),
    (6, 'Xicara assassina 2', 'comedia', 'Mark Zuckemberg'),
    (7, 'Borboleta Marolada', 'aventura', 'Elon Musk'),
    (8, 'Suporte de Headset 3', 'suspense', 'Jeff Bezos');
    

-- Exibir todos os dados da tabela
select * from filme;

-- Exibir apenas os títulos e os diretores dos filmes
select titulo, diretor from filme; 

-- Exibir apenas os dados dos filmes de um determinado gênero
select * from filme
	where genero = 'terror';
    
-- Exibir apenas os dados dos filmes de um determinado diretor
select * from filme 
	where diretor = 'Jeff Bezos';
    
-- Exibir os dados da tabela ordenados pelo título do filme
select * from filme
	order by titulo;
    
-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente
select * from filme
	order by diretor desc;
    
-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra
select * from filme
	where titulo like 'M%';
    
-- Exibir os dados da tabela, dos filmes cujo artista termine com uma determinada letra
select * from filme
	where titulo like '%a';
    
-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra
select * from filme
	where titulo like '_a%';
    
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra
select * from filme 
	where titulo like '%r_';
    
-- Eliminar tabela
drop table filme;

	
    
    


    