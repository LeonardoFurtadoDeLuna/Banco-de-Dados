/*
AULA 24 - TRABALHO
TRABALHO 6
Script 26 - Trabalho 6
DATA: 11/05/2021
*/

--Script Inicial
--Por Leonardo e Willian

--Eliminar Tables
Drop Table If Exists TB_Produto;
Drop Table If Exists TB_ProdutoVenda;
Drop Table If Exists TB_ComposicaoProdVnd;
Drop Table If Exists TB_SubGrupoProd;
Drop Table If Exists TB_SubGrupoProdVnd;
Drop Table If Exists TB_CompraItem;
Drop Table If Exists TB_GrupoProd;
Drop Table If Exists TB_GrupoProdVnd;

--Criação das tabelas
Create Table TB_GrupoProdVnd
(
  ID_GrupoProdVnd      Int Identity (1,1),
  Ds_GrupoProdVnd      Varchar(100) Not Null,

  Primary Key (ID_GrupoProdVnd)
);

Create Table TB_GrupoProd
(
  ID_GrupoProd      Int Identity (1,1),
  Ds_GrupoProd      Varchar(100) Not Null,

  Primary Key (ID_GrupoProd)
);

Create Table TB_SubGrupoProdVnd
(
  ID_SubGrupoProdVnd      Int Identity (1,1),
  Ds_SubGrupoProdVnd      Varchar(100) Not Null,
  ID_GrupoProdVnd         Int Not Null,

  Primary Key (ID_SubGrupoProdVnd),

  Foreign Key (ID_GrupoProdVnd)
           References TB_GrupoProdVnd(ID_GrupoProdVnd)
);

Create Table TB_SubGrupoProd
(
  ID_SubGrupoProd      Int Identity (1,1),
  Ds_SubGrupoProd      Varchar(100) Not Null,
  ID_GrupoProd         Int Not Null,

  Primary Key (ID_SubGrupoProd),

  Foreign Key (ID_GrupoProd)
           References TB_GrupoProd(ID_GrupoProd)
);

Create Table TB_ProdutoVenda
(
   ID_ProdutoVenda     Int Identity (1,1) Not Null,
   Ds_ProdutoVenda     Varchar(100) Not Null,
   Qt_Estoque          Int Not Null,
   Qt_EstoqueMinimo    Int Not Null,
   Ds_QtProduto        Varchar(100) Not Null,
   Ds_Path             Varchar(200) Not Null,
   Pr_Venda            Numeric(8,2) Not Null,
   Alarme              Bit Not Null,
   ID_SubGrupoProdVnd  Int Not Null,

   Primary Key (ID_ProdutoVenda),

   Foreign Key (ID_SubGrupoProdVnd)
           References TB_SubGrupoProdVnd(ID_SubGrupoProdVnd)
);

Create Table TB_Produto
(
   ID_Produto            Int Identity (1,1),
   Ds_Produto            Varchar(100) Not Null,
   Qt_Utilizada          Int Not Null,
   Vl_CustoUnitario      Numeric(8,2) Not Null,
   Vl_Subtotal           Numeric(8,2) Not Null,
   ID_SubGrupoProd       Int Not Null,

   Primary Key (ID_Produto),

   Foreign Key (ID_SubGrupoProd)
           References TB_SubGrupoProd(ID_SubGrupoProd)
);

Create Table TB_ComposicaoProdVnd
(
   ID_ProdutoVenda   Int Not Null,
   ID_Produto        Int Not Null,

   Primary Key (ID_ProdutoVenda, ID_Produto),

   Foreign Key (ID_ProdutoVenda)
           References TB_ProdutoVenda(ID_ProdutoVenda),

   Foreign Key (ID_Produto)
           References TB_Produto(ID_Produto)
);

Create Table TB_CompraItem
(
   ID_CompraItem   Int Identity (1,1),
   Dt_CompraItem   Date Default GetDate(),
   Vl_CompraItem   Numeric(8,2) Not Null,
   ID_Produto      Int,

   Primary Key (ID_CompraItem),

   Foreign Key (ID_Produto)
           References TB_Produto(ID_Produto)
);






	
-----------------------------------------------

	
	
