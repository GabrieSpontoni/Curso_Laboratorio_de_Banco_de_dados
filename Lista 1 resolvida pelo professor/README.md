# LISTA 1 – Modelagem Entidade Relacionamento/Estendido e Implementação Banco de Dados MySQL.
Universidade Federal de Mato Grosso do Sul Faculdade de Computação – FACOM Laboratório de Banco de Dados - 2021-1 Prof. Márcio Silva LISTA 1 – Modelagem Entidade Relacionamento/Estendido e Implementação Banco de Dados MySQL. 

1. A empresa XYZ pretende armazenar os dados sobre os seus projetos e sobre os funcionários lotados nesses projetos. Cada projeto possui uma sigla e um nome. A sigla de um projeto o identifica unicamente em relação a outros projetos. Cada funcionário tem um código de matrícula, um CPF e um nome. Além disso, um funcionário pode estar lotado em vários projetos, bem como um projeto pode contar com a participação de vários funcionários. Baseado nessas informações, modele o Diagrama Entidade-Relacionamento (DER) para o problema proposto.

2. Uma concessionária que trabalha com venda de veículos deseja criar uma base de dados para o seu negócio. Essa base deve atender aos seguintes requisitos: 

   **a**. Para qualquer veículo, devemos saber o número do chassi, número da placa, cor, ano de fabricação, quilometragem, marca e modelo. 

   **b**. Sobre marca e modelo, basta sabermos seus códigos e nomes. 

   **c**. Todo carro pertence a um modelo e este modelo pertence a uma marca.

   **d**. Uma pessoa pode assumir um dos seguintes papéis em relação a concessionária: corretor ou comprador. 

   **e**. Sobre o comprador do veículo, tem-se CPF, nome, estado civil e, se for casado, os dados do cônjuge (como nome e CPF). 

   **f**. Sobre os corretores, tem-se número da matrícula, nome e data de admissão. 

   **g**. Um corretor negocia com um comprador a venda de um veículo. Sobre a venda 

   **h**. são necessárias as seguintes informações: data, valor da venda e valor da comissão do corretor. 

3. Os alunos da Disciplina de Banco de Dados foram convidados para projetar o banco de dados que será utilizado para gerenciar as atividades realizadas durante o evento da SBC 2020. Para isso, crie um DER capaz de representar os seguintes requisitos: 

   **a**. Cada atividade do evento possui: código, descrição, quantidade máxima de participantes e valor; 

   **b**. Há dois tipos de pessoas no evento: participantes e ministrantes de atividades; 

   **c**. Todas essas pessoas possuem os seguintes atributos em comum: cpf, nome, data de nascimento, endereço, telefone e email; 

   **d**. O endereço é composto de rua, número, complemento, bairro, cidade, UF e CEP; 

   **e**. É possível cadastrar vários telefones para uma mesma pessoa. 

   **f**. Cada atividade só pode ter um único ministrante; 

   **g**. É necessário armazenar a data de pagamento em que cada participante pagou cada uma de suas atividades. Um único participante pode pagar cada uma de suas atividades em datas diferentes; 

4. Crie um DER para representar os dados da empresa Xing-Ling de Campo Grande que tem seus dados organizados da seguinte forma: 

   **a**. Cada empregado trabalha em um único departamento da empresa e possui: matrícula, cpf, nome, endereço, telefone e email. 

   **b**. Funcionários são diretamente chefiados por um único supervisor que também é um funcionário. É possível haver mais de um supervisor em um mesmo departamento. 

   **c**. Um departamento possui no mínimo 5 funcionários, onde somente um deles é o gerente do departamento. O gerente do departamento também é um funcionário. Além disso, cada departamento possui um código e um nome. Os dependentes dos funcionários devem possuir como atributos: id, nome e data de nascimento. 

   **d**. O salário de um empregado é calculado com base nos seus diversos vencimentos. 

   **e**. Para cada tipo de vencimento, existe uma descrição e o valor correspondente. 

5. Você foi chamado para criar o Diagrama de Entidade-Relacionamento de uma rede de lojas baseado nas informações a seguir. 

   **a**. Cada loja cadastrada no sistema deve possuir um CNPJ, uma sigla e um nome; 

   **b**. O sistema deve permitir o cadastro de dois tipos de clientes: pessoa física e pessoa jurídica. É necessário registrar nome, endereço e telefone de todos os clientes. Cada cliente pessoa física deve ter cadastrado seu CPF. Já os clientes que são pessoas jurídicas devem ter seus CNPJs armazenados; 

   **c**. Cada produto vendido pela loja tem um código que o identifica unicamente, um nome, um valor e uma categoria, que identifica o tipo de produto vendido pela loja; 

   **d**. Cada categoria de produto possui um identificador único e um nome; 

   **e**. Cada compra é realizada em uma data específica por um único cliente em uma determinada loja. Além disso, cada compra tem vários itens. Cada item de compra possui informações sobre o produto, a quantidade comprada daquele produto e o valor unitário do produto comprado;