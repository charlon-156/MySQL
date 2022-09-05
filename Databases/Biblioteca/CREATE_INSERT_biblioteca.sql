-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DDL(de modificação) do Banco de Dados do Aeroporto 
-- |------------------------------------------------------

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

-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

-- |------------------------------------------------------ 
-- |Comandos DML(de inserção) do Banco de Dados da Biblioteca
-- |------------------------------------------------------

insert into tb_bairros values 
	(default, 'Centro'), 
    (default, 'Samanau'),
    (default, 'New Caico'),
    (default, 'Joao 23'),
    (default, 'Paulo 6'),
    (default, 'Alto da Boa Vista');
    
insert into tb_alunos values 
	(default, 'Chico', 'Rua Coronel', '200', 1),
	(default, 'Adamastor', 'Rua Osama', '2001',2),
	(default, 'Maria', 'Rua loreval', '12', 4),
	(default, 'Charlon', 'Rua Fonseca', '2014', 5),
	(default, 'Mateus', 'Avenida central', default, 6);
    
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

insert into tb_generos values
	(default, 'Romance'),
    (default, 'Ficcao'),
    (default, 'Comedia'),
    (default, 'Informatica'),
    (default, 'Historia'),
    (default, 'Auto_ajuda');

insert into tb_publicacoes values 
	(default, 'PHP com Romero', 2022, 4),
    (default, 'Como viver bem', 2018, 6),
    (default, 'Revista Mad', 1982, 3),
    (default, 'Dom Casmurro', 1887, 1),
    (default, 'Revista de História', 2015, 5),
    (default, 'Banco de Dados com Ari', 2020, 4),
    (default, 'Revista Auto estima', 2020, 6),
    (default, 'Historia do Brasil', 2010, 5),
    (default, 'Revista Bang', 2021, 2),
    (default, 'Alienista', 1888, 1);
    
insert into tb_emprestimos values 
	(default, '2018-01-01 12:00:00', 1, 6),
    (default, '2019-01-01 13:00:00', 2, 6),
    (default, '2020-01-01 14:00:00', 3, 6),
    (default, '2021-01-01 15:00:00', 4, 6),
    (default, '2020-02-02 16:00:00', 5, 6),
    (default, default, 5, 10),
    (default, default, 4, 8),
    (default, default, 3, 6),
    (default, default, 2, 4),
    (default, default, 1, 2),
    (default, default, 5, 9),
    (default, default, 4, 7),
    (default, default, 3, 5),
    (default, default, 2, 3),
    (default, default, 1, 1);
    
insert into tb_revistas values 
	(3, 2, 'Edicao 2', 'Colecao de setember'),
    (5, 3, 'Edicao 8', 'Colecao de historia nacao'),
    (7, 4, 'Edicao U', 'Colecao Viva Melhor'),
    (9, 1, 'Edicao 4', 'Colecao de Aliens?');

insert into tb_tiposcapas values
	(default, 'capa comum'),
    (default, 'capa dura');
    
insert into tb_livros values 
	(1, 333, 2),
    (2, 101, 1),
    (4, 454, 2),
    (6, 204, 2),
    (8, 154, 1),
    (10, 134, 1);