/*
AULA 10 - INSERT E DELETE
EXPLICAÇÃO
Script 12 - UPDATE
DATA: 16/03/2021
*/

/*

Update
------

Update <Tabela>
   Set <Campo1> = <Conteúdo1> 
    [, <campon> = <ConteúdoN> ]
	[ Where <condições> ]

*/

Select NF.Nr_NF, 
       NF.Dt_NF, 
	   NF.ID_Cliente,
	   Cli.Nm_Cliente,
	   NF.Vl_NF
  From TB_NF As NF

  Inner Join TB_Cliente As Cli
        On Cli.ID_Cliente = NF.ID_Cliente

-- Era Marcos (3) para Maria (2)
Update TB_NF
   Set ID_Cliente = 2
     , Vl_NF = 250
 Where Nr_NF = 1001

-- Desconto de 20%
Update TB_NF
   Set Vl_NF = Vl_NF * 0.8
 Where Nr_NF = 1000

-- Adicionar 15%
Update TB_NF
   Set Vl_NF = Vl_NF * 1.15
 Where Nr_NF = 1001


