DROP DATABASE IF EXISTS EmpresaMultinacional;
CREATE DATABASE EmpresaMultinacional;
USE EmpresaMultinacional;

create table Produto(
	Nome_Prod varchar (100),
	Numero_de_Serie_Prod varchar (8),
    Preço_Prod int (10),
    Tipo_Prod varchar (20),
    
    primary key (Numero_de_Serie_Prod)
);

create table Sede(
	Nome_Sede varchar (100),
    Endereço_Sede varchar (100),
    Telefone_Sede varchar (10),
    CNPJ_Sede char (14),
    NIT char (11),
    Numero_de_Serie_Prod varchar (8),
    
	
    foreign key (Numero_de_Serie_Prod) references Produto (Numero_de_Serie_Prod),
    primary key (CNPJ_Sede)
);

create table Setor(
	Nome_Setor varchar(100),
	CNPJ_Sede char(14),
	Codigo_Setor varchar(10),
	Numero_de_Serie_Prod varchar(8),
    foreign key (CNPJ_Sede) references Sede (CNPJ_Sede),
    foreign key (Numero_de_Serie_Prod) references Produto (Numero_de_Serie_Prod),
    primary key (Codigo_Setor)
);

create table Empregado(
	Codigo_Emp varchar(10),
    Nome_Emp varchar (100),
    Sobrenome_Emp varchar (80),
    CNPJ_Sede char (14),
    Endereço_Emp varchar (100),
    CPF_Emp char(11),
    RG_Emp char (11),
    Idade_Emp int (20),
    Email_Emp varchar (100),
    Salario int (50),
    foreign key (CNPJ_Sede) references Setor(CNPJ_Sede),
	primary key (Codigo_Emp)
);

create table Fornecedor(
	Nome_For varchar (100),
    Sobrenome_For varchar (80),
    Endereço_For varchar (100),
    CNPJ_For char (14),
    RG_For char (11),
    Idade_For int (20),
    Email_For varchar(100),
    Numero_de_Serie_Prod varchar(8),
    
    primary key (CNPJ_For),
    foreign key (Numero_de_Serie_Prod) references Produto (Numero_de_Serie_Prod)
);

create table Cliente (
	Codigo_Cl varchar(10),
	Nome_Cl varchar(100),
	Sobrenome_Cl varchar(80),
	Endereço_Cl varchar(100),
    CPF_Cl char(11),
    Idade_Cl varchar(20),
    Email_Cl varchar(100),
    
	primary key (Codigo_Cl)
);


create table Acionista(
	Nome_Acio varchar(100),
    Sobrenome_Acio varchar(80),
    Idade_Acio varchar(20),
    CPF_Acio varchar(11),
    RG_Acio varchar(11),
    Email_Acio varchar(100),
    Investimento_Acio int(45),
    Codigo_Acio char(10),
    
    primary key (Codigo_Acio)
);

create table Venda(
	Codigo_Cl varchar(10),
	Quantidade_Vend int (10),
    Codigo_Vend varchar (10),
    Numero_de_Serie_Prod varchar(8),
    
    primary key (Codigo_Vend),
    foreign key (Numero_de_Serie_Prod) references Produto (Numero_de_Serie_Prod),
    foreign key (Codigo_Cl) references Cliente (Codigo_Cl)
);
/*População do banco de dados*/

/*Produtos*/
insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("F-22_Raptor",68259178,100000000,"Aeronave_Militar");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Airbus", 26437952, 10000000,"Aeronave_Comercial");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Avionica",13458765,500000,"Peça_Aer_Militar");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Motor_F_22",98075625,5000000,"Peça_Aer_Militar");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Turbina",92463172,900000,"Peça_Aer_Comercial");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Asa",07689522,1000000,"Peça_Aer_Comercial");

insert into Produto (Nome_Prod, Numero_de_Serie_Prod, Preço_Prod, Tipo_Prod)
values("Metal",20896280,5000,"Materia-Prima");

/*Sedes*/
insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_Nova_York","Nova_York_EUA_Rua_Corinthians_24",3333333333,12121212121212,22222222222,68259178);

insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_Frankfurt","Frankfurt_Alemanha_Rua_João_35",4333333334,13131313131313,33333333333,26437952);

insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_Munique","Munique_Alemanha_Rua_Paulo_Cesar_35",1584775649,23232323232323,44444444444,92463172);

insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_Berlim","Berlim_Alemanha_Rua_da_virtude_25",2578691239,43434343434343,55555555555,07689522);

insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_São_Paulo","São_Paulo_Brasil_Rua_Dom_Pedro_Primeiro_75",3865972468,45454545454545,66666666666,13458765);

