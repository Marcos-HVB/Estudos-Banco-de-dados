-- criando o bd sprint1
create database sprint1;

-- selecionando o bd sprint1
use sprint1;

-- criando a tabela dentro do bd
create table revista(
	idRevista int primary key auto_increment,
    nomeRevista varchar(40),
    categoriaRevista varchar(30)
);	

-- inserindo dados na tabela 
insert into revista(nomeRevista) values 
	('Veja'),
    ('Isto é'),
    ('Epoca'),
    ('Forbes');
    
-- Exibir todos os dados da tabela
select * from revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente
update revista set categoriaRevista = 'entretenimento' 
	where categoriaRevista is null;
    
select * from revista;

-- Insira mais 3 registros completos
insert into revista(nomeRevista, categoriaRevista) values 
	('Quatro Rodas', 'automóveis'),
    ('Claudia', 'economia'),
    ('Time', 'tempo');
    
-- Exibir novamente os dados da tabela
select * from revista;

-- Exibir a descrição da estrutura da tabela
show columns from revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres
alter table revista
	modify column categoriaRevista varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
show columns from revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15)
alter table revista
	add column periodicidade varchar(15);

-- Exibir os dados da tabela
show columns from revista;

-- Excluir a coluna periodicidade da tabela
alter table revista
	drop column periodicidade;

-- Excluir BD sprint1
drop database sprint1;