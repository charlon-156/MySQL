-- INSERT INTO
use db_locadora;

insert into tb_generos (gen_genero) values
	('drama'),('ação'),('aventura'),('suspense'),('terror'),('documentário'),('ficção científica'),('histórico'),('comédia'),('romance');

insert into tb_conservacoes (con_conservacao) values
	('Novo'),('Arranhado'),('Inutilizado');

insert into tb_dependentes (dep_nome,dep_dtnasc) values
	('Carlinhos','2001-03-22'),
	('Pedro','2001-08-03'),
	('Marcos César','2001-12-21'),
	('Antonio Lúcio','2001-07-15'),
	('Mara','2001-08-09'),
	('Clarinha','2001-09-01'),
	('André','2001-01-08'),
	('José Lucas','2001-11-13'),
	('Pedro Augusto','2001-03-17'),
	('Lucas','2001-09-01'),
	('Paulinho','2001-02-13'),
	('Liara','2001-12-30'),
	('Isabel','2001-03-14'),
	('Tereza','2001-02-19'),
	('Maria Luiza','2001-03-02');

insert into tb_faixas (fai_faixa) values
	('Geral'),('+12 anos'),('+14 anos'),('+16 anos'),('+18 anos');

insert into tb_diretores (dir_diretor) values
	('Steven Spielberg'),('Quentin Tarantino'),('Woody Allen'),('Alfred Hitchcock'),('Clint Eastwood'),('Billy Wilder'),('Bernardo Bertolucci'),('François Truffaut'),('Tim Burton');

insert into tb_cidades (cid_cidade) values
	('Natal'),('Parnamirim'),('Estremoz'),('Macaíba'),('São Gonçalo do Amarante'),('Mossoró'),('Apodí'),('Pau dos Ferros');

insert into tb_cargos (car_cargo,car_salario) values
	('Vendedor',900),('Gerente',1299.99),('Supervisor',1000);

insert into tb_atores (ato_ator,ato_dtnasc) values
	('Nicolas Cage','1964-01-07'), ('Johnny Depp','1963-06-09'), ('Brad Pitt','1963-12-18'), ('Leonardo DiCaprio','1974-11-11'), ('Marlon Brando','1924-04-03'), ('Al Pacino','1940-04-25'), ('Morgan Freeman','1937-06-01'), ('Denzel Washington','1954-12-28'), ('Dustin Hoffman','1937-08-08'), ('Tom Hanks','1956-07-09'), ('Robin Williams','1951-07-21'), ('Bruce Willis','1955-03-19'), ('Samuel L. Jackson','1948-12-21'), ('John Travolta','1954-02-18'), ('George Clooney','1961-05-06'), ('Mel Gibson','1956-01-03'), ('Arnold Schwarzenegger','1947-07-30'), ('Harrison Ford','1942-07-13'), ('Keanu Reeves','1964-09-02'), ('Kate Winslet','1975-10-05'), ('Julia Roberts','1967-10-28'), ('Nicole Kidman','1967-06-20'), ('Sandra Bullock','1967-07-26'), ('Jodie Foster','1962-11-19'), ('Natalie Portman','1981-06-09');

insert into tb_tiposmidia (tip_tipo) values
	('DVD'),('VHS'),('Bluray');

insert into tb_categorias (cat_categoria,cat_preco) values
	('Catálogo',2),('Lançamento',3),('Super-lançamento',4.5);

insert into tb_bairros (bai_bairro,	bai_cid_codigo) values 
  ('Candelária',1),('Neópolis',1),('Tirol',1),('Ribeira',1),('Nova Parnamirim',2),('Lagoa Seca',1),('Emaús',2),('Nova Esperança',2),('Centro',3);

