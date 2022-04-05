/*
AULA 23 - LEFT JOIN
Atividade 18
Script 25 - Aula Join
DATA: 06/05/2021
*/

-- Eliminar tabelas se existirem
Drop Table If Exists TB_VendaItem;
Drop Table If Exists TB_Venda;
Drop Table If Exists TB_Cliente;
Drop Table If Exists TB_Produto;
Drop Table If Exists TB_SubCategoria;
Drop Table If Exists TB_Categoria;
Go

-- Criação...
Create Table TB_Cliente (
   ID_Cliente Int Identity(1,1)
   , Nm_Cliente Varchar(200)
   , Primary key (ID_Cliente)
);


Create Table TB_Categoria (
	ID_Categoria Int Identity(1,1),
	Ds_Categoria Varchar(100),
	Primary Key (ID_Categoria)
);

Create Table TB_SubCategoria (
	ID_SubCategoria Int Identity(10,1),
	Ds_SubCategoria Varchar(100),
	ID_Categoria Int,
	Primary Key (ID_SubCategoria),
	Foreign Key (ID_Categoria)
		References TB_Categoria(ID_Categoria)
);

Create Table TB_Produto (
	  ID_Produto Int Identity(100,1)
	, Ds_Produto Varchar(100)
	, ID_SubCategoria Int
	, Pr_Venda Numeric(7,2)
	, Primary Key (ID_Produto)
	, Foreign Key (ID_SubCategoria)
		References TB_SubCategoria(ID_SubCategoria)
);

Create Table TB_Venda (
   ID_Venda Int Identity(1000,1)
   , ID_Cliente Int
   , Vl_Venda Numeric(12,2)
   , Primary Key (ID_Venda)
   , Foreign Key (ID_Cliente)
        References TB_Cliente(ID_Cliente)
);

Create Table TB_VendaItem (
   ID_VendaItem Int Identity(1,1)
   , ID_Venda Int
   , ID_Produto Int
   , Qt_Produto Numeric(6,2)
   , Pr_Venda Numeric(10,2)
   , Vl_SubTotal As (Qt_Produto * Pr_Venda) 
   , Primary Key (ID_VendaItem)
   , Foreign Key (ID_Venda)
        References TB_Venda(ID_Venda)
   , Foreign Key (ID_Produto)
        References TB_Produto(ID_Produto)
);

Go

-- Inserindo dados...

-- Cliente
Insert Into TB_Cliente (Nm_Cliente) Values ('JOAO');
Insert Into TB_Cliente (Nm_Cliente) Values ('MARIA');
Insert Into TB_Cliente (Nm_Cliente) Values ('MARCOS');
Insert Into TB_Cliente (Nm_Cliente) Values ('ANA');

-- Categ
Insert Into TB_Categoria(Ds_Categoria) Values ('Padaria');
Insert Into TB_Categoria(Ds_Categoria) Values ('Açougue');
Insert Into TB_Categoria(Ds_Categoria) Values ('Legumes');

-- SubCateg
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Salgado',   1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Pão Doce',		1)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Bovina',	2)
Insert Into TB_SubCategoria(Ds_SubCategoria, ID_Categoria) Values ('Carne Suina',	2)

-- Produtos
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Pão Frances',	10, 16);	-- 100
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Bronha',		10, 20);	-- 101
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Coxao Mole',	12, 40);	-- 102
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	Values ('Coxão Duro',	12, 35);	-- 103
Insert Into TB_Produto(Ds_Produto,ID_SubCategoria, Pr_Venda) 
	values ('Picanha',		12, 50);	-- 104

Select * From TB_Produto

-- Vendas
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (1, 100.00);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (3, 157.80);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (1,   3.20);
Insert Into TB_Venda (ID_Cliente, Vl_Venda) Values (4, 212.60);

Select * From TB_Venda

-- VendasItem
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1000, 100, 0.5, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1000, 102, 2.3, 40);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 100, 0.3, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 104, 2.1, 50);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1001, 102, 1.2, 40);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1002, 100, 0.2, 16);

Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 100, 1.1, 16);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 104, 2.1, 50);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 102, 1.2, 40);
Insert Into TB_VendaItem (ID_Venda, ID_Produto, Qt_Produto, Pr_Venda) 
	Values (1003, 101, 2.1, 20);

Select * from TB_VendaItem

--Aula de hoje

--Comando ISNULL ( <var:, <conteudo_se_nulo> )

Declare @ID_Funcion Int;
Set @ID_Funcion = Null;

SELECT ISNULL (@ID_FUNCION, 0) AS ID_Funcion;

SELECT S.ID_SubCategoria, S.Ds_SubCategoria,
	   P.ID_produto, P.Ds_Produto
FROM TB_SubCategoria AS S

	   LEFT JOIN TB_Produto AS P
	   ON S.ID_SubCategoria = P.ID_SubCategoria

	   ORDER BY S.ID_SubCategoria, P.ID_SubCategoria

-- TB_SubCategoria -1 --- 0/N ---- TB_Produto

SELECT * FROM TB_VendaItem;
SELECT * FROM TB_Venda;
SELECT * FROM TB_Cliente;
SELECT * FROM TB_Produto;
SELECT * FROM TB_SubCategoria;
SELECT * FROM TB_Categoria;


-- (Q01) Venda (itens) com o seu total calculado
Select SUM(Vl_SubTotal) As Vl_TotalVendido
From TB_VendaItem
Group By ID_Venda;

-- (Q02) Categorias (ID/Ds) e SubCategoria (ID/Ds) ==> 1 => N
Select C.ID_Categoria,
       C.Ds_Categoria,
       S.ID_SubCategoria,
       S.Ds_SubCategoria
From TB_SubCategoria As S
     Inner Join TB_Categoria As C
     On C.ID_Categoria = S.ID_Categoria;

-- (Q03) Produto (1 =>N) SubCategoria (N => 1) Categoria
Select P.ID_Produto, P.Ds_Produto,
       S.ID_SubCategoria, S.Ds_SubCategoria,
       C.ID_Categoria, C.Ds_Categoria
From TB_SubCategoria As S
     Inner Join TB_Produto As P
     On P.ID_SubCategoria = S.ID_SubCategoria
     Inner Join TB_Categoria As C
     On C.ID_Categoria = S.ID_Categoria

-- (Q04) Todas as Categorias e subCategoria (1 => 0/N)
Select C.ID_Categoria,
       C.Ds_Categoria,
       S.ID_SubCategoria,
       S.Ds_SubCategoria
From TB_SubCategoria As S
     Left Join TB_Categoria As C
     On C.ID_Categoria = S.ID_Categoria;

-- (Q05) Exibir apenas as Categorias que não tem subCategoria

SELECT TB_Categoria.ID_Categoria,
       TB_Categoria.Ds_Categoria,
       TB_SubCategoria.ID_SubCategoria,
       TB_SubCategoria.Ds_SubCategoria
FROM TB_Categoria
      Left join TB_SubCategoria 
	  ON TB_SubCategoria.ID_Categoria = TB_Categoria.ID_Categoria
WHERE isNULL(TB_SubCategoria.ID_SubCategoria, 0) = 0