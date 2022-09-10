-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DML(de inserção) do Banco de Dados da Loja
-- |------------------------------------------------------

use db_loja;

-- INSERIR TB_ESTADOS --
insert into tb_estados( est_nome )	 values ('RIO GRANDE DO NORTE');
insert into tb_estados( est_nome )	 values ('CEARA');
insert into tb_estados( est_nome )	 values ('PARAIBA');
insert into tb_estados( est_nome )	 values ('PERNAMBUCO');
insert into tb_estados( est_nome )	 values ('RIO DE JANEIRO');
 
insert into tb_sexos (sex_tipo) values ('MASCULINO');
insert into tb_sexos (sex_tipo) values ('FEMININO');
 
insert into tb_cidades( cid_cidade,cid_est_codigo )	values ('NATAL',1);
insert into tb_cidades( cid_cidade,cid_est_codigo )	values ('PARNAMIRIM',1);
insert into tb_cidades( cid_cidade,cid_est_codigo )	values ('MACAIBA',1);
insert into tb_cidades( cid_cidade,cid_est_codigo )	values ('SAO GONCALO DO AMARANTE',1);
insert into tb_cidades( cid_cidade,cid_est_codigo ) values ('FORTALEZA',2);

	 -- - inserir tb_bairros ---
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('CENTRO',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('ALECRIM',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('TIROL',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('RIBEIRA',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('CANDELÁRIA',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('LAGOA SECA',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('LAGOA NOVA',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('MORRO BRANCO',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('PETRÓPOLIS',1);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('CENTRO',2);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('CENTRO',3);
insert into tb_bairros (bai_bairro,bai_cid_codigo) values ('CENTRO',4);

		-- INSERIR TB CLIENTES 
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1,'GILBERTO ALVES DE OLIVEIRA','RUA JARDIM DO SERIDO','48','59150666');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (2,'JOAO MARIA','RUA DR SEM NOME','222','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1,'MARIA JOSE','RUA TESTE','1111','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (8,'MAKUS PEREIRA','RUA DOS CAICOS','2210','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1,'PAULO ROBERTO','RUA MISSIONARIO DANIEL BERG','4','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (2,'TELEGRAFOS S.A','RUA S. JOSE','24','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (8,'J.J COMERCIO','RUA PARQUE AZUL','29','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (4,'PAULO ALIMENTOS','RUA S. CARLOS','39','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (3,'NORCA','RUA DR. JOSE MARIA','147','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (1,'PAO DE ACUCAE','RUA S. S. SILVA','9874','59000000');
insert into tb_clientes(cli_bai_codigo,cli_nome,cli_logradouro,cli_numero,cli_cep) values (2,'NORDESTE','AV. CARLOS SANTOS','987-B','59000000');

	  -- INSERIR TB_TEL_CLIENTES ---
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (1,'8432332145');  
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (1,'8434444146');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (2,'8422222222');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (3,'8499999999');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'8440011111');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'8489898898');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (4,'8487666555');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (8,'8487666555');
insert into tb_tel_clientes (tec_cli_codigo,tec_telefone) values (11,'8433332222');

	  -- -INSERIR TB_CLIFISICO ---
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (1,1,'06548605899','312332','1965-03-03');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (2,1,'03748605789','12322','1950-02-01');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (3,2,'03148605678','4343','1930-04-02');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (4,1,'02748605923','2322','1970-02-15');
insert into tb_clifisico (clf_cli_codigo,clf_sex_codigo,clf_cpf,clf_rg,clf_dt_nascimento) values (5,1,'01148604303','2324','2000-02-03');

	  -- -INSERIR TB_CLIJURIDICO ---
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (6,'1234567891234','EMPRESA DE TELEFRAFOS S.A','123458');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (7,'1232227891111','J.J COMERCIO LTDA','123984');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (8,'1234567894444','PAULO INDUSTRIA DE ALIMENTOS','234841');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (9,'1255467891237','NORCA LTDA','36562');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (10,'3434437891238','PAO DE ACUCAR LTDA','216464');
insert into tb_clijuridico (clj_cli_codigo,clj_cnpj,clj_raz_social,clj_ins_estadual) values (11,'2342367891239','NORDESTE TRANSPORTES LTDA','874103');

	  -- - INSERIR TB_VENDEDORES ---
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (1,1,'GILBERTO ALVES','03148706588','2651907','2014-05-02','AV. MARIA LACERDA','1 - A');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (2,2,'MARIA DA SILVA','03148706589','2651908','2004-04-03','AV. PRUDENTE DE MORAIS','2 - B');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (2,1,'PAULO ROBERTO','03148706590','2651909','2008-03-09','TRAV. PADRE JOAO MARIA','3 - C');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (8,2,'CARLA DA COSTA GOMES','03148706591','2651910','2010-03-04','RUA DOS CAICOS','4 - D');
insert into tb_vendedores(ven_bai_codigo,ven_sex_codigo,ven_nome,ven_cpf,ven_rg,ven_dt_admissao,ven_logradouro,ven_numero)	values (10,1,'MARKUS PEREIRA','03148706592','2651911','2013-04-05','RUA MARIA ALVES','5 - E');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (1,'8432132145');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (2,'8467676776');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (2,'8434343433');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (4,'8411112222');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (4,'8489999988');
insert into tb_tel_vendedores (tev_ven_codigo,tev_telefone) values (4,'8423232122');

	  -- - INSERIR TB_DEPARTAMENTOS ---
insert into tb_departamentos (dep_nome, dep_desconto) values ('MEDICAMENTOS',2);
insert into tb_departamentos (dep_nome, dep_desconto) values ('ALIMENTOS',2.5);
insert into tb_departamentos (dep_nome, dep_desconto) values ('ROUPAS',3);
insert into tb_departamentos (dep_nome, dep_desconto) values ('CALÇADOS',1);
insert into tb_departamentos (dep_nome, dep_desconto) values ('JARDIM',2.5);
insert into tb_departamentos (dep_nome, dep_desconto) values ('INFORMÁTICA',3);

	  -- - INSERIR TB_MARCAS ---
insert into tb_marcas (mar_nome) values ('HP');
insert into tb_marcas (mar_nome) values ('PRIZER');
insert into tb_marcas (mar_nome) values ('ADIDDAS');
insert into tb_marcas (mar_nome) values ('NIKE');
insert into tb_marcas (mar_nome) values ('DELL');
insert into tb_marcas (mar_nome) values ('SADIA');
insert into tb_marcas (mar_nome) values ('PERDIGÃO');
insert into tb_marcas (mar_nome) values ('TRAMONTINA');
insert into tb_marcas (mar_nome) values ('TEXACO');
insert into tb_marcas (mar_nome) values ('BRASTEMP');
insert into tb_marcas (mar_nome) values ('FRIBOI');
insert into tb_marcas (mar_nome) values ('CELESTE');
insert into tb_marcas (mar_nome) values ('NORDESTE FRUIT');

	  -- - INSERIR TB_PRODUTOS ---
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (2,1,'BANANA',143,10,10);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (2,2,'CAJÁ',223,100,20);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (5,3,'CISCADOR DE PLÁSTICO',35,100,30);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (1,4,'SORO ANTI-A 10ML',34,120,40);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (2,5,'CARNE BOVINA',53,11,50);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (4,5,'TENIS AIR-SOFT',553,50,50);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (4,5,'SANDÁLIA ORTO-FLEX',35,100,50);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (3,5,'CAMISETA DO BRASIL',2,1,180);
insert into tb_produtos (pro_dep_codigo,pro_mar_codigo,pro_nome,pro_qt_estoque,pro_qt_minima,pro_preco)	values (3,5,'CAMISETA DO FLAMENGO',50,1,1.99);

	  -- - INSERIR TB_FORMAS_PGTOS ---
insert into tb_formas_pgtos (fdp_forma_pg) values ('AVISTA');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CHEQUE');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CARTAO VISA');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CARTAO MASTER');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CARTAO HIPER');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CARTAO AMEX');
insert into tb_formas_pgtos (fdp_forma_pg) values ('CONVENIOS');

	  -- - INSERIR TB_VENDAS ---
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (1,1,'1232','2012-01-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (2,1,'1323','2013-02-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (3,3,'3434','2014-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (3,4,'3232','2013-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (5,5,'1214','1995-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (5,3,'1121','2001-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (5,3,'9877','2004-03-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (1,1,'7779','2011-01-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (3,1,'9988','2010-02-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (10,3,'9877','2009-01-02');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (8,1,'5676','2007-01-02');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (8,4,'5656','2005-10-01');
insert into tb_vendas (ved_cli_codigo,ved_ven_codigo,ved_nt_fiscal,ved_data)	values (1,4,'9563','2005-01-01');

	  -- - inserir tb_pgvendas ---
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (1,1,10);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (2,6,55.9);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (3,2,43.2);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (4,3,8.99);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (5,2,23);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (6,5,100);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (7,8,10);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (2,2,77.2);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (3,3,87);
insert into tb_pgvendas (pgv_fdp_codigo,pgv_ved_codigo,pgv_valor)	values (2,7,232);

	  -- - insert itensvendas ---
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (1,1,20,10);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (2,2,2.99,10);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (3,2,5.3,15);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (4,2,233,1);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (5,2,76,1);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (6,3,11,2);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (7,4,5.22,8);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (8,5,5.21,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (2,5,9.22,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (1,5,1.22,5);
insert into tb_itensvendas (itv_pro_codigo,itv_ved_codigo,itv_preco,itv_qtd) values (4,6,3.22,5);

	  -- - inserir tb_fornecedores ---
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'EUROFARMA INDUTRIA FAMACEUTICA','EUROFARMA','1234567891234','123456','654321','AV. MARIA LACERDA','1 - A','www.eurofarma.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (4,'PRIZER INDUSTRIA LTDA','PRIZER','1234567891277','123457','654322','AV. PRUDENTE DE MORAIS','2 - B','www.prizer.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (6,'KAVO COMERCIO LTDA','KAVO','1234567891981','123458','654323','TRAV. PADRE JOAO MARIA','3 - C','www.kavo.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'FARMA FORMULA COMERCIO LTDA','FARMA FORMULA','1234567894561','123459','654324','RUA DOS CAICOS','4 - D','www.farmaformula.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (2,'INDUSTRIA HERBARIUM  LTDA','HEBARIUM','1234569876542','123460','654325','RUA MARIA ALVES','5 - E','www.herbarium.com.br','59000000');
insert into tb_fornecedores (for_bai_codigo,for_razao_social,for_nome,for_cnpj,for_ins_estadual,for_ins_municipal,for_logradouro,for_numero,for_website,for_cep)	values (1,'DISTRIBUIDOR IBRAMED LTDA ','IBRAMED','1234569836975','123461','654326','AV. AFONSO PENA','6 - F','www.ibramed.com.br','59000000');

	  -- - inserir tb_tel_fornecedores ---
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (1,'8432132145');  
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432132322');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432234234');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (2,'8432132555');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (3,'8432137777');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (4,'8432188888');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (4,'8432133333');
insert into tb_tel_fornecedores (tef_for_codigo,tef_telefone) values (6,'8432132656');

	  -- - inserir tb_tb_email_fornecedores ---
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (1,'eurofarma@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (2,'prizer@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (3,'kavo@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (3,'farmafhotmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (5,'hebarium@gmail.com');
insert into tb_email_fornecedores (emf_for_codigo,emf_email) values (6,'ibamed@yahoo.com');

	  -- - inserir tb_compras ---
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (1,'212','2009-01-01');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'87','2010-06-01');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'788','2011-03-02');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (2,'677','2012-04-02');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (5,'547','2007-03-03');
insert into tb_compras (com_for_codigo,com_nt_fiscal,com_data)	values (5,'567','2014-02-03');

	  -- - inserir tb_itenscom ---
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (1,1,1.5,1000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,3,1.7,500);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,2,12,500);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (2,1,61,5000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (5,3,46,8000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (5,1,2,2000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (1,5,144.22,7000);
insert into tb_itenscom (itc_pro_codigo,itc_com_codigo,itc_preco,itc_qtd)	values (8,5,123.2,1000);

/***** all rights reserved to Charlon Fernandes *****/