insert into tb_clientes 
	(cli_nome,				cli_cpf,		cli_dtnasc,		cli_logradouro,			cli_numero,	cli_bai_codigo,	cli_cep)
	values
	('Maria dos Santos', 	'01125374512', 	'1981-01-10', 	'Rua dos Angicos', 		'200', 		3, 				'55210-210'),
	('João Matos', 			'25125400400', 	'1953-11-29', 	'Av. Carlos Santos', 	'S/N', 		5, 				'52378-910'),
	('Ricardo Costa', 		'00121927955', 	'1988-03-04', 	'Av. Prudente de Morais','123', 	1, 				'59324-876'),
	('Diogo Augusto', 		'00121927955', 	'1976-02-07', 	'Rua Carlos Moura', 	'462', 		4, 				'59032-454'),
	('Cephas Melo da Silva','00121927955', 	'1989-01-14', 	'Rua Divina Cruz', 		'323', 		5, 				'59000-937'),
	('Diana Costa Silva',	'00121927955', 	'1998-09-19', 	'Rua Belo Monte', 		'23', 		2, 				'59434-859'),
	('Glória Maria Pereira','00121927955', 	'1983-11-02', 	'Rua Aeroporto Sul', 	'11', 		3, 				'59023-843'),
	('César Mario Gomes',	'00121927955', 	'1987-07-29', 	'Rua Mero Norte', 		'365', 		5, 				'59432-938'),
	('Mara Santana Praxedes','00121927955',	'1987-07-29', 	'Rua Galeão Sul', 		'663', 		2, 				'59675-456'),
	('Silvana Castro',		'00121927955', 	'1987-07-29', 	'Rua Augusto Pontes', 	'200', 		5, 				'59765-565'),
	('Ruth Ellen Borba',	'00121927955', 	'1987-07-29', 	'Av. Deodoro da Fonseca','2450', 	7, 				'59435-454');

insert into tb_teldoscli (tdc_telefone,tdc_cli_codigo) values
	('(84) 3432-3234',1),
	('(84) 2323-7678',1),
	('(84) 4344-8457',2),
	('(84) 4343-2726',2),
	('(84) 5455-7376',2),
	('(84) 6233-7747',3),
	('(84) 4444-7477',4),
	('(84) 4343-5252',4),
	('(84) 5555-8686',5),
	('(84) 2122-2423',6),
	('(84) 2123-3334',8),
	('(84) 3232-5555',8),
	('(84) 3233-7777',9),
	('(84) 3432-8888',9),
	('(85) 4344-9673',9),
	('(84) 3431-6456',10),
	('(84) 2313-2342',11),
	('(84) 4343-1568',11);

insert into tb_funcionarios (fun_car_codigo,fun_nome)
	values
	(1,'Hélio Gomes'),
	(1,'Raissa Bulhões'),
	(1,'Marcela Maria'),
	(2,'Claudia Abreu'),
	(1,'Mara Cereja'),
	(1,'Marcelo Claudio'),
	(3,'Lucinete Barreto');

insert into tb_locacoes 
	(loc_cli_codigo,loc_fun_codigo,	loc_datalocacao,loc_datadevolucao,	loc_preco)
	values
	(1,				1,				'2014-01-22',	'2014-01-26',		8.50),
	(2,				2,				'2014-02-02',	'2014-02-04',		5),
	(3,				2,				'2014-02-02',	'2014-02-04',		5),
	(3,				2,				'2014-02-03',	'2014-02-06',		8),
	(4,				1,				'2014-02-15',	'2014-02-17',		10),
	(6,				1,				'2014-02-16',	'2014-02-20',		15),
	(4,				2,				'2014-03-04',	'2014-03-06',		7),
	(1,				3,				'2014-03-04',	'2014-03-07',		20),
	(5,				2,				'2014-03-04',	'2014-03-07',		23),
	(6,				3,				'2014-03-05',	'2014-03-08',		22),
	(1,				3,				'2014-03-18',	'2014-03-19',		8),
	(2,				3,				'2014-03-19',	'2014-03-22',		10),
	(3,				2,				'2014-03-25',	'2014-03-28',		15),
	(6,				2,				'2014-04-01',	'2014-04-03',		10),
	(7,				4,				'2014-04-04',	'2014-04-06',		5),
	(8,				4,				'2014-04-04',	'2014-04-06',		9.50),
	(9,				5,				'2014-04-09',	'2014-04-14',		10),
	(11,			6,				'2014-04-11',	'2014-04-14',		20),
	(2,				2,				'2014-04-16',	'2014-04-18',		10),
	(7,				3,				'2014-04-19',	'2014-04-24',		5),
	(8,				1,				'2014-04-22',	'2014-04-27',		9.50);

insert into tb_depdoscli
	(ddc_dep_codigo,ddc_cli_codigo)
	values
	(1,1),(2,2),(3,3),(4,3),(5,4),(5,5),(5,2),(5,1),(6,5),(7,6),(7,3),(8,8),(9,10),(9,9),(9,1),(10,11),(13,6),(14,7),(15,2),(15,1),(15,9);

