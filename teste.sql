create database db_loja;
use db_loja;
-- drop database db_loja;
-- CLIENTES E VENDEDORES

create table tb_estados (
	est_codigo int auto_increment,
    est_estado varchar(20) not null,
    primary key(est_codigo)
);

create table tb_cidades (
	cid_codigo int auto_increment,
    cid_est_codigo int not null,
    cid_cidade varchar(20) not null,
    foreign key(cid_est_codigo) references tb_estados(est_codigo),
    primary key(cid_codigo)
);

create table tb_bairros (
	bai_codigo int auto_increment,
    bai_cid_codigo int not null,
    foreign key(bai_cid_codigo) references tb_cidades(cid_codigo),
    primary key(bai_codigo)
);

create table tb_clientes (
	cli_codigo int auto_increment,
    cli_bai_codigo int not null,
    cli_nome varchar(50) not null,
    cli_logradouro varchar(100) not null,
    cli_numero varchar(6) not null,
    foreign key(cli_bai_codigo) references tb_bairros(bai_codigo),
    primary key(cli_codigo)
);

create table tb_telclientes(
	tec_telefone char(11) not null,
    tec_cli_codigo int not null,
    foreign key(tec_cli_codigo) references tb_clientes(cli_codigo),
    primary key(tec_telefone, tec_cli_codigo)
);

create table tb_sexos (
	sex_codigo int auto_increment,
    sex_sexo varchar(10) not null,
    primary key(sex_codigo)
);

create table tb_clijuridico(
	clj_cli_codigo int,
    clj_razsocial varchar(20) not null,
    clj_insestadual varchar(20) not null,
    clj_insmunicipal varchar(20) not null,
    clj_cnpj varchar(20) not null,
    clj_website varchar(40) not null,
    foreign key(clj_cli_codigo) references tb_clientes(cli_codigo),
    primary key(clj_cli_codigo)
);

create table tb_clifisico (
	clf_cli_codigo int,
    clf_sex_codigo int not null,
    clf_rg varchar(8) not null,
    clf_cpf varchar(11) not null,
    clf_dtnascimento date not null,
    foreign key(clf_sex_codigo) references tb_sexos(sex_codigo),
    foreign key(clf_cli_codigo) references tb_clientes(cli_codigo),
	primary key(clf_cli_codigo)
);

create table tb_vendedores(
	ven_codigo int auto_increment,
    ven_bai_codigo int not null,
    ven_sex_codigo int not null,
    ven_nome varchar(30) not null,
    ven_cpf varchar(11) not null,
    ven_rg varchar(10) not null,
    ven_dtadmissao date not null,
    ven_logradouro varchar(50) not null,
    ven_numero varchar(10) not null,
    foreign key(ven_bai_codigo) references tb_bairros(bai_codigo),
    foreign key(ven_sex_codigo) references tb_sexos(sex_codigo),
    primary key(ven_codigo)
);

create table tb_telvendedores (
	tev_telefone varchar(11),
    tev_ven_codigo int,
    foreign key(tev_ven_codigo) references tb_vendedores(ven_codigo),
    primary key(tev_telefone, tev_ven_codigo)
);

-- VENDAS 

create table tb_vendas (
	ved_codigo int,
    ved_cli_codigo int not null,
    ved_ven_codigo int not null,
    ved_ntfiscal varchar(10) not null,
    ved_data timestamp not null,
    foreign key(ved_cli_codigo) references tb_clientes(cli_codigo),
    foreign key(ved_ven_codigo) references tb_vendedores(ven_codigo),
    primary key(ved_codigo)
);

create table tb_formaspgtos (
	fdp_codigo int,
    fdp_formapg varchar(20) not null,
    primary key(fdp_codigo)
);

create table tb_pagvendas (
	pgv_ved_codigo int not null,
    pgv_fdp_codigo int not null,
    pgv_valor decimal(8,2) not null,
    foreign key(pgv_ved_codigo) references tb_vendas(ved_codigo),
    foreign key(pgv_fdp_codigo) references tb_formaspgtos(fdp_codigo),
    primary key(pgv_ved_codigo, pgv_fdp_codigo)
);

-- FORNECEDORES

create table tb_fornecedores (
	for_codigo int,
    for_bai_codigo int,
    for_nome varchar(20) not null,
    for_cnpj varchar(15) not null,
    for_website varchar(20) not null, 
    for_insmunicipal varchar(20) not null,
    for_insestadual varchar(20) not null,
    for_logradouro varchar(50) not null,
    for_numero varchar(6) not null,
    for_cep varchar(10) not null,
    foreign key(for_bai_codigo) references tb_bairros(bai_codigo),
    primary key(for_codigo)
);

create table tb_telfornecedores (
	tef_telefone varchar(11),
    tef_for_codigo int,
    foreign key(tef_for_codigo) references tb_fornecedores(for_codigo),
    primary key(tef_telefone, tef_for_codigo)
);

create table tb_emailfornecedores (
	emp_email varchar(20),
    emp_for_codigo int,
    foreign key(emp_for_codigo) references tb_fornecedores(for_codigo),
    primary key(emp_email, emp_for_codigo)
);

create table tb_departamentos (
	dep_codigo int,
    dep_desconto decimal(5,2) not null,
    dep_nome varchar(20),
    primary key(dep_codigo)
);

create table tb_marcas (
	mar_codigo int,
	mar_marca varchar(20) not null,
    primary key(mar_codigo)
);

create table tb_compras (
	com_codigo int,
    com_for_codigo int not null,
    com_ntfiscal varchar(20) not null,
    com_data timestamp not null,
    foreign key(com_for_codigo) references tb_fornecedores(for_codigo),
    primary key(com_codigo)
);

create table tb_produtos (
	pro_codigo int,
    pro_dep_codigo int not null,
    pro_mar_codigo int null,
    pro_nome varchar(20) not null,
    pro_qtestoque int not null,
    pro_qtminima int not null,
    pro_desproduto varchar(100),
    pro_preco decimal (8,2),
    foreign key(pro_dep_codigo) references tb_departamentos(dep_codigo),
    foreign key(pro_mar_codigo) references tb_marcas(mar_codigo),
    primary key(pro_codigo)
);

create table tb_itenscompras (
	itc_com_codigo int,
    itc_pro_codigo int,
    itc_preco decimal(8,2) not null,
    itc_qtd int not null,
    foreign key(itc_com_codigo) references tb_compras(com_codigo),
    foreign key(itc_pro_codigo) references tb_produtos(pro_codigo),
    primary key(itc_com_codigo, itc_pro_codigo)
);

create table tb_itensvendas (
	itv_pro_codigo int,
    itv_ved_codigo int,
    itv_preco decimal(8,2) not null,
    itv_qtd int not null,
    foreign key(itv_pro_codigo) references tb_produtos(pro_codigo),
    foreign key(itv_ved_codigo) references tb_vendas(ved_codigo),
    primary key(itv_pro_codigo, itv_ved_codigo)
);