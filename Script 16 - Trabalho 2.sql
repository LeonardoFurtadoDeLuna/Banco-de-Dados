/*
AULA 13 - FUNCS
TRABALHO 2
Script 16 - Trabalho 2
DATA: 25/03/2021
*/

/* --Por Leonardo Furtado de Luna

		TB_Cliente

		ID_Cliente  Int
		Nm_Cliente  Varchar(200) -- Todas em maiúsculas
		Nr_CPF      Numeric( 11)  -- 999.999.999-99
		Nr_Telefone Varchar( 10)  -- (99) 9999-9999
		Nr_Celular  Varchar( 11)  -- (99) 9-9999-9999
		Dt_Cadastro date

		-- Inserir os nomes em minúsculo!!!
*/


-- Eliminando tabelas existentes
Drop Table If Exists TB_Cliente;

-- Criando tabela
Go

Create Table TB_Cliente (
ID_Cliente Int Identity(1,1),
Nm_Cliente Varchar(200), -- Todas em maiúsculas
Nr_CPF Numeric(11), -- 999.999.999-99
Nr_Telefone Varchar(10), -- (99) 9999-9999
Nr_Celular Varchar( 11), -- (99) 9-9999-9999
Dt_Cadastro Date Default GetDate(),
Primary Key(ID_Cliente),
);
Go

-- Inserindo dados na tabela
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('rodrigo de melo', '29454785965', '1141546669',
'11999666555', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('adriana melo', '30454784125', '1141546999',
'11984658951', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('darlei garcia', '30159578955', '1136869969',
'11970412582', '2020-10-15');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) Values ('elson moraes', '15135785264', '1134877069',
'01945070777', '2020-10-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('jamel campary', '19137582500', '1146876069','11974131313', '2020-09-13');
Insert Into TB_Cliente (Nm_Cliente, Nr_CPF, Nr_Telefone, Nr_Celular, Dt_Cadastro) 
	Values ('teste de zero', '05135785264', '1134877069','01945070777', '2020-10-13');

select * from TB_Cliente


SELECT 'Nome: ' + Upper(Nm_Cliente) + ', CPF: ' + Convert(Varchar(11), Nr_CPF) From TB_Cliente;
       
	   + Upper(Nm_Cliente),
       Substring(Convert(Varchar(11), Nr_CPF), 1, 3) + '.' +
	   Substring(Convert(Varchar(11), Nr_CPF), 4, 3) + '.' +
	   Substring(Convert(Varchar(11), Nr_CPF), 7, 3) + '.' +
	   Substring(Convert(Varchar(11), Nr_CPF), 10, 2) As Nr_CPF
	   
	   + '(' + SUBSTRING(Convert(Numeric(10), Nr_Telefone), 1, 2) + ')' +
             SUBSTRING(Convert(Numeric(10), Nr_Telefone), 3, 4) + '-' +
			 SUBSTRING(Convert(Numeric(10), Nr_Telefone), 7, 4) As Nr_Telefone
	  
	  + '(' + SUBSTRING(Convert(Numeric(11), Nr_Celular), 1, 2) + ')' +
             SUBSTRING(Convert(Numeric(11), Nr_Celular), 3, 5) + '-' +
			 SUBSTRING(Convert(Numeric(11), Nr_Celular), 8, 4) As Nr_Celular
	    FROM TB_Cliente;



