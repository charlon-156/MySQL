-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------

-- |----------------------Questão 01----------------------
-- |Nome do departamento, descrição do produto, valor de venda e desconto de todos 
-- |os produtos com estoque acima do mínimo, por ordem de nome do departamento.
-- |------------------------------------------------------

select dep_nome, pro_nome, pro_preco, dep_desconto from tb_produtos
join tb_departamentos on pro_dep_codigo = dep_codigo
where pro_qt_estoque > pro_qt_minima;



-- |----------------------Questão 02----------------------
-- |Nome do departamento, descrição do produto, valor de venda, desconto de
-- |todos os produtos do departamento de calçados.
-- |------------------------------------------------------

select dep_nome, pro_nome, pro_preco, dep_desconto from tb_produtos
join tb_departamentos on pro_dep_codigo = dep_codigo
where dep_codigo = 4;



-- |----------------------Questão 03----------------------
-- |Nome e telefone de todos os clientes dos bairros TIROL, ALECRIM, ou
-- |RIBEIRA, por ordem de nome do cliente.
-- |------------------------------------------------------

select cli_nome, tec_telefone, bai_bairro from tb_clientes
join tb_tel_clientes on tec_cli_codigo = cli_codigo
join tb_bairros on cli_bai_codigo = bai_codigo
where bai_codigo in(1,2,3);


-- |----------------------Questão 04----------------------
-- |Nome e telefone de todos os fornecedores das cidades NATAL ou
-- |PARNAMIRIM, por ordem de nome do fornecedor.
-- |------------------------------------------------------

select for_nome, tef_telefone, cid_cidade from tb_fornecedores 
join tb_tel_fornecedores on tef_for_codigo = for_codigo
join tb_bairros on for_bai_codigo = bai_codigo
join tb_cidades on bai_cid_codigo = cid_codigo
where bai_cid_codigo in (1,2) order by for_nome;



-- |----------------------Questão 05----------------------
-- |Nota fiscal, data, descrição das formas de pagamento e nome do vendedor
-- |de todas as vendas já realizadas.
-- |------------------------------------------------------

select ved_nt_fiscal, ved_data, fdp_forma_pg, ven_nome from tb_vendas
join tb_vendedores on ved_ven_codigo = ven_codigo
join tb_pgvendas on pgv_ved_codigo = ved_codigo
join tb_formas_pgtos on pgv_fdp_codigo = fdp_codigo;

-- |----------------------Questão 06----------------------
-- |Nota fiscal, data, descrição das formas de pagamento e nome do vendedor
-- |de todas as vendas realizadas no mês de março de 2012.
-- |------------------------------------------------------

select ved_nt_fiscal, ved_data, fdp_forma_pg, ven_nome from tb_vendas
join tb_vendedores on ved_ven_codigo = ven_codigo
join tb_pgvendas on pgv_ved_codigo = ved_codigo
join tb_formas_pgtos on pgv_fdp_codigo = fdp_codigo 
where ved_data between '2012-03-01' and '2012-03-31';



-- |----------------------Questão 07----------------------
-- |O nome e departamento de todos os produtos que foram comprados pela
-- |loja em março de 2012
-- |------------------------------------------------------

select pro_nome, dep_nome from tb_produtos
join tb_departamentos on pro_dep_codigo = dep_codigo
join tb_itenscom on itc_pro_codigo = pro_codigo
join tb_compras on itc_com_codigo = com_codigo
where com_data between '2012-03-01' and '2012-03-31';



-- |----------------------Questão 08----------------------
-- |O nome e o departamento de todos os produtos que foram vendidos por um
-- |determinado departamento.
-- |------------------------------------------------------
select pro_nome, dep_nome from tb_produtos
join tb_departamentos on pro_dep_codigo = dep_codigo
where dep_codigo = 1;



-- |----------------------Questão 09----------------------
-- |O nome e o departamento de todos os produtos que foram vendidos por um
-- |determinado vendedor no primeiro semestre de 2012.
-- |------------------------------------------------------
select distinct ven_nome, pro_nome, dep_nome from tb_produtos
join tb_departamentos on pro_dep_codigo = dep_codigo
join tb_itensvendas on itv_pro_codigo = pro_codigo
join tb_vendas on itv_ved_codigo = ved_codigo
join tb_vendedores on ved_ven_codigo = ven_codigo
where ven_codigo = 2 and ved_data between '2012-01-01' and '2012-06-30';



-- |----------------------Questão 10----------------------
-- |O nome dos vendedores que nunca venderam nenhum produto.
-- |------------------------------------------------------
select ven_nome, ven_codigo from tb_vendedores 
left join tb_vendas on ved_ven_codigo = ven_codigo
where ved_ven_codigo is null;



