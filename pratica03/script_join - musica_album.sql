use sprint2;

create table musica(
	idMusica int primary key auto_increment,
    tituloMusica varchar(40),
    artista varchar (40),
    genero varchar(40)
);

create table album(
	idAlbum int primary key auto_increment,
    nomeAlbum varchar(40),
    tipo varchar(10),
    dtLancamento date,
    constraint ckhTipo check (tipo in('Digital', 'Físico'))
);

insert into musica(tituloMusica, artista, genero) values
	('Voa passarinho', 'BMTH', 'rock'),
    ('Blabla', 'Jorginho', 'rock'),
    ('Garrafinha', 'BMTH', 'sertanejo'),
    ('Capinha', 'Jorginho', 'sertanejo');
    
insert into album(nomeAlbum, tipo, dtLancamento) values
	('Borboletinha', 'Digital', '1999-01-01'),
    ('Formiga', 'Físico', '2005-02-01');
    

-- Exibir todos os dados das tabelas separadamente
select * from musica;
select * from album;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio
alter table musica add column fkAlbum int;
alter table musica add foreign key (fkAlbum) references album(idAlbum);

-- Atualizar os álbuns de cada música
update musica set fkAlbum = 1
	where idMusica = 1;
    
update musica set fkAlbum = 2
	where idMusica = 2;
    
update musica set fkAlbum = 1
	where idMusica = 3;
    
update musica set fkAlbum = 2
	where idMusica = 4;
    
-- Exibir as músicas e seus respectivos álbuns
select * from musica join album 
	on fkAlbum = idAlbum;
    
-- Exibir somente o título da música e o nome do seu respectivo álbum
select musica.tituloMusica, album.nomeAlbum from musica join album
	on fkAlbum = idAlbum;
    
-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo
select * from musica join album 
	on fkAlbum = idAlbum
		where album.tipo = 'Digital';