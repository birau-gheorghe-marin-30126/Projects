create database Biblioteca
go
use Biblioteca
go
create table [dbo].[Editura](
		[Id_Editura] [int] IDENTITY(1,1) PRIMARY KEY,
		[Nume] [varchar](100) NOT NULL,
		[Sediu] [varchar](60)  NULL,
		[Oras] [varchar](60)  NULL,
		[Tara] [varchar](60) NULL
)
go
create table [dbo].[Autori](   
		[Id_Autor] [int] IDENTITY(1,1) PRIMARY KEY,
		[Nume] [varchar](60) NOT NULL,
		[Prenume] [varchar](60) NOT NULL,
		[Nr_telefon] [varchar](60) NULL,
		[Status] [bit] NULL,
		[Origine] [varchar](60) NULL
)
go
create table [dbo].[Membri](
		[Id_Membru] [int] IDENTITY(1,1) PRIMARY KEY,
		[Nume] [varchar](60) NOT NULL,
		[Prenume] [varchar](60) NOT NULL,
		[Data_Inregistrarii] [date] NOT NULL,
		[Data_Expirare] [date] NULL,
		[Nr_Toatal_Carti] [int] NULL,
		[Nr_Carti_Curente] [int] NULL,
		[Nr_Telefon] [varchar](60) NULL
)
go
create table [dbo].[Personal](
		[Id_personal] [int] IDENTITY(1,1) PRIMARY KEY,
		[Nume] [varchar](60) NOT NULL,
		[Prenume] [varchar](60) NOT NULL,
		[Job] [varchar](60) NOT NULL,
		[Program] [varchar](100) NOT NULL,
		[Varsta] [int] NOT NULL,
		[Status Job][varchar](60) NULL,
		[Salariu] [varchar](10) NOT NULL,
		[Nr_telefon] [varchar](60) NULL,		
)
go 
create table [dbo].[Categorie](
		[Id_Categorie] [int] IDENTITY(1,1) PRIMARY KEY,
		[Categorie] [varchar](60) NOT NULL
)
go
create table [dbo].[Carti](
		[Id_Carte] [int] IDENTITY(1,1) PRIMARY KEY,
		[Titlu] [varchar](100) NOT NULL,
		[Id_Autor] [int] FOREIGN KEY REFERENCES [Autori](Id_Autor),
		[Nr_Pagini] [int] NOT NULL,
		[Data_Publicarii] [date] NOT NULL ,
		[Id_Editura] [int] FOREIGN KEY REFERENCES [Editura](Id_Editura),
		[Format] [varchar](50) NULL,
		[Id_Categorie] [int] FOREIGN KEY REFERENCES [Categorie](Id_Categorie)
)
go
create table [dbo].[Imprumuturi](
		[Id_Imprumut] [int]  IDENTITY(1,1) PRIMARY KEY,
		[Id_Carte] [int] FOREIGN KEY REFERENCES Carti(Id_Carte),
		[Id_Membru] [int] FOREIGN KEY REFERENCES Membri(Id_Membru),
		[Data_Imprumut] [date] NOT NULL,
		[Data_Returnare] [date] NULL,
)
go
create table [dbo].[Biblioteca1](
		[Id_Sediu] [int] IDENTITY(1,1) PRIMARY KEY,
		[Nume] [varchar](100) NOT NULL,
		[Locatie] [varchar](100) NULL,
		[Data_Infiintare] [date] NOT NULL,
		[Id_Carte] [int] FOREIGN KEY REFERENCES Carti(Id_Carte),
		[Id_Membru] [int] FOREIGN KEY REFERENCES Membri(Id_Membru),
		[Id_Personal] [int] FOREIGN KEY REFERENCES Personal(Id_Personal)
)
go

/* Inserare de date*/

