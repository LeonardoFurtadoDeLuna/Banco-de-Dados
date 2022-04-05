/*
AULA 10 - INSERT E DELETE
EXPLICAÇÃO
Script 9 - DELETE
DATA: 16/03/2021
*/

/*
Delete

Delete From <Tabela>
  [ Where <Condições> ]
*/

Select ID_Cliente, Nm_Cliente
   From TB_Cliente

Delete From TB_Cliente
   Where ID_Cliente = 1 

/*
   A instrução DELETE conflitou com a restrição do 
      REFERENCE "FK__TB_NF__ID_Client__5A846E65". 
	  O conflito ocorreu no banco de dados "AulaBD", 
	  tabela "dbo.TB_NF", column 'ID_Cliente'.

A instrução foi finalizada.

>> Cliente 1 está em TB_NF!!!

*/



