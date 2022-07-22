drop database if exists db_loja;
create database db_loja;
use db_loja;

-- criação das tabelas da loja

create table tb_estados (
	 est_codigo int auto_increment,
	 est_nome varchar(50) not null,
	 constraint pk_estados primary key(est_codigo)
	 ) engine=innodb;

create table tb_sexos (
	 sex_codigo int auto_increment,
	 sex_tipo varchar(10) null,
	 constraint pk_sexos primary key(sex_codigo)
	 ) engine=innodb;

create table tb_cidades (
	 cid_codigo int auto_increment,
	 cid_cidade varchar(50) not null,
	 cid_est_codigo int not null,
	 constraint pk_cidades primary key (cid_codigo),
	 constraint fk_est_cid foreign key (cid_est_codigo) references tb_estados (est_codigo)
	 ) engine=innodb;

create table tb_bairros (
	 bai_codigo int auto_increment,
	 bai_bairro varchar(50) not null,
	 bai_cid_codigo int not null,
	 constraint pk_bairros primary key (bai_codigo),
	 constraint fk_cid_bai foreign key (bai_cid_codigo) references tb_cidades (cid_codigo)
	 ) engine=innodb;  

create table tb_clientes (
	 cli_codigo int auto_increment,
	 cli_bai_codigo int not null,
	 cli_nome varchar(50) not null,
	 cli_logradouro varchar(100) not null,
	 cli_numero varchar(6) not null,
	 cli_cep varchar(8),
	 constraint pk_clientes primary key (cli_codigo),
	 constraint fk_bai_cli foreign key (cli_bai_codigo) references tb_bairros (bai_codigo)
	 ) engine=innodb;

create table tb_tel_clientes(
	 tec_telefone varchar(11) not null,
	 tec_cli_codigo int not null,
	 constraint pk_tel_clientes primary key ( tec_telefone,tec_cli_codigo),
	 constraint fk_cli_tec foreign key (tec_cli_codigo) references tb_clientes (cli_codigo)
	 ) engine=innodb;     

create table tb_clifisico (
	 clf_cli_codigo int not null,
	 clf_sex_codigo int not null,
	 clf_cpf varchar(11) not null,
	 clf_rg int not null,
	 clf_dt_nascimento date,
	 constraint pk_clifisico primary key(clf_cli_codigo),
	 constraint fk_cli_clf foreign key (clf_cli_codigo) references tb_clientes(cli_codigo),
	 constraint fk_sex_clf foreign key (clf_sex_codigo) references tb_sexos(sex_codigo)
	 ) engine=innodb;

create table tb_clijuridico (
	 clj_cli_codigo int not null,
	 clj_cnpj varchar(20) not null,
	 clj_raz_social varchar(50) not null,
	 clj_ins_estadual varchar(20) not null,
	 clj_ins_minicipal varchar(20) null,
	 clj_website varchar(50) null,
	 constraint pk_clijuridico primary key(clj_cli_codigo),
	 constraint fk_cli_clj foreign key (clj_cli_codigo) references tb_clientes(cli_codigo)
	) engine=innodb;

create table tb_vendedores (
	 ven_codigo int auto_increment,
	 ven_bai_codigo int not null,
	 ven_sex_codigo int not null,
	 ven_nome varchar(50) not null,
	 ven_cpf char(11) not null,
	 ven_rg varchar(10) not null,
	 ven_dt_admissao date,
	 ven_logradouro varchar(50) not null,
	 ven_numero varchar(8) not null,
	 constraint pk_vededores primary key(ven_codigo),
	 constraint fk_bai_ven foreign key (ven_bai_codigo) references tb_bairros(bai_codigo),
	 constraint fk_sex_ven foreign key (ven_sex_codigo) references tb_sexos(sex_codigo)
	) engine=innodb;

create table tb_tel_vendedores(
	 tev_telefone varchar(11) not null,
	 tev_ven_codigo int not null,
	 constraint pk_teldosven primary key ( tev_telefone,tev_ven_codigo),
	 constraint fk_ven_tdc foreign key (tev_ven_codigo) references tb_vendedores(ven_codigo)
	) engine=innodb;
		  
create table tb_departamentos (
	 dep_codigo int auto_increment,
	 dep_nome varchar(50) null,
	 dep_desconto float,
	 constraint pk_departamentos primary key(dep_codigo)
	) engine=innodb;

create table tb_marcas (
	 mar_codigo int auto_increment,
	 mar_nome varchar(50) not null,
	 constraint pk_marcas primary key(mar_codigo)
	) engine=innodb;     

