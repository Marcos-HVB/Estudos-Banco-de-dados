create database PraticaFuncionario;

use PraticaFuncionario;


create table setor(
	idSetor int primary key auto_increment,
    nomeSetor varchar(50),
    numeroAndar varchar(3)
);


create table funcionario(
	idFuncionario int primary key auto_increment,
    nomeFuncionario varchar(50),
    telFuncionario varchar(11),
    salario decimal(6,2),
    fkSetor int,
    foreign key (fkSetor) references setor(idSetor)
);


create table acompanhante(
	idAcompanhante int auto_increment,
    nomeAcompanhante varchar(45),
    parentesco varchar(15),
    dataNasc date,
    fkFuncionario int,
    primary key(idAcompanhante, fkFuncionario),
    foreign key (fkFuncionario) references funcionario(idFuncionario)
);


--  Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado

insert into setor(nomeSetor, numeroAndar) values
	('RH', '1A'),
    ('Consultoria', '1B'),
    ('ADM', '2'),
    ('Financeiro', '3');
    
insert into funcionario (nomeFuncionario, telFuncionario, salario, fkSetor) values
	('Roberta Claudia', '12345678911', 1200.00, 1),
    ('Mario Sanches', '12345678000', 1200.00, 1),
    ('Roberto Carlos', '12345678457', 1350.00, 2),
    ('Marcos Henrique', '12345678123', 1350.00, 2),
    ('José Algusto', '12345678456', 2000.00, 3),
    ('Rogério Farias', '12345678985', 5000.00, 4);
    
insert into acompanhante(nomeAcompanhante, parentesco, dataNasc, fkFuncionario) values
	('Mario Gomes', 'Filho', '2000-10-20', 1),
    ('Roberto', 'Filho', '1999-08-20', 2),
    ('Leonardo', 'Sobrinho', '1997-02-02', 3),
    ('Leandro', 'Primo', '2005-12-22', 4);
    
-- Exibir todos os dados de cada tabela criada, separadamente
select * from setor;
select * from funcionario;
select * from acompanhante;


-- Exibir os dados dos setores e dos seus respectivos funcionários
select * from setor join funcionario
	on idSetor = fkSetor;
    
-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários
select * from setor join funcionario
	on idSetor = fkSetor
		where nomeSetor = 'RH';
        
--  Exibir os dados dos funcionários e de seus acompanhantes
select * from funcionario join acompanhante
	on idFuncionario = fkFuncionario;
    
--  Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes
select * from funcionario join acompanhante
	on idFuncionario = fkFuncionario	
		where nomeFuncionario = 'Roberta Claudia';
        
-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes
select * from funcionario join setor 
	on idSetor = fkSetor
		JOIN acompanhante 
			on idFuncionario = fkFuncionario;
            
