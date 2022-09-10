-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

use db_loja;

-- |----------------------Questão 01----------------------
-- |Nome e o desconto de todos os departamentos
-- |------------------------------------------------------
select dep_nome, dep_desconto from tb_departamentos;



-- |----------------------Questão 02----------------------
-- |Descrição, valor para venda e quantidade em estoque de todos os produtos
-- |------------------------------------------------------
select pro_nome, pro_preco, pro_qt_estoque from tb_produtos;



-- |----------------------Questão 03----------------------
-- |Descrição, valor para venda, quantidade em estoque e valor mínimo em
-- |estoque de todos os produtos que estão abaixo do estoque mínimo
-- |------------------------------------------------------
select pro_nome, pro_preco, pro_qt_estoque, pro_qt_minima from tb_produtos
where pro_qt_estoque < pro_qt_minima;



-- |----------------------Questão 04----------------------
-- |Descrição, valor para venda, quantidade em estoque e valor mínimo em
-- |estoque de todos os produtos que estão acima do estoque mínimo
-- |------------------------------------------------------
select pro_nome, pro_preco, pro_qt_estoque, pro_qt_minima from tb_produtos
where pro_qt_estoque > pro_qt_minima;



-- |----------------------Questão 05----------------------
-- |Matrícula, nome e data de admissão de todas as vendedoras (mulheres)
-- |------------------------------------------------------
select ven_codigo, ven_nome, ven_dt_admissao from tb_vendedores
where ven_sex_codigo = 2;



-- |----------------------Questão 06----------------------
-- |Matrícula, nome e data de admissão de todos os vendedores homens,
-- |admitidos entre 01/01/2005 e 31/12/2008
-- |------------------------------------------------------
select ven_codigo, ven_nome, ven_dt_admissao from tb_vendedores
where ven_sex_codigo = 1 and ven_dt_admissao between '2008-12-31' and '2015-01-01';



-- |----------------------Questão 07----------------------
-- |Nome de todos os clientes que possuem “SANTOS” no nome
-- |------------------------------------------------------
select cli_nome from tb_clientes
where cli_nome like '%SANTOS%';



-- |----------------------Questão 08----------------------
-- |Descrição e preço dos dois produtos mais baratos
-- |------------------------------------------------------
select pro_nome, pro_preco from tb_produtos
order by pro_preco
limit 2;



-- |----------------------Questão 09----------------------
-- |Descrição e preço dos dois produtos mais caros
-- |------------------------------------------------------
select pro_nome, pro_preco from tb_produtos
order by pro_preco desc
limit 2;



-- |----------------------Questão 10----------------------
-- |Matrícula e data de admissão dos 3 vendedores mais antigos
-- |------------------------------------------------------
select ven_nome, ven_dt_admissao from tb_vendedores
order by ven_dt_admissao 
limit 3;

/***** all rights reserved to Charlon Fernandes *****/