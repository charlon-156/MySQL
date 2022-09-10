-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- | Comandos DML(de mudança) do Banco de Dados da Locadora
-- |------------------------------------------------------

use db_locadora;

-- |----------------------Questão 01----------------------
-- |Filmes que foram lançados a mais de 10 anos atrás devem ser colocados no catálogo.
-- |Entre 6 e 3 anos, serão lançamento. E nos últimos 3 anos são super-lançamento.
-- |------------------------------------------------------

update tb_filmes set fil_cat_codigo = 1 where fil_ano > 2012;
update tb_filmes set fil_cat_codigo = 2 where fil_ano between 2019 and 2016;
update tb_filmes set fil_cat_codigo = 3 where fil_ano < 2019;



-- |----------------------Questão 02----------------------
-- |Mescle os gêneros de ação e aventura, formando um só. (crie um novo gênero chamado Ação e Aventura,
-- |e dê update para tirar os filmes do gênero anterior e mover para o novo. Por fim, exclua os dois antigos)
-- |------------------------------------------------------

insert into tb_generos (gen_genero) values ('Ação e Aventura');
update tb_filmes set fil_gen_codigo = 11 where fil_gen_codigo in (2, 3);
delete from tb_generos where gen_codigo in (2, 3);



-- |----------------------Questão 03----------------------
-- |Mude todos as cópias do tipo DVD ou Bluray que estejam arranhadas para inutilizadas
-- |------------------------------------------------------

update tb_copias set cop_con_codigo = 3 where (cop_tip_codigo = 1 or cop_tip_codigo = 3) and cop_con_codigo = 2;



-- |----------------------Questão 04----------------------
-- |O cliente Cephas Silva deseja cancelar sua conta, e deixar tudo em nome da sua esposa Diana Silva. 
-- |Transfira o histórico e todas as dependências, e depois exclua o cliente Cephas.
-- |------------------------------------------------------ 

update tb_depdoscli set ddc_cli_codigo = 6 where ddc_cli_codigo = 5;
update tb_teldoscli set tdc_cli_codigo = 6 where tdc_cli_codigo = 5;
update tb_locacoes set loc_cli_codigo = 6 where loc_cli_codigo = 5;
delete from tb_clientes where cli_codigo = 5;



-- |----------------------Questão 05----------------------
-- |Reapraze as devoluções que ocorreriam depois de 22/04/2021 para segunda-feira
-- |------------------------------------------------------

update tb_locacoes set loc_datadevolucao = 2021-04-26 where loc_datalocacao between 2021-04-22 and 2021-04-25;



-- |----------------------Questão 06----------------------
-- |Descubra se existe alguma cidade sem bairros. Se houver, exclua esta cidade.
-- |------------------------------------------------------

	-- Select para descobrir cid_codigo que não possui bairros

	select bai_bairro, cid_cidade, cid_codigo
	from tb_bairros right join tb_cidades on bai_cid_codigo = cid_codigo;

delete from tb_cidades where cid_codigo between 4 and 8;



-- |----------------------Questão 07----------------------
-- |Descubra manualmente se existem dependentes que não são dependentes de nenhum cliente. Se houver, exclua-os.
-- |------------------------------------------------------

	/* Select para descobrir quais dependentes não possuem responsavel*/
	select dep_nome, dep_codigo, ddc_cli_codigo from tb_dependentes
    left join tb_depdoscli on dep_codigo = ddc_dep_codigo
	left join tb_clientes on ddc_cli_codigo = cli_codigo order by dep_codigo;

delete from tb_dependentes where dep_codigo in (11, 12);

/***** all rights reserved to Charlon Fernandes *****/