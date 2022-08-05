
-- Questão 1
select fil_titulo, gen_genero, cat_categoria from tb_filmes join tb_generos on gen_codigo = fil_gen_codigo join tb_categorias on cat_codigo = fil_cat_codigo
where fil_gen_codigo = 9 and fil_cat_codigo = 3;

-- Questão 2
select cop_codigo, fil_titulo from tb_copias join tb_filmes on cop_fil_codigo = fil_codigo order by fil_gen_codigo