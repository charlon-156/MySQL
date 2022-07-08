create database db_aviao;
use db_aviao;

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

create table tb_voos (
	voo_codigo int auto_increment,
    voo_datasaida timestamp not null,
    voo_datachegada timestamp not null,
    voo_localsaida varchar(45) not null,
    voo_localchegada varchar(45) not null,
    voo_avi_codigo int,
    voo_pil_codigo int,
    primary key(voo_codigo),
    foreign key(voo_avi_codigo) references tb_avioes(avi_codigo),
    foreign key(voo_pil_codigo) references tb_pilotos(pil_codigo)
);

create table tb_clientes(
	cli_codigo int auto_increment,
    cli_nome varchar(45) not null,
    cli_datanasc date not null,
    cli_documento varchar(45) not null
);

create table tb_clientes_dos_voos (
	cdv_voo_codigo int,
    cdv_cli_codigo int,
    primary key(cdv_voo_codigo,cdv_cli_codigo)
    );
    
    