insert into Sede(Nome_Sede, Endereço_Sede, Telefone_Sede, CNPJ_Sede, NIT, Numero_de_Serie_Prod)
values ("Sede_De_MinasGerais","Minas_Gerais_Brasil_Rua_Pedro_Alvares_Cabral_155",4578963212,65656565656565,77777777777,98075625);

/*Setores*/
insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Aer_Militares_EUA",12121212121212,000000000,68259178);

insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Aer_Comerciais_Alemanha",13131313131313,0101010101,26437952);

insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Peças_Comerciais_Munique",23232323232323,0202020202,92463172);

insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Peças_Comerciais_Berlim",43434343434343,0303030303,07689522);

insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Peças_Militares_São_Paulo",45454545454545,0404040404,13458765);

insert into Setor(Nome_Setor,CNPJ_Sede,Codigo_Setor,Numero_de_Serie_Prod)
values("Setor_De_Peças_Militares_Minas_Gerais",65656565656565,0505050505,98075625);

/*Empregados*/
insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp, CNPJ_Sede, Endereço_Emp,CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario) 
values(111111111,"Gabriel","Sposito",12121212121212,"Nova_York_EUA_Rua_Boulevard_19",22222222222,33333333333,20,"gabrielsconciani@gmail.com",100000);

insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp,CNPJ_Sede, Endereço_Emp,CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario)
values(1111111112,"Thomas","Frentzel",13131313131313,"Frankfurt_Alemanha_Rua_Couves_21",22222222453,33333333334,19,"thomasfrentzel@gmail.com",90000);

insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp,CNPJ_Sede, Endereço_Emp, CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario)
values(1111111123,"Pedro","Amadeu",23232323232323,"Munique_Alemanha_Rua_Senhora_das_Graças_14",22222222873,33333333154,19,"pedroamadeu@gmail.com",90000);

insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp,CNPJ_Sede, Endereço_Emp,CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario)
values(2756899657,"Theo","Cesar",43434343434343,"Berlim_Alemanha_Rua_da_Pedreira_17",23252222927,79333333189,19,"theocesar@gmail.com",90000);

insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp,CNPJ_Sede, Endereço_Emp,CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario)
values(8759861412,"Lucas","Bastos",45454545454545,"São_Paulo_Brasil_Rua_Oscar_Niemeyer_158",74758212392,24586598712,25,"lucasbastos@gmail.com",90000);

insert into Empregado(Codigo_Emp, Nome_Emp, Sobrenome_Emp,CNPJ_Sede, Endereço_Emp,CPF_Emp, RG_Emp, Idade_Emp,Email_Emp, salario)
values(9856827521,"Renam","Belem",65656565656565,"Minas_Gerais_Brasil_Rua_Nossa_Senhora_Aparecida_359",86793554988,57286674144,22,"renambelem@gmail.com",80000);

/*Fornecedores*/

insert into Fornecedor(Nome_For,Sobrenome_For,Endereço_For,CNPJ_For,RG_For,Idade_For,Email_For,Numero_de_Serie_Prod)
values("Clayton","Celso","Londres_Reino_Unido_Rua_da_Liberdade_202",25783491973715,46581895925,45,"claytoncelso@gmail.com",20896280);

/*Clientes*/
insert into Cliente (Codigo_Cl, Nome_Cl, Sobrenome_Cl, Endereço_Cl, Idade_Cl, Email_Cl)
values(1549856547,"Leonardo","Silva","São_Paulo_Brasil_Rua_Dom_João_IV_712,",20,"leonardosilva@gmail.com");

insert into Cliente (Codigo_Cl, Nome_Cl, Sobrenome_Cl, Endereço_Cl, Idade_Cl, Email_Cl)
values(6428374526,"Pedro","Biachini","Los_Angeles_EUA_Rua_Grove_Street",19,"pedrobinchini@gmail.com");

insert into Cliente (Codigo_Cl, Nome_Cl, Sobrenome_Cl, Endereço_Cl, Idade_Cl, Email_Cl)
values(7693819462,"Karim","Benzema","França_Paris_Rua_Lepic_99",34,"karimbenzema@gmail.com");

insert into Cliente (Codigo_Cl, Nome_Cl, Sobrenome_Cl, Endereço_Cl, Idade_Cl, Email_Cl)
values(8867489962,"Vinicius","Junior","Espanha_Madrid_Rua_Gran_Via_143",21,"viniciusjunior@gmail.com");

/*Acionistas*/
insert into Acionista(Nome_Acio, Sobrenome_Acio, Idade_Acio, CPF_Acio, RG_Acio, Email_Acio, Investimento_Acio, Codigo_Acio)
values("Telma","Aparecida",49,43891673478,76183456489,"telmaaparecida@gmail.com",2000000,4789687531);

