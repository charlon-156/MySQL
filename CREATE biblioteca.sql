create database db_biblioteca;
use db_biblioteca;

-- Criação das tabelas Aluno, bairros e telefone dos alunos

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
