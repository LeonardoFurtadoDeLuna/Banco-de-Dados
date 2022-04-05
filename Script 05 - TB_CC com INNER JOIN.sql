/*
AULA 09 - SELECT
ATIVIDADE 11
Script 5 - TB_CC com INNER JOIN
DATA: 11/03/2021
*/

-- Script Inicial
-- Por Leonardo Furtado

-- Eliminar Tables
Drop Table If Exists TB_CC;
Drop Table If Exists TB_Correntista;
Drop Table If Exists TB_Agencia;

--Observação: Somente SELECTs

Select TB_CC.Nr_CC,
       TB_Correntista.Nm_Correntista
	From TB_CC
	Inner Join TB_Correntista
	   On TB_CC.ID_Correntista = TB_Correntista.ID_Correntista;

Select TB_CC.Nr_CC,
       TB_Agencia.Nm_Agencia
	From TB_CC
	Inner Join TB_Agencia
	   On TB_CC.Nr_Agencia = TB_Agencia.Nr_Agencia;

Select TB_CC.Nr_CC,
       TB_Correntista.Nm_Correntista,
       TB_Agencia.Nm_Agencia,
	   TB_CC.Vl_Saldo
	From TB_CC
	Inner Join TB_Correntista
	   On TB_CC.ID_Correntista = TB_Correntista.ID_Correntista
	Inner Join TB_Agencia
	   On TB_CC.Nr_Agencia = TB_Agencia.Nr_Agencia;