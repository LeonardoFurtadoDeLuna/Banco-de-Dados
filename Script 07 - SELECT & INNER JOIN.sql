/*
AULA 09 - SELECT
EXPLICAÇÃO
Script 7 - SELECT & INNER JOIN
DATA: 11/03/2021
*/

/*
Select <campo>
   From <tabela>
   
   Inner Join <tabela>
   On <campo> = <campo>

   [ Where <condição> ]

*/

SELECT NF.Nr_NF,
       NF.Dt_NF,
	   NF.ID_Cliente,
	   Cli.Nm_Cliente,
	   NF.Vl_NF

FROM TB_NF AS NF

INNER JOIN TB_Cliente AS Cli
ON Cli.ID_Cliente = NF.ID_Cliente

WHERE NF.Vl_NF >= 100
   AND Cli.ID_UF = 'SP'
   AND NF.ID_Cliente > 1