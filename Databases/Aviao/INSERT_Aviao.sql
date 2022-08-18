-- |------------------------------------------------------ 
-- | Desenvolvido por Charlon F. Monteiro
-- |------------------------------------------------------


-- |------------------------------------------------------ 
-- |Comandos DML(de inserção) do Banco de Dados do Aeroporto C
-- |------------------------------------------------------

-- | Insert's
insert into tb_avioes (avi_nome, avi_datacompra, avi_datacompra) values ('Boing GGG', '2006-07-20', 12300);
insert into tb_avioes (avi_nome, avi_datacompra, avi_datacompra) values ('Jumbo 456', '2006-04-01', 1300);
insert into tb_avioes (avi_nome, avi_datacompra, avi_datacompra) values ('Tucano SS', '2013-02-28', 12651);
insert into tb_avioes (avi_nome, avi_datacompra, avi_datacompra) values ('Pardon 22', '2010-10-10', 1000);

insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Jefferson Aron', 9500, '1987-08-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Pedro Paulo', 2500, '1990-02-27');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Arnon Amarante', 3300, '1977-11-11');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Bertollini Bel', 17700, '1991-08-30');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Marcos Mel', 19500, '1979-12-20');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Caio Xavier', 8050, '1980-08-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Zalberto Zambelli', 6330, '1992-03-20');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Juliano-Jean', 500, '1976-10-13');
insert into tb_pilotos (pil_nome, pil_horasvoo, pil_datanasc) values ('Luaciano Vaz', 9500, '1972-01-31');

insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (1, 1, '2019-02-20 12:00:00', '2019-02-20 14:00:00', 'Caicó', 'Natal');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (3, 4, '2019-04-01 04:40:00', '2019-04-01 14:55:00', 'Natal', 'São Paulo');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (2, 2, '2020-07-14 13:00:00', '2020-07-15 04:27:00', 'Natal', 'Nova York');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (4, 8, '2020-08-20 15:00:00', '2020-08-20 14:00:00', 'Mossoró', 'Caicó');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (2, 2, '2020-07-14 13:00:00', '2020-07-15 04:27:00', 'Natal', 'Nova York');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (4, 5, '2021-08-20 15:00:00', '2020-08-20 15:55:00', 'Mossoró', 'Caicó');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (2, 3, '2021-07-14 13:00:00', '2020-07-15 23:15:00', 'São Paulo', 'Natal');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (4, 7, '2022-08-20 15:00:00', '2020-08-20 14:00:00', 'Caicó', 'Jucurutu');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (2, 9, '2022-07-14 13:00:00', '2020-07-15 04:27:00', 'Caicó', 'Mossoró');
insert into tb_voos (voo_avi_codigo, voo_pil_codigo, voo_datachegada, voo_datachegada, voo_localsaida, voo_localchegada) values (4, 6, '2022-08-20 15:00:00', '2020-08-20 14:00:00', 'Jucurutu', 'Mossoró');

-- insert into tb_clientes (cli_nome, cli_datanasc, cli_documento) values ('Charlon Fernandes', '2001-11-11', 'identidade')

