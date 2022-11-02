create database faculdade1adsc;

use faculdade1adsc;

-- Criar as tabelas equivalentes à modelagem
create table cliente(
	idCliente int primary key auto_increment,
    nomeCliente varchar(30),
    sobrenomeCliente varchar(30),
    telFixo char(9),
    telCel char(11)
);


create table pet(
	idPet int primary key auto_increment,
    nome varchar(50),
	tipo varchar(45),
    raca varchar(45),
    dataNasc date,
    fkCliente int,
    foreign key (fkCliente) references cliente(idCliente)
)auto_increment = 101;


create table enderecoCliente(
	idEnderecoCliente int primary key auto_increment,
    rua varchar(45),
    bairro varchar(45),
    numero varchar(45),
    estado varchar(45),
    complemento varchar(45),
    fkCliente int,
    foreign key (fkCliente) references cliente(idCliente)
);


-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente,
-- e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
-- menos 2 clientes diferentes que tenham o mesmo sobrenome
insert into cliente (nomeCliente, sobrenomeCliente, telFixo, telCel) values
	('Marcos', 'Henrique', '123456789', '12345678912'),
    ('Gabriel', 'Henrique', '123456546', '12345678456'),
    ('Lucas', 'Souza', '123456889', '12345678978'),
    ('Mariana', 'Silva', '123456478', '12345678014'),
    ('Amanda', 'Alves', '123456324', '12345678147');
    
insert into pet (tipo, nome, raca, dataNasc, fkCliente) values
	('Gato', 'Roberta', 'Siamês', '2022-09-18', 1),
    ('Gato', 'Xuxu', 'Maine coon', '2021-08-22', 1),
    ('Gato', 'Mongolia', 'Angorá', '2010-06-10', 2),
    ('Cachorro', 'Biscoito', 'Dogue alemão', '2009-09-09', 3),
    ('Cachorro', 'Jose', 'Husky siberiano', '1999-02-13', 4),
    ('Cachorro', 'Claudia', 'Golden retriever', '2018-05-08', 5);
    
insert into enderecoCliente (rua, bairro, numero, estado, complemento, fkCliente) values
	('Areias', 'Jardim Campos', '11', 'São Paulo', 'Bloco D apt 11', 1 ),
    ('Doutor Fernandes Figueira', 'Jardim Bartira', '200', 'São Paulo', '', 2),
    ('Jose Alfredo', 'Jardim Nazaré', '122', 'Minas Gerais', '', 3),
    ('Jose Alberto', 'Ibirapuera', '1547E', 'Pernambuco', '', 4),
    ('Teclado roxo', 'Chico Mendes', '6560', 'Rio Grande do Sul', 'blodo F apt 148', 5);
    
    
-- Exibir todos os dados de cada tabela criada, separadamente.
-- Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
select * from cliente;
select * from pet;
select * from enderecoCliente;

-- Altere o tamanho da coluna nome do cliente
alter table cliente modify column nomeCliente varchar(100);


-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro)
select * from pet
	where tipo = 'cachorro';
    
-- Exibir apenas os nomes e as datas de nascimento dos pets
select nome, dataNasc from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
select * from pet
	order by nome;
    
-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro
select cliente.idCliente, cliente.nomeCliente, enderecoCliente.bairro from cliente JOIN enderecoCliente
	on idCliente = fkCliente order by enderecoCliente.bairro;
    
    
-- Exibir os dados dos pets cujo nome comece com uma determinada letra
select * from pet
	where nome like 'X%';
    
-- Exibir os dados dos clientes que têm o mesmo sobrenome
select * from cliente
	where sobrenomeCliente = 'Henrique';


-- Alterar o telefone de um determinado cliente
update cliente set telFixo = '548978569'
	where idCliente = 1;
    
-- Exibir os dados dos clientes para verificar se alterou
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos
select * from cliente join pet
	on idCliente = fkcliente;
    
-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente
select * from cliente join pet
	on idCliente = fkcliente
		where idCliente = 1;
        
-- Excluir algum pet
delete from pet where idPet = 105;

-- Exibir os dados dos pets para verificar se excluiu
select * from pet;

-- Excluir as tabelas
drop table cliente;
drop table pet;
drop table enderecoCliente;





