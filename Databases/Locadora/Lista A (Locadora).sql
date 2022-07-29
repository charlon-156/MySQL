-- DESENVOLVIDO POR CHARLON FERNANDES 

use db_locadora; 

-- Questão 1
select cli_nome from tb_clientes where cli_bai_codigo in(1,2,3,5) order by cli_dtnasc;

-- Questão 2
select cli_nome from tb_clientes where year(cli_dtnasc) < year(curdate()-18);

-- Questão 3
select cdl_cop_codigo from tb_copias_das_locacoes where cdl_loc_codigo = 3; 

-- Questao 4 
select cli_nome, cli_dtnasc from tb_clientes where cli_dtnasc between '2014-01-01' and '2016-12-31' 
order by cli_nome, cli_dtnasc;

-- Questao 5
select cli_nome from tb_clientes where cli_nome like "%Silva";

-- Questao 6
select fun_nome, fun_codigo from tb_funcionarios;

-- Questao 7
select fil_titulo from tb_filmes where fil_gen_codigo = 5 order by fil_ano;

-- Questao 8
select fil_titulo, fil_ano from tb_filmes where fil_ano > '2010-01-01' order by fil_ano;

-- Questao 9
select fil_titulo from tb_filmes where fil_titulo like "%Tubarão%" order by fil_titulo;

-- Questao 10
select cop_qtd_midia from tb_copias where cop_fil_codigo = 1 and cop_con_codigo = 1;