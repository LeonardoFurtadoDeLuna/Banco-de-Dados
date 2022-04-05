/*
AULA 08 - MAIS PRÓXIMO DO REAL
ATIVIDADE 10
Script 4 - TB_Incidente
DATA: 09/03/2021
*/

-- Script Inicial
-- Por Leonardo Furtado

-- Eliminar Tables
Drop Table If Exists TB_Incidente;
Drop Table If Exists TB_Categoria;
Drop Table If Exists TB_Severidade;
Drop Table If Exists TB_Equipamento;
Drop Table If Exists TB_Usuario;
Drop Table If Exists TB_Tecnico;

-- Criação das tabela
Create Table TB_Categoria
(
   ID_Categoria Int Identity (1,1),
   Ds_Categoria Varchar(300) Not Null,

   Primary Key (ID_Categoria)
);

Create Table TB_Usuario
(
   ID_Usuario Int Identity (1,1),
   Nm_Usuario Varchar(300) Not Null,

   Primary Key (ID_Usuario)
);

Create Table TB_Severidade(
   ID_Severidade Int Identity (1,1),
   Ds_Severidade Varchar(300) Not Null,

   Primary Key (ID_Severidade)
);

Create Table TB_Equipamento
(
   ID_Equipamento Int Identity (1,1),
   Ds_Equipamento Varchar(300) Not Null,

   Primary Key (ID_Equipamento)
);

Create Table TB_Tecnico
(
   ID_Tecnico Int Identity (1,1),
   Nm_Tecnico Varchar(300) Not Null,
   Nr_NivelTecnico Int Not Null,

   Primary Key (ID_Tecnico)
);

Create Table TB_Incidente
(
   ID_Incidente Int Identity (1,1),
   ID_Severidade Int Not Null,
   ID_Equipamento Int Not Null,
   ID_Categoria Int Not Null,
   Ds_Incidente Varchar(300) Not Null,
   Dt_Criacao Date Default GetDate(), 
   ID_Tecnico Int Not Null,
   ID_Usuario Int Not Null,

   Primary Key (ID_Incidente),
   Foreign Key (ID_Categoria)
           References TB_Categoria(ID_Categoria),
   Foreign Key (ID_Usuario)
           References TB_Usuario(ID_Usuario),
   Foreign Key (ID_Severidade)
           References TB_Severidade(ID_Severidade),
   Foreign Key (ID_Equipamento)
           References TB_Equipamento(ID_Equipamento),
   Foreign Key (ID_Tecnico)
           References TB_Tecnico(ID_Tecnico),
);
