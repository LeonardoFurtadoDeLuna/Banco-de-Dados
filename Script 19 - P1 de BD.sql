/*
AULA 16 E 17 - P1 
P1 DE BD
Script 19 - P1 de BD
DATA: 308/04/2021
*/

--Script Inicial
--Por Leonardo Furtado

--Eliminar Tables
Drop Table If Exists TB_FornecedorTipoProduto;
Drop Table If Exists TB_TipoProduto;
Drop Table If Exists TB_Fornecedor;
Drop Table If Exists TB_Produto;

--Criação das tabelas
Create Table TB_Fornecedor
(
   ID_Fornecedor Int Identity (1,1),
   Ds_RazaoSocial Varchar(200) Not Null,
   Nm_Fantasia Varchar(200) Not Null,
   Vl_CapitalSocial Numeric(8,2) Not Null,
   Dt_Fundacao Date Default GetDate(),
   Ds_Pontuacao Varchar(50),

   Primary Key (ID_Fornecedor)
);

Create Table TB_Produto
(
   ID_Produto Int Identity (1,1),
   Ds_Produto Varchar(200) Not Null,
   Pr_Custo Numeric(8,2) Not Null,
   Pr_Venda Numeric(8,2) Not Null,
   Qt_Estoque Int Not Null,
   Nr_CodigoDeBarras Numeric (13) Not Null,
   Nr_Corredor Int Not Null,
   
   Primary Key (ID_Produto)
  
);

Create Table TB_TipoProduto
(
   ID_TipoProduto Int Identity (1,1),
   Ds_TipoProduto Varchar(200) Not Null,
   ID_Produto Int Not Null,
   
   Primary Key (ID_TipoProduto),

   Foreign Key (ID_Produto)
           References TB_Produto(ID_Produto),
);
  
Create Table TB_FornecedorTipoProduto
(
   ID_Fornecedor Int Not Null,
   ID_TipoProduto Int Not Null,
   
   Primary Key (ID_Fornecedor, ID_TipoProduto),

   Foreign Key (ID_TipoProduto)
           References TB_TipoProduto(ID_TipoProduto),

   Foreign Key (ID_Fornecedor)
           References TB_Fornecedor(ID_Fornecedor)
);



-- Inserindo
Insert Into TB_TipoProduto(Ds_TipoProduto, ID_Produto) Values ('Produtos de Limpeza', 1);
Insert Into TB_TipoProduto(Ds_TipoProduto, ID_Produto) Values ('Produtos alimentícios', 2);

Insert Into TB_Produto (Ds_Produto, Pr_Custo, Pr_Venda, Qt_Estoque, Nr_CodigoBarras, Nr_Corredor)
Values ('Desifetante', 5.60, 10.40, 20, 0121697455632, 10);
Insert Into TB_Produto (Ds_Produto, Pr_Custo, Pr_Venda, Qt_Estoque, Nr_CodigoBarras, Nr_Corredor)
Values ('Álcool', 7.60, 19.40, 30, 0121697477632, 11);

Insert Into TB_Produto (Ds_Produto, Pr_Custo, Pr_Venda, Qt_Estoque, Nr_CodigoBarras, Nr_Corredor)
Values ('Cafe', 4.60, 7.40, 10, 0121697455631, 14);
Insert Into TB_Produto (Ds_Produto, Pr_Custo, Pr_Venda, Qt_Estoque, Nr_CodigoBarras, Nr_Corredor)
Values ('Leite', 2.60, 3.40, 45, 0121697477635, 13);

--Exibição
SELECT * FROM TB_Produto;
SELECT * FROM TB_TipoProduto;