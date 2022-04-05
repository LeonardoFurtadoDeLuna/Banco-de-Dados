/*
AULA 11 e 12 - CASO SC2
ATIVIDADE 13
Script 14 - CASO SC2
DATA: 18/03/2021
*/

--Script Inicial
--Por Leonardo Furtado

--Eliminar Tables
Drop Table If Exists TB_Jogador;
Drop Table If Exists TB_Raca;
Drop Table If Exists TB_Partida;
Drop Table If Exists TB_PartidaUnidade;
Drop Table If Exists TB_Unidades;
Drop Table If Exists TB_PartidaJogador;

--Criação das tabelas
Create Table TB_Jogador(
    ID_Jogador Int Identity (1,1),
	Nm_Jogador Varchar(300) Not Null,
	Primary Key (ID_Jogador)
);

Create Table TB_Raca(
    ID_Raca Int Identity (1,1),
	Nm_Raca Varchar(300) Not Null,
	Primary Key (ID_Raca)
);

Create Table TB_Partida(
    ID_Partida Int Identity (1,1),
	Nm_Partida Varchar(300) Not Null,
	Dt_Partida Date Default GetDate(),
	Primary Key (ID_Partida)
);

Create Table TB_Unidades(
    ID_Unidade Int Identity (1,1),
	Nm_Unidade Varchar(300) Not Null,
	ID_Raca Int Not Null,
	Qt_HpPadrao Int Not Null,
	Primary Key (ID_Unidade),

	Foreign Key (ID_Raca)
	        References TB_Raca(ID_Raca),
);

Create Table TB_PartidaUnidade(
    ID_PartidaUnidade Int Identity (1,1),
	Nr_Posx Numeric(10,2) Not Null,
	Nr_Posy Numeric(10,2) Not Null,
	ID_Partida Int Not Null,
	ID_Unidade Int Not Null,
	Qt_HpAtual Int Not Null,
	St_Ativo Varchar(1) Default 'A',
	Primary Key (ID_PartidaUnidade),

	Foreign Key (ID_Partida)
	        References TB_Partida(ID_Partida),
	Foreign Key (ID_Unidade)
	        References TB_Unidades(ID_Unidade)
);

Create Table TB_PartidaJogador(
    ID_Jogador Int Not Null,
	ID_Partida Int Not Null,
	ID_Raca Int Not Null,
	Primary Key (ID_Jogador, ID_Partida),

	Foreign Key (ID_Jogador)
	        References TB_Jogador(ID_Jogador),
	Foreign Key (ID_Partida)
	        References TB_Partida(ID_Partida),
	Foreign Key (ID_Raca)
	        References TB_Raca(ID_Raca)
);

-- Inserindo Jogadores
Insert Into TB_Jogador(Nm_Jogador) Values ('Valter');
Insert Into TB_Jogador(Nm_Jogador) Values ('Rafael');

--Inserindo Raças
Insert Into TB_Raca(Nm_Raca) Values ('Zerg');
Insert Into TB_Raca(Nm_Raca) Values ('Protoss');
Insert Into TB_Raca(Nm_Raca) Values ('Humans');

--Inserindo Unidades
Insert Into TB_Unidades(Nm_Unidade, ID_Raca, Qt_HpPadrao) Values ('Tatu-Bola', 1, 15);
Insert Into TB_Unidades(Nm_Unidade, ID_Raca, Qt_HpPadrao) Values ('Zangão', 1, 10);

--Inserindo Partida
Insert Into TB_Partida(Nm_Partida) Values ('Partida 1');
Insert Into TB_Partida(Nm_Partida) Values ('Partida 2');

--Inserindo PartidaJogador
Insert Into TB_PartidaJogador(ID_Jogador, ID_Partida) Values (1, 1);
Insert Into TB_PartidaJogador(ID_Jogador, ID_Partida) Values (2, 2);

--Inserindo PartidaUnidade
Insert Into TB_PartidaUnidade(Nr_Posx, Nr_Posy, ID_Partida, ID_Unidade, Qt_HpAtual) Values (4, 2, 1, 1, 8);
Insert Into TB_PartidaUnidade(Nr_Posx, Nr_Posy, ID_Partida, ID_Unidade, Qt_HpAtual) Values (7, 10, 2, 2, 0);

--ExclusaoLogica
Update TB_PartidaUnidade
   Set St_Ativo = 'I'
 Where Qt_HpAtual = 0

--Exibição
SELECT * FROM TB_Jogador;
SELECT * FROM TB_Raca;
SELECT * FROM TB_Unidades;
SELECT * FROM TB_Partida;
SELECT * FROM TB_PartidaJogador;
SELECT * FROM TB_PartidaUnidade;


	        

	