create table tb_produtos (
	 pro_codigo int auto_increment,
	 pro_dep_codigo int not null,
	 pro_mar_codigo int not null,
	 pro_nome varchar(50) null,
	 pro_qt_estoque int,
	 pro_qt_minima int,
	 pro_preco double not null,
	 constraint pk_produtos primary key(pro_codigo),
	 constraint fk_dep_pro foreign key (pro_dep_codigo) references tb_departamentos(dep_codigo),
	 constraint fk_mar_itv foreign key (pro_mar_codigo) references tb_marcas(mar_codigo)
	 )    ;

create table tb_formas_pgtos (
	fdp_codigo int auto_increment,
	fdp_forma_pg varchar(50) not null,
	constraint pk_formaspgtos primary key (fdp_codigo)
	) engine=innodb;

create table tb_vendas (
	ved_codigo int auto_increment,
	ved_cli_codigo int not null,
	ved_ven_codigo int not null,
	ved_nt_fiscal varchar(10)not null,
	ved_data date not null,
	constraint pk_vendas primary key(ved_codigo),
	constraint fk_cli_ved foreign key (ved_cli_codigo) references tb_clientes(cli_codigo),
	constraint fk_ven_ved foreign key (ved_ven_codigo) references tb_vendedores(ven_codigo)
	) engine=innodb;

create table tb_pgvendas (
	 pgv_fdp_codigo int not null,
	 pgv_ved_codigo int not null,
	 pgv_valor double not null,
	 
	 constraint pk_pagvendas primary key(pgv_fdp_codigo,pgv_ved_codigo),
	 constraint fk_fdp_pgv foreign key (pgv_fdp_codigo) references tb_formas_pgtos(fdp_codigo),
	 constraint fk_ved_pgv foreign key (pgv_ved_codigo) references tb_vendas(ved_codigo)
	) engine=innodb;
    
create table tb_itensvendas (
	 itv_pro_codigo int not null,
	 itv_ved_codigo int not null,
	 itv_preco double not null,
	 itv_qtd int not null,
	 constraint pk_itensvendas primary key(itv_pro_codigo, itv_ved_codigo),
	 constraint fk_pro_itv foreign key (itv_pro_codigo) references tb_produtos(pro_codigo),
	 constraint fk_ved_itv foreign key (itv_ved_codigo) references tb_vendas(ved_codigo)
	 )  ; 

create table tb_fornecedores (
	 for_codigo int auto_increment,
	 for_bai_codigo int not null,
	 for_razao_social varchar(50) not null,
	 for_nome varchar(30) not null,
	 for_cnpj varchar(15) not null,
	 for_ins_estadual varchar(20),
	 for_ins_municipal varchar(20),
	 for_logradouro varchar(50) not null,
	 for_numero varchar(6) not null,
	 for_website varchar(100),
	 for_cep varchar(10),
	 constraint pk_fornecedores primary key(for_codigo),
	 constraint fk_bai_for foreign key (for_bai_codigo) references tb_bairros(bai_codigo)
	) engine=innodb;

create table tb_tel_fornecedores(
	 tef_telefone varchar(11) not null,
	 tef_for_codigo int not null,
	 constraint pk_teldosfor primary key ( tef_telefone,tef_for_codigo),
	 constraint fk_for_tef foreign key (tef_for_codigo) references tb_fornecedores (for_codigo)
	) engine=innodb;

create table tb_email_fornecedores (
	 emf_email varchar(20) not null,
	 emf_for_codigo int not null,
	 constraint pk_emailfor primary key ( emf_email,emf_for_codigo),
	 constraint fk_for_emf foreign key (emf_for_codigo) references tb_fornecedores (for_codigo)
	) engine=innodb;

create table tb_compras (
	 com_codigo int auto_increment,
	 com_for_codigo int not null,
	 com_nt_fiscal varchar(20) not null,
	 com_data date not null,
	 constraint pk_compras primary key(com_codigo),
	 constraint fk_for_com foreign key (com_for_codigo) references tb_fornecedores(for_codigo)
	) engine=innodb;

create table tb_itenscom (
	 itc_pro_codigo int not null,
	 itc_com_codigo int not null,
	 itc_preco double not null,
	 itc_qtd int not null,
	 constraint pk_itenscom primary key(itc_pro_codigo, itc_com_codigo),
	 constraint fk_pro_itc foreign key (itc_pro_codigo) references tb_produtos(pro_codigo),
	 constraint fk_com_itc foreign key (itc_com_codigo) references tb_compras(com_codigo)
	) engine=innodb;