--Valor do comoBox Subgrupo para ProdutoVenda, baseado em um ID_ProdutoVenda 1
Select pv.ID_SubGrupoProdVnd As ID_SubGrupoProdVnd
	From TB_ProdutoVenda As pv
		Inner Join TB_SubGrupoProdVnd As sgpv 
			On pv.ID_SubGrupoProdVnd = sgpv.ID_SubGrupoProdVnd
	Where pv.ID_ProdutoVenda = 1
	
--Lista de Opções do comoBox Subgrupo, baseado em um ID_GrupoProdVnd 1
Select sgpv.ID_SubGrupoProdVnd As ID_SubGrupoProdVnd, sgpv.Ds_SubGrupoProdVnd As Ds_SubGrupoProdVnd
	From TB_SubGrupoProdVnd As sgpv
		Inner Join TB_GrupoProdVnd As gpv 
			On sgpv.ID_GrupoProdVnd = gpv.ID_GrupoProdVnd
	Where gpv.ID_GrupoProdVnd = 1



--Valor do comoBox Grupo para ProdutoVenda, baseado em um ID_ProdutoVenda 1
Select gpv.ID_GrupoProdVnd as ID_GrupoProdVnd, gpv.Ds_GrupoProdVnd As Ds_GrupoProdVnd
	From TB_ProdutoVenda As pv
		Inner Join TB_SubGrupoProdVnd As sgpv 
			On pv.ID_SubGrupoProdVnd = sgpv.ID_SubGrupoProdVnd
		Inner Join TB_GrupoProdVnd As gpv 
			On sgpv.ID_GrupoProdVnd = gpv.ID_GrupoProdVnd
	Where pv.ID_ProdutoVenda = 1
	
--Lista de Opções do comoBox Grupo para ProdutoVenda
Select ID_GrupoProdVnd, Ds_GrupoProdVnd
	From TB_GrupoProdVnd
	
	
	
	
-----------------------------------------------

	
--Valor do comoBox Subgrupo para Produto, baseado em um ID_Produto 1
Select p.ID_SubGrupoProd As ID_SubGrupoProd
	From TB_Produto As p
		Inner Join TB_SubGrupoProd As sgp
			On p.ID_SubGrupoProd = sgp.ID_SubGrupoProd
	Where p.ID_Produto = 1
	
--Lista de Opções do comoBox Subgrupo, baseado em um ID_GrupoProd 1
Select sgp.ID_SubGrupoProd As ID_SubGrupoProd, sgp.Ds_SubGrupoProd As Ds_SubGrupoProd
	From TB_SubGrupoProd As sgp
		Inner Join TB_GrupoProd As gpv 
			On sgp.ID_GrupoProd = gpv.ID_GrupoProd
	Where gpv.ID_GrupoProd = 1

--Valor do comoBox Grupo para Produto, baseado em um ID_Produto 1
Select gpv.ID_GrupoProd as ID_GrupoProd, gpv.Ds_GrupoProd As Ds_GrupoProd
	From TB_Produto As p
		Inner Join TB_SubGrupoProd As sgp
			On p.ID_SubGrupoProd = sgp.ID_SubGrupoProd
		Inner Join TB_GrupoProd As gpv 
			On sgp.ID_GrupoProd = gpv.ID_GrupoProd
	Where p.ID_Produto = 1
	
--Lista de Opções do comoBox Grupo para Produto
Select ID_GrupoProd, Ds_GrupoProd
	From TB_GrupoProd
	
	
-----------------------------------------------


--Listagem de ProdutoVenda
Select  pv.Ds_ProdutoVenda As Ds_ProdutoVenda, 
		gpv.Ds_GrupoProdVnd As Ds_GrupoProdVnd, 
		sgpv.Ds_SubGrupoProdVnd As Ds_SubGrupoProdVnd, 
		pv.Qt_Estoque As Qt_Estoque, 
		pv.Pr_Venda As Pr_Venda
	From TB_ProdutoVenda As pv
		Inner Join TB_SubGrupoProdVnd As sgpv 
			On pv.ID_SubGrupoProdVnd = sgpv.ID_SubGrupoProdVnd
		Inner Join TB_GrupoProdVnd As gpv 
			On sgpv.ID_GrupoProdVnd = gpv.ID_GrupoProdVnd		
	



