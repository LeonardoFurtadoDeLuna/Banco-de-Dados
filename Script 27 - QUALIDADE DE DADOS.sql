/*
AULA 26 - QUALIDADE DE DADOS
EXPLICA��O
Script 27 - QUALIDADE DE DADOS
DATA: 18/05/2021
*/

-- Qualidade de Dados

Drop Table If Exists TB_Cliente;

Create Table TB_Cliente (
   ID_Cliente Int Identity(1,1),
   Nm_Cliente varchar(100),
   Ds_Endereco Varchar(300),
   Ds_Bairro Varchar(100),
   Ds_Cidade Varchar(100),
   ID_UF Varchar(2),
   Nr_Telefone varchar(20),
   Primary Key (ID_Cliente)
)
Go

Insert Into TB_Cliente(Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone)
	Values('Joao da Silva','Rua Apucarana, 123','S�o Gon�alves','S�o Paulo','SP','1198872312');
Insert Into TB_Cliente(Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone)
	Values('MARIA ap da Silva','Av. Indian�polis, 123','Centro','S�o Paulo','SP','1199971222');
Insert Into TB_Cliente(Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone)
	Values('MARCOS ROGERIO','Rua Apucarana, 123','S�o Gon�alves','S�o Paulo','SP','(11)9-8872312');
Insert Into TB_Cliente(Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone)
	Values('ROBERTO    Oliveira','Av. Tenente marques, 1203','Santana de Parna�ba','S�o Paulo','SP','(11)9-8872312');
Insert Into TB_Cliente(Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone)
	Values('MIRIAM aparecida Souza','R barata ribeiro, 250','Centro','SAO PAULO','SP','(119887.2312');


Go

/*
Select ID_Cliente,Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone
  From TB_Cliente
*/
-- Identifique os problemas

-- Nm_Cliente
--    P01: Mai�sculo
Update TB_Cliente
   Set Nm_Cliente = UPPER(Nm_Cliente)

--    P02: "ap" = "APARECIDA"
Update TB_Cliente
   Set Nm_Cliente = REPLACE(Nm_Cliente, 'AP ','APARECIDA')
Go

--    P03: espa�os demais
Update TB_Cliente
Set Nm_Cliente = Replace(Nm_Cliente, '  ',' ')
Go 5
--    P04: AparecidaDA
Update TB_Cliente
   Set Nm_Cliente = REPLACE(Nm_Cliente, 'APARECIDADA','APARECIDA')


-- Ds_Endereco
--    P01: Mai�sculo
Update TB_Cliente
Set Ds_Endereco = UPPER(Ds_Endereco);

--    P02: "R " => "Rua"
Update TB_Cliente
Set Ds_Endereco = REPLACE(Ds_Endereco, 'R ', 'RUA ');

--    P03: "av. " => "Avenida"
Update TB_Cliente
Set Ds_Endereco = REPLACE(Ds_Endereco, 'AV. ', 'AVENIDA ');


-- Ds_Bairro
--    P01: Mai�sculo
Update TB_Cliente
Set Ds_Bairro = UPPER(Ds_Bairro);

--    P02: "�" => "a"
Update TB_Cliente
Set Ds_Bairro = REPLACE(Ds_Bairro, '�', 'A');

--    P02: "�" => "c"
Update TB_Cliente
Set Ds_Bairro = REPLACE(Ds_Bairro, '�', 'C');

--    P03: "�" => "i"
Update TB_Cliente
Set Ds_Bairro = REPLACE(Ds_Bairro, '�', 'I');


-- Ds_Cidade
--    P01: Mai�sculo
Update TB_Cliente
   Set Ds_Cidade = UPPER(Ds_Cidade);

--    P02: "�" => "a"
Update TB_Cliente
   Set Ds_Cidade = REPLACE(Ds_Cidade, '�', 'A');


-- Nr_Telefone "11912345678"
Update TB_Cliente
   Set Nr_Telefone = REPLACE(Nr_Telefone, '(', '');
Update TB_Cliente
   Set Nr_Telefone = REPLACE(Nr_Telefone, ')', '');
Update TB_Cliente
   Set Nr_Telefone = REPLACE(Nr_Telefone, '-', '');
Update TB_Cliente
   Set Nr_Telefone = REPLACE(Nr_Telefone, '.', '');



-- 

/*
Select ID_Cliente,Nm_Cliente, Ds_Endereco, Ds_Bairro, Ds_Cidade, ID_UF,Nr_Telefone
  From TB_Cliente
*/
