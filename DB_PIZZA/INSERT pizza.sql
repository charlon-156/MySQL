use db_pizza;

insert into tb_pizzas values 
	(default, 'calabresa', 'p', 20),
    (default, 'abacaxi', 'm', 12.80),
    (default, '4 queijo', 'g', 18),
    (default, 'peperonni','p', 10),
    (default, 'mussarela','g', 15);

insert into tb_clientes values 
	(default, 'Ari', 'Mesa 2'),
    (default, 'Beto', 'Mesa 9'),
    (default,  'Calu', 'Mesa 24'),
    (default, 'Dani', 'Mesa 11'),
    (default, 'Ester', 'Mesa 5');

insert into tb_pedidos values
	(default, 2, 1, '2020-11-30', 1),
    (default, 1, 3, '2019-01-01', 1),
    (default, 3, 4, '2019-01-01', 1),
    (default, 5, 5, '2019-01-01', 1),
    (default, 4, 2, '2019-01-01', 1);
;

select * from tb_pizzas;
select * from tb_clientes;
select * from tb_pedidos;

select tb_clientes.cli_nome, tb_clientes.cli_mesa, tb_pizzas.piz_sabor from
tb_clientes inner join tb_pizzas on tb_clientes.cli_codigo = tb_pizzas.piz_codigo;