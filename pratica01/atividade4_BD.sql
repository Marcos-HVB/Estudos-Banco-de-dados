-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table professor(
	idProfessor int primary key not null,
    nomeProfessor varchar(50),
    especialidadeProfessor varchar(40),
    dtNascProfessor date
);	

-- inserindo dados na tabela professor
insert into professor values
	(1, 'Vivian', 'Matemática', '2000-05-03' ),
    (2, 'Fernanda', 'Matemática', '1999-09-11' ),
    (3, 'Chola', 'Física', '1998-08-10'),
    (4, 'Thiago', 'Física', '1999-07-09'),
    (5, 'Vera', 'Português', '1999-06-08'),
    (6, 'Yoshi', 'Português', '1999-04-07');
    
-- Exibir todos os dados da tabela
select * from professor;

-- Exibir apenas as especialidades dos professores
select especialidade from professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade
select * from professor 
	where especialidade = 'Matematica';
    
-- Exibir os dados da tabela ordenados pelo nome do professor
select * from professor
	order by nome;
    
-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente
select *, DATE_FORMAT(dtNasc, '%d/%m/%Y')  as 'data_formatada' from professor
	order by dtNasc desc;
    
-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra
select * from professor
	where nome like 'v%';
    
-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra
select * from professor
	where nome like '%a';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra
select * from professor 
	where nome like '_e%';
    
-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra
select * from professor
	where nome like '%a_';
    
-- Excluindo tabela
drop table professor;





    