insert into Acionista(Nome_Acio, Sobrenome_Acio, Idade_Acio, CPF_Acio, RG_Acio, Email_Acio, Investimento_Acio, Codigo_Acio)
values("Carlos","Sainz",32,86127456498,43157632799,"carlossainz@gmail.com",1900000,7634218965);

/*Vendas*/
Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(8867489962,3,0947305429,26437952);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(7693819462,5,2807521902,26437952);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(8867489962,6,92463172,92463172);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(8867489962,5,09584725,07689522);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(6428374526,5,7604932547,68259178);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(7693819462,2,7260057504,07689522);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(1549856547,3,7260057514,68259178);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(6428374526,4,9502407894,13458765);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(1549856547,2,8304756205,98075625);

Insert into Venda(Codigo_Cl,Quantidade_Vend,Codigo_Vend,Numero_de_Serie_Prod)
values(6428374526,4,8507430868,98075625);



/*SELECT das perguntas*/

/*1)Quais setores produzem peças para aeronaves comerciais?*/

SELECT * FROM Setor
WHERE Nome_Setor IN ("Setor_De_Peças_Comerciais_Munique","Setor_De_Peças_Comerciais_Berlim"); 

/*2)Quais setores produzem peças para aeronaves de uso militar?*/

SELECT * FROM Setor
WHERE Nome_Setor IN ("Setor_De_Peças_Militares_São_Paulo","Setor_De_Peças_Militares_Minas_Gerais");

/*3)Quantos Acionistas a empresa possui?*/

select count(*) from Acionista;

/*4)Qual é o Acionista que mais investiu na empresa?*/

select Nome_Acio, Sobrenome_Acio, Codigo_Acio, Investimento_Acio
from Acionista
as ordem
group by Nome_Acio, Sobrenome_Acio, Codigo_Acio
order by COUNT(*) desc
limit 1;

/*5)Qual é o setor que realiza a montagem das aeronaves comerciais?*/
SELECT Codigo_Setor, Nome_Setor FROM Setor
WHERE Codigo_Setor = 0101010101;
/*6)Quais são os fornecedores que fornecem matéria-prima para a empresa?*/

/*Todos os fornecedores fornecem matéria-prima*/

SELECT count(*) FROM Fornecedor;

/*7)Quantos funcionários possui a empresa?*/

SELECT count(*) FROM Empregado;

/*8)Quantos Clientes possui a empresa?*/

SELECT count(*) FROM Cliente;


/*9)Quantas sedes possui a Empresa?*/

SELECT count(*) FROM Sede;

/*10)Quantos setores possui a empresa?*/

SELECT count(*) FROM Setor;

/*11)Qual cliente compra mais aeronaves comerciais? */

SELECT Nome_Cl, Numero_de_Serie_Prod
FROM Cliente, Produto
WHERE Nome_Cl = "Karim" and Numero_de_Serie_Prod = 26437952;

/*12)Qual cliente compra mais aeronaves militares?*/

SELECT Nome_Cl, Numero_de_Serie_Prod
From Cliente, Produto
WHERE Nome_Cl = "Pedro" and Numero_de_Serie_Prod = 68259178; 

/*13)Quantos airbus a empresa vendeu no total?*/
SELECT SUM(Quantidade_Vend) FROM Venda
WHERE Numero_de_Serie_Prod = 26437952;

/*14)Qual é o numero de produtos que a empresa oferta?*/

select count(*) from Produto;

/*15)Qual é a sede que produz aeronaves militares?*/
SELECT CNPJ_Sede, Nome_Sede FROM Sede
WHERE CNPJ_Sede = 12121212121212;
/*16)Qual é a sede que produz aeronaves comerciais?*/

SELECT CNPJ_Sede, Nome_Sede FROM Sede
WHERE CNPJ_Sede = 13131313131313;


/*17)Quanto a empresa vendeu no total?*/

select count(*) Quantidade_Vend from Venda;

/*18)Quanto é o total gasto no pagamento de todos os funcionários da empresa?*/

SELECT SUM(salario) FROM Empregado;

/*19)Qual Funcionário possui o maior salario na empresa?*/

select Nome_Emp, Sobrenome_Emp, salario
from Empregado
as ordem
group by Nome_Emp, Sobrenome_Emp
order by salario desc
limit 1;

/*20)Qual é o número de fornecedores da Empresa?*/

/*Todos os Fornecedores Fornecem Materia-Prima*/
select count(*) from Fornecedor;

/*21)Qual empregado tem o menor salario da empresa?*/

select Nome_Emp, Sobrenome_Emp, salario
from Empregado
as ordem
group by Nome_Emp, Sobrenome_Emp
order by salario asc
limit 1;

/*22)Qual é o produto mais caro da empresa?*/

SELECT Nome_Prod FROM Produto 
WHERE Nome_Prod = "F-22_Raptor";