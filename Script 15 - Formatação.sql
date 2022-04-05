/*
AULA 13 - FUNCS
ATIVIDADE 14
Script 15 - Formatação
DATA: 25/03/2021

REALIZAR UM SCRIPT DE 3 REGISTROS E FAZER A FORMATAÇÃO DO:
-> NOME (MAIUSC)
-> CPF (FORMATADO)
*/

Drop Table If Exists TB_Cliente

Create Table TB_Cliente
(
   ID_Cliente  Int Identity(1,1),
   Nm_Cliente  VARCHAR(300) Not Null,
   Nr_CPF      Numeric(11) Not Null,

   Primary Key (ID_Cliente)
);

Insert Into TB_Cliente(Nm_Cliente, Nr_CPF) Values ('Marcos', 51724976823);
Insert Into TB_Cliente(Nm_Cliente, Nr_CPF) Values ('Diego ', 51724976555);
Insert Into TB_Cliente(Nm_Cliente, Nr_CPF) Values ('Ana   ', 51788976823);

SELECT  UPPER(Nm_Cliente) AS Nm_Cliente,
		SUBSTRING(CONVERT(VARCHAR(11), Nr_CPF), 1, 3) + '.' +
		SUBSTRING(CONVERT(VARCHAR(11), Nr_CPF), 4, 3) + '.' +
		SUBSTRING(CONVERT(VARCHAR(11), Nr_CPF), 7, 3) + '-' +
		SUBSTRING(CONVERT(VARCHAR(11), Nr_CPF), 10, 2) AS Nr_CPF FROM TB_Cliente
