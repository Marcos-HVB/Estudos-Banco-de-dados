create database Campanha;

use Campanha;

create table tbOrganizador(
	idOrganizador int primary key auto_increment,
    nomeOrganizador varchar(45),
    emailOrganizador varchar(45),
    fkOrganizador int,
    constraint chkEmail CHECK (emailOrganizador like "%@%"),
    constraint organizadorExperiente foreign key (fkOrganizador) references tbOrganizador(idOrganizador)
)auto_increment = 30;

create table tbEndereco(
	idEndereco int,
    rua varchar(45),
    bairro varchar(45),
    fkOrganizador int,
    foreign key (fkOrganizador) references tbOrganizador(idOrganizador),
    primary key (idEndereco, fkOrganizador)
);

create table tbCampanha(
	idCampanha int primary key auto_increment,
    categoria varchar(45),
    instituicao1 varchar(45),
    instituicao2 varchar(45),
    dataFinal date,
    fkOrganizador int,
    foreign key (fkOrganizador) references tbOrganizador(idOrganizador)
)auto_increment = 500;



insert into tbOrganizador values
	(null, 'José Roberto', 'joseroberto@hotmail.com', null),
    (null, 'Marcos Henrique', 'marcoshenrique@hotmail.com', null),
    (null, 'Maria Maria', 'mariamaria@hotmail.com', null);
    
insert into tbOrganizador values
	(null, 'Rafael Marques', 'rafael@hotmai.com', 30),
    (null, 'Henrique Castanho', 'henrique@hotmail.com', 30),
    (null, 'Andreia Ferreira', 'andreia@hotmail.com', 31),
    (null, 'Antonio Jose', 'antonio@hotmail.com', 31),
    (null, 'Lucas Moura', 'lucas@hotmail.com', 32),
    (null, 'Felipe Castanhari', 'felipe@hotmail.com', 32);
    
    
insert into tbEndereco values
	(1, 'Rua 01', 'Bairro 91', 30),
    (1, 'Rua 12', 'Bairro 82', 31),
    (1, 'Rua 23', 'Bairro 73', 32),
    (1, 'Rua 34', 'Bairro 64', 33),
    (1, 'Rua 45', 'Bairro 55', 34),
    (1, 'Rua 56', 'Bairro 46', 35),
    (1, 'Rua 67', 'Bairro 37', 36),
    (1, 'Rua 78', 'Bairro 28', 37),
    (1, 'Rua 89', 'Bairro 19', 38);
    
    
insert into tbCampanha values
	(null, 'Alimento', 'Instituição da Fome', null, '2023-09-21', 30),
    (null, 'Produto de Higiene', 'Instituição Higiênica', 'Instituição Higiênica 2', '2023-05-05', 30),
    (null, 'Máscaras de Proteção', 'Instituição Máscaras', null, '2023-05-06', 31),
    (null, 'Cestas Básicas', 'Instituição Cestas', 'Instituição Cestas 2', '2024-01-01', 31),
    (null, 'Roupas', 'Instituição Roupas', null, '2022-12-06', 32),
    (null, 'Móveis', 'Instituição Móveis', 'Instituição Móveis 2', '2022-12-12', 32);
    
insert into tbCampanha values
	(null, 'Materiais de Construção', 'Instituilção Materiais', null, '2023-02-25', 35),
	(null, 'MCelulares', 'Instituilção Celulares', 'Instituilção Celulares 2', '2023-01-25', 36),
    (null, 'Notebooks', 'Instituilção Notebooks', null, '2023-02-05', 37),
    (null, 'Brinquedos', 'Instituilção Brinquedos', 'Instituilção Brinquedos 2', '2023-02-25', 38);
    
    
select * from tbOrganizador;
select * from tbEndereco;
select * from tbCampanha;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas
select * from tbOrganizador as org join tbCampanha as camp
	on org.idOrganizador = camp.fkOrganizador;
    
-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas
select * from tbOrganizador as org join tbCampanha as camp
	on org.idOrganizador = camp.fkOrganizador
		where org.nomeOrganizador = 'Marcos Henrique';
        
-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores
select * from tbOrganizador as orgNovato join tbOrganizador as orgExperiente
	on orgExperiente.idOrganizador = orgNovato.fkOrganizador;
    
-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador 
-- orientador (informar o nome do organizador orientador na consulta).
select * from tbOrganizador as orgNovato join tbOrganizador as orgExperiente
	on orgExperiente.idOrganizador = orgNovato.fkOrganizador
		where orgExperiente.nomeOrganizador = 'Marcos Henrique';
        
-- Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
select * from tbOrganizador as orgNovato join tbOrganizador as orgExperiente
	on orgExperiente.idOrganizador = orgNovato.fkOrganizador
		join tbCampanha as camp	
			on orgNovato.idOrganizador = camp.fkOrganizador;
            
--  Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu
-- organizador orientador

select * from tbOrganizador as orgNovato join tbOrganizador as orgExperiente
	on orgExperiente.idOrganizador = orgNovato.fkOrganizador
		join tbCampanha as camp	
			on orgNovato.idOrganizador = camp.fkOrganizador
				where orgNovato.nomeOrganizador = 'Antonio Jose';
    