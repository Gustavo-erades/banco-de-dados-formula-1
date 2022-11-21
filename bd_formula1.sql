/* banco de dados */
create database db_formula1;
use db_formula1;
create table paises(
	codigo int not null,
    nome varchar (30),
    primary key (codigo)
);
create table equipes(
	sigla varchar (3) not null,
    nome varchar (30) not null,
    cod_pais int not null,
    primary key (sigla),
    foreign key (cod_pais) references paises(codigo)
);
create table pilotos(
	numero int not null,
	nome varchar (30) not null,
    sigla_equipe varchar (3) not null,
    cod_pais int not null,
    primary key (numero),
    foreign key (cod_pais) references paises(codigo),
    foreign key (sigla_equipe) references equipes(sigla)
);
create table corridas(
	sigla_gp varchar(3) not null,
    nome_gp varchar (30) not null,
    cod_pais int,
    qtd_voltas int,
    primary key (sigla_gp),
    foreign key (cod_pais) references paises(codigo)
);
create table participantes(
	sigla_gp varchar (3),
    num_piloto int,
    posicao_largada int,
    primary key (sigla_gp, num_piloto),
    foreign key (sigla_gp) references corridas(sigla_gp),
    foreign key (num_piloto) references pilotos(numero)
);
insert into paises values (55, "Brasil");
insert into paises values (39, "Italia");
insert into paises values (33, "França");
insert into paises values (81, "Japão");
insert into paises values (52, "México");

insert into equipes values ("McL","McLaren",55);
insert into equipes values ("Wll","Williams",55);
insert into equipes values ("Btt","Benetton",55);
insert into equipes values ("MP","MP Motorsport",55);
insert into equipes values ("Alt","AlphaTauri",39);
insert into equipes values ("Al","Alpine",39);
insert into equipes values("Ma","Marussia",39);
insert into equipes values ("Sa","Sauber",33);
insert into equipes values ("DR","Dragon Racing",33);
insert into equipes values ("RBr","Red Bull Racing",52);

insert into pilotos values(1, "Ayrton Senna","McL",55);
insert into pilotos values(2, "Felipe Massa","Wll",55);
insert into pilotos values(3, "Nelson Piquet","Btt",55);
insert into pilotos values(4, "Rubens Barrichello","Wll",55);
insert into pilotos values(5, "Felipe Drugovich","MP",55);
insert into pilotos values(6, "Pierre Gasly","Alt",39);
insert into pilotos values(7, "Esteban Ocon","Al",39);
insert into pilotos values(8, "Jules Bianchi","Ma",39);
insert into pilotos values(9, "Antonio Giovinazzi","Sa",33);
insert into pilotos values(10, "Nicola Larini","DR",33);
insert into pilotos values(11, "Yuki Tsunada","Alt",81);
insert into pilotos values(12, "Sergio Pérez","RBr",52);

insert into corridas values("gpB","Interlagos",55,15);
insert into corridas values("gpI","Monza",39,11);
insert into corridas values("gpF","Paul Ricard",33,9);
insert into corridas values("gpJ","Suzuka",81,53);
insert into corridas values("gpM","Hermanos Rodríguez",52,71);

insert participantes values ("gpB",1,null);
insert participantes values ("gpB",2,null);
insert participantes values ("gpB",3,null);
insert participantes values ("gpB",4,null);
insert participantes values ("gpB",5,null);
insert participantes values ("gpI",6,null);
insert participantes values ("gpI",7,null);
insert participantes values ("gpI",8,null);
insert participantes values ("gpF",9,null);
insert participantes values ("gpF",10,null);
insert participantes values ("gpJ",11,null);
insert participantes values ("gpM",12,null);

/* querys */
select nome
from paises
where nome like "b%" "%l";

select pilotos.nome, paises.nome 
from pilotos join paises
on  pilotos.cod_pais = paises.codigo
where pilotos.cod_pais=55 or pilotos.cod_pais=39 or pilotos.cod_pais=33
order by paises.nome, pilotos.nome asc;

select nome
from pilotos
order by pilotos.nome asc;

select nome_gp as Gran_pix, qtd_voltas as voltas
from corridas
order by Gran_pix asc;

select pilotos.nome, paises.nome 
from pilotos join paises
on pilotos.cod_pais = paises.codigo
order by paises.nome, pilotos.nome asc;

alter table pilotos add salario double;

update pilotos
set salario=1650000
where pilotos.numero=1;
update pilotos
set salario=5300000
where pilotos.numero=2;
update pilotos
set salario=5500000
where pilotos.numero=3;
update pilotos
set salario=null
where pilotos.numero=4;
update pilotos
set salario=36300000
where pilotos.numero=5;
update pilotos
set salario=76000000
where pilotos.numero=6;
update pilotos
set salario=2048000
where pilotos.numero=7;
update pilotos
set salario=668000
where pilotos.numero=8;
update pilotos
set salario=757220000
where pilotos.numero=9;
update pilotos
set salario=null
where pilotos.numero=10;
update pilotos
set salario=750000
where pilotos.numero=11;
update pilotos
set salario=8000000
where pilotos.numero=12;

select pilotos.nome as nome, pilotos.salario as salario
from pilotos
where salario between 70000 and 100000;

select avg(salario), paises.codigo 
from pilotos join paises
on paises.codigo = pilotos.cod_pais
group by pilotos.cod_pais;

select nome, salario
from pilotos
order by salario asc;






