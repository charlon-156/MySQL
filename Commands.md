# Comandos

Página com resumos bem basicos de Banco de Dados, esse arquivo tem o objetivo de incentivar e resumir conceitos básicos do SQL

- [Criar Banco de Dados](#criar-database-e-tabelas)
	- [Modificador de atributos](#modificadores-de-atributo)

- [Inserindo valores](#inserindo-valores)

- [Modificar tabela](#modificando-tabelas)
	- [Adicionar colunas](#adicionando-novas-colunas)
	- [Deletar colunas](#deletando-colunas)
	- [Modificar colunas](#modificando-colunas)
	
- [Manipular valores](#manipular-linhas)
	- [Update](#update)
	- [Delete](#delete)

- [Selecionando Valores](#select)
	- [select com números](#select-com-números)
	- [select com palavras](#select-com-números)
	- [select com ações predefinas](#select-com-ações-predefinidas)

## Criar DataBase e Tabelas

Primeiro de tudo deve-se criar o **`database`**, porém eu já fiz alguns comandos para que os dados do tipo literal possam receber acentuação. O padrão utf-8 — aceito mundialmente — ele aceita basicamente toda tipo de acentuação das línguas latino-americanas.

```sql
create database hospital
default character set utf8
default collate utf8_general_ci;
```

Agora vamos criar uma tabela dentro do nosso Banco de Dados: ```create table tb_pacientes();```

Dentro do parênteses deve ser adicionado o **nome** e o **tipo da variável**. Tudo isso separado por virgulas, como vemos em `nascimento date` nascimento é *nome* da variável e *`date`* é o tipo. E por fim, e mais importante, `primary key()` : id agorar é uma chave primaria única, não existe outra linha na tabela como o mesmo valor na coluna id.
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

### Modificadores de Atributo

1. `not null` - faz com que aquele atributo não seja criado nulo.
2. `default` - é para casos em que o tipo não é informado, se por acaso alguém não informar sua nacionalidade, ela por padrão será “Brasileiro.
3. `auto_increment` - em casos de valores com números ele vai sempre aumentando o valor.
4. `unique` - esse garante que não vai existir valores repetidos.
5. `unsigned` esse ignora o sinal; utilize pois reduz os bytes. 

## Inserindo valores
z
Temos duas maneiras de adicionar os dados em uma tabela: 

```sql
insert into tb_pacientes values
('Chico', default, '1987-02-11', 'Alemão'),
('Antonia', '2','1990-10-29', default);
```

o default já foi explicado anteriormente; o default no primeiro caso como a variável tem auto incremento não é necessário fazer a atribuição, ele pode ser deixado e no caso de origem, sempre que deixado em branco, vai ser default.

```sql
insert into tb_pacientes
(nome, id, nascimento, nacionalidade) values
('Chico', default, '1987-02-11', 'Alemão'),
('Antonia', '2','1990-10-29', default);
```

## Modificando tabelas

Nem tudo é só CREATE, temos outros tipos de comando DDL - Por exemplo, crei uma tabela, porém esqueci alguns dados ou atributosno formato do *Database* — Não há nescessidade de dropar tudo e recomençar, basta fazer mudanças na tal tabela previamente criada. Acompanhe alguns comandos para fazer tais ações.

SINTAXE 🖊️ —  ALTER TABLE (nome da tabela)

###  Adicionando novas colunas
 - ADD -> Adiciona uma nova coluna
```sql
alter table tb_pacientes 
add sexo enum('M', 'F');
```

desse modo, a coluna sexo será adicionada no final da tabela. Temos duas variantes nessas opções para adicionar, colocar após uma coluna expecifica ou ser a primeira coluna

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

Agora, por obsequio, vamos mudar a coluna por inteiro

```sql
alter table paciente
change sexo sex varchar(1);

```

## Manipular linhas

Manipular linhas é ação de se relacionar com os dados existente 

O **WHERE** é uma parte MUITO importante. É muito perigoso DELETE's e UPDATE's sem esse comando, pois TODAS as linhas seram atualizadas; Então, em nenhuma hipótese, execute delete ou update sem um where bem escrito.

### Update

Para darmos inicio nas manipulações vamos modificar o nome de uma linha em especifico, de preferencia, escolhemos a chave primaria para a acessar uma parte especifica. A sintaxe e o seguinte: 

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

As vezes em seu banco de dados há a nescessidade de deletar um dado. O que ocorre com a maioria dos devers são linhas que não são deletadas — isso acontece por que aquela linha deve ter chave estrangeira, ou seja, delete suas relações nas tabelas em que ele possue dependência. Se liga no fio :thread:

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

Na área de Ciência de Dados, o select tem papel fundamental; Ações empresárias de muitíssima importância só são feitas depois dos respaldos de dúvidas como essas: quantos clientes são de tal bairro e qual a faixa etária? Que mês a rentabilidade foi maior? E até dúvidas simples como: Tem mais João ou Maria como clientes? Tudo isso é fruto de selects

### Sintaxe Básica

Primeiramente, vamos mostrar todos os dados de uma tabela! Agora nosso objetivo é mostrar TODOS os dados, para não ter que escrever todos os atributos usa-se o atalho '*' (asterisco) para simbolizar a totalidade de informações de uma tabela.

1. ```SELECT``` (dados que serão mostrados) 
2. ```FROM``` (tabela que será mostrada)

```sql
select * from table
select nome from table
select nome, sexo from table
```

## Select com Números

Certamente em seu Banco de Dados vai haver diversar informações em tipo númerico, com isso, restrições para a seleção de dados mais cirurgico. Com isso uma sequência de informações podem ser filtradas. A sintaxe padrão continua a mesma, select ... from ... MAS devemos inserir o velho termo chamado ```WHERE```

-- as instâncias que foram verdadeiras seram "selecionados"

1. *igual que* (=) — vai verificar se tal atributo(ano) é igual ao valor informado(2016) 
2. *menor que & menor igual que* (< & <=) — vai verificar se tal atributo(ano) é menor que valor informado(2016) 
3. *diferente* (<>) — vai verificar se tal atributo(ano) é diferente ao valor informado(2016)
4. *entre* (between x and y) — vai verificar se tal atributo(ano) está entre x e y
5. *em* (in) — o select vai procurar as intâncias que possuam o valor informado dentro do parenteses
6. *e* (and) — o "and" vai garantir que as duas ou mais informações são válidas.
7. *ou* (or) — o "ou" vai mostra as intâncias que **pelo menos uma** das ações será verdadeira

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

Vez ou outro nescessitamos de consultar dados que são um cadeia lógica de caracteres a qual o ser humano denominou de *"Palavras"*(String), porém, consultar esses dados não são dos mesmos modos que se consulta números. Acompanhe-me nessa explicação descomplicada!

```where *coluna* like (condição)```

A consulta depois do like é rigorosa. Se você deseja encontrar todos Marcos e o sexo Masculino são diferentes. Se você escreve 'm' - o select vai retornar apenas as instâncias que SÃO APENAS 'm'. Quando estiver buscando algo especifico, excreve apenas exatamente a *string*. Mas se quiser todos os Silva deve-se usar a simbologia do **%**

> % e _ na busca por palavras SQL
>
> O porcentagem significa que existe pode existir mais caracteres depois ou apenas o vazio depois
> Já **_** significa que obrigatóriamente vai existir pelo menos um caracter 

1. ``` nome like Pedro%``` - Esse comando vai buscar todos os que começam com Pedro ou que são somente 'Pedro'
2. ``` nome like %Silva_``` - Esse comando vai buscar todos os que em qualquer lugar tenha Silva e outro caracter, ou seja, Silvana será selecionada e 'Thiago Silva' não será.

```sql
where sexo like 'M'
where nome like 'P%'
where nome like '%a'
where nome not like '%a%'
where nome not like 'ph%p_'
```

### Select com ações predefinidas

As vezes, temos a obrigação de conhecer certos dados como média da carga horária dos cursos, produto mais barato ou o mais caro... Vejamos como tais ações podem serem feitas.

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

* Avg - Média, que saber quanto é a média da idade do seus clientes?  Se liga aqui
	```select avg(idade) from tb_clientes;```

Agora vou falar do ORDER BY. Essa parte pode ser implementada no select, sua função é organizar os dados mostrados, se colocarmos ORDER BY `id` os resultados seram mostrado em sequência, do id = 1 até id = n
Se agrupar por nome, vai retorna a pesquisa em ordem alfabetica. Porém, se você quiser começando do Z? basta adicionar depois o termo `desc`.
Lembrando, mais de um termo de organização pode ser considerado, para isso basta adicionar uma vírgula.

```sql
order by nome;
order by nome desc, ano;
```
no primeiro comando está organizando por ordem alfabetica, e o segundo pela mesma ordem só que invertida além disso considerando o ano.

## Relacionamento entre Tabelas

Como estamos estudando MySQL que é um banco de dados RELACIONAL. Ou seja, vai haver relacionamento entre tabelas e outros dados vão ser dependentes de outro, e isso vai deixar nossas consultas mais complexas e inteligente. Agora vamos poder em um único select, coletar dados de mais de uma campo de dados do nosso sistema.

Vamos vê como isso pode acontecer...

### Join 

```JOIN```, o comando que vai dar um baita upgrade em nossos estudos de ciência de dados. Join juntaria duas tabelas para que a consulta atenda um número maior de informações. Ou seja, tb_cidades tinha 3 colunas e tb_estados tinha 3 linhas também, agora o select com o join vai possuir  um total de 6 colunas. veja o exemplo a seguir:

