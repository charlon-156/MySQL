# Modelagem de Dados

Olá :grinning:, Esse é um documento para tratar de modelagem de dados; A modelagem é totalmente importante para que a criação de Banco de Dados. Aqui você encontrará a documentação sobre a criação dos diagramas e modelos existente na ciência de Dados. Esse conhecimento é importante para gerar um BD perfeito e coerente com os três principios: Evitar redundância, inconsistência de dados e facilitar atualizações!

## Súmario 

- [**Modelo Conceitual**](#modelo-conceitual)
    - [**Entidades**](#entidades)
    - [**Atributos**](#atributos)
    - [**Relacionamento entre entidades**](#relacionamentos-entre-entidades)
    - [**Cardinalidade de relaciomentos**](#cardinalidade-de-relacionamentos)
    
- [**Modelo Lógico**](#modelo-lógico)
    - [**Regra 1:N**](#regra-1n)
    - [**Regra Redundância Funcional**](#regra-redundância-funcional)
    - [**Regra Multivalorização**](#regra-multivalorização)
    - [**Regra N:N**](#regra-nn)
    - [**Regra Relacionamentos Múltiplos**](#regra-relacionamentos-múltiplos)
    - [**Regra Agregação**](#regra-agregação)
    - [**Regra Particionamento**](#regra-particionamento)

- [Referências](#references)

## Modelo Conceitual

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

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_4.png">

Observe atentamente como está disposta a cardinalidade no modelo acima. Para se descobrir qual a cardinalidade de um relacionamento, basta fazer a seguinte pergunta do ```“cada”```:
**“CADA música se relaciona com quantos COMPOSITORES?”** = '1'. E a resposta, anotar *“do lado de lá”*, em Compositores. Lembre-se relacionamento é vai e volta, a pergunta tem que ser feita nas duas direção, se liga — **Cada compositor se relaciona com quantas músicas?** = N ```Veja o outro exemplo abaixo```.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_5.png">

Já no relacionamento N:N, cada elemento de uma entidade X liga-se a vários elementos da entidade Y, e cada elemento de Y liga-se a vários de X. No exemplo dado acima, temos um relacionamento N:N. Cada livro pode ser alugado por muitos (N) alunos, e cada aluno pode alugar muitos (N) livros.


## Modelo Lógico

O modelo lógico é o modelo que mostra toda a estrutura do banco de dados, mas é ainda independente de SGBD, ou seja, pode ser usado em qualquer banco de dados. Quando estiver pronto, podemos ter noção da estrutura e de todas as tabelas (entidades) que o sistema terá, com consistência, segurança e sem redundâncias. Após este modelo, já direcionaremos o nosso banco para o SGBD a ser utilizado, ou seja, Oracle, MySQL, SQL Server, PostgreSQL, etc.


### Regra 1:N

Copiamos o atributo determinante do lado 1 para o lado N, mas sem ser determinante.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_6.png"> 

Olhe esse exemplo para maior esclarecimento

Entidade: Alunos

| **Cód. do Aluno** |  **Nome**  |  **Cód. da escola**  |
|:-----------------:|:----------:|----------------------|
|         1         | Charlon F. |          *1*         |
|         2         | Nicolau M. |          *2*         |
|         3         |  Thomas H. |          *2*         |
|         4         |   John L.  |          *1*         |

Entidade: Escolas

|  **Cód. da escola**  |        **Nome**        |
|:--------------------:|:----------------------:|
|          *1*         |   Academia de Platão   |
|          *2*         | Atheneu de Westminster |


### Regra Redundância Funcional

1. Remove-se o atributo em redundância e surge uma nova entidade cujo nome será o do atributo, no plural. 
2. O atributo em redundância passa para a nova entidade sem ser redundante.
3. Cria-se um determinante artificial para a entidade nova.
4. Surge um relacionamento de cardinalidade 1:N da entidade nova para a antiga. (N no velho - 1 no novo)
5. Decompõe-se o relacionamento 1:N.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_7.png"> 


### Regra Multivalorização

1. Apagamos o atributo multivalorado e surge uma nova entidade cujo nome será uma combinação do nome do atributo, no plural, com o nome da entidade antiga.
2. O atributo multivalorado passa para a nova entidade sem ser multivalorado.
3. Surge um relacionamento de cardinalidade 1:N da entidade antiga para a nova.
4. Decompõe-se o relacionamento 1:N (1 no velho - N no novo)
5. Os atributos da nova entidade irão formar um determinante composto.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_7.png"> 


### Regra N:N 

Essa é uma das regras mais importante e talvez a mais complexa. Por isso, vou colocar exatamente a explicação do Professor <a href="https://arioliveira.com/">Ari Barreto Oliveira</a> do seu livro: Conhecendo Banco de Dados: Modelagem de dados.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_8.png">


### Regra Relacionamentos múltiplos 

**Passo 1** - Quebra as pernas do relacionamento e surge uma nova entidade no lugar da relação.
**Passo 2** - Surgem três novas relações de cardinalidade 1 (do lado da entidade antiga) para N (do lado da nova entidade). 
**Passo 3** - Decompõe-se os três relacionamentos 1:N.
**Passo 4** - Deve-se definir qual (quais) atributo(s) formará a determinação (ou criar um artificial)

Veja a seguir o exemplo do Mestre Ari: 

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_9.png">


### Regra Agregação 

1. Decomponha a relação dentro da Agregação; 
2. Ligue a entidade externa à agregação com a nova entidade;
3. Decomponha o relacionamento que existia fora da agregação;

<div align='center'>
    <img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_10.png">
    <img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_11.png">
</div>


### Regra Particionamento

I. Quebra-se o particionamento e surgem duas novas entidades ligadas à partição principal, por dois novos relacionamentos 1:1.
II. O atributo determinante da partição principal se repete nas novas entidades, também como atributos determinantes.

<img src="https://raw.githubusercontent.com/charlon-156/MySQL/main/img/img_12.png">

# References

- OLIVEIRA, Ari Barreto. **"Conhecendo Banco de Dados: Modelagem de dados"**;
- SETZER, Valdemar W. **"Bancos de Dados"**, Editora Edgard Blucher LTDA, 1989.
- SILBERSCHATZ, Abraham.Horth, Henry F., Sudarshan. S. **"Sistema de Bancos de Dados"**.Makron Books. 