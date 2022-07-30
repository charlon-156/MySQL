# Modelagem de Dados

## Súmario 

- [**Modelo Conceitual**](#Modelo_Conceitual)
    - [**Entidades**](#Entidades)
    - [**Atributos**](#Atributos)

## Modelo_Conceitual

O primeiro passo na construção de um modelo conceitual é o reconhecimento das informações.. No exemplo acima, perceba que estão descritas ligações entre seres, coisas, fatos e organismos sociais. Identificando estes elementos você estará isolando os conjuntos. Exemplo: *Paciente, Médico, Atendimento*

### Entidades

Os conjuntos de informação darão origem as entidades. Cada entidade irá compor todos os elementos de um conjunto de informação. Elas serão modeladas com **retângulos** e com o nome do conjunto escrito dentro dele no *plural* porque a entidade representa todos os elementos daquele conjunto. Por exemplo: a entidade Médicos não representa somente o Doutor Salomão, e sim todos os médicos da clínica.

<img href="../img/img_1.png" align="center">

Existem algumas pre requisitos para determinar o que é entidade. Veja:

1. Uma entidade é algo do mundo real que possui uma **existência independente**.
2. Pode ser um objeto com uma existência *física* - uma pessoa, uma sala - ou pode ser um objeto com existência *conceitual* - uma turma, um trabalho ou um curso
3. A entidade tem que ter mais de uma característica *(atributo)*
4. Algo que represente uma **ação** ou **verbo** não pode ser uma entidade


### Atributos

Em cada entidade, além dos atributos simples, que representam informações básicas, devemos ter  No caso da entidade professores, o atributo determinante é Matrícula, pois cada professor tem seu número de matrícula que é exclusivo dele. No caso do curso é o código. Cada curso da escola tem seu código e ele não será usado para nenhum outro. Para identificar quais atributos são determinantes, usaremos uma bolinha pintada.

Existem 4 tipos de Atributos para Entidades

1. ```Atributo Comum``` - Nesse apenas dados como data de nascimento, cor de pele...
2. ```Atributo Determinante``` - um atributo (ou uma junção de atributos) que tenha um valor único para cada instância. Ou seja, este valor não poderá se repetir de uma instância (registro) para outra, e tampouco poderá ficar em branco. Damos a este atributo o nome de atributo determinante. Ele recebe este nome porque através dele nós determinamos os outros atributos. — A matrícula de um aluno é determinante, pois nenhum outro aluno possuirá a mesma matrícula
3. ```Atributo Multivalorado``` - Um atributo é dito multivalorado quando ele pode conter diversos valores. Imagine que nós resolvamos armazenar, para cada professor, todos os números de telefone que possua. Muitos têm o telefone residencial, telefone celular e telefone do escritório, mas cada atributo simples somente pode armazenar um valor. Sempre que uma instância de uma entidade possuir mais de um valor, esse atributo será multivalorado.
4. ```Atributo Redundancia``` - Isto acontece quando o valor do atributo pode se repetir excessivamente em um banco de dados. Por exemplo, quando cadastramos um livro temos que informar qual a categoria deste livro. Percebemos então que MUITOS livros terão como categoria “romance” ou “infantil” ou “drama”.

<img herf="../img/img_2.png" align="center">