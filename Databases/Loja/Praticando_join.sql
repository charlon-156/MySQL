-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------



-- |----------------------Questão 01----------------------
-- |Nome e o desconto de todos os departamentos
-- |------------------------------------------------------
select ven_nome, sex_tipo from tb_vendedores 
join tb_sexos on ven_sex_codigo = sex_codigo;



-- |----------------------Questão 02----------------------
-- |Nome das cidade e do estado pertencente
-- |------------------------------------------------------
select cid_cidade, est_nome from tb_cidades 
join tb_estados on cid_est_codigo = est_codigo;



-- |----------------------Questão 03----------------------
-- |Nome dos produtos e suas marcas
-- |------------------------------------------------------
select pro_nome, mar_nome from tb_produtos 
join tb_marcas on pro_mar_codigo = mar_codigo;



-- |----------------------Questão 04----------------------
-- |Nome dos produtos e seus departamentos
-- |------------------------------------------------------
select pro_nome, dep_nome from tb_produtos 
join tb_departamentos on pro_dep_codigo = dep_codigo;



-- |----------------------Questão 05----------------------
-- |Nome dos clientes, CPF e RG
-- |------------------------------------------------------
select cli_nome, clf_cpf, clf_rg from tb_clientes 
join tb_clifisico on cli_codigo = clf_cli_codigo;



-- |----------------------Questão 06----------------------
-- |Código da compra, nota fiscal e nome do fornecedor
-- |------------------------------------------------------
select com_codigo, com_nt_fiscal, for_nome from tb_compras 
join tb_fornecedores on com_for_codigo = for_codigo;



-- |----------------------Questão 07----------------------
-- |Código da venda, nota fiscal, data e nome do cliente
-- |------------------------------------------------------
select ved_codigo, ved_nt_fiscal, ved_data, cli_nome from tb_vendas 
join tb_clientes on cli_codigo = ved_cli_codigo;



-- |----------------------Questão 08----------------------
-- |Código da venda, Número da nota fiscal, data e nome do vendedor
-- |------------------------------------------------------
select ved_codigo, ved_nt_fiscal, ved_data, ven_nome from tb_vendas 
join tb_vendedores on ven_codigo = ved_ven_codigo;



-- |----------------------Questão 09----------------------
-- |Nome e o desconto de todos os departamentos
-- |------------------------------------------------------
select ved_codigo, ved_nt_fiscal, ved_data, cli_nome, ven_nome from tb_clientes 
join tb_vendas on cli_codigo = ved_cli_codigo 
join tb_vendedores on ven_codigo = ved_ven_codigo


/***** all rights reserved to Charlon Fernandes *****/