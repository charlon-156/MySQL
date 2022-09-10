-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DDL(de criação) do Banco de Dados da Loja
-- |------------------------------------------------------

drop database if exists db_loja;
create database db_loja;
use db_loja;

-- criação das tabelas da loja

create table tb_estados (
	 est_codigo int auto_increment,
	 est_nome varchar(50) not null,
	 primary key(est_codigo)
	 );

create table tb_sexos (
	 sex_codigo int auto_increment,
	 sex_tipo varchar(10) null,
	 primary key(sex_codigo)
	 );

create table tb_cidades (
	 cid_codigo int auto_increment,
	 cid_cidade varchar(50) not null,
	 cid_est_codigo int not null,
	 primary key (cid_codigo),
	 foreign key (cid_est_codigo) references tb_estados(est_codigo)
	 );

create table tb_bairros (
	 bai_codigo int auto_increment,
	 bai_bairro varchar(50) not null,
	 bai_cid_codigo int not null,
	 primary key (bai_codigo),
	 foreign key (bai_cid_codigo) references tb_cidades(cid_codigo)
	 );  

create table tb_clientes (
	 cli_codigo int auto_increment,
	 cli_bai_codigo int not null,
	 cli_nome varchar(50) not null,
	 cli_logradouro varchar(100) not null,
	 cli_numero varchar(6) not null,
	 cli_cep varchar(9) null,
	 primary key (cli_codigo),
	 foreign key (cli_bai_codigo) references tb_bairros(bai_codigo)
	 );

create table tb_tel_clientes(
	 tec_telefone varchar(11) not null,
	 tec_cli_codigo int not null,
	 primary key ( tec_telefone,tec_cli_codigo),
	 foreign key (tec_cli_codigo) references tb_clientes(cli_codigo)
	 ) engine=innodb;     

create table tb_clifisico (
	 clf_cli_codigo int not null,
	 clf_sex_codigo int not null,
	 clf_cpf varchar(11) not null unique,
	 clf_rg int not null unique,
	 clf_dt_nascimento date,
	 primary key(clf_cli_codigo),
	 foreign key (clf_cli_codigo) references tb_clientes(cli_codigo),
	 foreign key (clf_sex_codigo) references tb_sexos(sex_codigo)
	 );

create table tb_clijuridico (
	 clj_cli_codigo int not null,
	 clj_cnpj varchar(20) not null,
	 clj_raz_social varchar(50) not null,
	 clj_ins_estadual varchar(20) not null,
	 clj_ins_minicipal varchar(20) null,
	 clj_website varchar(50) null,
	 primary key(clj_cli_codigo),
	 foreign key (clj_cli_codigo) references tb_clientes(cli_codigo)
	);

create table tb_vendedores (
	 ven_codigo int auto_increment,
	 ven_bai_codigo int not null,
	 ven_sex_codigo int not null,
	 ven_nome varchar(50) not null,
	 ven_cpf char(11) not null,
	 ven_rg varchar(10) not null,
	 ven_dt_admissao date,
	 ven_logradouro varchar(50) not null,
	 ven_numero varchar(15) not null,
	 primary key(ven_codigo),
	 foreign key (ven_bai_codigo) references tb_bairros(bai_codigo),
	 foreign key (ven_sex_codigo) references tb_sexos(sex_codigo)
	);

create table tb_tel_vendedores(
	 tev_telefone varchar(11) not null,
	 tev_ven_codigo int not null,
	 primary key ( tev_telefone,tev_ven_codigo),
	 foreign key (tev_ven_codigo) references tb_vendedores(ven_codigo)
	);
		  
create table tb_departamentos (
	 dep_codigo int auto_increment,
	 dep_nome varchar(50) null,
	 dep_desconto float,
	 primary key(dep_codigo)
	);

create table tb_marcas (
	 mar_codigo int auto_increment,
	 mar_nome varchar(50) not null,
	primary key(mar_codigo)
	);     

create table tb_produtos (
	 pro_codigo int auto_increment,
	 pro_dep_codigo int not null,
	 pro_mar_codigo int not null,
	 pro_nome varchar(50) null,
	 pro_qt_estoque int,
	 pro_qt_minima int,
	 pro_preco double not null,
	 primary key(pro_codigo),
	 foreign key (pro_dep_codigo) references tb_departamentos(dep_codigo),
	 foreign key (pro_mar_codigo) references tb_marcas(mar_codigo)
	 );

