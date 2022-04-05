/*
AULA 27 - SCRIPT QD
EXPLICAÇÃO
Script 28 - SCRIPT QD
DATA: 20/05/2021
*/

--
--@@Identity
--

Select name From sys.objects where name like 'TB%'

Insert Into TB_Usuario (Nm_Usuario, Ds_Login, Ds_Password)
    Values ('Maria', 'M.Aparecida', '******');

Select @@IDENTITY AS ID_Usuario; --@@IDENTITY Recebe o último ID criado

--Verificando: Select * from TB_Usuario

--------------------------------

--
--IF
--
--Sintaxe:
/*
   IF (<Condições>) Begin ... End
       [Else Begin ... End ]
*/

Declare @Nr_1 Int;

SET @Nr_1 = 1;

--Exibir 'Um'se o valor de Nr_1 for igual a 1 ou 'Outros' se for diferente de 1
IF (@Nr_1 = 1)
    Begin
	    SELECT 'Um' AS Ds_Resposta;
	End
Else
    Begin
	    SELECT 'Outros' AS Ds_Resposta;
	End;