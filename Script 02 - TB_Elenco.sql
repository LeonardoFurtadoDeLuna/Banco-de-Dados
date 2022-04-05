/*
AULA 06 - T-SQL
ATIVIDADE 8
Script 2 - TB_Elenco
DATA: 25/02/2021
*/

--Script Inicial
--Por Leonardo Furtado

--Eliminar Tables
Drop Table If Exists TB_Ator;
Drop Table If Exists TB_Filme;
Drop Table If Exists TB_Elenco;

--Criação da tabela Ator
Create Table TB_Ator
(
   ID_Ator Int Identity (1,1),
   Nm_Ator Varchar(200) Not Null,

   Primary Key (ID_Ator)
);

-- Criação da tabela Filme
Create Table TB_Filme
(
   ID_Filme            Int Identity (1,1),
   Nm_Ator             Varchar(200) Not Null,
   Ds_TituloOriginal   Varchar(200) Not Null,
   Ds_TituloBr         Varchar(200) Not Null,
   Dt_Lancamento       Date Not Null,
   
   Primary Key (ID_Filme),
);

-- Criacao da tabela Elenco
Create Table TB_Elenco
(
   ID_Filme Int Not Null,
   ID_Ator  Int Not Null,

   Primary Key (ID_Filme, ID_Ator),

   Foreign Key (ID_Filme)
      References TB_Filme(ID_Filme),

   Foreign Key (ID_Ator)
      References TB_Ator(ID_Ator)
);


     
  