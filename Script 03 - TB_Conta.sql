/*
AULA 07 - PRIMEIROS PASSOS
ATIVIDADE 9
Script 3 - TB_Conta
DATA: 02/03/2021
*/

--Script Inicial
--Por Leonardo Furtado 

--Eliminação das tabelas
Drop Table If Exists TB_Conta;
Drop Table If Exists TB_Empresa;
Drop Table If Exists TB_Banco;
Drop Table If Exists TB_Agencia;

--Criação das tabelas
Create Table TB_Empresa
(
   ID_Empresa Int Identity(1,1),
   Nm_Empresa Varchar(200) Not Null,

   Primary Key(ID_Empresa)
);

Create Table TB_Agencia
(
   Nr_Agencia Int Not Null,
   Nm_Agencia Varchar(200) Not Null,

   Primary Key(Nr_Agencia)
);

Create Table TB_Banco
(
   Cd_Banco Int Not Null,
   Nm_Banco Varchar(200) Not Null,

   Primary Key(Cd_Banco)
);

Create Table TB_Conta
(
   Nr_Conta   Int Identity(1,1),
   ID_Empresa Int Not Null, 
   Nr_Agencia Int Not Null,
   Cd_Banco   Int Not Null,

   Foreign Key (ID_Empresa)
           References TB_Empresa(ID_Empresa),

   Foreign Key (Nr_Agencia)
           References TB_Agencia(Nr_Agencia),

   Foreign Key (Cd_Banco)
           References TB_Banco(Cd_Banco)
);