create table tb_formas_pgtos (
	fdp_codigo int auto_increment,
	fdp_forma_pg varchar(50) not null,
	primary key (fdp_codigo)
	);

create table tb_vendas (
	ved_codigo int auto_increment,
	ved_cli_codigo int not null,
	ved_ven_codigo int not null,
	ved_nt_fiscal varchar(10)not null,
	ved_data date not null,
	primary key(ved_codigo),
	foreign key (ved_cli_codigo) references tb_clientes(cli_codigo),
	foreign key (ved_ven_codigo) references tb_vendedores(ven_codigo)
	);

create table tb_pgvendas (
	 pgv_fdp_codigo int not null,
	 pgv_ved_codigo int not null,
	 pgv_valor double not null,
	 primary key(pgv_fdp_codigo,pgv_ved_codigo),
	 foreign key (pgv_fdp_codigo) references tb_formas_pgtos(fdp_codigo),
	 foreign key (pgv_ved_codigo) references tb_vendas(ved_codigo)
	);
    
create table tb_itensvendas (
	 itv_pro_codigo int not null,
	 itv_ved_codigo int not null,
	 itv_preco double not null,
	 itv_qtd int not null,
	 primary key(itv_pro_codigo, itv_ved_codigo),
	 foreign key (itv_pro_codigo) references tb_produtos(pro_codigo),
	 foreign key (itv_ved_codigo) references tb_vendas(ved_codigo)
	 ); 

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
	 primary key(for_codigo),
	 foreign key (for_bai_codigo) references tb_bairros(bai_codigo)
	);

create table tb_tel_fornecedores(
	 tef_telefone varchar(11) not null,
	 tef_for_codigo int not null,
	 primary key ( tef_telefone,tef_for_codigo),
	 foreign key (tef_for_codigo) references tb_fornecedores (for_codigo)
	);

create table tb_email_fornecedores (
	emf_email varchar(20) not null,
	emf_for_codigo int not null,
	primary key ( emf_email,emf_for_codigo),
	foreign key (emf_for_codigo) references tb_fornecedores (for_codigo)
	);

create table tb_compras (
	 com_codigo int auto_increment,
	 com_for_codigo int not null,
	 com_nt_fiscal varchar(20) not null,
	 com_data date not null,
	 primary key(com_codigo),
	 foreign key (com_for_codigo) references tb_fornecedores(for_codigo)
	);

create table tb_itenscom (
	 itc_pro_codigo int not null,
	 itc_com_codigo int not null,
	 itc_preco double not null,
	 itc_qtd int not null,
	 primary key(itc_pro_codigo, itc_com_codigo),
	 foreign key (itc_pro_codigo) references tb_produtos(pro_codigo),
	 foreign key (itc_com_codigo) references tb_compras(com_codigo)
	);

/***** all rights reserved to Charlon Fernandes *****/

-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DML(de inserção) do Banco de Dados da Loja
-- |------------------------------------------------------

use db_loja;

insert into tb_estados(est_nome) values ('Rio Grande do Norte');
insert into tb_estados(est_nome) values ('Ceará');
insert into tb_estados(est_nome) values ('Paraíba');
insert into tb_estados(est_nome) values ('Pernambuco');
insert into tb_estados(est_nome) values ('Rio de Janeiro');
 
insert into tb_sexos (sex_tipo) values ('Mascul ino');
insert into tb_sexos (sex_tipo) values ('Feminino');
 
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Natal',1);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Parnamirim',1);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Campina Grande',3);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Recife',4);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Olinda',4);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Fortaleza',2);
insert into tb_cidades ( cid_cidade,cid_est_codigo ) values ('Juazeiro do Norte',2);

insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Alecrim',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Tirol',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Ribeira',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Candelária',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Emaús',2);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Centro',2);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Estação Velha',3); 
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Catingueira',3);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('José Pinheiro',3);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Caxangá',4);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('Centro',5);

insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1, 'Gilberto Alves de Oliveira', 'Rua Jardim do Seridó', '45','59150-666');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (2, 'Frei João Maria', 'Rua Doutor Aladim', '221','59344-756');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (9, 'Mariana Carmelita', 'Rua Madre Tereza', '663', '59160-661');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (8, 'Markus Pereira Santos', 'Rua dos K-icós','1530','59360-020');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1, 'Paula Roberto Carlos', 'Rua Padre Berge', '4','59344-756');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (5, 'Telegrafos S.A','Rua Graham Bell', '1867','59980-000');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (8, 'J. J. Esport', 'Av. do Ouvidor', '19','59139-230');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (4, 'Paulo PenDrivers', 'Rua Soleil', '158','59784-912');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (3, 'Norca', 'Rua Marquês de Pombal', '157','67532-540');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1, 'Pão de Açucar L.T.','Av. Presidente Temer','9884','53323-123');
insert into tb_clientes (cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (2, 'Nordestão', 'Av. Coronel Chicó','987-B','59000000');

insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (1,'84 32332145');  
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (1,'84 34444146');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (2,'84 22222222');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (3,'84 99999999');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'84 40011111');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'84 89898898');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'84 87666555');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (7,'83 87666555');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (11,'84 33332222');

insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (1,1,'06548605899','312332','1965-03-03');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (2,1,'03748605789','12322','1950-02-01');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (3,2,'03148605678','4343','1930-04-02');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (4,1,'02748605923','2322','1970-02-15');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (5,2,'01148604303','2324','2000-02-03');

insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (6,'1234567891234','Empresa de Telegrafós S.A','123458');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (7,'1232227891111','J.J Esport LTDA','123984');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (8,'1234567894444','Paulo Produtor Tec','234841');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (9,'1255467891237','Norca LTDA','36562');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (10,'3434437891238','Pão de açucar LTDA','216464');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (11,'2342367891239','Supermercado Nordestão LTDA','874103');

insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (11, 1, 'Gilberto Barros', '03148706588', '2651907', '2014-05-02', 'AV. Leão', '1 - A'); 
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (7, 2, 'Maria Silva', '03148706589', '2651908', '2006-04-03', 'Rua Constantino', '22');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (9, 1, 'Paulo Selino', '03148706590', '2651909', '2008-03-09', 'Trav. Padre Felipe', '31');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (8, 2, 'Carla das Dores Costa', '03148706591', '2651910', '2010-03-04', 'Rua dos frades', '4');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (10, 1, 'Pedrus Petrovks', '03148706592', '2651911', '2013-04-05', 'Rua Marechal Vermes', 'apart. 55');

insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (1,'85 32132145');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (2,'83 67676776');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (2,'83 34343433');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (3,'83 11112222');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (4,'83 89999988');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (4,'83 23232122');

insert into tb_departamentos (dep_nome, dep_desconto) values ('Farmacêutico', 2);
insert into tb_departamentos (dep_nome, dep_desconto) values ('Alimentício', 2.5);
insert into tb_departamentos (dep_nome, dep_desconto) values ('Vestuário', 3);
insert into tb_departamentos (dep_nome, dep_desconto) values ('Calçados', 1);
insert into tb_departamentos (dep_nome, dep_desconto) values ('Utencílios', 2.5);
insert into tb_departamentos (dep_nome, dep_desconto) values ('Informática', 3);

insert into tb_marcas (mar_nome) values ('HP'); -- 6 1
insert into tb_marcas (mar_nome) values ('Bayer'); -- 1 2
insert into tb_marcas (mar_nome) values ('Adidas'); -- 4 3
insert into tb_marcas (mar_nome) values ('Nike'); -- 4 4
insert into tb_marcas (mar_nome) values ('Dell'); -- 6 5
insert into tb_marcas (mar_nome) values ('Sadia'); -- 2 6
insert into tb_marcas (mar_nome) values ('Palmeres'); -- 2 7
insert into tb_marcas (mar_nome) values ('Tramontina'); -- 5 8
insert into tb_marcas (mar_nome) values ('Samsung'); -- 6 9
insert into tb_marcas (mar_nome) values ('Brastemp'); -- 5 10
insert into tb_marcas (mar_nome) values ('Lacoste'); -- 3 11
insert into tb_marcas (mar_nome) values ('Merck'); -- 1 12
insert into tb_marcas (mar_nome) values ('Supreme'); -- 3 13

insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (6, 1, 'Impressora DeskJet', 143,  20, 107);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (1, 2, ' Anti-Fungo Menino Ney', 235, 80, 10);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (4, 3, 'Tênis de luzinha', 35, 100, 40);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (4, 4, 'Tênis Air-Soft', 55, 110, 22);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (6, 5, 'Notebook Gamer X5', 53,17, 2340);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (2, 6, 'Bolinho Maria Braga', 25, 50, 9);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (2, 7, 'Caju', 35, 100, 7);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (5, 8, 'Faca 23cm', 1, 5, 100);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (6, 9, 'S22 Plus Max', 50, 5, 3800);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (6, 9, 'Galaxy Z Fold 2', 50, 1, 3800);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (5, 10, 'Chapa de aço', 50, 1, 2.99);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (3, 11, 'Camiseta do Flamengo', 50, 1, 1.99);

insert into tb_formas_pgtos (fdp_forma_pg) values ('Avista');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Cheque');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Cartão Visa');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Cartão Master');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Cartão Hiper');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Cartão AMEX');
insert into tb_formas_pgtos (fdp_forma_pg) values ('Convenios');

insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (1, 3, '1232', '2012-01-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (2, 2, '1323', '2012-03-10');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (3, 3, '3434', '2014-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (3, 4, '3232', '2013-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (5, 5, '1214', '2017-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (5, 2, '1121', '2017-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (5, 4, '9877', '2018-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (1, 2, '7779', '2018-01-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (3, 2, '9988', '2018-02-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (10, 3,'9877', '2019-01-02');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (11, 5, '5676', '2019-01-02');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (8, 4, '5656', '2020-10-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data) values (1 ,4, '9563', '2020-01-01');

insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (1,1,10);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (2,6,55.9);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (3,2,43.2);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (4,3,8.99);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (5,2,23);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (6,5,100);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (7,8,10);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (2,2,77.2);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (3,3,87);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor) values (2,7,232);

insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (1,1,20,10);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (2,2,2.99,10);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (3,2,5.3,15);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (4,2,233,1);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (5,2,76,1);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (6,3,11,2);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (7,4,5.22,8);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (8,5,5.21,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (2,5,9.22,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (1,5,1.22,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (4,6,3.22,5);

insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'Eurofarma Industria Farmacêutica','Eurofarma','1234567891234','123456','654321','Av. Maria Lacerda','1 - A','www.eurofarma.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (4,'AriBuzz LTDA','AriBuzz','1234567891277','123457','654322','Av. Castelo Branco','2 - B','www.aribuzz.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (6,'Kalvo Comercio LTDA','kaLvo','1234567891981','123458','654323','Trav. Capitão Chimbinha','3 - C','www.kalvo.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'Marilene Moda SA','Marilene Moda','1234567894561','123459','654324','Rua Quintinho Bocaiuvas','4 - D','www.marilenemoda.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (2,'Insdutria Herbarium LTDA','Hebarium','1234569876542','123460','654325','Rua Chica da Silva','5 - E','www.herbarium.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'Distribuidor Ibramed LTDA ','IBRAMED','1234569836975','123461','654326','AV. AFONSO PENA','6 - F','www.ibramed.com.br','59000000');

insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (1,'8432132145');  
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432132322');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432234234');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432132555');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (3,'8432137777');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (4,'8432188888');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (4,'8432133333');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (6,'8432132656');

insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (1,'eurofarma@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (2,'aribuzz@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (3,'kalvo@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (3,'kalvo@hotmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (5,'hebarium@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (6,'ibamed@yahoo.com');

insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (1,'212','2010-01-01');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'87','2012-06-01');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'788','2012-03-02');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'677','2015-04-02');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (5,'547','2017-03-03');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (5,'567','2018-02-03');

insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (1,1,1.5,1000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,3,1.7,500);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,2,12,500);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,1,61,5000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (5,3,46,8000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (5,1,2,2000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (1,5,144.22,7000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (8,5,123.2,1000);

/***** all rights reserved to Charlon Fernandes *****/