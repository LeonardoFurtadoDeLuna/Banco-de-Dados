/*
AULA 18 - FUNÇÕES DE SUMARIZAÇÃO
EXPLICAÇÃO
Script 20 - SUMARIZAÇÃO
DATA: 15/04/2021
*/

Drop Table If Exists TB_NF;
Go

Create Table TB_NF (
	Nr_NF Int Identity( 1, 1),
	Dt_NF Date Default GetDate(),
	Vl_NF Numeric(10,2),
	ID_Cliente Int,
	Primary Key (Nr_NF)
)
Go

Insert Into TB_NF(Vl_NF, ID_Cliente) Values (100, 1);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values (150, 2);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values ( 50, 3);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values ( 40, 4);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values ( 80, 1);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values ( 20, 3);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values ( 10, 1);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values (180, 2);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values (200, 4);
Insert Into TB_NF(Vl_NF, ID_Cliente) Values (  5, 1);
Go

select * from TB_NF

-- Todas as vendas realizadas
Select 'Total de Vendas' as Ds_Item,
Sum(Vl_NF) As Vl_Item
From TB_NF


-- TODOS os Registros
Union
Select 'Qt de Vendas' as Ds_Item,
Count(*) As Vl_Item
From TB_NF

-- Forma por Função
Union
Select 'Média de Vendas' as Ds_Item,
Avg(Vl_NF) As Vl_Item
From TB_NF

-- Maior venda
Union
Select 'Maior Venda' as Ds_Item,
Max(Vl_NF) As Vl_Item
From TB_NF

-- Menor Venda
Union
Select 'Menor Venda' as Ds_Item,
Min(Vl_NF) As Vl_Item
From TB_NF