insert into tb_filmes
	(fil_fai_codigo,fil_gen_codigo,	fil_cat_codigo,	fil_ano,fil_duracao,fil_titulo,	fil_sinopse)
	values
	(1,				9,				1,				1921,	118,		'Charles Chaplin: The Collection','Os Ociosos The Idle Class/1921-25min Chaplin representa dois personagens conduzindo um delicioso caso de confusão de identidade. Um rico bêbado que despreza sua apaixonada esposa, e o Vagabundo que fantasia uma vida maravilhosa com ela. Dia de Pagamento Pay Day/1922/USA-26min Charles é um humilde operário confuso e preocupado com seu pagamento e o que fazer para escondê-lo de sua mulher. Nosso adorável vagabundo, numa comédia de erros, apronta a maior confusão, onde nada dá certo. Pastor de Almas The Pilgrim/1923/USA-47min Carlitos interpreta um fugitivo da prisão que rouba uma batina. Na fuga ele é confundido com um verdadeiro pastor. Grandes complicações surgem quando um ex-detento o encontra. Hilárias gags, quando tem que pregar como um pastor.'),
	(2,				9,				2,				2013,	92,		'Os Estagiários','Billy (Vince Vaughn) e Nick (Owen Wilson) são grandes amigos e trabalham juntos como vendedores de relógios. Eles são pegos de surpresa quando seu chefe (John Goodman) fecha a empresa, por acreditar que o negócio esteja ultrapassado. Com problemas financeiros, eles conseguem a inscrição em uma seleção de estágio no Google. Mesmo sem terem a garantia que serão contratados, eles partem para a sede da empresa e lá precisam lidar com a diferença de idade entre eles e os demais competidores.'),
	(4,				5,				3,				2013,	100,		'A Hora do Espanto 2','Quando o estudante Charlie vai ao exterior num programa de estudo na Romênia com seu amigo obcecado por terror, “Evil” Ed, e a ex-namorada Amy, ele logo descobre que sua jovem e atraente professora Gerri (Jaime Murray), é uma vampira na vida real. Pena que ninguém acredita nele. Na verdade, Evil Ed acha divertido e isso só alimenta sua obsessão por vampiros. Quando Gerri transforma Ed, Charlie procura Peter Vincent, o infame caçador de vampiros (bem, ele interpreta um num programa de TV), para ensiná-lo a acabar com a “demônia” antes que ela chegue a Amy, cujo sangue vai curar Gerri de passar a eternidade como uma vampira.'),
	(3,				1,				1,				1993,	195,		'A Lista de Schindler','A inusitada história de Oskar Schindler (Liam Neeson), um sujeito oportunista, sedutor, "armador", simpático, comerciante no mercado negro, mas, acima de tudo, um homem que se relacionava muito bem com o regime nazista, tanto que era membro do próprio Partido Nazista (o que não o impediu de ser preso algumas vezes, mas sempre o libertavam rapidamente, em razão dos seus contatos). No entanto, apesar dos seus defeitos, ele amava o ser humano e assim fez o impossível, a ponto de perder a sua fortuna mas conseguir salvar mais de mil judeus dos campos de concentração.'),
	(2,				10,				3,				2014,	125,		'A Culpa é das Estrelas','Diagnosticada com câncer, a adolescente Hazel Grace Lancaster (Shailene Woodley) se mantém viva graças a uma droga experimental. Após passar anos lutando com a doença, ela é forçada pelos pais a participar de um grupo de apoio cristão. Lá, conhece Augustus Waters (Ansel Elgort), um rapaz que também sofre com câncer. Os dois possuem visões muito diferentes de suas doenças: Hazel preocupa-se apenas com a dor que poderá causar aos outros, já Augustus sonha em deixar a sua própria marca no mundo. Apesar das diferenças, eles se apaixonam. Juntos, atravessam os principais conflitos da adolescência e do primeiro amor, enquanto lutam para se manter otimistas e fortes um para o outro.'),
	(2,				7,				3,				2012,	132,		'X-Men: Dias de um Futuro Esquecido','No futuro, os mutantes são caçados impiedosamente pelos Sentinelas, gigantescos robôs criados por Bolívar Trask (Peter Dinklage). Os poucos sobreviventes precisam viver escondidos, caso contrário serão também mortos. Entre eles estão o professor Charles Xavier (Patrick Stewart), Magneto (Ian McKellen), Tempestade (Halle Berry), Kitty Pryde (Ellen Page) e Wolverine (Hugh Jackman), que buscam um meio de evitar que os mutantes sejam aniquilados. O meio encontrado é enviar a consciência de Wolverine em uma viagem no tempo, rumo aos anos 1970. Lá ela ocupa o corpo do Wolverine da época, que procura os ainda jovens Xavier (James McAvoy) e Magneto (Michael Fassbender) para que, juntos, impeçam que este futuro trágico para os mutantes se torne realidade.'),
	(2,				2,				3,				2014,	128,		'Capitão América 2 - O Soldado Invernal','Dois anos após os acontecimentos em Nova York (Os Vingadores - The Avengers), Steve Rogers (Chris Evans) continua seu dedicado trabalho com a agência S.H.I.E.L.D. e também segue tentando se acostumar com o fato de que foi descongelado e acordou décadas depois de seu tempo. Em parceria com Natasha Romanoff (Scarlett Johansson), também conhecida como Viúva Negra, ele é obrigado a enfrentar um poderoso e misterioso inimigo chamado Soldado Invernal, que visita Washington e abala o dia a dia da S.H.I.E.L.D., ainda liderada por Nick Fury (Samuel L. Jackson).'),
	(1,				2,				1,				2002,	128,		'Homem-Aranha','Peter Parker (Tobey Maguire) é um jovem estudioso que vive com seus tios, Ben (Cliff Robertson) e May (Rosemary Harris), desde que seus pais faleceram. Inteligente e com um grande interesse pela ciência, Peter tem dificuldade em se relacionar com seus colegas, por ser tímido e por eles o considerarem um nerd. Até que, em uma demonstração científica, um acidente inesperado faz com que aranha modificada geneticamente pique Peter. A partir de então seu corpo é quimicamente alterado pela picada da aranha, fazendo com que Peter possa escalar paredes e tetos, emitir pelos punhos um fluido ultra-resistente semelhante à uma teia de aranha e passe a ter um "sentido de aranha", que o avisa sempre que há perigo por perto, além de superforça e visão ampliada. Inicialmente Peter pensa em usar seus novos poderes para ganhar dinheiro, adotando o nome de Homem-Aranha e se apresentando em lutas de exibição. Porém, ao permitir que um ladrão fuja por não considerar sua função capturá-lo, o fugitivo acaba assassinando seu tio Ben. A partir de então, Peter decide não mais usar seus poderes para proveito próprio e sim para enfrentar o mal, tendo como seu primeiro grande desafio enfrentar o psicótico Duende Verde (Willem Dafoe), que na verdade é o empresário Norman Osborn após ter sido exposto à um gás experimental que lhe deu uma segunda personalidade e grande força física.'),
	(1,				10,				1,				1999,	194,		'Titanic','Jack Dawson (Leonardo DiCaprio) é um jovem aventureiro que, na mesa de jogo, ganha uma passagem para a primeira viagem do transatlântico Titanic. Trata-se de um luxuoso e imponente navio, anunciado na época como inafundável, que parte para os Estados Unidos. Nele está também Rose DeWitt Bukater (Kate Winslet), a jovem noiva de Caledon Hockley (Billy Zane). Rose está descontente com sua vida, já que sente-se sufocada pelos costumes da elite e não ama Caledon. Entretanto, ela precisa se casar com ele para manter o bom nome da família, que está falida. Um dia, desesperada, Rose ameaça se atirar do Titanic, mas Jack consegue demovê-la da ideia. Pelo ato ele é convidado a jantar na primeira classe, onde começa a se tornar mais próximo de Rose. Logo eles se apaixonam, despertando a fúria de Caledon. A situação fica ainda mais complicada quando o Titanic se choca com um iceberg, provocando algo que ninguém imaginava ser possível: o naufrágio do navio.'),
	(1,				3,				2,				2006,	90,	 		'O Cavaleiro Didi e a Princesa Lili','Didi (Renato Aragão) é o cavalariço do rei Lindolfo (Werner Schünemann), monarca da Landnóvia, de quem é também amigo de infância e conselheiro. Esta situação não agrada aos ministros do reino, em especial a Jafar (Alexandre Zachia), irmão do rei. Didi é também bastante amigo da princesa Lili (Lívia Taranto Aragão), filha única dos reis Lindolfo e Valentina (Vera Holtz) e futura rainha. Jafar arma um plano para se livrar de Didi, que falha e termina por matar o rei. Com Lili na linha sucessória da monarquia, Jafar passa a planejar o casamento dela com seu filho Galante (Eike Duarte). Porém ela se conhece Juan (Matheus Massaafferri), um plebeu por quem se apaixona.'),
	(1,				7,				2,				2003,	200,		'O Senhor dos Anéis - O Retorno do Rei','Sauron planeja um grande ataque a Minas Tirith, capital de Gondor, o que faz com que Gandalf (Ian McKellen) e Pippin (Billy Boyd) partam para o local na intenção de ajudar a resistência. Um exército é reunido por Theoden (Bernard Hill) em Rohan, em mais uma tentativa de deter as forças de Sauron. Enquanto isso Frodo (Elijah Wood), Sam (Sean Astin) e Gollum (Andy Serkins) seguem sua viagem rumo à Montanha da Perdição, para destruir o Um Anel.'),
	(3,				1,				1,				1972,	175,		'O Poderoso Chefão','Don Vito Corleone (Marlon Brando) é o chefe de uma "família" de Nova York que está feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo). Porém, durante a festa, Bonasera (Salvatore Corsitto) é visto no escritório de Don Corleone pedindo "justiça", vingança na verdade contra membros de uma quadrilha, que espancaram barbaramente sua filha por ela ter se recusado a fazer sexo para preservar a honra. Vito discute, mas os argumentos de Bonasera o sensibilizam e ele promete que os homens, que maltrataram a filha de Bonasera não serão mortos, pois ela também não foi, mas serão severamente castigados. Vito porém deixa claro que ele pode chamar Bonasera algum dia para devolver o "favor". Do lado de fora, no meio da festa, está o terceiro filho de Vito, Michael (Al Pacino), um capitão da marinha muito decorado que há pouco voltou da 2ª Guerra Mundial. Universitário educado, sensível e perceptivo, ele quase não é notado pela maioria dos presentes, com exceção de uma namorada da faculdade, Kay Adams (Diane Keaton), que não tem descendência italiana mas que ele ama. Em contrapartida há alguém que é bem notado, Johnny Fontane (Al Martino), um cantor de baladas românticas que provoca gritos entre as jovens que beiram a histeria. Don Corleone já o tinha ajudado, quando Johnny ainda estava em começo de carreira e estava preso por um contrato com o líder de uma grande banda, mas a carreira de Johnny deslanchou e ele queria fazer uma carreira solo. Por ser seu padrinho Vito foi procurar o líder da banda e ofereceu 10 mil dólares para deixar Johnny sair, mas teve o pedido recusado. Assim, no dia seguinte Vito voltou acompanhado por Luca Brasi (Lenny Montana), um capanga, e após uma hora ele assinou a liberação por apenas mil dólares, mas havia um detalhe: nas "negociações" Luca colocou uma arma na cabeça do líder da banda. Agora, no meio da alegria da festa, Johnny quer falar algo sério com Vito, pois precisa conseguir o principal papel em um filme para levantar sua carreira, mas o chefe do estúdio, Jack Woltz (John Marley), nem pensa em contratá-lo. Nervoso, Johnny começa a chorar e Vito, irritado, o esbofeteia, mas promete que ele conseguirá o almejado papel. Enquanto a festa continua acontecendo, Don Corleone comunica a Tom Hagen (Robert Duvall), seu filho adotivo que atua como conselheiro, que Carlo terá um emprego mas nada muito importante, e que os "negócios" não devem ser discutidos na sua frente. Os verdadeiros problemas começam para Vito quando Sollozzo (Al Lettieri), um gângster que tem apoio de uma família rival, encabeçada por Phillip Tattaglia (Victor Rendina) e seu filho Bruno (Tony Giorgio). Sollozzo, em uma reunião com Vito, Sonny e outros, conta para a família que ele pretende estabelecer um grande esquema de vendas de narcóticos em Nova York, mas exige permissão e proteção política de Vito para agir. Don Corleone odeia esta idéia, pois está satisfeito em operar com jogo, mulheres e proteção, mas isto será apenas a ponta do iceberg de uma mortal luta entre as "famílias".'),
	(1,				3,				2,				2011,	130,		'Harry Potter e as Relíquias da Morte - Parte 2','Harry Potter (Daniel Radcliffe) e seus amigos Rony Weasley (Rupert Grint) e Hermione Granger (Emma Watson) seguem à procura das horcruxes. O objetivo do trio é encontrá-las e, em seguida, destruí-las, de forma a eliminar lorde Voldemort (Ralph Fiennes) de uma vez por todas. Com a ajuda do duende Grampo (Warwick Davis), eles entram no banco Gringotes de forma a invadir o cofre de Bellatrix Lestrange (Helena Bonham Carter). De lá retornam ao castelo de Hogwarts, onde precisam encontrar mais uma horcrux. Paralelamente, Voldemort prepara o ataque definitivo ao castelo.'),
	(3,				9,				2,				2012,	112,		'Intocáveis','Philippe (François Cluzet) é um aristocrata rico que, após sofrer um grave acidente, fica tetraplégico. Precisando de um assistente, ele decide contratar Driss (Omar Sy), um jovem problemático que não tem a menor experiência em cuidar de pessoas no seu estado. Aos poucos ele aprende a função, apesar das diversas gafes que comete. Philippe, por sua vez, se afeiçoa cada vez mais a Driss por ele não tratá-lo como um pobre coitado. Aos poucos a amizade entre eles se estabele, com cada um conhecendo melhor o mundo do outro.'),
	(1,				1,				1,				1994,	140,		'Forrest Gump - O Contador de Histórias','Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.'),
	(3,				2,				3,				2013,	130,		'Velozes & Furiosos 6','Desde que o golpe de Dom (Vin Diesel) e Brian (Paul Walker) no Rio de Janeiro deixou o grupo com US$100 milhões, os heróis se espalharam pelo globo. Mas a incapacidade de voltar para casa e viver em um lar tornou suas vidas incompletas. Enquanto isso, Jobbs (Dwayne Johnson) esteve perseguindo uma organização de mercenários sobre rodas, um grupo de homens cruéis divididos em 12 países, cujo mentor (Luke Evans) tem ajuda da destemida Letty (Michelle Rodriguez), a antiga namorada de Dom, que ele acreditava estar morta. A única maneira de parar este grupo de criminosos é superá-los nas ruas, por isso Hobbs pede a Dom para reunir um grupo de elite em Londres. A recompensa? Perdão a todos eles, para poderem voltar para as suas casas e tornarem suas famílias completas novamente.'),
	(1,				7,				3,				2014,	97,		'Malévola','Baseado no conto da Bela Adormecida, o filme conta a história de Malévola (Angelina Jolie), a protetora do reino dos Moors. Desde pequena, esta garota com chifres e asas mantém a paz entre dois reinos diferentes, até se apaixonar pelo garoto Stefan (Sharlto Copley). Os dois iniciam um romance, mas Stefan tem a ambição de se tornar líder do reino vizinho, e abandona Malévola para conquistar seus planos. A garota torna-se uma mulher vingativa e amarga, que decide amaldiçoar a filha recém-nascida de Stefan, Aurora (Elle Fanning). Aos poucos, no entanto, Malévola começa a desenvolver sentimentos de amizade em relação à jovem e pura Aurora.'),
	(1,				1,				1,				2014,	90,		'Um Sonho de Liberdade','Em 1946, Andy Dufresne (Tim Robbins), um jovem e bem sucedido banqueiro, tem a sua vida radicalmente modificada ao ser condenado por um crime que nunca cometeu, o homicídio de sua esposa e do amante dela. Ele é mandado para uma prisão que é o pesadelo de qualquer detento, a Penitenciária Estadual de Shawshank, no Maine. Lá ele irá cumprir a pena perpétua. Andy logo será apresentado a Warden Norton (Bob Gunton), o corrupto e cruel agente penitenciário, que usa a Bíblia como arma de controle e ao Capitão Byron Hadley (Clancy Brown) que trata os internos como animais. Andy faz amizade com Ellis Boyd Redding (Morgan Freeman), um prisioneiro que cumpre pena há 20 anos e controla o mercado negro da instituição.'),
	(1,				6,				3,				2014,	117,		'Woody Allen - Um Documentário','Documentário sobre Woody Allen que aborda vários momentos da carreira do cineasta e conta com depoimentos de importantes nomes da sétima arte. Antonio Banderas, Josh Brolin, Penélope Cruz, John Cusack, Larry David e Scarlett Johansson são alguns dos nomes que dão entrevistas falando sobre Allen. '),
	(1,				6,				1,				2010,	90,			'Senna','Junho de 1984, GP de Mônaco de Fórmula 1. Seis atuais ou futuros campeões mundiais estavam na pista, mas as atenções ficaram voltadas para um jovem que largara em 13º lugar e estava apenas em sua sexta corrida. Ultrapassando um a um, ele alcançou seu primeiro pódio e apenas não venceu devido a uma questão técnica. Seu nome era Ayrton Senna. A trajetória do tricampeão mundial, contada desde a ascensão no automobilismo até sua morte em pleno GP de San Marino, em 1994, passando pela rivalidade com Alain Prost e os problemas enfrentados nos bastidores da Fórmula 1.'),
	(3,				1,				2,				2006,	123,		'Rush - No Limite da Emoção','Anos 1970. O mundo sexy e glamouroso da Fórmula 1 é mobilizado principalmente pela rivalidade existente entre os pilotos Niki Lauda (Daniel Brühl) e James Hunt (Chris Hemsworth). Eles possuíam características bem distintas: enquanto Lauda era metódico e brilhante, Hunt adotava um estilo mais despojado, típico de um playboy. A disputa entre os dois chegou ao seu auge em 1976, quando ambos correram vários riscos dentro do cockpit para que pudessem se sagrar campeão mundial de Fórmula 1.');

