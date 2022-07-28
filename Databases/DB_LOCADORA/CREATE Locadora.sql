-- CREATE IN LOCADORA

create database db_locadora;
use db_locadora;

create table tb_generos (
  gen_codigo int not null auto_increment,
  gen_genero varchar(45) null,
  primary key(gen_codigo)
) engine=innodb;

create table tb_conservacoes (
  con_codigo int not null auto_increment,
  con_conservacao varchar(50) null,
  primary key(con_codigo)
) engine=innodb;

 
create table tb_dependentes (
  dep_codigo int not null auto_increment,
  dep_nome varchar(45) not null,
  dep_dtnasc date null,
  primary key(dep_codigo)
) engine=innodb;

create table tb_faixas (
  fai_codigo int not null auto_increment,
  fai_faixa varchar(20) null,
  primary key(fai_codigo)
  ) engine=innodb;

create table tb_diretores (
  dir_codigo int not null auto_increment,
  dir_diretor varchar(45) null,
  primary key(dir_codigo)
  ) engine=innodb;

create table tb_cidades (
  cid_codigo int not null auto_increment,
  cid_cidade varchar(45) not null,
  primary key(cid_codigo)
  ) engine=innodb;

create table tb_cargos (
  car_codigo int not null auto_increment,
  car_cargo varchar(50) null,
  car_salario decimal(8,2),
  primary key(car_codigo)
  ) engine=innodb;

create table tb_atores (
  ato_codigo int not null auto_increment,
  ato_ator varchar(45) not null,
  ato_dtnasc date null,
  primary key(ato_codigo)
  ) engine=innodb;

create table tb_tiposmidia (
  tip_codigo int not null auto_increment,
  tip_tipo varchar(50) null,
  primary key(tip_codigo)
  ) engine=innodb;

create table tb_categorias (
  cat_codigo int not null auto_increment,
  cat_categoria varchar(45) not null,
  cat_preco float null,
  primary key(cat_codigo)
  ) engine=innodb;

create table tb_bairros (
  bai_codigo int not null auto_increment,
  bai_cid_codigo int not null,
  bai_bairro varchar(45) null,
  primary key(bai_codigo)
  ) engine=innodb;

create table tb_clientes (
  cli_codigo int auto_increment not null,
  cli_cpf varchar(11) not null,
  cli_bai_codigo int not null,
  cli_nome varchar(45) not null,
  cli_logradouro varchar(45) not null,
  cli_numero varchar(8) not null,
  cli_cep varchar(9) null,
  cli_dtnasc date not null,
  primary key(cli_codigo),
  foreign key (cli_bai_codigo) references tb_bairros(bai_codigo)
  ) engine=innodb;

create table tb_teldoscli (
  tdc_telefone varchar(45) not null,
  tdc_cli_codigo int not null,
  primary key(tdc_telefone,tdc_cli_codigo),
  foreign key (tdc_cli_codigo) references tb_clientes(cli_codigo)
  ) engine=innodb;

create table tb_funcionarios (
  fun_codigo int not null auto_increment,
  fun_car_codigo int not null,
  fun_nome varchar(50) null,
  primary key(fun_codigo),
  foreign key (fun_car_codigo) references tb_cargos(car_codigo)
  ) engine=innodb;

create table tb_locacoes (
  loc_codigo int not null auto_increment,
  loc_cli_codigo int not null,
  loc_fun_codigo int not null,
  loc_datalocacao date null,
  loc_datadevolucao date null,
  loc_preco int null,
  primary key(loc_codigo),
  foreign key (loc_cli_codigo) references tb_clientes(cli_codigo),
  foreign key (loc_fun_codigo) references tb_funcionarios(fun_codigo)
  ) engine=innodb;

create table tb_depdoscli (
  ddc_dep_codigo int not null,
  ddc_cli_codigo int not null,
  primary key(ddc_dep_codigo, ddc_cli_codigo),
  foreign key (ddc_dep_codigo) references tb_dependentes(dep_codigo),
  foreign key (ddc_cli_codigo) references tb_clientes(cli_codigo)
  ) engine=innodb;

create table tb_filmes (
  fil_codigo int not null auto_increment,
  fil_fai_codigo int not null,
  fil_gen_codigo int not null,
  fil_cat_codigo int not null,
  fil_titulo varchar(100) not null,
  fil_sinopse text null,
  fil_duracao int null,
  fil_ano int null,
  primary key (fil_codigo),
  foreign key (fil_fai_codigo) references tb_faixas(fai_codigo),
  foreign key (fil_gen_codigo) references tb_generos(gen_codigo),
  foreign key (fil_cat_codigo) references tb_categorias(cat_codigo)
  ) engine=innodb;

create table tb_copias (
  cop_codigo int not null auto_increment,
  cop_tip_codigo int not null,
  cop_con_codigo int not null,
  cop_fil_codigo int not null,
  cop_qtd_midia int null,
  primary key(cop_codigo),
  foreign key (cop_tip_codigo) references tb_tiposmidia(tip_codigo),
  foreign key (cop_con_codigo) references tb_conservacoes(con_codigo),
  foreign key (cop_fil_codigo) references tb_filmes(fil_codigo)
  ) engine=innodb;

create table tb_copias_das_locacoes (
  cdl_loc_codigo int not null,
  cdl_cop_codigo int not null,
  primary key(cdl_loc_codigo, cdl_cop_codigo),
  foreign key (cdl_loc_codigo) references tb_locacoes(loc_codigo),
  foreign key (cdl_cop_codigo) references tb_copias(cop_codigo)
  ) engine=innodb;

create table tb_atoresfilmes (
  adf_fil_codigo int not null,
  adf_ato_codigo int not null,
  primary key(adf_fil_codigo, adf_ato_codigo),
  foreign key (adf_fil_codigo) references tb_filmes(fil_codigo),
  foreign key (adf_ato_codigo) references tb_atores(ato_codigo)
  ) engine=innodb;

create table tb_diretoresfilmes (
  ddf_fil_codigo int not null,
  ddf_dir_codigo int not null,
  primary key(ddf_fil_codigo, ddf_dir_codigo),
  foreign key (ddf_fil_codigo) references tb_filmes(fil_codigo),
  foreign key (ddf_dir_codigo) references tb_diretores(dir_codigo)
  ) engine=innodb;
