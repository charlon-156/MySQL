-- Lista 1 (Loja)

use db_loja;

-- Questao 1
select dep_nome, dep_desconto from tb_departamentos;

-- Questao 2
select pro_nome, pro_preco, pro_qt_estoque from tb_produtos;

-- Questao 3
select pro_nome, pro_preco, pro_qt_estoque, pro_qt_minima from tb_produtos
where pro_qt_estoque < pro_qt_minima;

-- Questao 4
select pro_nome, pro_preco, pro_qt_estoque, pro_qt_minima from tb_produtos
where pro_qt_estoque > pro_qt_minima;

-- Questao 5
select ven_codigo, ven_nome, ven_dt_admissao from tb_vendedores
where ven_sex_codigo = 2;

-- Questao 6
select ven_codigo, ven_nome, ven_dt_admissao from tb_vendedores
where ven_sex_codigo = 1 and ven_dt_admissao between '2008-12-31' and '2015-01-01';

-- Questao 7
select cli_nome from tb_clientes
where cli_nome like '%SANTOS%';

-- Questao 8 
select pro_nome, pro_preco from tb_produtos
order by pro_preco
limit 2;

-- Questao 9
select pro_nome, pro_preco from tb_produtos
order by pro_preco desc
limit 2;

-- Questao 10
select ven_nome, ven_dt_admissao from tb_vendedores
order by ven_dt_admissao 
limit 3;