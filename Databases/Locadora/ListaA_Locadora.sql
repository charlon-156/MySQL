-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


use db_locadora;


-- |----------------------Questão 01----------------------
-- |Me dê o nome, o logradouro e a idade dos clientes, em ordem
-- |de idade que moram nos bairros 1,2,3,5 e 10.
-- |------------------------------------------------------
select cli_nome, cli_logradouro, cli_dtnasc from tb_clientes 
where cli_bai_codigo in(1,2,3,5,10)
order by cli_dtnasc;



-- |----------------------Questão 02----------------------
-- |lista de nomes e a data de nascimento dos meus clientes maiores
-- |de idade. Ordenem em ordem alfabética
-- |------------------------------------------------------
select cli_nome, cli_dtnasc from tb_clientes 
where TIMESTAMPDIFF(YEAR, cli_dtnasc, now()) >= 18 order by cli_dtnasc;



-- |----------------------Questão 03----------------------
-- |Liste as cópias alugadas na locação de número 3.
-- |------------------------------------------------------
select cdl_cop_codigo from tb_copias_das_locacoes 
where cdl_loc_codigo = 3;



-- |----------------------Questão 04----------------------
-- |nomes e datas de nascimento dos dependentes com mais de 8 anos,
-- | categorizados por ordem alfabética
-- |------------------------------------------------------
select dep_nome, dep_dtnasc from tb_dependentes 
where TIMESTAMPDIFF(YEAR, dep_dtnasc, now()) >= 8
order by dep_nome;



-- |----------------------Questão 05----------------------
-- |Faça uma lista dos clientes da família "Silva"
-- |------------------------------------------------------
select cli_nome from tb_clientes where cli_nome like "%_Silva%";



-- |----------------------Questão 06----------------------
-- |Liste, por favor, o nome e código de cada um deles
-- |------------------------------------------------------
select fun_nome, fun_codigo from tb_funcionarios;



-- |----------------------Questão 07----------------------
-- |Estamos preparando uma festa de Halloween. Faça uma lista
-- | dos filmes de Terror, em ordem de lançamento.
-- |-----------------------------------------------------
select fil_titulo, fil_ano from tb_filmes where fil_gen_codigo = 5 
order by fil_ano;



-- |----------------------Questão 08----------------------
-- |Liste os filmes lançados a partir de 2010, organizados em ordem de lançamento
-- |-----------------------------------------------------
select fil_titulo, fil_ano from tb_filmes 
where fil_ano > '2010-01-01' 
order by fil_ano;



-- |----------------------Questão 09----------------------
-- | Liste todos os filmes que tem o nome tubarão e coloque em ordem alfabética.
-- |-----------------------------------------------------
select fil_titulo from tb_filmes where fil_titulo like "%Tubarão%"
order by fil_titulo;



-- |----------------------Questão 10----------------------
-- |Liste quais cópias temos do filme 1, mas apenas as que estejam novas.
-- |-----------------------------------------------------
select cop_codigo from tb_copias 
where cop_fil_codigo = 1 and cop_con_codigo = 1;