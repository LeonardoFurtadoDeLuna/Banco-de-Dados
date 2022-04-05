/*
AULA 10 - INSERT E DELETE
EXPLICAÇÃO
Script 10 - EXCLUSÃO LÓGICA
DATA: 16/03/2021
*/

-- Exclusao Lógica

-- 'A' - Ativo // 'I' - Inativo
Drop Table If Exists TB_Cliente;
Go

Create Table TB_Cliente (
   ID_Cliente Int Identity(1,1),
   Nm_Cliente Varchar(100),
   St_Ativo Varchar(1) Default 'A',
   Primary Key (Id_Cliente)
);

Insert Into TB_Cliente(Nm_Cliente) Values ('JOAO');    -- 1
Insert Into TB_Cliente(Nm_Cliente) Values ('MARIA');   -- 2
Insert Into TB_Cliente(Nm_Cliente) Values ('MARCOS');  -- 3

Select ID_Cliente, Nm_Cliente
   From TB_Cliente
   Where St_Ativo = 'A'


-- Joao Eliminado! (logicamente)
-- Não darei Delete!
Update TB_Cliente
   Set St_Ativo = 'I'
 Where ID_Cliente = 1


Select ID_Cliente, Nm_Cliente, St_Ativo
   From TB_Cliente

-- Recuperar
Update TB_Cliente
   Set St_Ativo = 'A'
 Where ID_Cliente = 1

