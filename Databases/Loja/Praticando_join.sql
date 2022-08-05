-- Atividade sobre Inner Join - Developer by Charlon Fernandes

-- Questão 1
select ven_nome, sex_tipo from tb_vendedores join tb_sexos on ven_sex_codigo = sex_codigo;

-- Questão 2
select cid_cidade, est_nome from tb_cidades join tb_estados on cid_est_codigo = est_codigo;

-- Questão 3
select pro_nome, mar_nome from tb_produtos join tb_marcas on pro_mar_codigo = mar_codigo;

-- Questão 4
select pro_nome, dep_nome from tb_produtos join tb_departamentos on pro_dep_codigo = dep_codigo;

-- Questão 5
select cli_nome, clf_cpf, clf_rg from tb_clientes join tb_clifisico on cli_codigo = clf_cli_codigo;

-- Questão 6
select com_codigo, com_nt_fiscal, for_nome from tb_compras join tb_fornecedores on com_for_codigo = for_codigo;

-- Questão 7
select ved_codigo, ved_nt_fiscal, ved_data, cli_nome from tb_vendas join tb_clientes on cli_codigo = ved_cli_codigo;

-- Questão 8 
select ved_codigo, ved_nt_fiscal, ved_data, ven_nome from tb_vendas join tb_vendedores on ven_codigo = ved_ven_codigo;

-- Questão 9
select ved_codigo, ved_nt_fiscal, ved_data, cli_nome, ven_nome from tb_clientes join tb_vendas on cli_codigo = ved_cli_codigo join tb_vendedores on ven_codigo = ved_ven_codigo
