-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DDL(de modificação) do Banco de Dados da biblioteca
-- |------------------------------------------------------

drop database if exists db_biblioteca;
create database db_biblioteca;
use db_biblioteca;

create table tb_bairros(
	bai_codigo int auto_increment,
    bai_bairro varchar(50) not null,
    primary key(bai_codigo)
);

create table tb_alunos(
	alu_codigo int auto_increment,
    alu_nome varchar(90) not null,
    alu_logradouro varchar(50),
    alu_numero varchar(10),
    alu_bai_codigo int,
    foreign key (alu_bai_codigo)references tb_bairros(bai_codigo),
    primary key(alu_codigo)
);

create table tb_telefonesalunos(
	tda_telefone int,
    tda_alu_codigo int,
    foreign key (tda_alu_codigo) references tb_alunos(alu_codigo),
    primary key (tda_telefone, tda_alu_codigo)
);

-- Criação das tabelas 

create table tb_generos(
	gen_codigo int auto_increment,
    gen_genero varchar(45) not null,
    primary key(gen_codigo)
);

create table tb_publicacoes(
	pub_codigo int auto_increment,
    pub_titulo varchar(100) not null,
    pub_ano int not null,
    pub_gen_codigo int not null,
    foreign key (pub_gen_codigo) references tb_generos(gen_codigo),
    primary key (pub_codigo)
);

create table tb_emprestimos(
	emp_codigo int auto_increment,
    emp_data timestamp null default current_timestamp,
    emp_alu_codigo int not null,
    emp_pub_codigo int not null,
    foreign key(emp_alu_codigo) references tb_alunos(alu_codigo),
    foreign key(emp_pub_codigo) references tb_publicacoes(pub_codigo),
    primary key(emp_codigo)
);

create table tb_revistas(
	rev_pub_codigo int,
    rev_tiragem int not null,
    rev_numeroedicao varchar(10) not null,
    rev_revistascol varchar(45) not null,
    foreign key(rev_pub_codigo) references tb_publicacoes(pub_codigo),
    primary key(rev_pub_codigo)
);

create table tb_tiposcapas(
	cap_codigo int auto_increment,
    cap_tipo varchar(45) not null,
    primary key(cap_codigo)
);

create table tb_livros(
	liv_pub_codigo int,
    liv_qtdpaginas int not null,
    liv_cap_codigo int not null,
    foreign key(liv_pub_codigo) references tb_publicacoes(pub_codigo),
    foreign key(liv_cap_codigo) references tb_tiposcapas(cap_codigo)
);

insert into tb_bairros (bai_bairro) values 
	('Centro'), 
    ('Samanau'),
    ('New Caico'),
    ('Joao 23'),
    ('Paulo 6'),
    ('Alto da Boa Vista');
    
insert into  tb_alunos (alu_nome, alu_logradouro, alu_numero, alu_bai_codigo) values 
	('Chico César', 'Rua Coronel', '200', 1),
	('Adamastor Goes', 'Rua Osama', '2001',2),
	('Maria Amarely', 'Rua loreval', '12', 4),
	('Charlon Vaz', 'Rua Fonseca', '2014', 5),
	('Mateus Gorgon', 'Avenida central', null, 6),
    ('Roberto Carlos', null, null, null);
    
insert into tb_telefonesalunos values 
	(98989898, 2),
    (98779877, 2),
    (99999999, 1),
    (96543211, 3),
    (98765432, 3),
    (34343434, 4),
    (45214521, 1),
    (44444444, 2),
    (40028922, 3),
    (12345678, 4);

insert into  tb_generos (gen_genero) values
	('Romance'),
    ('Ficcao'),
    ('Comedia'),
    ('Informatica'),
    ('Historia'),
    ('Auto_ajuda'),
    ('Terror');

insert into tb_publicacoes (pub_titulo, pub_ano, pub_gen_codigo) values 
	('PHP com Romero', 2022, 4),
    ('Como viver bem', 2018, 6),
    ('Revista Mad', 1982, 3),
    ('Dom Casmurro', 1887, 1),
    ('Revista de História', 2015, 5),
    ('Banco de Dados com Ari', 2020, 4),
    ('Revista Auto estima', 2020, 6),
    ('Historia do Brasil', 2010, 5),
    ('Revista Bang', 2021, 2),
    ('Alienista', 1888, 1);
    
insert into tb_emprestimos (emp_data, emp_alu_codigo, emp_pub_codigo) values 
	('2018-01-01 12:45:00', 1, 6),
    ('2019-01-01 13:01:00', 2, 6),
    ('2020-01-01 14:20:00', 3, 6),
    ('2021-01-01 15:07:00', 4, 6),
    ('2021-02-02 16:29:00', 5, 6),
    ('2019-09-11 15:50:00', 5, 10),
    ('2022-02-28 09:47:00', 4, 8),
    ('2022-04-21 10:45:00', 3, 6),
    ('2022-06-17 15:50:00', 2, 4),
    ('2022-06-23 18:02:00', 1, 2),
    ('2022-07-22 19:34:00', 5, 9),
    ('2022-08-12 08:17:00', 4, 7),
    ('2022-09-01 16:49:00', 3, 5),
    ('2022-10-31 17:02:00', 2, 3),
    ('2022-11-11 11:11:00', 1, 1);
    
insert into tb_revistas values 
	(3, 2, 'Edicao 2', 'Colecao de setember'),
    (5, 3, 'Edicao 8', 'Colecao de historia nacao'),
    (7, 4, 'Edicao U', 'Colecao Viva Melhor'),
    (9, 1, 'Edicao 4', 'Colecao de Aliens?');

insert into tb_tiposcapas (cap_tipo) values
	('capa comum'),
    ('capa dura');
    
insert into tb_livros values 
	(1, 333, 2),
    (2, 101, 1),
    (4, 454, 2),
    (6, 204, 2),
    (8, 154, 1),
    (10, 134, 1);
    