insert into tb_copias 
	(cop_fil_codigo,cop_tip_codigo,	cop_con_codigo,	cop_qtd_midia)
	values
(1,1,1,1),(1,2,1,1),(1,2,1,1),(1,2,2,1),(2,1,1,1),(2,1,1,1),(2,1,3,1),(2,1,2,1),(3,1,1,1),(3,3,1,1),(4,1,1,1),(4,1,1,1),(4,1,1,1),(4,2,1,1),(5,1,2,1),(5,1,1,1),(5,3,1,1),(5,3,1,1),(6,1,1,1),(7,1,2,1),(7,1,1,1),(8,1,1,1),(9,1,3,1),(10,1,1,1),(11,1,2,2),(11,1,1,2),(12,2,1,2),(12,2,1,2),(13,1,2,1),(13,1,1,1),(14,1,2,1),(14,1,1,1),(15,1,1,1),(15,1,1,1),(16,1,1,1),(16,1,1,1),(16,3,1,1),(17,1,2,1),(17,1,1,1),(17,3,1,1),(18,1,3,1),(18,3,1,1),(19,1,2,1),(19,1,1,1),(19,3,1,1),(20,1,1,1),(20,1,1,1),(20,1,2,1),(21,1,1,1),(21,1,1,1);

insert into tb_copias_das_locacoes
	(cdl_loc_codigo,cdl_cop_codigo)
	values
