-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

use db_loja;

-- |----------------------Questão 01----------------------
-- |Nome de todas as cidades e, se existirem, seus respectivos bairros.
-- |------------------------------------------------------
select cid_cidade, bai_bairro from tb_bairros 
right join tb_cidades on bai_cid_codigo = cid_codigo;



-- |----------------------Questão 02----------------------
-- |Nome e código de todas as cidades sem nenhum bairro cadastrado.
-- |------------------------------------------------------
select cid_cidade, cid_codigo from tb_cidades 
left join tb_bairros on bai_cid_codigo = cid_codigo
where bai_cid_codigo is null;



-- |----------------------Questão 03----------------------
-- |Código e nome de todas as marcas sem nenhum produto cadastrado.
-- |------------------------------------------------------
select mar_codigo, mar_nome from tb_produtos 
right join tb_marcas on pro_mar_codigo = mar_codigo
where pro_mar_codigo is null;



-- |----------------------Questão 04----------------------
-- |Nome de todos os produtos que não tiveram nenhuma unidade vendida.
-- |------------------------------------------------------
select pro_nome from tb_produtos 
left join tb_itensvendas on itv_pro_codigo = pro_codigo
where itv_pro_codigo is null;



-- |----------------------Questão 05----------------------
-- |Nome e fone de todos os vendedores que não venderam nada.
-- |------------------------------------------------------
select ven_nome, tev_telefone from tb_tel_vendedores 
inner join tb_vendedores on tev_ven_codigo = ven_codigo
left join tb_vendas on ved_ven_codigo = ven_codigo
where ved_ven_codigo is null;



-- |----------------------Questão 06----------------------
-- |Nome dos clientes, pessoa física, sem telefone cadastrado.
-- |------------------------------------------------------
select cli_nome from tb_tel_clientes 
right join tb_clientes on tec_cli_codigo = cli_codigo
right join tb_clifisico on clf_cli_codigo = cli_codigo
where tec_cli_codigo is null;



-- |----------------------Questão 07----------------------
-- |Nome e fone de todos os fornecedores que já forneceram produtos.
-- |------------------------------------------------------
select distinct for_nome, tef_telefone from tb_compras 
inner join tb_fornecedores on com_for_codigo = for_codigo
left join tb_tel_fornecedores on tef_for_codigo = for_codigo;



-- |----------------------Questão 08----------------------
-- |Nome, fone e email de todos os fornecedores que nunca forneceram.
-- |------------------------------------------------------
select distinct for_nome, tef_telefone, emf_email from tb_compras 
right join tb_fornecedores on com_for_codigo = for_codigo
left join tb_tel_fornecedores on tef_for_codigo = for_codigo
left join tb_email_fornecedores on emf_for_codigo = for_codigo
where com_for_codigo is null;

/***** all rights reserved to Charlon Fernandes *****/