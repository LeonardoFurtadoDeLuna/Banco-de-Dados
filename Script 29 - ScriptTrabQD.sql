/*
AULA 27 - SCRIPT QD
ATIVIDADE 19
Script 29 - ScriptTrabQD
DATA: 20/05/2021
*/

/*
Criar a tabela:

TB_Produto
  ID_Produto
  Ds_Produto
  Qt_EstoqMin
  Qt_EstoqMax
  Pr_Custo
  Pr_Venda

  -- Script para Inclusão (sp_Ins_Produto.sql)
*/

Drop Table If Exists TB_Produto;

Create Table TB_Produto
(
   ID_Produto   Int Identity (1,1),
   Ds_Produto   Varchar(200) Not Null,
   Qt_EstoqMin  Int Not Null,
   Qt_EstoqMax  Int Not Null,
   Qt_Estoq     Int Not Null,
   Pr_Custo     Numeric(8,2) Not Null,
   Pr_Venda     Numeric(8,2) Not Null,

   Primary key (ID_Produto)
);

  Declare @pDs_Produto   Varchar(200);
  Declare @pQt_EstoqMin  Int;
  Declare @pQt_EstoqMax  Int;
  Declare @pQt_Estoq     Int;
  Declare @pPr_Custo     Numeric(8,2);
  Declare @pPr_Venda     Numeric(8,2);

  Set @pDs_Produto = 'ArrOZ INteGraL';
  Set @pQt_EstoqMin = 10;
  Set @pQt_EstoqMax = 29;
  Set @pQt_Estoq    = 20;
  Set @pPr_Custo    = 17.85;
  Set @pPr_Venda    = 26.50;

--Regras de Negócio

--> (RN01) Qt_EstoqueMin <= Qt_EstoqueMax
  If (@pQt_EstoqMin > @pQt_EstoqMax) 
     Begin
	      Select 'Erro: RN01 - Qt de Estoque Mínimo deve ser menor ou igual a Qt de Estoque Máximo' AS Ds_Erro;
     End

--> (RN02) Pr_Custo <= Pr_Venda
  If (@pPr_Custo > @pPr_Venda) 
     Begin
	      Select 'Erro: RN02 - O preço de custo deve ser menor ou igual ao preço de venda' AS Ds_Erro;
     End

--> (RN03) Pr_Venda > 0
  If (@pPr_Venda <= 0) 
     Begin
	      Select 'Erro: RN03 - O preço de venda deve ser maior que 0' AS Ds_Erro;
     End

--> (RN04) Não pode haver descrição igual
  IF Exists (Select Ds_Produto FROM Tb_Produto WHERE Ds_Produto = @pDs_Produto)
     Begin
	      Select 'Erro: RN04 - Descrições de produtos iguais' AS Ds_Erro;
     End

--> (RN05) Qt em estoque deve ser maior ou igual a 0
  If (@pQt_Estoq < 0) 
     Begin
          Select 'Erro: RN05 - Qt em Estoque deve ser maior ou igual a Zero' AS Ds_Erro;;
     End

-- Tratamento de Dados
/*
Qualidade de Dados
(QD01) Todos os caracteres em maiúsculo
(QD02) Retornar o ID gerado como ID_Produto
*/

--> (QD01) Todos os caracteres em maiúsculo

Insert Into TB_Produto(Ds_Produto, Qt_EstoqMin, Qt_EstoqMax, Qt_Estoq, Pr_Custo, Pr_Venda)
	Values(UPPER(@pDs_Produto), @pQt_EstoqMin, @pQt_EstoqMax, @pQt_Estoq, @pPr_Custo, @pPr_Venda);
	

--> (QD02) Retornar o ID gerado como ID_Produto

Select @@IDENTITY AS 'ID_Produto'


