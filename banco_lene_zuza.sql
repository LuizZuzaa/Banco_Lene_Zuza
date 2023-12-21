create database lene_zuza;
use lene_zuza;
create table cliente (
	id_cliente int auto_increment,
    nome varchar(100) not null,
	cpf char(14) unique not null,
    data_nascimento date not null,
    sexo char(1) not null,
    primary key(id_cliente)
);

create table informacoes_complementar (
	id_cliente int,
    rua varchar(80),
    numero int,
    bairro varchar(80),
    cidade varchar(80),
    telefone varchar(20) not null,
    anotacoes varchar(500),
    primary key(id_cliente),
    foreign key(id_cliente) references cliente(id_cliente)
);

create table atendimento (
	id_cliente int,
    procedimentos_realizados varchar(200),
    valor_atendimento float,
    desconto float,
    indicacao char(1) not null, /* indicacao somente com S ou N */
    id_indicador int unique,
    data_atendimento date not null,
    primary key(id_cliente),
    foreign key(id_cliente) references cliente(id_cliente),
    foreign key(id_indicador) references cliente(id_cliente)
);

create table cera (
	marca_cera varchar(70),
    tipo_cera varchar(50),
    valor float,
    qualidade char(1), /* Qualidade será uma nota de 0 a 5 que a proprietaria terá um controle de qualidade */
    quantidade_estoque varchar(3) /* Quantidade do produto em embalagem fechada no estoque */
);

create table palito (
	marca_palito varchar(70),
	tipo_palito varchar(70),
    valor float,
    qualidade char(1),  /* Qualidade será uma nota de 0 a 5 que a proprietaria terá um controle de qualidade */
    quantidade_estoque varchar(3) /* Quantidade do produto em embalagem fechada no estoque */
);

create table luva (
	id_luva int auto_increment,
	marca_luva varchar(70),
	tipo_luva varchar(70),
    valor float,
    qualidade char(1),  /* Qualidade será uma nota de 0 a 5 que a proprietaria terá um controle de qualidade */
    quantidade_estoque varchar(3), /* Quantidade do produto em embalagem fechada no estoque */
    primary key(id_luva)
);

create table gel (
	marca_gel varchar(70),
    tipo_gel varchar(70),
    valor float,
    qualidade char(1),
    quantidade_estoque varchar(3)
);

/* Inserindo dados na tabela cliente */
insert into cliente(nome, cpf, data_nascimento, sexo) values("Leila", "123.456.789-01", "1988-06-25", "F");
insert into cliente(nome, cpf, data_nascimento, sexo) values("Luiz Fernando", "123.456.789-02", "2003-04-29", "M");
insert into cliente(nome, cpf, data_nascimento, sexo) values("Laiza", "123.456.789-03", "1990-11-27", "F");
insert into cliente(nome, cpf, data_nascimento, sexo) values("Phernanda", "123.456.789-04", "2002-02-22", "F");

select * from cliente; /* mostra a tabela cliente */


insert into informacoes_complementar(id_cliente, rua, numero, bairro, cidade, telefone, anotacoes) 
values(1, "Genreal Osório", 852, "Centro", "Franca", 16912347898, "Cliente com dermatite. Alérgica a cera de breu sabor Hortela.");
insert into informacoes_complementar(id_cliente, rua, numero, bairro, cidade, telefone, anotacoes) 
values (2, "Jamil Jorge Daniel", 208, "Pedreira", "São Paulo", 1191234123, null);
insert into informacoes_complementar(id_cliente, rua, numero, bairro, cidade, telefone, anotacoes) 
values (3, "Conceição de Souza Barbosa", 470, "Jardim Zelinda", "Franca", 1691234123, 
"Cliente tem sensibilidade na pele na parte das axilas, após a depilação fazer hidratação com argila branca");
insert into informacoes_complementar(id_cliente, rua, numero, bairro, cidade, telefone, anotacoes)
values (4, "Wanderley Borsari", 1549, "Parque das frutas", "Indaiatuba", 1691234-1551, null);


insert into atendimento(id_cliente, procedimentos_realizados, valor_atendimento, desconto, indicacao, id_indicacao, data_atendimento) 
values(3, "Sobrancelhas e Axilas", 90, null, "N", null, "2023-01-20");
insert into atendimento(id_cliente, procedimentos_realizados, valor_atendimento, desconto, indicacao, id_indicacao, data_atendimento) 
values(4, "Meia-Perna", 25, null, "S", 2, "2023-07-18");
insert into atendimento(id_cliente, procedimentos_realizados, valor_atendimento, desconto, indicacao, id_indicacao, data_atendimento) 
values (1, "Barra de Acess", 100, 20, "N", 0, "2023-12-18");
insert into atendimento(id_cliente, procedimentos_realizados, valor_atendimento, desconto, indicacao, id_indicacao, data_atendimento) 
values(4, "Axilas e Barra de Acess",120, 15, null, "N", 0, "2023-08-20");


insert into cera(marca_cera, tipo_cera, valor, qualidade, quantidade_estoque) values("DepilBela", "Roll-On", 3.50, "4", "6");
insert into cera(marca_cera, tipo_cera, valor, qualidade, quantidade_estoque) values("Veeter", "Cera de Breu", 25.32, "2", "0");
insert into cera(marca_cera, tipo_cera, valor, qualidade, quantidade_estoque) values("Marroquina", "Cera de Breu", 75, "5", 2);
insert into cera(marca_cera, tipo_cera, valor, qualidade, quantidade_estoque) values("DepilBela", "Cera de Breu", 36.99, "3", 1);


insert into palito(marca_palito, tipo_palito, valor, qualidade, quantidade_estoque) values("Talge", "Abaixador de lingua", 10, "5", "2");
insert into palito(marca_palito, tipo_palito, valor, qualidade, quantidade_estoque) values("Theotos", "Abaixador de lingua", 8.99, "2", "0");
insert into palito(marca_palito, tipo_palito, valor, qualidade, quantidade_estoque) values("Theotos", "Palitos para sanduiches", 46.90, "4", "2");


insert into luva(marca_luva, tipo_luva, valor, qualidade, quantidade_estoque) values("Talge", "Com pó", 54, "5", "3"); /* Inseriri Latex no tipo da luva */
insert into luva(marca_luva, tipo_luva, valor, qualidade, quantidade_estoque) values("G-Techn", "Com pó e Latex", 29.90, "3", "0");
insert into luva(marca_luva, tipo_luva, valor, qualidade, quantidade_estoque) values("Descarpag", "Com pó e Latex", 34.72, "1", "0");


insert into gel(marca_gel, tipo_gel, valor, qualidade, quantidade_estoque) values("DepilBela", "Gel-corporal", 39.99, "4", "1");
insert into gel(marca_gel, tipo_gel, valor, qualidade, quantidade_estoque) values("Hommee", "Gel-corporal", 31.05, "2", "0");
insert into gel(marca_gel, tipo_gel, valor, qualidade, quantidade_estoque) values("Depilsann", "Gel-corporal", 26.20, "2", "0");

/* CONSULTAS NO BANCO */

alter table cliente add quantidade_atendimentos int; /* Adiciona uma coluna que soma os atendimentos daquele cliente */

delete from informacoes_complementar where id_cliente = 4;

select * from cliente order by nome asc; /* Mostrar a tabela cliente ordenado pelo nome */

update luva set tipo_luva = "Com pó e Latex" where id_luva = 1;