# Comandos

Página com resumos bem básicos de Banco de Dados, esse arquivo tem o objetivo de enriquecer a comunidade e resumir conceitos básicos do SQL

## Sumário 

- [Comandos](#comandos)
	- [Criar e apagar Banco de Dados e Tabelas](#criar-database-e-tabelas)
		- [Chave Estrangeira](#chave-estrangeira)
		- [Modificadores de Atributo](#modificadores-de-atributo)
		- [Deletar](#deletar)
	- [Inserindo valores](#inserindo-valores)
	- [Modificando tabelas](#modificando-tabelas)
		- [Adicionando novas colunas](#adicionando-novas-colunas)
		- [Deletando colunas](#deletando-colunas)
		- [Modificando colunas](#modificando-colunas)
		- [Coluna Calculada](#coluna-calculada)
	- [Manipular linhas](#manipular-linhas)
		- [Update](#update)
		- [Delete](#delete)
	- [Select](#select)
		- [Sintaxe Básica](#sintaxe-básica)
	- [Select com Números](#select-com-números)
		- [Select com palavras](#select-com-palavras)
		- [Select com ações de agregação](#select-com-ações-de-agregação)
		- [Agrupando valores](#agrupando-valores)
	- [Relacionamento entre Tabelas](#relacionamento-entre-tabelas)
		- [From](#from)
		- [Join](#join)
		- [Left e Right Join](#left-e-right-join)
	- [Consultas SQL](#consultas-sql)
		- [Subconsulta Simples](#subconsulta-simples)
		- [Subconsulta correlacionais](#subconsulta-correlacionais)
	- [Views](#views)
	- [Rotinas](#rotinas)
		- [Variáveis](#variáveis)
		- [Função](#função)
		- [Procedimentos](#procedimentos)
		- [Blocos - BEGIN \& END](#blocos---begin--end)
		- [Parâmetros de Procedimentos](#parâmetros-de-procedimentos)
	- [Estruturas lógicas](#estruturas-lógicas)
		- [Estrutura condicional](#estrutura-condicional)
	- [Triggers](#triggers)
		- [Before ou After](#before-ou-after)
			- [Casos de After](#casos-de-after)
			- [Casos de Before](#casos-de-before)
		- [Devolvendo mensagens de erro](#devolvendo-mensagens-de-erro)
		- [A complexidade dos gatilhos](#a-complexidade-dos-gatilhos)
	-[Transações](#transações-em-mysql)
	- [References](#references)

## Criar DataBase e Tabelas

Primeiro de tudo deve-se criar o **`database`**, porém eu já fiz alguns comandos para que os dados do tipo literal possam receber acentuação. O padrão utf-8 — aceito mundialmente — ele aceita basicamente todo tipo de acentuação das línguas latino-americanas.

```sql
create database hospital
default character set utf8
default collate utf8_general_ci;
```

Agora vamos criar uma tabela dentro do nosso Banco de Dados: ```create table tb_pacientes();```

Dentro do parênteses deve ser adicionado o **nome** e o **tipo da variável**. Tudo isso separado por vírgulas, como vemos em `nascimento date` nascimento é *nome* da variável e *`date`* é o tipo. E por fim, e mais importante, `primary key()` : id agora é uma chave primária única, não existe outra linha na tabela como o mesmo valor na coluna id.
depois do table coloca-se `default charset utf8`:

```sql
create table tb_pacientes (
nome varchar(30) not null,
id int auto_increment,
nascimento date,
origem default 'Brasileiro'
primary key(id)
) default charset utf8;
```
### Chave Estrangeira 

Durante a [modelagem](Modelagem.md) observem que eu falei sobre o relacionamento entre mais de uma tabela. Isso desdobrou em diversas regras como [1:N](Modelagem.md#regra-1n) e [N:N](Modelagem.md#regra-nn). Isso vai gerar as chamadas `foreign key` — não me aprofundarei na utilidade desse atributo. Entretanto, vou mostrar a sintaxe básica da criação de um atributo estrageiro. Para isso:

1. A tabela de onde ela originiza deve já ter sido criada;
2. O atributo tem que ser criado com um normal;
3. Atribuição de referência estrageira.

Pode está um pouco abstrato, mas veja essa tabela simploria de livros. A tabela livro tem os atributos simples: código, nome e ISBN; e um atributo estrangeiro vindo da tabela categoria. Na nova tabela o atributo estrangeiro tem que ser do mesmo tipo. Agora sobre a atribuição de seu status. Para isso, escreve-se o seguinte:

```sql 
	foreign key /*atributo estrangeiro*/ references /* nomeDaTabela(chave primária)*/
```

Agora, verifique o código completo, com os creates e tudo mais:

```sql
	create table tb_categorias (
		cat_codigo int,
		cat_categoria varchar(45),
		primary key(cat_codigo)
	);

	create table tb_livros (
		liv_codigo int, 
		liv_nome varchar(50) not null,
		liv_isbn int,
		liv_cat_codigo int,
		foreign key (liv_cat_codigo) references tb_categorias(cat_codigo)
	);
```

### Modificadores de Atributo

1. `not null` - faz com que aquele atributo não seja criado nulo.
2. `default` - é para casos em que o tipo não é informado, se por acaso alguém não informar sua nacionalidade, ela por padrão será “Brasileiro.
3. `auto_increment` - em casos de valores com números ele vai sempre aumentando o valor.
4. `unique` - esse garante que não vai existir valores repetidos.
5. `unsigned` esse ignora o sinal; utilize pois reduz os bytes. 


### Deletar

Para apagar um tabela ou o próprio banco de dados (não recomendo) é o comando **DROP**. Para utilizar  basta informar o que se deseja apagar (***table, database, function...***) e em seguida o seu nome. 

```sql
drop table tb_livros;
```

Um dica adicional PARA QUEM ESTÁ DESENVOLVENDO um Banco de Dados do 0. Geralmente, você cria, modifica e testa várias e várias vezes, e para ajudar no desenvolver uma boa prática é no início do *Script* deixa uma teste condicional para deleter o Banco de Dados e já subi-lo com as modificações. Veja o exemplo:

```sql
drop database if exists db_aula;

create database db_aula
default character set utf8mb4;

USE db_aula;

-- [restante dos Comandos DDL...]
```

Dessa forma, você pode executar o Script repetitamente, sempre que uma modificação for feita e agilizar os procedimentos de teste. Pois, primeiramente verifica se o Banco de Dados existe, e caso for, delete-o. E logo 

> ⚠️ Não utilize esses comandos em Banco de Dados ativos, *dropar* uma tabela, ou banco de dados impacta sobre um apagão total de todos os dados.

## Inserindo valores

Temos duas maneiras de adicionar os dados em uma tabela: 

```sql
insert into tb_pacientes values
('Chico', default, '1987-02-11', 'Alemão'),
('Antonia', '2','1990-10-29', default);
```

O default já foi explicado anteriormente; o default no primeiro caso como a variável tem auto incremento não é necessário fazer a atribuição, ele pode ser deixado e no caso de origem, sempre que deixado em branco, vai ser default.

```sql
insert into tb_pacientes
(nome, id, nascimento, nacionalidade) values
('Chico', default, '1987-02-11', 'Alemão'),
('Antonia', '2','1990-10-29', default);
```

## Modificando tabelas

Nem tudo é só CREATE, temos outros tipos de comando DDL - Por exemplo, crei uma tabela, porém esqueci alguns dados ou atributos no formato do *Database* — Não há necessidade de dropar tudo e recomeçar, basta fazer mudanças na tal tabela previamente criada. Acompanhe alguns comandos para fazer tais ações.

SINTAXE 🖊️ —  ALTER TABLE (nome da tabela)

###  Adicionando novas colunas
 - ADD -> Adiciona uma nova coluna

```sql
alter table tb_pacientes 
add sexo enum('M', 'F');
```

desse modo, a coluna sexo será adicionada no final da tabela. Temos duas variantes nessas opções para adicionar, colocar após uma coluna específica ou ser a primeira coluna

```sql
	add sexo enum('M','F') after nome;
	add sexo enum('M','F') first;
```

### Deletando colunas

- DROP -> Deleta uma coluna
Agora, vamos eliminar a coluna sexo na tabela tb_pacientes:

```sql
alter table tb_pacientes
drop sexo;
```

### Modificando colunas

Por fim, vamos modificar a constrag ou o tipo do atributo

```sql
alter table tb_paciente
modify sexo varchar(1) default 'M';
```

Agora, por obséquio, vamos mudar a coluna por inteiro

```sql
alter table paciente
change sexo sex varchar(1);

```

### Coluna Calculada

Muitas vezes os banco de dados vão possuir colunas que não serão inseridas nos `insert`, mas sim são frutos de outras colunas. Para ciência de dados o melhor a se armazenar é a data de nascimento, entretanto podemos ter um campo calculado para armazenar a idade, mas a idade é calculado pela data de nascimento. Outro exemplo, o preço final e o preço do produto são diferentes. O produto final é aquele que já se atribuiu desconto sobre o  preço do produto e vai ser pago na boca do caixa. Esse valor a ser pago pode ser calculado por um campo calculado veja o exemplo:

```sql
create table tb_produtos (
	pro_codigo int primary key auto_increment,
    pro_nome varchar(45),
    pro_preco decimal, 
    pro_precofinal decimal as (pro_preco * 0.98) stored
    );
```

Quando é campo calculado deve-se explicar a formula que o atribuí depois do `as` e tem que se especificar se a coluna é stored ou virtual. 

1. **Virtual** - Não é armazenado dentro do banco de dados e o campo é calculado automaticamente quando chamado.
    1. **Prós:** Não ocupa espaço dentro do banco de dados deixando ele mais leve;
    2. **Contra:** Como não é armazenado, o valor é calculado na hora, então o retorno pode demorar.
2. **Stored** - Como um atributo comum é armazenado dentro do banco de dados.
    1. **Prós:** Como ele já é guardado dentro do banco não há demora para retorna-lo.
    2. **Contras:** Ocupa espaço do banco de dados, espaço que pode ser inútil.

## Manipular linhas

Manipular linhas é ação de se relacionar com os dados existente 

O **WHERE** é uma parte MUITO importante. É muito perigoso DELETE's e UPDATE's sem esse comando, pois TODAS as linhas serão atualizadas; Então, em nenhuma hipótese, execute delete ou update sem um where bem escrito.

### Update

Para darmos início nas manipulações vamos modificar o nome de uma linha em específico, de preferência, escolhemos a chave primária para a acessar uma parte específica. A sintaxe é o seguinte: 

1. ```UPDATE``` (tabela que vai ser modificada) 
2. ```SET``` (valor para ser modificado) = (novo valor)
3. ```WHERE``` (identificador da(s) linha(s))
 
```sql
update cursos 
set nome = 'HTML5'
where idcurso '1';
```

Lembre-se mais de uma coluna pode ser modificada por tabela. Veja o exemplo a seguir:

```sql
update cursos
set nome='PHP', ano='2015' 
where idcurso='4';
```

### Delete

As vezes em seu banco de dados há a necessidade de deletar um dado. O que ocorre com a maioria dos devers são linhas que não são deletadas — isso acontece porque aquela linha deve ter chave estrangeira, ou seja, delete suas relações nas tabelas em que ele possui dependência. Se liga no fio :thread:

1. ```DELETE FROM``` (Tabela que dado será deletado)
2. ```WHERE``` (identificador da(s) linha(s))

```
delete from cursos
where idcurso='8';
```

Esse de todos é o mais punk — ```truncate``` — DELETA TODOS OS DADOS da tabela

```
truncate cursos;
```

## Select

Na área de Ciência de Dados, o select tem papel fundamental; Ações empresariais de muitíssima importância só são feitas depois dos respaldos de dúvidas como essas: quantos clientes são de tal bairro e qual a faixa etária? Que mês a rentabilidade foi maior? E até dúvidas simples como: Tem mais João ou Maria como clientes? Tudo isso é fruto de selects

### Sintaxe Básica

Primeiramente, vamos mostrar todos os dados de uma tabela! Agora nosso objetivo é mostrar TODOS os dados, para não ter que escrever todos os atributos usa-se o atalho '*' (asterisco) para simbolizar a totalidade de informações de uma tabela.

1. ```SELECT``` (dados que serão mostrados) 
2. ```FROM``` (tabela que será mostrada)
3. ```WHERE```(condição dos dados que serão mostrados)

```sql
select * from table
select nome from table
select nome, sexo from table
```

Olha, o ***Alias(AS)*** é um modificador para renomear as colunas, um fato bastante importante é que o **AS**, o apelido temporario da coluna, deve está entre aspas simples, caso seja um nome simples como 'nome', 'valor' e etc. vai funcionar, entretanto caso você deseja colocar *'Valor total de compra'* dará errado se você não adicionar as aspas:

```sql
select cli_nome as 'Nome do Cliente' from tb_clientes;
```

Uma curiosidade, caso queira juntar duas tabelas, existe um mecanismo usando esses principios para selecionar dados. Isso seria uma introdução a fusão de duas tabelas, para saber mais desça até [JOIN](#join)

```sql
select cli_nome, bai_bairro from tb_clientes, tb_bairros where cli_bai_codigo = bai_codigo
```

## Select com Números

Certamente em seu Banco de Dados vai haver diversas informações em tipo numérico, com isso, restrições para a seleção de dados mais cirúrgico. Com isso uma sequência de informações podem ser filtradas. A sintaxe padrão continua a mesma, select ... from ... MAS devemos inserir o velho termo chamado `WHERE`

-- as instâncias que foram verdadeiras serão "selecionados"

1. *igual que* (=) — vai verificar se tal atributo(ano) é igual ao valor informado(2016) 
2. *menor que & menor igual que* (< & <=) — vai verificar se tal atributo(ano) é menor que valor informado(2016) 
3. *diferente* (<>) — vai verificar se tal atributo(ano) é diferente ao valor informado(2016)
4. *entre* (between x and y) — vai verificar se tal atributo(ano) está entre x e y
5. *em* (in) — o select vai procurar as instâncias que possuem o valor informado dentro do parênteses
6. *e* (and) — o "and" vai garantir que as duas ou mais informações são válidas.
7. *ou* (or) — o "ou" vai mostrar as instâncias que **pelo menos uma** das ações será verdadeira

```sql
where ano = 2016
where ano <= 2016
where ano <> 2016
where ano between 2010 and 2016
where ano in (2010,2012,2016)
where ano = 2016 and carga >30
where ano = 2016 or carga > 30
```

### Select com palavras

Vez ou outro necessitamos de consultar dados que são um cadeia lógica de caracteres a qual o ser humano denominou de *"Palavras"*(String), porém, consultar esses dados não é do mesmo modo que se consulta números. Acompanhe-me nessa explicação descomplicada!

```where *coluna* like (condição)```

A consulta depois do like é rigorosa. Se você deseja encontrar todos Marcos e o sexo Masculino são diferentes. Se você escreve 'm' - o select vai retornar apenas as instâncias que SÃO APENAS 'm'. Quando estiver buscando algo específico, escreve apenas exatamente a *string*. Mas se quiser todos os Silva deve-se usar a simbologia do **%**

> % e _ na busca por palavras SQL
>
> O porcentagem significa que existe pode existir mais caracteres depois ou apenas o vazio depois
> Já **_** significa que obrigatoriamente vai existir pelo menos um caracter 

1. ``` nome like Pedro%``` - Esse comando vai buscar todos os que começam com Pedro ou que são somente 'Pedro'
2. ``` nome like %Silva_``` - Esse comando vai buscar todos os que em qualquer lugar tenha Silva e outro caracter, ou seja, Silvana será selecionada e 'Thiago Silva' não será.

```sql
where sexo like 'M'
where nome like 'P%'
where nome like '%a'
where nome not like '%a%'
where nome not like 'ph%p_'
```

### Select com ações de agregação

Às vezes, temos a obrigação de conhecer certos dados como média da carga horária dos cursos, produto mais barato ou mais caro... Vejamos como tais ações podem ser feitas. Essas funções, naturalmente, retornam apenas uma linha, pois como que eu vou retornas dois máximos ou duas médias? 

| **Comando**|**Função**|
|:----------:|:--------:|
|  *COUNT*   | Contagem |
|   *SUM*    |   Soma   |
|   *MAX*    |  Máximo  |
|   *MIN*    |  Mínimo  | 
|   *AVG*    |  Média   |

* Count - Contagem, caso seja preciso descobrir quantos clientes estão cadastrados. Veja: 
	```select count(nome) from tb_clientes;```

* Sum - Soma, somando valores, como idade ou valores monetários. Acompanhe este bizu... 
	```select sum(idade) from tb_clientes;```

* Max - Máximo, Qual é o produto mais caro? Digite este comando
	```select max(preco) from tb_produtos;```

* Min - Mínimo, o inverso também funciona. Pegue o menor valor 
```select min(preco) from tb_produtos;```

* Avg - Média, que saber quanto é a média da idade dos seus clientes?  Se liga aqui
	```select avg(idade) from tb_clientes;```

Agora vou falar do **`ORDER BY`**. Essa parte pode ser implementada no select, sua função é organizar os dados mostrados, se colocarmos ORDER BY `id` os resultados serão mostrado em sequência, do id = 1 até id = n
Se agrupar por nome, vai retornar a pesquisa em ordem alfabética. Porém, se você quiser começar do Z? basta adicionar depois o termo `desc`.
Lembrando, mais de um termo de organização pode ser considerado, para isso basta adicionar uma vírgula.

```sql
order by nome;
order by nome desc, ano;
```
No primeiro comando está organizando por ordem alfabética, e o segundo pela mesma ordem só que invertida além disso considerando o ano.

### Agrupando valores

Alguns dados podem ser analisados em grupos, por exemplo, quantos clientes são de cada estado? A média de idade das mulheres e dos homens? Essas subdivisões de dados são muito úteis para a formação de comandos bem específicos. 
[As funções de agregação](#select-com-ações-de-agregação) podem ser combinadas com grupos, quando não se usa o termo ```group by``` os métodos (sum, max, count...) ,por padrão, retornam apenas uma linha. Mas associado a subdivisão por grupo, cada um ira retorna uma linha. 

```sql
	select cli_uf, count(cli_clientes) from tb_clientes 
```

Nesse primeiro comando, apenas uma linha com a quantidade total de clientes de TODOS os estados será retornado. Mas se eu quisesse o resultado da soma de cada um dos 27 estados em apenas um comando? basta adicionar o termo ```group by``` e o atributo que vai ser agrupado, no exemplo abaixo vamos agrupar pelo nome do estado:

```sql
	select cli_uf, count(cli_clientes) from tb_clientes 
	group by uf;
```

Da forma escrita acima, o retorno de dados serão mostrados nas divisões estaduais, ou seja quantos clientes possuem em cada um dos 27 estado da federação. 

**Agrupando mais de uma coluna** - É possível agrupar mais de uma coluna no GROUP BY, inclusive com operações de agregação diferentes, como mostra o exemplo abaixo:

```sql
SELECT uf, sexo, avg(idade) AS media_idade, count(id) AS total_pessoas
FROM pessoas
GROUP BY uf, sexo;
```

Neste caso estamos extraindo a média de idade e contando quantas pessoas existem em cada grupo de UF e sexo, o resultado terá 1 linha para cada grupo composto. Por exemplo, no UF de valor BA existem pessoas do sexo feminino e masculino, portanto o estado fará parte de dois grupos: BA + Feminino e BA + Masculino.

Agora veja sobre o comando `HAVING`, ele é como um `WHERE`... faz filtragem de dados, porém essa filtragem não é sobre uma coluna como é no where, mas sim em grupo associado a ação de agregação;
Veja esse exemplo:

```sql
	select uf, count(clientes) from tb_clientes 
	group by uf
	having count(clientes) > 200;
```

Nesse caso, será exibido os estados e sua quantidade de clientes, porém, desejamos apenas o estado com mais de 200. Tal feito é impossível de ser feito do `where`, mas possibilitado pela função de filtragem HAVING.

## Relacionamento entre Tabelas

Como estamos estudando MySQL que é um banco de dados RELACIONAL. Ou seja, vai haver relacionamento entre tabelas e outros dados vão depender de outro, e isso vai deixar nossas consultas mais complexas e inteligentes. Agora vamos poder em um único select, coletar dados de mais de uma campo de dados do nosso sistema.

Vamos ver como isso pode acontecer...

### From

Os comandos de SQL básicos podem ser usados para juntar tabelas. Como fazer? Simples? Coloque as tabelas depois do from separado por vírgulas e dentro do `where` coloque onde a chave estrangeira se iguala com a primária.

```sql
	select * from tb_cidades, tb_estados where cid_est_codigo = est_codigo
```

o retorno será assim:
| **Cid_codigo** |  **Cid_nome**  | **cid_est_codigo** | **est_codigo** |     **est_nome**    |
|:--------------:|:--------------:|:------------------:|:--------------:|:-------------------:|
|        1       |      Caicó     |          1         |        1       | Rio Grande do Norte |
|        3       |    Fortaleza   |          2         |        2       |        Ceará        |
|        2       | Campina Grande |          3         |        3       |       Paraíba       |



### Join 

Lá em [select](#select) eu mostrei um jeito simplório de juntar duas tabelas, agora leia um pouco mais sobre um comando com essa finalidade.

`JOIN`, o comando que vai dar um baita upgrade em nossos estudos de ciência de dados. Join junta duas tabelas para que a consulta atinja um número maior de informações. Ou seja, tb_cidades tinha 3 colunas e tb_estados tinha 3 linhas também, agora o select com o join vai possuir  um total de 6 colunas. Para se ligar duas colunas uma deve possuir chave estrangeira de outra, senão uma consulta de dados é falha. 

A sintaxe 

```sql
	select * from tb_cidades join tb_estados on cid_est_codigo = est_codigo
```

| **Cid_codigo** |  **Cid_nome**  | **cid_est_codigo** | **est_codigo** |     **est_nome**    |
|:--------------:|:--------------:|:------------------:|:--------------:|:-------------------:|
|        1       |      Caicó     |          1         |        1       | Rio Grande do Norte |
|        3       |    Fortaleza   |          2         |        2       |        Ceará        |
|        2       | Campina Grande |          3         |        3       |       Paraíba       |

Dessa forma podemos selecionar dados de outra tabela em um único select. O join é a parte que liga as duas tabelas, se no banco de dados houvesse um cidade sem estado, ou vice-versa, não seria mostrado na tabela. O join apenas liga os dados que se ligam, ou seja, que são “casados”.

### Left e Right Join

Mas se eu quiser mostrar todas as cidades, tanto as que possuem e que não possuem estados deve-se usar o comando `left` ou `right`. Ambos têm a mesma função, juntar dados sem relacionamento. Para compreendermos qual usar, se liga nessa dica, o segredo é o `from`.

```sql
--  Quero mostrar todas as cidades, com ou sem estados 
-- cidades está a esquerda do from, então usa left
-- tb_cidades FROM tb_estados

left ->  -- todas as cidades - com e sem estado
right -> -- todos os estados - com e sem cidade
```

Alguns selects necessitam de coisas específicas, por exemplo, mostre apenas as cidades que não possuem estado. Para isso, o parâmetro `is null` deve ser atribuído no `where` considerando a chave estrangeira.

```sql
select cid_nome from tb_cidades left join on cid_est_codigo = est_codigo
where cid_est_codigo is null;
```

Pode está confuso, mais a noção de conjuntos da matemática pode nos ajudar a resolver esse problema. Se ligue nesse modelinho para melhor entendimento dos JOINS

<div align='center'>
    <img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_join.png">
</div>

1 - Selecione todos os da esquerda que não se relacionam (left join + FK is null)<br>
2 - Selecione todos os da esquerda, literalmente todos da esquerda (left join)<br>
3 - Selecione todos os da direita que não se relacionam (right join + FK is null)<br>
4 - Selecione todos os da direita, literalmente todos da esquerda (right join)<br>


## Consultas SQL

Uma subconsulta é uma instrução **SELECT** que está encadeada dentro de outra instrução SELECT. A consulta interior é designada por seleção interna e é executada em primeiro lugar, sendo o seu resultado utilizado para completar a consulta principal ou externa. A utilização de subconsultas permite construir comandos potentes a partir de comandos mais simples.


### Subconsulta Simples

Para compreendermos melhor o termo de subconsulta vamos imaginar o caso em que se deseja encontrar os empregados que ganham menos. Com os conhecimentos até então, você faria duas etapas:

```sql
select min(fun_salario) from tb_funcionarios;
```

Suponhamos que esse select retornasse 800. Em seguida seria consultado todos os funcionários que recebem esse valor, usando o seguinte script:

```sql
select fun_nome, fun_cargo, fun_salario from tb_funcionarios
where fun_salario = 800;
```

É aí onde entra a subconsulta, os dois *queries* pode ser unificados em um único comando, veja:

```sql
select fun_nome, fun_cargo, fun_salario from tb_funcionarios
where fun_salario = (select min(fun_salario) from tb_funcionarios);
```

As subqueries são de grande utilidade na otimização de ações e simplificador de ações dentro de um sistema. Por exemplo, quero selecionar todos clientes que compraram no cartão:

```sql
select cli_nome from tb_clientes
where cli_codigo in((select com_cli_codigo from tb_compras where com_formato = 'Cartão'))
```

Agora você pode está dizendo: "ah, mais assim é mais complicado! Eu prefiro ir lá dar um select e depois inserir o dado manualmente". Saiba que isso não é dinâmico. Por exemplo, se eu lhe pedisse todos os funcionários que são "Designer", aí você iria dá um select e depois inserir aqueles dados manualmente. As subconsultas tem como objetivo desenvolver suas buscas em bases de dados. 

### Subconsulta correlacionais

Uma subconsulta correlacionada é mais complexa do que a  subconsulta simples. Neste tipo de consultas o subquery precisa de um dado que vem do query principal, pelo que o SELECT interno é executado tantas vezes quantas as linhas que são processadas no comando principal.

Por exemplo, A consulta abaixo pretende encontrar os empregados que ganham um salário superior ao salário médio do respectivo departamento:

```sql
select * from  tb_funcionarios c1 
where c1.fun_salario > (select avg(c2.fun_salario) 
from tb_funcionarios c2 where c2.fun_deprt = c1.fun_deprt);
```

os apelidos *c1* e *c2* são importantes para distinguir o select interno do principal.

## Views

Uma *view*(visão) é uma tabela virtual, contém linhas e colunas e pode receber comandos como `join`, `where` e muito mais. O intuito das visões seria como atalho selects e muito mais. Seu comando de criação é muito simples. 

```sql
create view vw_nome as 
select -- códigos
;
```

As `view` tem uma capacidade e utilidade muito incrível, Sempre que uma view é executada os dados foram atualizados, pois o motor do banco de dados recria os dados toda vez que um usuário consulta a visão. As visões são uma mão na roda, não há necessidade de escrever todos os comandos novamente.

```sql
create view vw_filmes as
select fil_titulo, fil_ano, gen_genero, cat_categoria from tb_filmes 
inner join tb_generos on fil_gen_codigo = gen_codigo
inner join tb_categorias on fil_cat_codigo = cat_codigo
where fil_duracao > 100
order by gen_genero, fil_titulo;
```

A `view` é como uma uma tabela; ela vai guardar **APENAS** os atributos que vocês informarem no processo de criação, ou seja, você terá acesso exclusivamente aos dados informados na view. Ela opera de forma desconexa das tabelas. Por exemplo, você tem um banco x — com 5 mil linhas de dados — caso você deixe ele operando, inserindo novos dados, deletando obsolências, criando novas ligações entre tabelas; quando você solicitar ao SGBD dados da view, antes de lhe retorna a base de dados, o sistema irá dá um "refresh" nos dados. 

```sql
select fil_titulo, gen_genero from vw_filmes limit 5;
```

No exemplo acima, está sendo solicitado o nome e o genero, como você está usando uma view, os join da tabela filme e gênero é feito automaticamente pela view. Assim, em uma frente de trabalho de analista ou em construções de rotinas SQL, as `view` podem ajudar o desenvolvimento.

## Rotinas 

Rotinas(*Routines*) é um conjunto de instruções SQL que são armazenadas e que podem ser executadas posteriormente. As *Routines* se dividem em dois grandes grupos: procedimentos e funções. Uma Rotina Armazenada é um subprograma que pode ser criado para efetuar tarefas específicas nas tabelas do banco de dados. Rotinas para calcular valores, gerar resultados e tornar ações de administração de sistemas mais simples.

### Variáveis 

Apesar do Mysql não ser uma linguagem de programação, ele possue a capacidade de criar espaço de mémoria que as linguagens de programação chamam de **Variáveis**. Para isso podemos fazer da seguintes formas:

```sql 
	set @media = 0;
	declare media double;
```

Na primeira forma estamos usando o @ que é um simbolo que o SGBD interpreta como valor global do sistema, por padrão o Mysql já possue diversas variáveis globais, então atenção quando usar esse tipo de armazenamento de dados para não desencadear uma serie de problemas. 
Recomendo que use o `declare`, que é uma forma de criação de variável bastantante tipada, pois você depois do declare tem que informar o nome e o tipo do valor que ele armazenará. Usando esse segunda forma de armazenamento você poderá atribuir manipuladores(`handler`) para tomar certas ações, por exemplo:

```sql
	declare erro tinyint default 0;
	declare continue handler for sqlexception set erro = 1; 
```

O que está acontecendo, eu crie a variável de nome erro, e caso uma exceção seja disparada, o manipulador vai setar o valor de erro para 1. Isso se tornará bem util nas [transações](#transações-em-mysql).


### Função

As funções são usadas geralmente para gerar/retornar um valor que pode ser usado em uma expressão SQL(`select`, `update`, e muito mais). Esse valor pode ser passado como parâmetro da função. Agora vejamos a sintaxe básica das funções

```sql
-- criando Função
create function fc_desconto(p int, d decimal(3,2))
returns decimal 
return  p - (p * d);
```

A função se resume em 4 etapas: a criação, seu tipo, os códigos e o retorno

1. CREATE FUNCTION fc_nome(parâmetros)
2. RETURNS <TipoDaFunção>
3. <código>
4. RETURN <valor retornado pela função>

Ótimo, criamos nossa função! Essa função calcula o preço final com base no desconto desejado. Nesse momento ela pode ser executa em qualquer expressão — selects, inserts e etc.

```sql
select fc_desconto(loc_preco, 0.1) 
as 'Preço com 10% de desconto'
from tb_locacoes;
```

note-se, essa função está sendo chamado dentro da tabela de locações, onde possue o atributo loc_preco. A função no primeiro paramêtro está recebendo o preço da locação, **de cada linha do select**, e a porcentagem de desconto — 0.1 é 10/100, ou seja 10%.

Para deletar uma função é simples: basta escrever `drop function <nome>`

Vamos imaginar uma banco onde possue a tabela notas que contem: código do aluno, código da disciplina, e 4 atributos que repesentam as notas nos 4 periodos escolares. Criei uma função que vai calcular a média de um aluno. 

```sql
create function fc_media(p decimal, d decimal, a decimal, c decimal)
returns decimal 
return (p + d + a + c)/4;
```

Quando executada o sistema retorna uma mensagem de para executar chamos a função e fazemos toda a passagem de paramêtros. veja:

```sql
select fc_media(not_nota1,not_nota2,not_nota3,not_nota4) from tb_notas where not_alu_id = 1
```

Uma coisa importante, e que funcões podem ser um pouco mais complexas, usar os blocos `BEGIN` e `END`, chamar a função dentro dela própria e muito mais. Meu amigo Agnaldo me gostaria de um sistema que além de retorna a média, retornasse a situação do aluno, se ele estava aprovado ou não. Eu e ele desenvolvemos isso:

```sql
delimiter /
create function fc_analisarsituacao(codigoAluno int, codigoDisciplina int)
returns varchar(30)
begin
	declare m decimal;
	set m  = (select fc_media(not_nota1,not_nota2,not_nota3,not_nota4) from tb_notas where not_alu_id = codigoAluno and not_dis_id = codigoDisciplina);
    
    if m < 7.00 then
		return 'Reprovado'; 
	elseif m >= 7.00 then
		return 'Aprovado';
	end if;

end /
delimiter ;
```

Logo em seguida meu fomos escrever o select que retornaria, o nome do aluno, o nome da disciplina, a média e a situação do aluno. Caso você estranhe o select abaixo leia sobre [relacionamento de tabelas](#relacionamento-entre-tabelas)

```sql
select alu_nome as 'Aluno', dis_nome as 'matéria',
fc_media(not_nota1,not_nota2,not_nota3,not_nota4) as 'media final',
fc_analisarsituacao(alu_id,dis_id) as 'situação' from tb_notas
join tb_alunos on not_alu_id = alu_id
join tb_disciplinas on not_dis_id = dis_id;
```

### Procedimentos

Os procedimentos é uma sub-rotina bastante utilizado em sistema de banco de dados. Sua funcionalidade vai desde validação de dados até execução de comandos complexos. A grande diferença entre os procedimentos e as funções é que o procedimento não tem obrigatoriamente um retorno fixo e não possue um classificação do tipo de retorno. Isso acontece porque o procedimento pode fazer alterações de dados no banco e tal ato não nessecita de um retorno.

```sql
create procedure sp_VerPaciente(id_paciente int)
select pac_nome from tb_pacientes
where pac_codigo = id_paciente;

-- observe que a função recebe um parametro que é o id_paciente, esse parametro vai ser utilizado dentro do **select**.
```

A criação de um procedimento de armazenamento é bem simples e muito semelhante a criação de funções. Entretanto, aqui nota-se outra diferença com a *função*, como a função tem retorno, ela pode ser utilizada nos `selects`, `update`, `delete` 
Pra executar o procedimento tem que usar o comando `call`

```sql
call sp_VerPaciente(2); -- retora o nome do paciente 2
```
Porém, as funções são bem 

### Blocos - BEGIN & END

Como dito anteriormente, dá para colocar diversos comandos dentro dessas rotinas. Porém, mais de um comando pode confundir o banco de dados. Por isso, quando desejamos mais de um bloco de código usamos o marcadores `BEGIN`  e `END`

Como termina a escrita de um comando SQL? isso. **PONTO E VÍRGULA (;).** Mas isso dentro de uma rotina é problemática, pois causa confusão, esse ; está terminando o comando ou o procedimento? Para isso se usa o comando `DELIMITER` - com esse comando dentro da função o ponto e virgula deve ser substituído por aquele caráter

```sql
delimiter /
create procedure sp_aumentaSalario (id int, valor decimal(5,2))
	begin
		update tb_funcionarios 
		set fun_salario + valor 
		where fun_codigo = id;

		select * from tb_funcionarios;
	end /
delimiter ;
```


### Parâmetros de Procedimentos

Bem, muitos podem está se perguntando oque o procedimento de difere da função. Pois bem, aqui está a resposta. Os parâmetros passados nos procedimento de dados podem ser alterados… Vamos com calma

Até então quando você passava valores dentro de uma rotina eles não eram afetados externamente. O que eu quis dizer. Observe o procedimento passado. Veja que id e valor tem seus valores e que foram apenas parâmetros simples para execução do procedimento. Ou seja, eram atributos `in` - usados apenas dentro da rotina. Mas você pode fazer com que o procedimento mude o valor do atributo.

Para isso deve-se usar o termo `out` antes de especificar o parâmetro, assim, no final do procedimento seu valor vai ser trocado.

```sql
delimiter /
create procedure sp_vezesDois (out valor int, aumento int)
	begin
		set aumento = aumento * 2;
		set valor = aumento;
	end /
delimiter ;

set @valor = 10;
call sp_vezesDois(@valor, 1) -- @valor agr vale 2
```

Vejam, `@valor` antes do procedimento tinha valor = 10, porém quando se passa por parâmetro `out` o atributo é automaticamente anulada e ai então começa o procedimento. O out é usado para que aquele procedimento possua um “retorno”, mas caso você não queira que esse valor seja anulado no inicio basta colocar o atributo como `inout <atributo>`


## Estruturas lógicas

Dentro dos procedimentos e funções algumas das estruturas clássicas de programação surgem e se tornam funcionais, porém suas implementações ocorrem de modos diferentes, vejamos sobre estrutura condicional e de repetição...


### Estrutura condicional

Sim, pode até parecer mentira, mas não é. Temos estruturas condicionais dentro de banco de Dados, não é algo muito distante dos mecanismos de outras linguagem de programação. 

O queridinho dos programadores *back-end* está aqui. Como bem mencionado antes. A única diferença gritante é o termo `then` que acompanha toda os termos 

```sql
delimiter /
create function calculaFrete (preco decimal(6,2))
returns decimal(6,2)

begin
	
	declare frete decimal(6,2);
		
	if preco < 5.00 then 
		set frete = preco - (preco * 0.02);
	elseif preco < 15.00 then
		set frete = preco - (preco * 0.05);
	else
		set frete = preco - (preco * 0.09);
	end if;
	return frete;
end / 

delimiter ;
```

Os fãs do *Switch Case* estão gritando. Existe o nosso queridinho em MySQL? Claro que existe. Mas a diferença entre os dois é tão insignificativa. Pegando a função de cima, basta fazer isso:

```sql
-- [...]

begin
	
	declare frete decimal(6,2);

	case preco
	when preco = 5.00 then 
		set frete = preco - (preco * 0.02);
-- [...]

	else 
		set /*mais codigo*/
	end case;
end /
```

## Triggers

Triggers, traduzindo ao pé da letra, *gatilho*. Esses são a associados a tabelas dentro do banco de dados e sempre são ativados quando um `insert`, um `update` ou um `delete` é feito na tabela que ele foi anexado. 

Os gatilhos podem ser usados para validação de dados, rastreamento de atividade e arquivamento de registros excluídos.

```sql
create trigger nome <timing> <operacao>
on tabela
for each row
-- declarações;
```

“*Charlon, isso está muito confuso… O que é uma operação e timing??”* Calma, meu jovem. Operação é qual função vai disparar o gatilho: pode ser no insert, no update ou no delele. Então, se você escrever insert sempre que um dado for inserido na tabela daquele `trigger` ele será ativado automaticamente. O `timing` é quando o gatilho será efetuado antes(`before`) ou depois(`after`) do comando DML.

```sql
delimiter /

create trigger tr_validacao before insert 
on tb_produtos
for each row 

begin

if (new.pro_preco > 1000) then
	set new.pro_preco = (new.pro_preco - (new.pro_preco * 0.7));
end if;

end /

delimiter ;
```

Esse gatilho vai verificar se o produto for mais de 1000 reais, seu preço será corrigido por um desconto de 7% sobre seu valor inicial.

### Before ou After

Isso depende da sua necessidade. Em alguns casos, como por exemplo validação, é interessante que esse teste seja feito antes do dado ser inserido na tabela. Mas em outros casos, as operações podem ser feitas apenas depois que todos os dados forem inclusos. Notasse que quando usamos `before` sempre que se referir a um atributo usasse o prefixo `NEW` , pois estamos nós referindo aos termos que estão entrando nessa tabela. Em *alguns* casos, por exemplo em deletes ou updates, você deseja se referir ao termo que está sendo substituido pelo procedimento, então você usa o termo `OLD`. Um exemplo de *old* seria uma gatilho para armazenar um dado antigo para caso o usuario queira restabelecer aquele dado um dia. 

#### Casos de After

Um exemplo clássico de After é fazer a modificações em outras tabelas, depois que o dado foi inserido — imagine um banco de escola onde existe a tabela de matriculas, com o código do aluno e da disciplina, e em outra tabela está relaciona as notas de cada uma dessas matriculas. Normalmente, **SEMPRE** que você inserisse uma matricula, você teria que ,manualmente, inserir na tabela de notas a matricula daquele novo aluno. Para solucionar isso vamos criar um `trigger` que ***depois*** da inserção adicione o aluno na tabela de matricula.

O objetivo do `after` é causa uma desdobramento de códigos após a nova adição de uma linha de dados. Os casos do `after` podem ser: inserção de um dado em outra tabela, um armazemando do dado antigo, ou uma reação com dados da propria tabela.

```sql
delimiter /

create trigger add_matricula after insert on tb_matriculas for each row
begin
	insert into tb_notas (not_mat_id) values (new.mat_id);
end /

delimiter ;
```

#### Casos de Before

Ainda falando de uma base de dados escolar, a situação da matricula de um aluno só pode ser de 4 tipos: Matriculado, Aprovado, Reprovado e Cancelada. Veja agora:

```sql
delimiter /

create trigger tr_aprovarMatricula before insert on tb_matriculas for each row
begin
	if not (new.mat_situacao in ('Matriculado','Cancelada','Aprovado','Reprovado')) then
    	signal sqlstate '45000' set message_text = 'ERRO -> Situação Indisponível';
    end if;
end /

delimiter ;
```

Não se preocupe com o `signal sqlstate`, leia sobre mensagem de erro no capitulo seguinte:

### Devolvendo mensagens de erro 

Em diversos casos de trigger, estamos fazendo testes lógicos para prevenir e tratar erros de sistema. Segundo diversos preceitos da ciência de programação todo erro deve ser informado ao usuário, `erro na linha...`; `valor x inexistente`; `função indisponível` são exemplo de erro. Algumas ações no SQL retornam mensagens de erro como inserção em tabelas inexistenstes, isso são erro que eu chamo de erros sintáticos, erros de semântica; você não escreveu corretamente o comando. Só que quando estamos falando de `trigger` a questão do erro semântico some, agora você vai tratar o erro de dados, erro esse que o banco não controla - para isso você deve usar dentro dos testes de condição o seguinte comando

```sql
	signal sqlstate '45000' set message_text = 'digite aqui';
```

Esse comando permite que uma mensagem de erro seja retornada pelo seu Workbench, já que o mesmo só retorna erros semânticos, o SGBD não sabe que sua tabela matricula no atributo de situação só pode ter 3 opções, é um atributo do tipo ``varchar` qualquer dado que seja em texto será armazenado. Para garantir a integridade de seus dados, cria-se o trigger para garantir tal feito, veja a aplicação do comando.

```sql
delimiter //
create trigger tr_dados before insert on tb_matriculas for each row
begin

	if not (new.situacao in ('Matriculado','Cancelada','Aprovado','Reprovado')) then
    signal sqlstate '45000' set message_text = 'ERRO -> Situação Indisponível';
    end if;
```


### A complexidade dos gatilhos

Os triggers, são ferramentas de controles suas ações não são para nescessariamente adicionar, mudar ou deletar dados; seu sentido está associado a uma dessas três funções eles são como vigilantes que vão guardar uma tabela; GUARDA DO QUE? inconsistência de dados. Os gatilhos em sua grande maioria serão usados para garantir os dados. por exemplo, um atributo float pode receber qualquer valor, mas existem livros milionários, ou você limita o tipo de dado na criação ou criar um gatilho que dispire um erro quando um valor fora da faixa de preço seja fornecido.


```sql
delimiter /

create trigger tr_preco before insert 
on tb_livros
for each row 

begin

if (new.pro_preco > 300) then
	signal sqlstate '45000' set message_text = 'ERRO - VALOR ACIMA DA FAIXA DE PREÇO';
end if;
end /

delimiter ;
```

## Transações em Mysql

Transação em Mysql, "configura um conjunto de declarações SQL que são combinadas em uma única unidade de trabalho, sendo executadas como se fossem uma única operação." Essa é a definção mais abstrata possível que se possa imaginar sobre as transações. Mas, vamos lá, imagine que você foi contratado para ser DBA junior, logo está trabalhando em um base de dados de produção real, ou seja, todos os comandos devem ser milimetricamente escritos, pois isso pode afetar o sistema inteiro e até regar problemáticas com dezenas de milhares de instâncias/linhas de um `database` em produção, em funcionamento. Como funcionário você terá que executar comandos DML, e para isso seria bom testar se os comandos funcionariam e se eles não atrapalharia a ordem dos dados.

Primeiramente, para usar os métodos seguros de transações, deve desativar o `autocommit`. Esse é variável super global de configução do SGBD, ele faz com que todos os comandos DML sejam aplicados no banco diretamente, sem pensar duas vezes, deu enter e pronto, dados atualizados! Para desativar, basta mudar o valor do autocommit de 1, ou seja, ativado; para 0, que é desativado. Veja:

```sql
	set @@autocommit = 0;
```

Perfeito, agora começaremos a festa. O comando `start transaction` ira marcar o começo da transição, todas as querys executas apartir de agora estaram submetidas a nossa transação e não faram parte do sistema enquanto não dermos uma nova ordem. Inicei a transição em no meio do processo notei um erro de digitação que poderia ferir o sistema e a sua integridade; (*desespero*), calme-se, você pode cancelar todas os comandos executados desde que você iniciou a transação, basta executar o comando `rollback`. Mas, se tudo funcionou o que eu faço? Quero essas alterações na produção, eai?? Basta rodar o comando oposto do rollback, o `commit`. Resumidamente:

```sql
	start transaction;
	-- erro ou resultado inesperado
	rollback;
```

```sql
	start transaction;
	-- comandos funcionando perfeitamente
	commit;
```

### Aplicação prática das transações

```sql

	delimiter /

	create trigger teste after insert on tb_livros
	begin
		declare erro tinyint dafault 0;
		declare continue handler for sqlexception set erro = 1; 
		start transaction;

  		if erro = 0 then
			-- armazamento de dados em outra tabela
    		COMMIT;

  		elseif erro = 1 then
    		ROLLBACK;
  		end if;
	end /

delimiter ;
```

Esse código é apenas para ilustrar que as transações podem ser usadas em triggers e procedures. 

## References

- OLIVEIRA, Ari Barreto. **"Conhecendo Banco de Dados: Modelagem de dados"**;
- SETZER, Valdemar W. **"Bancos de Dados"**; Editora Edgard Blucher LTDA, 1989.
- SILBERSCHATZ, Abraham.Horth, Henry F., Sudarshan. S; **"Sistema de Bancos de Dados"**.Makron Books. 
- SOMBRIO, Jessica. **Bê-á-bá do SQL**; Kondado, 2020.
- GUANABARA, Gustavo. **Curso de MYSQL**; Curso em vídeo, 2016.