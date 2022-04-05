/*
AULA 20 - TRAB SCRIPT
EXPLICAÇÃO
Script 22 - GROUP BY
DATA: 27/04/2021
*/

-- Eliminar se existir
Drop Table If Exists TB_NF;
Go

-- Criar Tabela
Create Table TB_NF 
(
	Nr_NF       Int Identity( 1, 1),
	Dt_NF       Date,
	Vl_NF       Numeric(10,2),
	ID_Cliente  Int,
	
	Primary Key (Nr_NF)
)
Go

-- Inserir registros
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()-10, 100, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()-10, 150, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()-10,  50, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()-10,  40, 4);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 9,  80, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 8,  20, 3);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 5,  10, 1);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 5, 180, 2);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 2, 200, 4);
Insert Into TB_NF(Dt_NF, Vl_NF, ID_Cliente) Values (GetDate()- 2,   5, 1);
Go

Select * from TB_NF

/*
Select
    From
	Group By <Campo>
	Having <Condicao>
*/

--COMANDO PARA FILTRAGEM COM FUNÇÕES IGUAIS
--WHERE - DADOS ESTÁTICOS/PARADOS
--HAVING - DADOS TRABALHADOS/SUMARIZADOS

SELECT TOP 1
        ID_Cliente, SUM(Vl_NF) AS VL_TotalVendido
FROM TB_NF
GROUP BY ID_Cliente
ORDER BY SUM(VL_NF) DESC

SELECT * FROM TB_NF

--Quanto é vendido por dia?
SELECT Dt_NF, SUM(Vl_NF) AS Vl_TotalVendido
  FROM TB_NF
  GROUP BY Dt_NF
  HAVING SUM(Vl_NF) >=150
  ORDER BY DT_NF

SELECT Dt_NF, COUNT(*) AS Qt_VendasRealizadas,
              SUM(Vl_NF) AS Vl_TotalVendido,
			  AVG(Vl_NF) AS Vl_TicketVnd
	FROM TB_NF
	GROUP BY DT_NF
	ORDER BY DT_NF

