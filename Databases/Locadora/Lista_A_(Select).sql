-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

use db_locadora; 

-- |----------------------Questão 01----------------------
-- |Me dê o nome dos clientes que moram nos bairros (1,2,3 e 5), em ordem de idade.
-- |------------------------------------------------------
select cli_nome from tb_clientes where cli_bai_codigo in(1,2,3,5) order by cli_dtnasc;



-- |----------------------Questão 02----------------------
-- |Preciso de uma lista de nomes dos meus clientes maiores de idade. Ordenem em ordem alfabética.
-- |------------------------------------------------------
select cli_nome from tb_clientes where year(cli_dtnasc) < year(curdate()-18);



-- |----------------------Questão 03----------------------
-- |Liste as cópias alugadas no contrato 3.
-- |------------------------------------------------------
select cdl_cop_codigo from tb_copias_das_locacoes where cdl_loc_codigo = 3; 



-- |----------------------Questão 04----------------------
-- |Preciso dos nomes de datas de nascimento dos entre 8 e 10 anos, categorizados por bairro e dentro de cada bairro em ordem alfabética.
-- |------------------------------------------------------
select cli_nome, cli_dtnasc from tb_clientes where cli_dtnasc between '2014-01-01' and '2016-12-31' 
order by cli_nome, cli_dtnasc;



-- |----------------------Questão 05----------------------
-- |Uma cliente conhecida como “Silva” ligou. Não sabemos o nome completo dela.
-- |------------------------------------------------------
select cli_nome from tb_clientes where cli_nome like "%Silva";



-- |----------------------Questão 06----------------------
-- |Liste, por favor, o nome e código de cada funcionário.
-- |------------------------------------------------------
select fun_nome, fun_codigo from tb_funcionarios;



-- |----------------------Questão 07----------------------
-- |Faça uma lista dos filmes de Terror, em ordem de lançamento.
-- |------------------------------------------------------
select fil_titulo from tb_filmes where fil_gen_codigo = 5 order by fil_ano;



-- |----------------------Questão 08----------------------
-- |filmes lançados a partir de 2010. Liste-os, organizados em ordem de lançamento
-- |------------------------------------------------------
select fil_titulo, fil_ano from tb_filmes where fil_ano > '2010-01-01' order by fil_ano;



-- |----------------------Questão 09----------------------
-- |Prpcure o filme que tem o nome "Tubarão" e organize por ordem alfabetica
-- |------------------------------------------------------
select fil_titulo from tb_filmes where fil_titulo like "%Tubarão%" order by fil_titulo;



-- |----------------------Questão 10----------------------
-- | Liste quais cópias temos do filme n°1, mas apenas as que estejam novas.
-- |------------------------------------------------------
select cop_codigo from tb_copias where cop_fil_codigo = 1 and cop_con_codigo = 1;

/***** all rights reserved to Charlon Fernandes *****/