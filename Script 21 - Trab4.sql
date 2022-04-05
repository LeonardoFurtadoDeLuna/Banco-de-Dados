/*
AULA 20 - TRAB SCRIPT
ATIVIDADE 16
Script 21 - Trab4
DATA: 27/04/2021

Considerando os dados do trabalho

(Q01) Total de vendas por produto
(Q02) Total de vendas por UF
*/

--(Q01) Total de vendas por produto
SELECT ID_Produto, SUM(Qt_Vendida) AS Vl_TotalVendaProduto
FROM TB_NFItem
GROUP BY ID_Produto
ORDER BY SUM(Qt_Vendida) DESC

--(Q02) Total de vendas por UF
SELECT TB_Cliente.ID_UF, SUM(Qt_Vendida) AS Qt_TotalVendasProduto
FROM TB_Cliente
     INNER JOIN TB_NF
	 ON TB_Cliente.ID_Cliente = TB_NF.ID_Cliente
	 INNER JOIN TB_NFItem
	 ON TB_NFItem.Nr_NF = TB_NFItem.Nr_NF
GROUP BY TB_Cliente.ID_UF
ORDER BY SUM(Qt_Vendida) DESC


