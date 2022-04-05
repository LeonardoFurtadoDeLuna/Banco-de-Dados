/*
AULA 15 - CORREÇÃO DO TRABALHO
ATIVIDADE 15
Script 18 - TB_Funcionario
DATA: 06/03/2021
*/

--Script Inicial
--Por Leonardo Furtado

--Eliminar Tabela

Drop Table If Exists TB_Funcionario
Drop Table If Exists TB_Cargo

--Criando Tables

Create Table TB_Cargo
(
   ID_Cargo     Int Identity (1,1),
   Nm_Cargo Varchar(100) Not Null,
   Ds_Cargo     Varchar(300) Not Null,
   Vl_Salario   Numeric(8,2) Not Null,
   
   Primary Key (ID_Cargo)
);

Create Table TB_Funcionario
(
   ID_Funcionario       Int Identity (1,1),
   Nm_Funcionario       Varchar(200) Not Null,
   Nr_CPF               Numeric(11) Not Null,
   Nr_ContatoTelefonico Numeric(11) Not Null,
   ID_Cargo             Int Not Null,

   Primary Key (ID_Funcionario),

   Foreign Key (ID_Cargo)
	        References TB_Cargo(ID_Cargo)
);

--Insert
Insert Into TB_Cargo (Nm_Cargo, Vl_Salario, Ds_Cargo) Values ('Analista de Sistemas', 5250.00, 'Analisar');
Insert Into TB_Cargo (Nm_Cargo, Vl_Salario, Ds_Cargo) Values ('Contador', 3300.00, 'Controle do Balanço Patrimonial');
Insert Into TB_Cargo (Nm_Cargo, Vl_Salario, Ds_Cargo) Values ('Auxiliar contábil', 1400.00, 'Auxiliar nas operações contábeis');

Insert Into TB_Funcionario (Nm_Funcionario, Nr_CPF, Nr_ContatoTelefonico) Values ('Caio', 14212312314, 11974563257);
Insert Into TB_Funcionario (Nm_Funcionario, Nr_CPF, Nr_ContatoTelefonico) Values ('Duda', 42123174514, 11945633257);
Insert Into TB_Funcionario (Nm_Funcionario, Nr_CPF, Nr_ContatoTelefonico) Values ('Mara', 14217896314, 11989652120);

--Update
Update TB_Cargo 
Set Vl_Salario = 1.650
Where ID_Cargo = 3;

Update TB_Funcionario 
Set Nr_ContatoTelefonico = 11948954593
Where ID_Cargo = 2;

--Select
Select Func.Nm_Funcionario,
       Cargo.Nm_Cargo
	From TB_Funcionario AS Func
	Inner Join TB_Cargo AS Cargo
	  On Func.ID_Funcionario = Cargo.ID_Cargo;

--Delete
Delete From TB_Funcionario
   Where ID_Funcionario = 1;