(1,23),(1,25),(2,11),(2,12),(2,25),(2,44),(3,33),(3,29),(4,28),(4,33),(5,05),(6,20),(6,2),(6,1),(7,19),(8,23),(9,32),(10,43),(11,49),(11,23),(11,45),(12,35),(13,34),(13,11),(13,15),(14,35),(14,17),(14,16),(15,14),(15,11),(15,27),(15,39),(16,28),(16,40),(16,20),(17,23),(17,13),(17,12),(18,08),(18,03),(18,23),(19,43),(19,49),(19,20),(19,10),(20,38),(20,31),(21,23);

insert into tb_atoresfilmes (adf_fil_codigo,adf_ato_codigo) values
(01,24),(01,21),(01,22),(01,15),(01,16),(02,12),(02,11),(02,08),(03,02),(03,01),(03,04),(04,05),(04,20),(04,11),(04,15),(04,19),(05,09),(05,04),(06,01),(06,10),(06,25),(07,02),(07,06),(08,03),(09,08),(09,07),(09,01),(10,02),(11,08),(11,07),(11,09),(11,21),(12,17),(12,22),(12,08),(13,24),(13,15),(14,11),(14,18),(14,24),(15,13),(16,25),(16,21),(16,12),(17,08),(17,15),(18,04),(18,09),(18,17),(18,16),(18,11),(19,09),(19,20),(19,04),(19,18),(19,25),(20,18),(20,01),(20,22),(20,04),(21,19),(21,09),(21,23);

insert into tb_diretoresfilmes
	(ddf_fil_codigo,ddf_dir_codigo)
	values	
(01,08),(02,09),(03,04),(04,09),(05,02),(06,06),(06,01),(07,01),(08,03),(09,05),(10,08),(11,04),(12,06),(12,02),(13,09),(14,05),(15,06),(16,08),(17,01),(18,09),(19,03),(19,09),(20,09),(21,02);