
-- Desenvolvido por Charlon 

use db_locadora;

-- Questão 01
update tb_filmes set fil_cat_codigo = 1 where fil_ano > 2012;
update tb_filmes set fil_cat_codigo = 2 where fil_ano between 2019 and 2014;
update tb_filmes set fil_cat_codigo = 3 where fil_ano < 2019;

-- 	Questão 02
insert into tb_generos (gen_genero) values ('Ação e Aventura');
update tb_filmes set fil_gen_codigo = 11 where fil_gen_codigo in (2, 3);
delete from tb_generos where gen_codigo in (2, 3);

-- 	Questão 03
update tb_copias set cop_con_codigo = 3 where (cop_tip_codigo = 1 or cop_tip_codigo = 3) and cop_con_codigo = 2;

-- Questão 04
update tb_clientes set cli_nome = 'Diana Silva' where cli_nome = 'Cephes Silva';

-- Questão 05
update tb_locacoes set loc_datadevolucao = 2021-04-26 where loc_datalocacao between 2021-04-22 and 2021-04-25;

-- Questão 06
delete from tb_cidades where cid_codigo between 4 and 8;

-- Questão 07 
delete from tb_dependentes where dep_codigo in (11, 12);
