/*
AULA 10 - INSERT E DELETE
ATIVIDADE 12
Script 8 - TB_Funcion
DATA: 16/03/2021
*/

--Script Inicial
--Por Leonardo Furtado

--Eliminar Tables
Drop Table If Exists TB_Funcion

--Criacao da tabela Funcion
Create Table TB_Funcion
(
   ID_Funcion  Int Identity (1,1),
   Nm_Funcion  Varchar(200) Not Null,
   Vl_Salario  Numeric(8,2) Not Null,
   Dt_Admissao Date Default GetDate(),
   Nr_Telefone Numeric(11) Not Null,
   St_Ativo    Varchar(1) Default 'A',

   Primary Key (ID_Funcion),
);

--Inserir 3 funcionarios
Insert Into TB_Funcion(Nm_Funcion, Vl_Salario, Dt_Admissao, Nr_Telefone) Values ('Isabella', 1500, '2020-09-26', 11905412323);
Insert Into TB_Funcion(Nm_Funcion, Vl_Salario, Dt_Admissao, Nr_Telefone) Values ('Rodrigo', 2000, '2021-01-15', 11974563125);
Insert Into TB_Funcion(Nm_Funcion, Vl_Salario, Dt_Admissao, Nr_Telefone) Values ('Paulo', 1980, '2020-12-14', 11963352214);
 
--Exclusão lógica
Update TB_Funcion
    Set St_Ativo = 'I'
	Where ID_Funcion = 1;

--Adicionar aumento de 10% para o ID 2
Update TB_Funcion
    Set Vl_Salario = Vl_Salario * 1.10
	Where ID_Funcion = 2;

--Apagar fisicamente o ID 3
Delete From TB_Funcion
    Where ID_Funcion = 3;

--Exibição
SELECT * FROM TB_Funcion;
