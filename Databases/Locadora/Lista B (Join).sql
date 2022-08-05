-- Developer Charlon F. Monteiro

-- Questão 1
select fil_titulo, gen_genero, cat_categoria from tb_filmes join tb_generos on gen_codigo = fil_gen_codigo join tb_categorias on cat_codigo = fil_cat_codigo
where fil_gen_codigo = 9 and fil_cat_codigo = 3;

-- Questão 2
select cop_codigo, fil_titulo from tb_copias join tb_filmes on cop_fil_codigo = fil_codigo order by fil_gen_codigo;

-- Questão 3
select cli_nome, cli_logradouro, bai_bairro, cid_cidade from tb_clientes 
join tb_bairros on cli_bai_codigo = bai_codigo 
join tb_cidades on bai_cid_codigo = cid_codigo;

-- Questão 4
select cli_nome, fun_nome, loc_datalocacao, loc_datadevolucao from tb_locacoes join tb_clientes on cli_codigo = loc_cli_codigo join tb_funcionarios on fun_codigo = loc_fun_codigo
where loc_datalocacao between '2014-01-01' and '2014-12-31';

-- Questão 5
select fil_titulo, cat_categoria from tb_locacoes 
join tb_copias_das_locacoes on cdl_loc_codigo = loc_codigo 
join tb_copias on cop_codigo = cdl_cop_codigo 
join tb_filmes on fil_codigo = cop_fil_codigo 
join tb_categorias on cat_codigo = fil_cat_codigo 
where loc_codigo = 4;

-- Questão 6
select cop_codigo, fil_titulo, con_conservacao from tb_copias 
join tb_filmes on fil_codigo = cop_fil_codigo
join tb_conservacoes on cop_con_codigo = con_codigo;

-- Questão 7
select distinct cop_codigo, fil_titulo from tb_copias
join tb_filmes on fil_codigo = cop_fil_codigo
join tb_copias_das_locacoes on cdl_cop_codigo = cop_codigo
join tb_locacoes on cdl_loc_codigo = loc_codigo
where loc_datalocacao between '2014-01-01' and '2014-12-31' and cop_con_codigo = 3;

-- Questão 8 

select cli_nome from tb_clientes 
join tb_locacoes on loc_cli_codigo = cli_codigo;

-- Questão 9
select cli_nome from tb_clientes 
join tb_locacoes on cli_codigo = loc_cli_codigo
join tb_copias_das_locacoes on cdl_loc_codigo = loc_codigo
join tb_copias on cdl_cop_codigo = cop_codigo
where cop_codigo = 5;

-- Questão 10
select cli_nome from tb_clientes join tb_locacoes on loc_cli_codigo = cli_codigo where loc_datadevolucao is null;
