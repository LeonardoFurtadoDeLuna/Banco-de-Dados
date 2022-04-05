/*
AULA 09 - SELECT
EXPLICAÇÃO
Script 6 - SELECT
DATA: 11/03/2021
*/

--Consulta de dados

/*
Select <campo>
   From <tabela>
   [ Where <condição> ]

*/

Drop Table If Exists TB_Cliente;
Go

Create Table TB_Cliente 
(
   ID_Cliente  Int Identity(1,1),
   Nm_Cliente  Varchar(200),
   ID_UF       Varchar(2) Default 'SP',
   
   Primary Key (ID_Cliente)
);

-- Inserts
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('Joao', 'SP');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('Maria', 'MG');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('Marcos', 'SP');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('Jose', 'BA');

-- Exibição
Select ID_Cliente, Nm_Cliente, ID_UF
From TB_Cliente

Select ID_Cliente As Codigo,
       Nm_Cliente As Nome,
       ID_UF      As Estado
  From TB_Cliente
  Where ID_UF = 'SP'