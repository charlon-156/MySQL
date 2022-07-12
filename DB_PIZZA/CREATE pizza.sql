create database db_pizza;
use db_pizza;

create table tb_pizzas (
	piz_codigo int auto_increment,
    piz_sabor varchar(50) not null,
    piz_tamanho varchar(1),
    piz_preco double (5,2),
    primary key (piz_codigo)
);

create table tb_clientes (
	cli_codigo int auto_increment,
    cli_nome varchar(50),
    cli_mesa varchar(50),
    primary key(cli_codigo)
);

create table tb_pedidos (
	ped_codigo int auto_increment,
    ped_cli_codigo int,
    ped_piz_codigo int,
    ped_data int,
    ped_finalizado int,
    primary key (ped_codigo),
    foreign key (ped_cli_codigo) references tb_clientes(cli_codigo),
    foreign key (ped_piz_codigo) references tb_pizzas(piz_codigo)
);

