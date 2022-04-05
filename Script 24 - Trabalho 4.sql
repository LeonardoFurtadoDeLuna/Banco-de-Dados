/*
AULA 18 - FUNÇÕES DE SUMARIZAÇÃO
TRABALHO 4
Script 24 - Trabalho 4
DATA: 15/04/2021
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
   Nr_Telefone    Numeric(10) Not Null,
   Nr_Celular     Numeric(10) Not Null,

   Primary Key (ID_Cliente)
);

Create Table TB_Produto
(
   ID_Produto     Int Identity (321,1),
   Ds_Produto     Varchar(100) Not Null,
   Pr_Venda       Numeric(8,2) Not Null,
   Pr_Compra      Numeric(8,2) Not Null,
   Qt_Estoque     Int Not Null,

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
   Nr_NFItem     Int Not Null,
   Nr_NF         Int Not Null,

   ID_Produto    Int Not Null,
   Qt_Vendida    Int Not Null,
   Pr_Unitario   Numeric(8,2) Not Null,
   Vl_SubTotal   Numeric(8,2) Not Null,

   Primary Key (Nr_NFItem, Nr_NF),

   Foreign Key (ID_Produto)
           References TB_Produto(ID_Produto),

   Foreign Key (Nr_NF)
           References TB_NF(Nr_NF)
);

--Inserindo os dados da tabela cliente
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) Values ('JOÃO    ','SP', 1155880101, 1198800101);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) Values ('MARIA   ','MG', 1155880202, 1198800202);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) Values ('MARCOS  ','BA', 1155880303, 1198800303);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) Values ('ANTONIO ','SP', 1155880404, 1198800404);
Insert Into TB_Cliente(Nm_Cliente, ID_UF, Nr_Telefone, Nr_Celular) Values ('GABRIELA','RJ', 1155880505, 1198800505);

--Inserindo os dados da tabela produto
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('MONITOR LCD LG                 ', 250.00, 150.00,  20);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('MONITOR LCD PHILIPS            ', 300.00, 200.00,  15);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('IMPRESSORA EPSON MOD1          ', 150.00, 350.00,  10);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('HD Externo 1T SEAGATE          ', 320.00, 200.00, 100);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('HD Externo 2T SEAGATE          ', 399.90, 250.00,  50);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('HD Interno 4T SEAGATE BARRACUDA', 679.90, 400.00, 120);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('CABO SATA PLUS                 ',   3.90,   1.50, 500);
Insert Into TB_Produto(Ds_Produto, Pr_Venda, Pr_Compra, Qt_Estoque) Values ('CABO ADAPTADOR USB3 SSD SATA   ',  49.90,  30.00,  10);

--Inserindo os dados da tabela NF
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-01', 250.00, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-02',  78.00, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-02', 323.90, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values ('2020-11-03', 679.90, 4);

--Inserindo os dados da tabela ItemNF
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario, Vl_SubTotal) Values (1, 100101, 321,  1, 250.00, 250.00);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario, Vl_SubTotal) Values (1, 100102, 327, 20,   3.90,  78.00);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario, Vl_SubTotal) Values (1, 100103, 324,  1, 320.00, 320.00);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario, Vl_SubTotal) Values (2, 100103, 327,  1,   3.90,   3.90);
Insert Into TB_NFItem(Nr_NFItem, Nr_NF, ID_Produto, Qt_Vendida, Pr_Unitario, Vl_SubTotal) Values (1, 100104, 326,  1, 679.90, 679.90);

SELECT * FROM TB_Cliente
SELECT * FROM TB_Produto
SELECT * FROM TB_NF
SELECT * FROM TB_NFItem

-- (Q01) Exiba todas as NF existentes.
SELECT Nr_NF FROM TB_NF

--(Q02) Altere o preço de venda para R$ 399,90 de todos os produtos que custarem R$ 410,00
UPDATE TB_Produto
   SET Pr_Venda = 399.90
   WHERE Pr_Venda = 410.00

--(Q03) Elimine o cliente MARCOS *
DELETE FROM TB_Cliente
      WHERE Nm_Cliente = 'MARCOS'

SELECT * FROM TB_Cliente

--(Q04) Liste todas as NFs em que o total for superior a R$ 260,00 
SELECT Nr_NF FROM TB_NF 
        WHERE Vl_NF > 260.00

--(Q05) Altere a quantidade vendida para 21 e o subtotal da NF 100102 item comprado 327 
UPDATE TB_NFItem
   SET Qt_Vendida = 21, Vl_SubTotal = 21*Pr_Unitario
   WHERE Nr_NF = 100102 AND ID_Produto = 327

SELECT * FROM TB_NFItem
WHERE Nr_NF = 100102

--(Q06) Atualize o valor total da NF 100102 
UPDATE TB_NF
   SET Vl_NF = 21*3.90
   WHERE Nr_NF = 100102

SELECT * FROM TB_NF
WHERE Nr_NF = 100102

--(Q07) Liste todos os clientes que forem de São Paulo
SELECT * FROM TB_Cliente 
        WHERE ID_UF = 'SP'

--(Q08) Exiba todos os produtos que tiverem na sua descrição a palavra "HD"
SELECT Ds_Produto FROM TB_Produto 
        WHERE DS_Produto LIKE '%HD%'

--(Q09) Elimine todos os clientes que começarem por ‘G’
DELETE FROM TB_Cliente
      WHERE Nm_Cliente LIKE 'G%'

SELECT * FROM TB_Cliente
WHERE Nm_Cliente LIKE 'G%'

--(Q10) Elimine o produto 321 *
DELETE FROM TB_Produto
      WHERE ID_Produto = 321

--(Q11) Transforme todas as descrições dos produtos em maiúsculo 
UPDATE TB_Produto
   SET Ds_Produto = UPPER(Ds_Produto)

SELECT ID_Produto, Ds_Produto FROM TB_Produto

--(Q12) Elimine todas as NF superior a R$ 690,00 
DELETE FROM TB_NF
      WHERE Vl_NF > 690.00

--(Q13) Exiba o total de vendas do cliente 1
SELECT Vl_NF AS Vl_TotalVendas
     FROM TB_NF
	 WHERE ID_Cliente = 1

--(Q14) Liste a quantidade de clientes do Minas Gerais
SELECT COUNT(ID_Cliente) AS Qt_ClientesMG
     FROM TB_Cliente
	 WHERE ID_UF = 'MG'

--(Q15) Elimine todas as impressoras da EPSON do arquivo de produtos 
DELETE FROM TB_Produto
       WHERE Ds_Produto LIKE 'Impressora EPSON%'

SELECT * FROM TB_Produto
WHERE Ds_Produto LIKE 'Impressora EPSON%' 

--(Q16) Liste todos os produtos que começarem por “C” 
SELECT Ds_Produto FROM TB_Produto
      WHERE Ds_Produto LIKE 'C%'

--(Q17) Exclua todos os produtos que o preço de venda for entre R$ 1.000,00 e R$ 1.500,00
DELETE FROM TB_Produto
       WHERE Pr_Venda BETWEEN 1000.00 AND 1500.00

--(Q18) Adicione 15% ao preço de venda do produto 321 
UPDATE TB_Produto
   SET Pr_Venda = Pr_Venda * 1.15
   WHERE ID_Produto = 321

SELECT * FROM TB_Produto
 WHERE ID_Produto = 321

--(Q19) Liste todas os Números de NF que contiverem o número 101 
SELECT Nr_NF FROM TB_NF
      WHERE Nr_NF LIKE '%101%'

--(Q20) Elimine os itens da NF 100103 
DELETE FROM TB_NFItem
      WHERE Nr_NF = 100103

SELECT * FROM TB_NFItem
WHERE Nr_NF = 100103

--(Q21) Liste todas os Números de NF, Data de NF, Total da NF e o "código do produto vendido e sua descrição"  **Não está aparecendo a NF 100103
SELECT TB_NF.Nr_NF, CONVERT(VARCHAR(10), TB_NF.Dt_NF, 103) As Dt_NF, TB_NF.Vl_NF, 
       TB_NFItem.ID_Produto, TB_Produto.Ds_Produto
FROM TB_NFItem INNER JOIN TB_Produto 
		       ON TB_Produto.ID_Produto = TB_NFItem.ID_Produto
			   RIGHT JOIN TB_NF 
               ON TB_NF.Nr_NF = TB_NFItem.Nr_NF
			   
--(Q22) Elimine a NF 100103 
DELETE FROM TB_NF
      WHERE Nr_NF = 100103

SELECT * FROM TB_NF
WHERE Nr_NF = 100103

--(Q23) Exiba o nome do cliente, a data da NF e o total da NF
SELECT TB_Cliente.Nm_Cliente, CONVERT(VARCHAR(10), TB_NF.Dt_NF, 103) AS Dt_NF, TB_NF.Vl_NF
FROM TB_Cliente LEFT JOIN TB_NF ON TB_Cliente.ID_Cliente = TB_NF.ID_Cliente

SELECT * FROM TB_Cliente

--(Q24) Elimine todos os clientes que tenham no nome a palavra MARCOS 
DELETE FROM TB_Cliente
      WHERE Nm_Cliente LIKE '%MARCOS%'

SELECT * FROM TB_Cliente 
WHERE Nm_Cliente LIKE '%MARCOS%'

--(Q25) Exiba o nome do cliente, seu telefone e celular formatados: (99) 9999-9999 (99) 99999-9999
SELECT Nm_Cliente, 
       ('(' + SUBSTRING(CONVERT(VARCHAR(10), Nr_Telefone), 1, 2) + ') ' + 
              SUBSTRING(CONVERT(VARCHAR(10), Nr_Telefone), 3, 4) + '-'  + 
		      SUBSTRING(CONVERT(VARCHAR(10), Nr_Telefone), 7, 4)) As Nr_Telefone,
       ('(' + SUBSTRING(CONVERT(VARCHAR(10), Nr_Celular), 1, 2) + ') ' +
              SUBSTRING(CONVERT(VARCHAR(10), Nr_Celular), 3, 4) + '-' +
	          SUBSTRING(CONVERT(VARCHAR(10), Nr_Celular), 7, 4)) As Nr_Celular FROM TB_Cliente

-- TABELA DO RESULTADO FINAL

/*
1. Qual o total em R$ de todas as Notas Fiscais?  
2. Quantos cliente a empresa possui?  
3. Se a empresa vendesse tudo quanto ela teria arrecadado?  
4. Qual o lucro que ela teria se vendesse todas os HDs que tem no estoque?
*/

SELECT 'Total das Notas Fiscais' AS Ds_Resposta,
        SUM(Vl_NF) AS Vl_Item FROM TB_NF
UNION
SELECT 'Quantidade de Clientes' AS Ds_Resposta,
       COUNT(ID_Cliente) AS Vl_Item FROM TB_Cliente
UNION
SELECT 'Arrecadação da venda de todos os produtos' AS Ds_Resposta,
        SUM(Pr_Venda*Qt_Estoque) AS Vl_Item FROM TB_Produto
UNION
SELECT 'Lucro da venda de todos os HDs' AS Ds_Resposta,
       SUM((Pr_Venda*Qt_Estoque)-(Pr_Compra*Qt_Estoque)) AS Vl_Item FROM TB_Produto
       WHERE DS_Produto LIKE '%HD%'


