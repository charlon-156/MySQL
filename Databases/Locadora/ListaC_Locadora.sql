-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

use db_locadora;

-- |----------------------Questão 01----------------------
-- |nomes dos clientes que têm dependentes, e inclua o nome de cada um dos dependentes.
-- |Coloque em ordem alfabética pelo dependente.
-- |------------------------------------------------------
select cli_nome, dep_nome from tb_clientes 
inner join tb_depdoscli on ddc_cli_codigo = cli_codigo 
inner join tb_dependentes on ddc_dep_codigo = dep_codigo
order by dep_nome;



-- |----------------------Questão 02----------------------
-- |Liste o nome e telefone dos clientes que não tem dependentes
-- |------------------------------------------------------
select cli_nome, tdc_telefone from tb_teldoscli
right join tb_clientes on tdc_cli_codigo = cli_codigo
left join tb_depdoscli on ddc_cli_codigo = cli_codigo 
left join tb_dependentes on ddc_dep_codigo = dep_codigo
where ddc_dep_codigo is null
order by dep_nome;



-- |----------------------Questão 03----------------------
-- |todos aqueles filmes que não foram alugados em 2019.
-- |------------------------------------------------------
select distinct fil_codigo, fil_titulo from tb_filmes 
left join tb_copias on cop_fil_codigo = fil_codigo
left join tb_copias_das_locacoes on cdl_cop_codigo = cop_codigo
left join tb_locacoes on cdl_loc_codigo = loc_codigo
where loc_datalocacao not like '%2019%'
order by fil_codigo;



-- |----------------------Questão 04----------------------
-- |Faça uma lista de funcionários que não fizeram nenhum aluguel em março de 2020.
-- |------------------------------------------------------
select distinct fun_codigo, fun_nome from tb_locacoes 
right join tb_funcionarios on loc_fun_codigo = fun_codigo
where not fun_codigo in (select loc_fun_codigo from tb_locacoes where loc_datalocacao like '%2020-03%') or loc_fun_codigo is null;



-- |----------------------Questão 05---------------------- 
-- |Liste o cargo e o nome dos funcionários que não conseguiram alugar filmes de comédia em 2018.
-- |------------------------------------------------------
select distinct fun_codigo, fun_nome, car_cargo from tb_cargos
right join tb_funcionarios on fun_car_codigo = car_codigo
left join tb_locacoes on loc_fun_codigo = fun_codigo
left join tb_copias_das_locacoes on cdl_loc_codigo = loc_codigo
left join tb_copias on cdl_cop_codigo = cop_codigo
left join tb_filmes on cop_fil_codigo = fil_codigo
where not fun_codigo in(select loc_fun_codigo from tb_locacoes where loc_datalocacao like '%2018%') and
not fil_gen_codigo = 9 or loc_fun_codigo is null;



-- |----------------------Questão 06----------------------
-- |Liste em ordem alfabética o nome dos atores que já fizeram filmes de comédia
-- |------------------------------------------------------
select distinct ato_ator from tb_atores
join tb_atoresfilmes on adf_ato_codigo = ato_codigo
join tb_filmes on adf_fil_codigo = fil_codigo
where fil_gen_codigo = 9
order by ato_ator;



-- |----------------------Questão 07----------------------
-- |Liste os Gêneros que não tem filmes cadastrados.
-- |------------------------------------------------------
select gen_genero from tb_filmes 
right join tb_generos on fil_gen_codigo = gen_codigo
where fil_gen_codigo is null;



-- |----------------------Questão 08----------------------
-- |Liste o nome de todas as cidades que não tem nenhum bairro cadastrado.
-- |------------------------------------------------------
select cid_cidade, cid_codigo, bai_bairro from tb_bairros
right join tb_cidades on bai_cid_codigo = cid_codigo
where bai_cid_codigo is null;


/***** all rights reserved to Charlon Fernandes *****/