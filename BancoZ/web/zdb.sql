drop database if exists zdb;
create database zdb;
use zdb;

show tables;
select *from usuarios;
select *from contas;

drop table if exists perfil;
create table if not exists perfil(
id int not null auto_increment primary key,
codigo int not null, descricao_perfil varchar(20)
);

drop table if exists funcoes;
create table funcoes(
id int not null auto_increment primary key,
id_perfil int not null,
operador_admin varchar(20) not null,
cliente varchar(20) not null 
);
alter table funcoes
add constraint foreign key(id_perfil) references perfil(id);

drop table if exists contas;
create table if not exists contas(
id int not null auto_increment primary key,
agencia varchar(20) not null,
conta_numero varchar(20)
);

drop table if exists usuarios;
create table if not exists usuarios(
id int not null auto_increment primary key,
id_funcao int not null,
nome varchar(40) not null,
cpf varchar(14) not null,
senha varchar(8) not null,
endereco varchar(40)
);
alter table usuarios
add constraint foreign key (id_funcao) references funcoes(id);

drop table if exists saldo;
create table if not exists saldo(
id int not null auto_increment primary key,
saldo_disponivel double(10, 2) not null,
data_saldo datetime
);

drop table if exists extrato;
create table if not exists extrato(
id int not null auto_increment primary key,
lancamentos varchar(20) not null,
data_lancamento datetime not null,
valor_lancamento double(10, 2) not null,
data_extrato datetime not null,
saldo_anterior double(10, 2) not null,
saldo_disponivel_dia double(10, 2) not null
);

drop table if exists deposito;
create table if not exists deposito(
id int not null auto_increment primary key,
data_deposito datetime not null,
conta_origem varchar (20) not null,
conta_destino varchar (20) not null,
valor_deposito double(10, 2) not null
);

drop table if exists saque;
create table if not exists saque(
id int not null auto_increment primary key,
data_saque datetime not null,
valor_saque double(10, 2)
);

drop table if exists transferencia;
create table if not exists transferencia(
id int not null auto_increment primary key,
data_transferencia datetime,
conta_origem varchar(20) not null,
conta_destino varchar(20) not null,
favorecido varchar(40) 
);

drop table if exists investimento;
create table if not exists investimento(
id int not null auto_increment primary key,
data_investimento datetime,
tipo_investimento varchar(25) not null,
valor_investimento double(10, 2) not null 
);
