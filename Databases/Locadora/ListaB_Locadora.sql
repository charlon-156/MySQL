-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------
 

 
-- |----------------------Questão 01----------------------
-- |Preciso do título dos filmes super-lançamento de comédia
-- |------------------------------------------------------
select fil_titulo, gen_genero, cat_categoria from tb_filmes 
join tb_generos on gen_codigo = fil_gen_codigo 
join tb_categorias on cat_codigo = fil_cat_codigo
where gen_codigo = 9 and fil_cat_codigo = 3;



-- |----------------------Questão 02----------------------
-- |Liste todos os códigos de cópia e nome do seu filme correspondente em ordem de gênero
-- |------------------------------------------------------
select cop_codigo, fil_titulo from tb_copias 
join tb_filmes on cop_fil_codigo = fil_codigo 
order by fil_gen_codigo;



-- |----------------------Questão 03----------------------
-- |nome dos clientes e o endereço completo, bairro e cidade.
-- |------------------------------------------------------
select cli_nome, cli_logradouro, bai_bairro, cid_cidade from tb_clientes 
join tb_bairros on cli_bai_codigo = bai_codigo 
join tb_cidades on bai_cid_codigo = cid_codigo;



-- |----------------------Questão 04----------------------
-- |Faça o relatório de atividades de 2019. nome do cliente,
-- |nome do funcionário que atendeu, e datas, em ordem cronológica
-- |------------------------------------------------------
select cli_nome, fun_nome, loc_datalocacao, loc_datadevolucao from tb_locacoes
join tb_clientes on cli_codigo = loc_cli_codigo 
join tb_funcionarios on fun_codigo = loc_fun_codigo
where loc_datalocacao between '2019-01-01' and '2019-12-31';



-- |----------------------Questão 05----------------------
-- |Nome de cada um dos filmes da locação 04, e a categoria
-- |------------------------------------------------------
select fil_titulo, cat_categoria from tb_locacoes 
join tb_copias_das_locacoes on cdl_loc_codigo = loc_codigo 
join tb_copias on cop_codigo = cdl_cop_codigo 
join tb_filmes on fil_codigo = cop_fil_codigo 
join tb_categorias on cat_codigo = fil_cat_codigo 
where loc_codigo = 4;



-- |----------------------Questão 06----------------------
-- |liste cópias, o nome do filme e o estado de conservação
-- |------------------------------------------------------
select cop_codigo, fil_titulo, con_conservacao from tb_copias 
join tb_filmes on fil_codigo = cop_fil_codigo
join tb_conservacoes on cop_con_codigo = con_codigo;



-- |----------------------Questão 07----------------------
-- |cópias quebradas que foram alugadas em 2021.
-- |------------------------------------------------------
select distinct cop_codigo, fil_titulo from tb_copias
join tb_filmes on fil_codigo = cop_fil_codigo
join tb_copias_das_locacoes on cdl_cop_codigo = cop_codigo
join tb_locacoes on cdl_loc_codigo = loc_codigo
where loc_datalocacao like '%2021%' and cop_con_codigo = 3;



-- |----------------------Questão 08----------------------
-- |clientes com mais de 18 anos que moram no Alecrim ou em Tirol. 
-- |só os que um dia já alugaram 
-- |------------------------------------------------------
select distinct cli_nome, bai_bairro from tb_clientes
join tb_bairros on cli_bai_codigo = bai_codigo 
join tb_locacoes on loc_cli_codigo = cli_codigo
where cli_bai_codigo in (2,3) and TIMESTAMPDIFF(YEAR, cli_dtnasc, now()) >= 18;



-- |----------------------Questão 09----------------------
-- |Liste o nome de todos os clientes que pegaram a cópia 5
-- |------------------------------------------------------
select cli_nome from tb_clientes 
join tb_locacoes on cli_codigo = loc_cli_codigo
join tb_copias_das_locacoes on cdl_loc_codigo = loc_codigo
join tb_copias on cdl_cop_codigo = cop_codigo
where cop_codigo = 5;



-- |----------------------Questão 10----------------------
-- |Existem filmes que foram pegos, mas não foram devolvidos
-- |------------------------------------------------------
select cli_nome from tb_clientes 
join tb_locacoes on loc_cli_codigo = cli_codigo 
where loc_datadevolucao is null;

/***** all rights reserved to Charlon Fernandes *****/