--Inserare date pentru  tabela -Editura
SET IDENTITY_INSERT [dbo].[Editura] ON 
INSERT [dbo].[Editura] ([Id_Editura], [Nume], [Sediu], [Oras], [Tara]) VALUES (1,'Litera',NULL,'Chisinau','Moldova')
INSERT [dbo].[Editura] ([Id_Editura], [Nume], [Sediu], [Oras], [Tara]) VALUES (2,'Humanitas',NULL,'Bucuresti','Romania')
INSERT [dbo].[Editura] ([Id_Editura], [Nume], [Sediu], [Oras], [Tara]) VALUES (3,'Arthur',NULL,'Bucuresti','Romania')
INSERT [dbo].[Editura] ([Id_Editura], [Nume], [Sediu], [Oras], [Tara]) VALUES (4,'Carminis',NULL,'Pitesti','Romania')
INSERT [dbo].[Editura] ([Id_Editura], [Nume], [Sediu], [Oras], [Tara]) VALUES (5,'Trei',NULL,'Bucuresti','Romania')
SET IDENTITY_INSERT [dbo].[Editura] OFF

--Inserare date pentru tabela -Autori
--Explicatie autori la Status este notat daca autorul este mort (1) sau viu(0) am ales sa folosim bit pentur a stoca aceasta variabila.
SET IDENTITY_INSERT [dbo].[Autori] ON 
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (1,'Rebreanu','Liviu',NULL,1,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (2,'Kiosaki','Robert','9857375821',0,'american')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (3,'Giurescu','Constantin',NULL,1,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (4,'Melinte','Paul','0893786730',0,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (5,'Creanga','Ion',NULL,1,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (6,'Arghezi','Tudor',NULL,1,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (7,'Blaga','Lucian',NULL,1,'roman')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (8,'Obama','Barack','087367190',0,'american')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (9,'Jones','Dan','0711668905',0,'american')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (10,'Gates','Bill','9811668901',0,'american')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (11,'Binder','Irina','4411668901',1,'romanca')
INSERT [dbo].[Autori] ([Id_Autor], [Nume], [Prenume], [Nr_telefon], [Status] , [Origine]) VALUES (12,'Donald','Trump','4400668999',1,'american')
SET IDENTITY_INSERT [dbo].[Autori] OFF

--Inserare date pentru tabela -Membri 
SET IDENTITY_INSERT [dbo].[Membri] ON 
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (1,'Stan','David','2019-09-03','2022-09-03',7,2,'0258467900')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (2,'Marc','Daniel','2017-08-11','2020-08-11',15,4,'0908467900')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (3,'Vajdea','Diana','2012-05-15','2015-05-15',10,0,'5258467900')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (4,'Ionescu','Andrei','2017-06-28','2020-06-28',20,6,'0258467902')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (5,'Bar','Maria','2020-12-15','2023-12-15',5,1,'9878467900')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (6,'Popescu','Andrei','2013-03-27','2016-03-27',35,3,'9878467967')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (7,'Bursuc','George','2016-12-01','2019-12-01',19,4,'0178467900')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (8,'Morar','Petronela','2018-04-03','2021-04-03',10,3,'9008467901')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (9,'Culda','Nicolae','2021-09-13','2024-09-13',17,2,'0878467211')
INSERT [dbo].[Membri] ([Id_Membru], [Nume], [Prenume], [Data_Inregistrarii], [Data_Expirare], [Nr_Toatal_Carti], [Nr_Carti_Curente], [Nr_Telefon])
	VALUES (10,'Cotisel','Virgil','2022-08-27','2025-08-27',50,7,'3987846609')
SET IDENTITY_INSERT [dbo].[Membri] OFF

--Inserare date pentru tabela -Personal 
SET IDENTITY_INSERT [dbo].[Personal] ON 
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (1,'Gombos','Raul','Asistent bibliotecar','6-14',19,'stagiar','2700','0846190538')
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (2,'Joldes','Bibliotecara','Raluca','6-14',35,'Angajata','4670','0946890538')
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (3,'Buzgariu','Daniel','Asistent bibliotecar','14-22',20,'stagiar','2700','0846190500')
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (4,'Bodea','Georgiana','Bibliotecara','14-22',29,'Angajata','4700','0746190118')
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (5,'Berindeie','Lia','Femeie de serviciu','8-16',43,'Angajata','2500','0274657098')
INSERT [dbo].[Personal] ([Id_personal], [Nume], [Prenume],[Job] ,[Program],[Varsta],[Status Job],[Salariu],[Nr_telefon])
VALUES (6,'Anstasia','Popescu','Femeie de serviciu','8-16',66,'Angajata','2600','0284656098')
SET IDENTITY_INSERT [dbo].[Personal] OFF

--Inserare date pentru tabela -Categorie
SET IDENTITY_INSERT [dbo].[Categorie] ON 
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (1,'Beletristica')
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (2,'Dictionare')
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (3,'Enciclopedii')
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (4,'Religioase')
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (5,'Clasici')
INSERT [dbo].[Categorie] ([Id_Categorie],[Categorie]) VALUES (6,'Dezvoltare Personala')
SET IDENTITY_INSERT [dbo].[Categorie] OFF

--Inserare date pentru tabela -Carti
SET IDENTITY_INSERT [dbo].[Carti] ON 
INSERT [dbo].[Carti] ([Id_Carte],[Titlu], [Id_Autor],[Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (1,'Ion',1,528,'2018-07-24',1,'145x205',5)
INSERT [dbo].[Carti] ([Id_Carte],[Titlu], [Id_Autor],[Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (2,'Tata bogat, tata sarac',2,232,'2019-09-03',2,'170x240',2)
INSERT [dbo].[Carti] ([Id_Carte],[Titlu], [Id_Autor],[Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (3,'Rascoala',1,360,'2013-06-05',3,NULL,5)
INSERT [dbo].[Carti] ([Id_Carte],[Titlu], [Id_Autor],[Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (4,'Amintiri din copilarie',5,144,'2018-07-03',3,NULL,5)
INSERT [dbo].[Carti] ([Id_Carte],[Titlu], [Id_Autor],[Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (5,'Hronicul si cantecul varstelor',7,284,'2018-03-05',2,'130 x 200',5)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (6,'Istoria romanilor',3,1792,'2019-06-30',1,NULL,5)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (7,'Lasa vrajala',4,208,'2019-05-10',1,'130 x 195',6)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (8,'Pamantul fagaduintei',8,850,'2020-09-05',2,NULL,3)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (9,'Templierii',9,528,'2022-08-20',1,NULL,5)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (10,'Flori de mucegai',6,200,'1931-10-26',3,'130 x 200',1)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (11,'Stiinta. Idei fundamentale',10,352,'2016-12-05',5,'145 x 200',3)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (12,'Fluturi',11,1000,'2020-09-05',2,NULL,1)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (13,'Ciuleandra',1,400,'1927-10-01',1,NULL,1)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (14,'Poemele luminii',7,200,'1919-08-27',3,'130 x 200',5)
INSERT [dbo].[Carti] ([Id_Carte], [Titlu], [Id_Autor], [Nr_pagini], [Data_Publicarii] , [Id_Editura], [Format], [Id_Categorie]) 
	VALUES (15,'Cum sa devii bogat',2,254,'2007-02-10',5,'145 x 200',6)
SET IDENTITY_INSERT [dbo].[Carti] OFF

--Inserare date pentru tabela -Imprumuturi
SET IDENTITY_INSERT [dbo].[Imprumuturi] ON 
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (1,1,2,'2020-03-05','2020-03-19')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (2,1,4,'2021-08-09','2021-08-14')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (3,3,8,'2021-12-28','2022-01-6')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (4,1,10,'2022-04-10','2022-04-20')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (5,3,5,'2015-06-22','2015-06-30')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (6,1,7,'2020-08-13','2020-08-25')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (7,2,7,'2020-08-13','2020-09-03')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (7,2,7,'2020-08-13','2020-09-03')
INSERT [dbo].[Imprumuturi] ([Id_Imprumut],[Id_Carte],[Id_Membru],[Data_Imprumut], [Data_Returnare]) VALUES (8,6,8,'2021-09-22','2021-10-06')
SET IDENTITY_INSERT [dbo].[Imprumuturi] OFF

--Inserare date pentru tabela -Biblioteca1
/*Explicatie Bibilioteca1  am ales acest nume deoarece se creea o confuzie intre numele bazei de date si cel al acestei tabele 
pe care o folosim pentru a insera o singura biblioteca cu sediu de care apartin toate tabelele create mai sus */ 
SET IDENTITY_INSERT [dbo].[Biblioteca1] ON 
INSERT [dbo].[Biblioteca1] ([Id_Sediu], [Nume], [Locatie], [Data_Infiintare]) 
	VALUES (1,'Biblioteca Judeteana Octavian Goga','Cluj','1995-08-09')
SET IDENTITY_INSERT [dbo].[Biblioteca1] OFF

/* Interogari */
/* Interogarea 1 */
use Biblioteca
go
Select Carti.Titlu as Titlu_Carte, Carti.Nr_Pagini as Nr_Pagini,Carti.Data_Publicarii as Data_Publicare,Autori.Nume as Nume_Autor ,Autori.Prenume as Prenume_Autor,Categorie as Categorie, Editura.Nume as Editura
from Carti 
INNER JOIN Autori on Carti.Id_Autor=Autori.Id_Autor
INNER JOIN Categorie on Carti.Id_Categorie=Categorie.Id_Categorie
INNER JOIN Editura on Carti.Id_Editura=Editura.Id_Editura
where Editura.Tara IN ('Romania','Moldova') AND Carti.Titlu LIKE 'i%' AND Nr_Pagini >300 

/* Interogarea 2 */
use Biblioteca
go
SELECT Carti.Titlu as [Titlu Carte] , Membri.Nume as [Nume Membru], Membri.Prenume as [Prenum Membru],Imprumuturi.Data_Imprumut as Data_Imprumut, Imprumuturi.Data_Returnare as Data_Returnare
from Carti
LEFT Join Imprumuturi on Carti.Id_Carte=Imprumuturi.Id_Carte
LEFT Join Membri on Imprumuturi.Id_Membru=Membri.Id_Membru
WHERE Membri.Id_Membru  in (SELECT Id_Membru from Imprumuturi) 
AND Carti.Nr_Pagini=(Select max(Nr_Pagini) from Carti)
GO

/* Vedere */
Create view Vedere_Biblioteca
as
Select Carti.Titlu as Titlu_Carte, Carti.Nr_Pagini as Nr_Pagini,Carti.Data_Publicarii as Data_Publicare,Autori.Nume as Nume_Autor ,Autori.Prenume as Prenume_Autor,Categorie as Categorie, Editura.Nume as Editura, Membri.Nume as Membru
from Carti 
INNER JOIN Autori on Carti.Id_Autor=Autori.Id_Autor
INNER JOIN Categorie on Carti.Id_Categorie=Categorie.Id_Categorie
INNER JOIN Editura on Carti.Id_Editura=Editura.Id_Editura
INNER JOIN Imprumuturi on Carti.Id_Carte=Imprumuturi.Id_Carte
INNER JOIN Membri on Imprumuturi.Id_Membru=Membri.Id_Membru
GO

/* Functii */
/* Functia 1  */
Create function f_Exsitence(@Origine varchar(20), @status varchar(10))
returns table 
as
return (Select * from Autori 
		WHERE Autori.Origine=@Origine AND Autori.Status=(CASE WHEN @status='viu' then 0
															  WHEN @status='mort' then 1 
															  ELSE 1 END)
)
GO
/*Explicatii functie : in principal aceasta functie este utilizata pentru a cauta autorii dupa o anumita originie si dupa un anumit status 
aceste doua criterii vor constituii defapt parametrii functiei atunci cand este apelata si chiar daca statusul l-am setat ca tip de data bit
ne-am gandit ca ar fi mult mai usor sa fie introdus in parametrii statusul dorit (morit/viu) ca vairabile de tip varchar*/ 

--Exemplu:
select * from f_Exsitence('roman','viu')
GO

/* Functia 2 */
Create function f_NrImprumuturi(@Carte varchar(80))
returns int
as 
begin
declare @rezultat int
if exists(Select * from Carti where Carti.Titlu=@Carte)
	begin
	set @rezultat=  (SELECT COUNT(Membri.Id_Membru) 
					from Carti
					INNER JOIN Imprumuturi on Carti.Id_Carte=Imprumuturi.Id_Carte
					INNER JOIN Membri on Imprumuturi.Id_Membru=Membri.Id_Membru
					WHERE Carti.Titlu=@Carte)
										
	end
else
begin
	set @rezultat=0
end

return @rezultat
end

/*Explicatie functie 2: la apelul acestei functii este returnat numarul de membrii care au imprumutat o anumita carte 
 oferita ca nume in parametrii functiei la apelul acesteia*/

--Exemplu:
GO
select dbo.f_NrImprumuturi('Tata bogat, tata sarac') as Nr_Membri

/* Proceduri stocate */

/* Procedura 1*/
GO
CREATE PROCEDURE Ins_Imprumut(@IdC int, @IdM int, @Di date, @Dr date )
as
begin
if DATEDIFF(day,@Di,@Dr)>20 
	begin 
	print 'Nu putem imprumuta carti pentru o perioada mai mare 20 de zile'
	end
else 
	begin
	insert into Imprumuturi(Id_Carte,Id_Membru,Data_Imprumut,Data_Returnare)
		values(@IdC,@IdM,@Di,@Dr)
	print 'Imprumutul a fost realizat cu succes'
	UPDATE Membri 
	SET Membri.Nr_Toatal_Carti =	Membri.Nr_Toatal_Carti + 1,
		Membri.Nr_Carti_Curente = Membri.Nr_Carti_Curente+ 1
	Where Id_Membru=@IdM
	end
end
go
/*Explicatie procedura stocata 1: aplicabilitatea acestei proceduri stocate este prezenta atunci cand dorim sa inseram inregistrari in
tabela imprumuturi, exista totusi o diferenta fata de o simpla inserare si anume daca dorim sa inseram un imprumut cu o perioada mai 
lunga de 20 de zile procedura ne va atentiona de aceasta incercare si inserarea nu va fi efectuata. In cazul in care normele pentru 
inserare au fost indeplinite in tabela Membrii la id-ul respectiv care va face inserarea li se va face update la campurile:
Nr_Total_Carti si Nr_Carti_Curente.*/

--Exemplu:
select * from Imprumuturi
where Id_Membru=1;

EXEC Ins_Imprumut 3,4,'2021-08-09','2021-08-14'

/* Procedura 2 */
GO
Create Procedure Delete_Imprumut(@IdI int )
as
begin
	Declare @IdM int 
	SET @IdM =(select Id_Membru from Imprumuturi where Id_Imprumut=@IdI)
	DELETE FROM Imprumuturi where Id_Imprumut=@IdI 
	print 'Inregistrarea cu imprumutul a fost stearsa'
	UPDATE Membri 
	SET Membri.Nr_Carti_Curente = Membri.Nr_Carti_Curente -1
	Where Id_Membru=@IdM
end

/*Explicatie procedura 2: putem folosi aceasta inregistrare pentru a sterge un imprumut dupa id-ul imprumutului si de asemenea
tabelei membrii li se va face update astfel incat membrul a carui inregistrare i-a fost stearsa sa ii se modifice si numarul
de carti curente imprumutate.*/

--Exemplu : inlocuiti id_valabil cu un id corect din tabela imprumuturi.
select * from Imprumuturi
EXEC Delete_Imprumut id_valabil

/* Cursor */
begin
	SET NOCOUNT ON
	declare @Id_per int;
	declare @Nume varchar(60);
	declare @Salar varchar(10);
	declare pr_cursor cursor for
	Select Id_personal , Nume ,Salariu from Personal
	open pr_cursor;
	fetch next from pr_cursor into @Id_per ,@Nume ,@Salar;
	while @@FETCH_STATUS = 0
	begin 
		if @Salar >=3000
			begin
			set @Salar =@Salar +50; 
			end
		else 
			begin
			set @Salar =@Salar +150;
			end
		update Personal 
		set Salariu = @Salar 
		where Id_personal=@Id_per
		print @Nume + ' acuma castiga ' + @Salar;
		fetch next from pr_cursor into @Id_per ,@Nume ,@Salar;
	end
	close pr_cursor;
	deallocate pr_cursor;
end
/*Explicatie cursor : cursorul va fi setat pentru tabela Personal avand campurile selectate: Id_personal, Nume,Salariu
acest cursor printeaza numele unui lucrator din tabela Personal si in cazul in care salariul lui depaseste 3000 de lei
la printare salariul ii va fi afisat cu 50 de lei mai mult altfel cu 150 de lei in plus.*/

/* Trigger 1*/
GO
CREATE Trigger Insert_Trig on Personal instead of insert 
as
begin
	declare @var int = (Select Varsta from inserted)
	declare @n varchar(60) = (Select Nume from inserted)
	declare @p varchar(60) = (Select Prenume from inserted)
	declare @j varchar(60) = (Select Job from inserted)
	declare @pr varchar(100) = (Select Program from inserted)
	declare @sj varchar(60) = (Select [Status Job] from inserted)
	declare @slriu varchar(10) =(Select [Salariu] from inserted)
	declare @nr_tel varchar(60) = (Select Nr_telefon from inserted)
	if @var<18
		begin
		print 'Nu pot fi angajati copii cu varsta mai mica de 16 ani'
		end
	else
		begin
		insert into Personal
		VALUES(@n,@p,@j,@pr,@var,@sj,@slriu,@nr_tel)
		end
end
GO

/*Explicatie Insert_Trig : acest trigger este automat folosit in momentul inserarii unor indivizi in tabela Personal
daca cumva persoana pentru care incercam sa incarcam o inregistrare este minora trigger-ul va printa un mesaj si va impiedica
inserarea deoarece este de tip instead of */ 

--Exemplu Insert_Trig:
select * from Personal 
insert into Personal
Values('Andrew','Smith','Asistent bibliotecar','7-13',15,NULL,'2300','0746217379')

/* Trigger 2*/
GO
Create trigger Delete_Trig on Personal instead of delete 
as 
begin
	declare @var int = (Select Varsta from deleted)
	declare @id int = (Select Id_Personal from deleted)
	if @var between 18 and 23 
	begin
	update Personal 
	set Personal.[Status job]='Perioada finalizata'
	where Id_Personal=@id
	end
	else if @var >65
	begin
	update Personal 
	set Personal.[Status job]='Pensionat(a)'
	where Id_Personal=@id
	end
end

/*Explicatie Delete_Trig : acest trigger este declansat cand incercam sa stergem inregistrari din tabela Personal si functionalitatea lui
consta in faptul ca nu sterge inregistrarile ci modifica coloana cu [Status Job] in perioada finalizata daca varsta angajatului este 
intre 18 si 23 si daca persoana respectiva are o varsta peste 65 de ani [Status Job] va deveni -> Pensionata(a)*/

--Exemplu:
select * from Personal
delete from Personal
where Personal.Id_personal=3;
