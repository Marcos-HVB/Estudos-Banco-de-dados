create database bdTreinador;

use bdTreinador;

create table treinador(
	idTreinador int primary key auto_increment,
    nomeTreinador varchar(45),
    telefone char(11),
    email varchar(45),
    constraint chkEmail CHECK (email like '%@%'),
    fkTreinadorExperiente int
)auto_increment = 10;


create table nadador(
	idNadador int primary key auto_increment,
    nomeNadador varchar(45),
	estado char(2),
    dataNasc date,
    fkTreinador int,
    FOREIGN KEY (fkTreinador) references treinador(idTreinador)
)auto_increment = 100;



-- Inserir dados nas tabelas, de forma que exista mais de um nadador para algum treinador,
-- e mais de um treinador sendo orientado por algum treinador mais experiente

insert into treinador(nomeTreinador, telefone, email, fkTreinadorExperiente) values
	('Roberto', '12345678944', 'roberto@sptech.school', 12),
    ('José', '12345678654', 'roberto@sptech.school', 0),
    ('Alberta', '12345678314', 'roberto@sptech.school', 14),
    ('Mario', '12345678946', 'roberto@sptech.school', 0),
    ('Flavia', '12345678687', 'roberto@sptech.school', 16),
    ('Fernando', '12345678789', 'roberto@sptech.school', 0);
    
insert into nadador(nomeNadador, estado, dataNasc, fkTreinador) values
	('Maria', 'SP', '2000-05-22', 10),
    ('Mariano', 'SP', '1999-04-21', null),
    ('Francisco', 'MG', '1998-03-20', 12),
    ('Alberto', 'MG', '2002-05-01', 13),
    ('Geovana', 'SC', '2003-05-02', 14),
    ('Paulo', 'SC', '2004-04-10', 15),
    ('Antonio', 'AC', '2005-05-15', 15);
    
--  Exibir todos os dados de cada tabela criada, separadamente
select * from treinador;
select * from nadador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores
select * from treinador join nadador 
	on idTreinador = fkTreinador;
    
-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores
select * from treinador join nadador 
	on idTreinador = fkTreinador
		where nomeTreinador = 'Roberto';
        
-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores
select * from treinador
	where fkTreinadorExperiente != 0;
    
select * from treinador
	where fkTreinadorExperiente = 0;
    
--  Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o
-- nome do treinador na consulta)
select * from treinador
	where fkTreinadorExperiente != 0 and nomeTreinador = 'Roberto';
    
select * from treinador
	where fkTreinadorExperiente = 0 and nomeTreinador = 'José';
    
    
-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores
select * from treinador join nadador 
	on idTreinador = fkTreinador;
    
-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador
select * from treinador join nadador 
	on idTreinador = fkTreinador
		where nomeTreinador = 'Roberto';
    