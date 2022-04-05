/*
AULA 14 e 15 - TRABALHO
TRABALHO 3
Script 17 - Trabalho 3
DATA: 30/03/2021
*/

-- Script Inicial
-- Por Leonardo Furtado

-- Eliminar Tables
Drop Table If Exists TB_OrdemEntrega;
Drop Table If Exists TB_Pack;
Drop Table If Exists TB_Caminhao;

-- Criação das tabela
Create Table TB_OrdemEntrega(
   ID_OrdemEntrega Int Identity (1,1),
   Dt_OrdemEntrega Date Default GetDate(),
   Qt_VolumeOrdemEntrega Numeric(8,2) Not Null,

   Primary Key (ID_OrdemEntrega)
);

Create Table TB_Caminhao(
   ID_Caminhao Int Identity (1,1),
   Nm_Caminhao Varchar(300) Not Null,
   Nr_Placa Varchar(7) Not Null,
   Nr_AnoFabricacao Int Not Null,
   Qt_VolumeCarga Numeric (8,2) Not Null,

   Primary Key (ID_Caminhao)
);

Create Table TB_Pack(
   ID_Pack Int Identity (1,1),
   Dt_Saida Date Default GetDate(),
   Dt_Chegada Date Default GetDate(),
   Vl_Frete Numeric(8,2) Not Null,
   ID_Caminhao Int Not Null,
   ID_OrdemEntrega Int Not Null,

   Primary Key (ID_Pack),
   Foreign Key (ID_Caminhao)
           References TB_Caminhao(ID_Caminhao),
   Foreign Key (ID_OrdemEntrega)
           References TB_OrdemEntrega(ID_OrdemEntrega)

);