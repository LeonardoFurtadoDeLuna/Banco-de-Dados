/*
AULA 10 - INSERT E DELETE
EXPLICAÇÃO
Script 11 - INSERT
DATA: 16/03/2021
*/

/*
Insert
------
Insert Into Tabela[ ( <campos> ) ] Values (<valores>);

*/

Drop Table If Exists TB_NF;
Drop Table If Exists TB_Cliente;
Go

Create Table TB_Cliente (
   ID_Cliente Int Identity(1,1),
   Nm_Cliente Varchar(100),
   Primary Key (Id_Cliente)
);

Create Table TB_NF (
   Nr_NF Int Identity(1000,1),
   Dt_NF Date Default GetDate(),
   Vl_NF Numeric(12,2),
   ID_Cliente Int,

   Primary Key (Nr_NF),

   Foreign Key (ID_Cliente)
      References TB_Cliente(ID_Cliente)

);

-- Inserindo...


--    Cliente
Insert Into TB_Cliente(Nm_Cliente) Values ('JOAO');    -- 1
Insert Into TB_Cliente(Nm_Cliente) Values ('MARIA');   -- 2
Insert Into TB_Cliente(Nm_Cliente) Values ('MARCOS');  -- 3

Select ID_Cliente, Nm_Cliente
   From TB_Cliente

--    NF
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2021-03-15', 100, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2021-03-15', 200, 3);


Select Nr_NF, Dt_NF, ID_Cliente
  From TB_NF

Select NF.Nr_NF, 
       NF.Dt_NF, 
	   NF.ID_Cliente,
	   Cli.Nm_Cliente,
	   NF.Vl_NF
  From TB_NF As NF

  Inner Join TB_Cliente As Cli
        On Cli.ID_Cliente = NF.ID_Cliente



-- Exemplo Andre 
-- Insert Into TB_CC (Nr_Agencia, ID_Correntista, Vl_Saldo) Values (10, 1, 1000.00)

