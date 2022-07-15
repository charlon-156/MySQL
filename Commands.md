# Comandos

Página com resumos bem basicos de Banco de Dados, esse arquivo tem o objetivo de incentivar e resumir conceitos básicos do SQL

# Criar Data-Base e Tabelas

Primeiro criar o **`database`**, porém eu já fiz alguns comandos para as varias do tipo literal possam receber acentuação. O padrão utf-8 ele aceita basicamente toda tipo de acentuação das línguas latino-americanas.

```sql
create database hospital
default character set utf8
default collate utf8_general_ci;
```

Agora vamos criar uma tabela dentro do nosso Banco de Dados, depois do table coloca-se `default charset utf8`:

```sql
create table tb_pacientes (
nome varchar(30) not null,
id int auto_increment,
nascimento date,
origem default 'Brasileiro'
primary key(id)
) default charset utf8;
```

dentro do parênteses deve ser adicionado o **nome** e o **tipo da variável**. Tudo isso separado por virgulas, como vemos em `nascimento date` nascimento é *nome* da variável e *`date`* é o tipo. E por fim, e mais importante, `primary key()` : id agorar é uma chave primaria única, não existe outra linha na tabela como o mesmo valor na coluna id.
### Modificadores de Atributo

1. `not null` - faz com que aquele atributo não seja criado nulo.
2. `default` - é para casos em que o tipo não é informado, se por acaso alguém não informar sua nacionalidade, ela por padrão será “Brasileiro.
3. `auto_increment` - em casos de valores com números ele vai sempre aumentando o valor.
4. `unique` - esse garante que não vai existir valores repetidos.
5. `unsigned` esse ignora o sinal; utilize pois reduz os bytes. 

# Inserindo valores

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

# Modificando colunas

##  Adicionando novas colunas
```sql
alter table tb_paciente 
add sexo enum('M', 'F');
```

desse modo, a coluna sexo será adicionada no final da tabela.
Temos duas variantes nessas opções para adicionar, colocar após uma coluna ou ser a primeira coluna

```sql
	add sexo enum('M','F') after nome;
	add sexo enum('M','F') first;
```

## Deletando tabela

Agora, vamos eliminar a coluna sexo na tabela tb_paciente:

```sql
alter table tb_paciente
drop sexo;
```

Por fim, vamos modificar a constrag ou o tipo da coluna

```sql
alter table tb_paciente
modify sexo varchar(1) default 'M';
```

Agora, por obsequio, vamos mudar a coluna por inteiro

```sql
alter table paciente
change sexo sex varchar(1);

```

# Manipular linhas

```sql
update cursos 
set nome = 'HTML5'
where idcurso '1';

update cursos
set nome='PHP', ano='2015' 
where idcurso='4';

delete from cursos
where idcurso='8';

truncate cursos;
```

# Select

```sql
select * from table
select nome from table
select nome, sexo from table

where ano = 2016
where ano <= 2016
where ano <> 2016
where ano between 2010 and 2016
where ano in (2010,2012,2016)
where ano = 2016 and carga >30
where ano = 2016 or carga > 30

where nome like 'P%'
where nome like '%a'
where nome not like '%a%'
where nome not like 'ph%p_'

select distinct nacionalidade from table
select cont(*) from cursos where carga > 40
select max(carga) from cursos
min(-), sum(-), avg(-)

order by nome;
order by nome desc, ano;
```
