/*
AULA 06 - T-SQL
ATIVIDADE 7
Script 1 - TB_CC
DATA: 25/02/2021
*/

-- Script Inicial
-- por Leonardo Furtado de Luna


-- Eliminar Tables
Drop Table If Exists TB_Correntista;
Drop Table If Exists TB_CC;
Drop Table If Exists TB_Agencia;


-- Criação das Tabelas
Create Table TB_Correntista
(
    ID_Correntista  Int Identity(1, 1),
	Nr_Telefone     Numeric(11) Not Null,
	Nr_CPF          Numeric(11) Not Null,
	
	Primary Key (ID_Correntista)
);

Create Table TB_Agencia
(
    Nr_Agencia  Int Identity(1, 1),
	Nm_Agencia  Varchar(200) Not Null,
	
	Primary Key (Nr_Agencia)
);

Create Table TB_CC
(
    Nr_CC           Int Identity(1,1),
	Nr_Agencia      Int Not Null,
	ID_Correntista  Int Not Null,
	Vl_Saldo        Numeric(8,2) Not Null,
	
	Primary Key (Nr_CC),

	Foreign Key(Nr_Agencia)
	    References TB_Agencia(Nr_Agencia),

	Foreign Key(ID_Correntista)
	    References TB_Correntista(ID_Correntista)
);
