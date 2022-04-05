/*
AULA 10 - INSERT E DELETE
EXPLICA��O
Script 9 - DELETE
DATA: 16/03/2021
*/

/*
Delete

Delete From <Tabela>
  [ Where <Condi��es> ]
*/

Select ID_Cliente, Nm_Cliente
   From TB_Cliente

Delete From TB_Cliente
   Where ID_Cliente = 1 

/*
   A instru��o DELETE conflitou com a restri��o do 
      REFERENCE "FK__TB_NF__ID_Client__5A846E65". 
	  O conflito ocorreu no banco de dados "AulaBD", 
	  tabela "dbo.TB_NF", column 'ID_Cliente'.

A instru��o foi finalizada.

>> Cliente 1 est� em TB_NF!!!

*/



