# Modelagem de Dados

## Súmario 

- [**Modelo Conceitual**](#Modelo_Conceitual)
    - [**Entidades**](#Entidades)
    - [**Atributos**](#Atributos)
    - [**Relacionamento entre entidades**](#Relacionamentos-entre-entidades)
    - [**Cardinalidade de relaciomentos**](#Cardinalidade-de-relacionamentos)

## Modelo_Conceitual

O primeiro passo na construção de um modelo conceitual é o reconhecimento das informações.. No exemplo acima, perceba que estão descritas ligações entre seres, coisas, fatos e organismos sociais. Identificando estes elementos você estará isolando os conjuntos. Exemplo: *Paciente, Médico, Atendimento*

### Entidades

Os conjuntos de informação darão origem as entidades. Cada entidade irá compor todos os elementos de um conjunto de informação. Elas serão modeladas com **retângulos** e com o nome do conjunto escrito dentro dele no *plural* porque a entidade representa todos os elementos daquele conjunto. Por exemplo: a entidade Médicos não representa somente o Doutor Salomão, e sim todos os médicos da clínica.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/Img_1.jpg">

Existem algumas pre requisitos para determinar o que é entidade. Veja:

1. Uma entidade é algo do mundo real que possui uma **existência independente**.
2. Pode ser um objeto com uma existência *física* - uma pessoa, uma sala - ou pode ser um objeto com existência *conceitual* - uma turma, um trabalho ou um curso
3. A entidade tem que ter mais de uma característica *(atributo)*
4. Algo que represente uma **ação** ou **verbo** não pode ser uma entidade


### Atributos

Em cada entidade, além dos atributos simples, que representam informações básicas, devemos ter  No caso da entidade professores, o atributo determinante é Matrícula, pois cada professor tem seu número de matrícula que é ***exclusivo*** dele. No caso do curso é o código. Cada curso da escola tem seu código e ele não será usado para nenhum outro. Para identificar quais atributos são determinantes, usaremos uma bolinha pintada.

Existem 4 tipos de Atributos para Entidades

1. ```Atributo Comum``` - Nesse apenas dados como data de nascimento, cor de pele...
2. ```Atributo Determinante``` - um atributo (ou uma junção de atributos) que tenha um valor único para cada instância. Ou seja, este valor não poderá se repetir de uma instância (registro) para outra, e tampouco poderá ficar em branco. Damos a este atributo o nome de atributo determinante. Ele recebe este nome porque através dele nós determinamos os outros atributos. — A matrícula de um aluno é determinante, pois nenhum outro aluno possuirá a mesma matrícula
3. ```Atributo Multivalorado``` - Um atributo é dito multivalorado quando ele pode conter diversos valores. Imagine que nós resolvamos armazenar, para cada professor, todos os números de telefone que possua. Muitos têm o telefone residencial, telefone celular e telefone do escritório, mas cada atributo simples somente pode armazenar um valor. Sempre que uma instância de uma entidade possuir mais de um valor, esse atributo será multivalorado.
4. ```Atributo Redundancia``` - Isto acontece quando o valor do atributo pode se repetir excessivamente em um banco de dados. Por exemplo, quando cadastramos um livro temos que informar qual a categoria deste livro. Percebemos então que MUITOS livros terão como categoria “romance” ou “infantil” ou “drama”.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_2.jpg">

### Relacionamentos entre **entidades**

Em um sistema, as entidades não ficam isoladas sem nenhuma ligação com outros conjuntos de informação. A não ser que o sistema só tenha uma entidade. As entidades em um sistema estão ligadas através de relacionamentos. ```Um médico está habilitado a atender pacientes```. Um relacionamento é representado por um losango que é colocado entre as duas entidades ou mais que ele liga. Dentro do losango pode ser escrito um nome para o relacionamento ou deixa-lo vazio.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_3.jpg">

As vezes, a ligação entre entidades revela ações ou acontecimentos, e neste caso deveremos obrigatoriamente escrever o nome do relacionamento.

### Cardinalidade de relacionamentos

Não basta dizer que existe um relacionamento entre determinadas entidades. É preciso dizer também como os elementos de uma entidade se ligam aos elementos de outra. Um médico atende quantos pacientes? e um aluno tem quantos cursos preferidos? As classes de relacionamento principais são a ```1:N``` e a ```N:N```. Traduzindo: um para vários (ou vários para um) e vários para vários. Tomo como exemplo um sistema de um arquivo de músicas e compositores. Cada música só tem 1 compositor, e cada compositor pode ser compositor de N (várias) músicas.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_4.jpg">

Observe atentamente como está disposta a cardinalidade no modelo acima. Para se descobrir qual a cardinalidade de um relacionamento, basta fazer a seguinte pergunta do ```“cada”```:
**“CADA música se relaciona com quantos COMPOSITORES?”** = '1'. E a resposta, anotar *“do lado de lá”*, em Compositores. Lembre-se relacionamento é vai e volta, a pergunta tem que ser feita nas duas direção, se liga — **Cada compositor se relaciona com quantas músicas?** = N ```Veja o outro exemplo abaixo.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_5.jpg">

Já no relacionamento N:N, cada elemento de uma entidade X liga-se a vários elementos da entidade Y, e cada elemento de Y liga-se a vários de X. No exemplo dado acima, temos um relacionamento N:N. Cada livro pode ser alugado por muitos (N) alunos, e cada aluno pode alugar muitos (N) livros.