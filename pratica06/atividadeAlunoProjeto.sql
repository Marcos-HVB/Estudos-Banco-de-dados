create database AlunoProjeto;

use AlunoProjeto;

create table projeto(
	idProjeto int primary key auto_increment,
    nomeProjeto varchar(45),
    descProjeto varchar (100)
);

create table aluno(
	raAluno char(8) not null primary key,
    nome varchar(45),
    telefone char(11),
    representante char(8),
    constraint alunoRepresentante foreign key (representante) references aluno(raAluno),
    fkProjeto int,
    foreign key (fkProjeto) references projeto(idProjeto)
);

create table acompanhante(
	idAcompanhante int,
    nomeAcompanhante varchar(50),
    tipoRelacao varchar(15),
    fkAluno char(8),
    foreign key (fkAluno) references aluno(raAluno),
    primary key (idAcompanhante, fkAluno)
);


-- Inserir dados nas tabelas

insert into projeto values
	(null, 'Química orgânica', 'Fazer uma maket relacionada ao tema'),
    (null, 'Calculador em JS', 'Fazer uma calculadora em JS sem nenhuma api'),
    (null, 'Prótotipo de site', 'Fazer um prótotipo de site no figma');
    
insert into aluno values
	('01222001', 'Roberto Teixeira', '11988888888', null, 3),
	('01222002', 'Ricardo Michael', '11988887777', null, 2),
    ('01222003', 'Joana Farias', '11988886666', null, 1);
    
insert into aluno values
	('01222004', 'Matheus Prado', '11988888555', '01222001', 3),
    ('01222005', 'João Teixeira', '11988888444', '01222001', 3),
    ('01222006', 'Marcos Henrique', '11988888333', '01222002', 2),
    ('01222007', 'Samuel Mariano', '11988888222', '01222002', 2),
    ('01222008', 'Leonardo Teodoro', '11988888111', '01222003', 1),
    ('01222009', 'Paulo José', '11988888000', '01222003', 1);
    

insert into acompanhante values
	(1, 'Maria Claudia', 'Esposa', '01222003'),
	(1, 'João Teodoro', 'Filho', '01222004'),
    (1, 'Letícia Santos', 'Irmã', '01222005');

-- Exibir os dados dos alunos e dos projetos correspondentes
select * from aluno join projeto
	on idProjeto = fkProjeto;

-- - Exibir os dados dos alunos e dos seus acompanhantes
select * from aluno join acompanhante
	on raAluno = fkAluno;
    
-- Exibir os dados dos alunos e dos seus representantes
select a.*, r.* from aluno as a
	join aluno as r
		on a.representante = r.raAluno;
        
-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente
-- de um determinado projeto (indicar o nome do projeto na consulta)
select * from aluno join projeto
	on idProjeto = fkProjeto
		where nomeProjeto = 'Protótipo de site';
        
-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes
select * from projeto join aluno
	on idProjeto = fkProjeto
		join acompanhante
			on raAluno = fkAluno;

