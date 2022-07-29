
-- Desenvolvido por Charlon 

use db_locadora;

-- -- QUESTÃO 01 -- --

update tb_filmes set fil_cat_codigo = 1 where fil_ano > 2012;
update tb_filmes set fil_cat_codigo = 2 where fil_ano between 2019 and 2016;
update tb_filmes set fil_cat_codigo = 3 where fil_ano < 2019;

-- -- QUESTÃO 02 -- --

insert into tb_generos (gen_genero) values ('Ação e Aventura');
update tb_filmes set fil_gen_codigo = 11 where fil_gen_codigo in (2, 3);
delete from tb_generos where gen_codigo in (2, 3);

-- -- QUESTÃO 03 -- -- 

update tb_copias set cop_con_codigo = 3 where (cop_tip_codigo = 1 or cop_tip_codigo = 3) and cop_con_codigo = 2;

-- -- QUESTÃO 04 -- --  

update tb_depdoscli set ddc_cli_codigo = 6 where ddc_cli_codigo = 5;
update tb_teldoscli set tdc_cli_codigo = 6 where tdc_cli_codigo = 5;
update tb_locacoes set loc_cli_codigo = 6 where loc_cli_codigo = 5;
delete from tb_clientes where cli_codigo = 5;

-- -- QUESTÃO 05 -- --  

update tb_locacoes set loc_datadevolucao = 2021-04-26 where loc_datalocacao between 2021-04-22 and 2021-04-25;

-- --  QUESTÃO 06 -- --  

	-- Select para descobrir cid_codigo que não possui bairros

	select tb_bairros.bai_bairro, tb_cidades.cid_cidade, tb_cidades.cid_codigo
	from tb_bairros right join tb_cidades on tb_bairros.bai_cid_codigo = tb_cidades.cid_codigo;

delete from tb_cidades where cid_codigo between 4 and 8;

-- -- QUESTÃO 07 -- -- 

	-- Select para descobrir quais dependentes não possuem responsavel
	select tb_dependentes.dep_nome, tb_dependentes.dep_codigo, tb_depdoscli.ddc_cli_codigo from tb_dependentes
    left join tb_depdoscli on tb_dependentes.dep_codigo = tb_depdoscli.ddc_dep_codigo
	left join tb_clientes on tb_depdoscli.ddc_cli_codigo = tb_clientes.cli_codigo order by tb_dependentes.dep_codigo;

delete from tb_dependentes where dep_codigo in (11, 12);
