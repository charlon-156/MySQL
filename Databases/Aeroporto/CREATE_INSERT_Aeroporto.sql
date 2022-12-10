-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DDL(de modificação) do Banco de Dados do Aeroporto 
-- |------------------------------------------------------

drop database if exists db_aeroporto;

create database db_aeroporto;

use db_aeroporto;

create table tb_avioes (
	avi_codigo int auto_increment,
    avi_datacompra date not null,
    avi_nome varchar(45) not null,
    avi_horasdevoa int not null,
    primary key(avi_codigo)
);

create table tb_pilotos (
	pil_codigo int auto_increment,
    pil_nome varchar(45) not null,
    pil_datanasc date not null,
    pil_horasvoo int not null,
    primary key(pil_codigo)
);

create table tb_locais(
    loc_codigo int auto_increment,
    loc_local varchar(45) not null,
    primary key(loc_codigo)
);

create table tb_voos (
	voo_codigo int auto_increment,
    voo_datasaida timestamp not null,
    voo_datachegada timestamp not null,
    voo_loc_saida int not null,
    voo_loc_chegada int not null,
    voo_avi_codigo int not null,
    voo_pil_codigo int not null,
    foreign key(voo_loc_saida) references tb_locais(loc_codigo),
    foreign key(voo_loc_chegada) references tb_locais(loc_codigo),
    foreign key(voo_avi_codigo) references tb_avioes(avi_codigo),
    foreign key(voo_pil_codigo) references tb_pilotos(pil_codigo),
    primary key(voo_codigo)
);

create table tb_documentos(
	doc_codigo int auto_increment,
    doc_documento varchar(45) not null,
    primary key(doc_codigo)
);

create table tb_clientes(
	cli_codigo int auto_increment,
    cli_nome varchar(45) not null,
    cli_datanasc date not null,
    cli_doc_codigo int not null,
    foreign key(cli_doc_codigo) references tb_documentos(doc_codigo),
    primary key(cli_codigo)
);

create table tb_clientes_dos_voos (
	cdv_voo_codigo int,
    cdv_cli_codigo int,
    foreign key(cdv_voo_codigo) references tb_voos(voo_codigo),
    foreign key(cdv_cli_codigo) references tb_clientes(cli_codigo),
    primary key(cdv_voo_codigo, cdv_cli_codigo)
    );
    
-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DML(de inserção) do Banco de Dados do Aeroporto 
-- |------------------------------------------------------


insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Boing GGG', '2006-07-20', 12300);
insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Jumbo 456', '2011-04-01', 1200);
insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Tucano SS', '2013-02-28', 12651);
insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Pardon 22', '2010-10-10', 9000);
insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Papad 373', '2021-07-28', 15);
insert into tb_avioes (avi_nome, avi_datacompra, avi_horasdevoa) values ('Tecki 673', '2019-11-10', 7000);

insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Jefferson Aron', 9500, '1987-08-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Pedro Paulo', 2500, '1990-02-27');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Arnon Amarante', 3300, '1977-11-11');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Bertollini Bel', 17700, '1991-08-30');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Marcos Mel', 19500, '1979-12-20');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Caio Xavier', 8050, '1980-08-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Zalberto Zambelli', 6330, '1992-03-20');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Juliano-Jean', 500, '1976-10-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Luaciano Vaz', 9500, '1972-01-31');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Nikita Sargov', 2000, '1998-07-30');

insert into tb_locais (loc_local) values ('Caicó'), ('Jucurutu'), ('Mossoró'), ('Nova York'), ('Maceió'), ('Washington'), ('São Paulo'), ('Rio de Janeiro'), ('Paris'), ('Natal');

insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (1, 1, '2019-02-20 12:00:00', '2019-02-20 14:00:00', 1, 10);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (3, 4, '2019-04-01 04:40:00', '2019-04-01 14:55:00', 10, 7);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (2, 2, '2020-07-14 13:00:00', '2020-07-15 04:27:00', 10, 4);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (4, 8, '2020-08-20 15:00:00', '2020-08-20 14:00:00', 3, 1);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (2, 2, '2020-07-14 13:00:00', '2020-07-15 04:27:00', 10, 4);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (5, 5, '2021-08-20 15:00:00', '2020-08-20 15:55:00', 3, 1);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (2, 3, '2021-07-14 13:00:00', '2020-07-15 23:15:00', 7, 10);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (6, 7, '2022-08-20 15:00:00', '2020-08-20 14:00:00', 1, 2);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (1, 9, '2022-07-14 13:00:00', '2020-07-15 04:27:00', 1, 3);
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datasaida, voo_datachegada, voo_loc_saida, voo_loc_chegada) values (4, 6, '2022-08-20 15:00:00', '2020-08-20 14:00:00', 2, 3);

insert into tb_documentos (doc_documento) values ('Identidade'), ('Passaporte'), ('Carteira de Trabalho');

insert into tb_clientes (cli_nome, cli_datanasc, cli_doc_codigo) values ('Charlon Fernandes', '2004-11-11', 1), ('Arlindo Bezerra', '1978-03-20', 3), ('Carlos Franco', '1976-03-01', 3), ('Júlio Vargas', '1954-09-24', 2), ('Carlos Branco', '1964-04-01', 1), ('Barack Obama', '1961-08-04', 2), ('Arnon Calvo', '1951-09-19', 1),('Marco Alves', '1979-03-15', 2), ('Asem Erdogan', '2003-06-10', 2), ('Carlos Chagas', '1987-01-20', 2);
insert into tb_clientes (cli_nome, cli_datanasc, cli_doc_codigo) values ('Flavio Gomes', '1984-12-12', 3), ('Bento Rodrigues', '1987-05-02', 1), ('Francis Blaze', '1956-10-06', 2), ('Ari Barreto', '1985-07-21', 2), ('Betham Jeraldo', '1971-02-17', 3), ('Renan Descarte', '2000-10-04', 2), ('Edith Bardho', '1999-12-31', 3),('Alvaro Cabral', '1984-05-11', 1), ('Frederich Trump', '2001-09-11', 2), ('Wosvaldo Marcon', '1988-07-20', 1);

insert into tb_clientes_dos_voos values	(1,1),(1,7),(1,18),(1,6),(2,18),(2,11),(2,15),(2,7),(3,13),(3,14),(3,16),(3,11),(3,9),(3,8),(4,5),(4,6),(4,17),(5,2),(5,6),(5,5),(5,19),(5,13), (6,2),(6,6),(6,7),(7,7),(7,12),(7,14),(7,16),(8,16),(8,13),(8,7),(8,5),(9,9),(9,7),(9,17),(10,14),(10,3),(10,9),(10,5),(10,1);

