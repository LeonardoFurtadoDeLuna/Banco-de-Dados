/*
AULA 21 - EXERCÍCIOS
ATIVIDADE 17
Script 23 - Dashboard
DATA: 29/04/2021
*/

--Script Inicial
--Por Leonardo Furtado
 
--Eliminar Tables
Drop Table If Exists TB_NFItem;
Drop Table If Exists TB_NF;
Drop Table If Exists TB_Cliente;
Drop Table If Exists TB_Produto;

--Criação das tabelas
Create Table TB_Cliente
(
   ID_Cliente     Int Identity (1,1),
   Nm_Cliente     Varchar(100) Not Null,
   ID_UF          Varchar(2) Not Null,

   Primary Key (ID_Cliente)
);

Create Table TB_Produto
(
   ID_Produto      Int Identity (321,1),
   Ds_Produto      Varchar(100) Not Null,
   ID_Subcategoria Int,
   Pr_Custo        Numeric(8,2) Not Null,
   Pr_Venda        Numeric(8,2) Not Null,

   Primary Key (ID_Produto)
);

Create Table TB_NF
(
   Nr_NF       Int Identity (100101,1),
   Dt_NF       Date Default GetDate(),
   Vl_NF       Numeric(8,2) Not Null,
   ID_Cliente  Int Not Null,

   Primary Key (Nr_NF),

   Foreign Key (ID_Cliente)
           References TB_Cliente(ID_Cliente)
);

Create Table TB_NFItem
(
   ID_NFItem     Int Not Null,
   Nr_NF         Int Not Null,

   ID_Produto    Int Not Null,
   Qt_Vendida    Int Not Null,
   Pr_Vendido    Numeric(8,2) Not Null,
   Vl_SubTotal   Numeric(8,2) Not Null,

   Primary Key (ID_NFItem, Nr_NF),

   Foreign Key (ID_Produto)
           References TB_Produto(ID_Produto),

   Foreign Key (Nr_NF)
           References TB_NF(Nr_NF)
);

--Inserindo os dados da tabela cliente
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('JOÃO    ','SP');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('MARIA   ','MG');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('MARCOS  ','BA');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('ANTONIO ','SP');
Insert Into TB_Cliente(Nm_Cliente, ID_UF) Values ('GABRIELA','RJ');

--Inserindo os dados da tabela produto
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('MONITOR LCD LG                 ', 250.00, 150.00,  20);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('MONITOR LCD PHILIPS            ', 300.00, 200.00,  15);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('IMPRESSORA EPSON MOD1          ', 150.00, 350.00,  10);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('HD Externo 1T SEAGATE          ', 320.00, 200.00, 100);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('HD Externo 2T SEAGATE          ', 399.90, 250.00,  50);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('HD Interno 4T SEAGATE BARRACUDA', 679.90, 400.00, 120);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('CABO SATA PLUS                 ',   3.90,   1.50, 500);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Custo, ID_Subcategoria) Values ('CABO ADAPTADOR USB3 SSD SATA   ',  49.90,  30.00,  10);

--Inserindo os dados da tabela NF
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-01', 250.00, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-02',  78.00, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-03', 323.90, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-04', 679.90, 4);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-05', 250.00, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-06',  10.00, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-07', 300.90, 5);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-08', 400.90, 4);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-09', 250.00, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-10',  10.00, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-11', 300.90, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-12', 400.90, 4);

--Inserindo os dados da tabela ItemNF
Insert Into TB_NFItem(ID_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Vendido, Vl_SubTotal) Values (1, 100101, 321,  1, 250.00, 250.00);
Insert Into TB_NFItem(ID_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Vendido, Vl_SubTotal) Values (1, 100102, 327, 20,   3.90,  78.00);
Insert Into TB_NFItem(ID_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Vendido, Vl_SubTotal) Values (1, 100103, 324,  1, 320.00, 320.00);
Insert Into TB_NFItem(ID_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Vendido, Vl_SubTotal) Values (2, 100103, 327,  1,   3.90,   3.90);
Insert Into TB_NFItem(ID_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Vendido, Vl_SubTotal) Values (1, 100104, 326,  1, 679.90, 679.90);

SELECT * FROM TB_Cliente
SELECT * FROM TB_Produto
SELECT * FROM TB_NF
SELECT * FROM TB_NFItem

--(a) Venda dos Últimos 10 dias: Venda total dos últimos 10 dias (por dia) 
SELECT TOP 10 CONVERT(VARCHAR(10), Dt_NF, 103) AS Dt_NF, SUM(Vl_NF) AS Vl_TotalVendido
  FROM TB_NF
  GROUP BY Dt_NF
  ORDER BY Dt_NF

--(b) Clientes VIP: Os 3 clientes que mais compraram 
 SELECT TOP 3 ID_Cliente, SUM(Vl_NF) AS Vl_TotalVendido
  FROM TB_NF
  GROUP BY ID_Cliente
  ORDER BY SUM(Vl_NF) DESC

--(c) Vendas por UF: Total de vendas por UF 
SELECT C.ID_UF, SUM(N.Vl_NF) AS Vl_TotalVendido
	FROM TB_Cliente AS C
	INNER JOIN TB_NF AS N
	ON C.ID_Cliente = N.ID_Cliente
	GROUP BY C.ID_UF

--(d) Ticket Médio: Valor médio por venda
SELECT AVG(Vl_NF) AS Vl_TicketVnd
	FROM TB_NF

--(e) Valor Imobilizado: Valor em R$ de quanto está alocado em estoque  Qt * Preço Custo 
SELECT SUM(Pr_Custo*ID_Subcategoria) AS Vl_Estoque 
       FROM TB_Produto

--(f) Potencial Lucro: Se tudo fosse vendido Qt * (Preço venda – Preço Custo)
SELECT SUM(ID_Subcategoria*(Pr_Venda-Pr_Custo)) AS Vl_PotencialLucro 
       FROM TB_Produto
