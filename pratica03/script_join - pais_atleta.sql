create database sprint2;

use sprint2;

create table atleta(
	idAtleta int primary key auto_increment,
    nomeAtleta varchar(40),
	modalidade varchar(40),
    qtdMedalha int
);

create table pais(
	idPais int primary key auto_increment,
    nomePais varchar(30),
    capital varchar(40)
);

insert into atleta(nomeAtleta, modalidade, qtdMedalha) values
	('Michael', 'Natação', 2),
    ('Mariana', 'Natação', 3),
    ('Marcos', 'Futebol', 4),
    ('Fernando', 'Futebol', 5),
    ('Pedro', 'Vôlei', 6),
    ('Paulo', 'Vôlei', 7),
    ('Roberta', 'Ginástica', 8);
    
    
insert into pais(nomePais, capital) values
	('Japão', 'Tóquio'),
    ('França', 'Paris'),
    ('Holanda','Amsterdã');
    
-- Criar a chave estrangeira na tabela correspondente conforme modelagem
alter table atleta add column fkPais int;
alter table atleta add foreign key (fkPais)
	references pais(idPais);
    
-- Atualizar o país de todos os atletas
update atleta set fkPais = 1
	where idAtleta = 1;
    
update atleta set fkPais = 2
	where idAtleta = 2;

update atleta set fkPais = 3
	where idAtleta = 3;
    
update atleta set fkPais = 1
	where idAtleta = 4;
    
update atleta set fkPais = 1
	where idAtleta = 5;
    
update atleta set fkPais = 2
	where idAtleta = 6;
    
update atleta set fkPais = 3
	where idAtleta = 7;

-- Exibir os atletas e seu respectivo país
select * from pais JOIN atleta
	ON fkPais = idPais;
    
-- Exibir apenas o nome do atleta e o nome do respectivo país;
select atleta.nomeAtleta, pais.nomePais from Atleta JOIN pais
	ON fkPais = idPais;
    
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital
select * from pais JOIN atleta
	ON fkPais = idPais
		where pais.capital = 'Amsterdã';
        
        