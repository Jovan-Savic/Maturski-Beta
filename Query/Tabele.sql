CREATE DATABASE Djacki
Use Djacki

/* TABELE SQL */
create table Tip(
id int primary key identity(1,1),
tip nvarchar(20) not null
)

create table Ucenik(
id int primary key identity(1,1),
ime nvarchar(20) not null,
prezime nvarchar(20) not null,
jmbg nvarchar(13) not null,
)

create table Profesor(
id int primary key identity(1,1),
ime nvarchar(20) not null,
prezime nvarchar(20) not null,
email nvarchar(35) not null,
jmbg nvarchar(13) not null,
passw nvarchar(20) not null,
tip_id int foreign key references Tip(id),
)

create table Dinar(
id_dinara int primary key identity(1,1),
id_ucenika int foreign key references Ucenik(id),
id_profesora int foreign key references Profesor(id),
iznos int not null,
datum date,
uplacen nvarchar(2) DEFAULT 'Ne' not null,
)
GO
/* PROCEDURE ZA UPLATE?? NE ZNAM DA LI MI TREBA OVO ALI OSTAVICU*/
GO
Create proc uplatioje 
@id_dinara nvarchar(2)
as
begin
UPDATE Dinar set uplacen = 'Da' WHERE id_dinara = @id_dinara
end
Go
/*TUGL KOMANDA ZA UPLATU*/
GO
Create proc tugluplate 
@id_dinara nvarchar(2)
as
begin
IF EXISTS (SELECT TOP 1 uplacen FROM Dinar
	WHERE id_dinara =@id_dinara and uplacen = 'Ne')
	UPDATE Dinar set uplacen = 'Da' WHERE id_dinara = @id_dinara
	else if EXISTS (SELECT TOP 1 uplacen FROM Dinar
	WHERE id_dinara =@id_dinara and uplacen = 'Da')
	UPDATE Dinar set uplacen = 'Ne' WHERE id_dinara = @id_dinara
end
GO
/*IZBOR SVIH STORED PROCEDURES*/
SELECT * 
  FROM Djacki.INFORMATION_SCHEMA.ROUTINES
 WHERE ROUTINE_TYPE = 'PROCEDURE'
 Drop table Dinar
 GO
/*INSERT DELETE za TIP*/
GO
CREATE PROC Tip_Insert
@tip nvarchar(20)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 tip  FROM Tip
	WHERE tip = @tip)
	Return 1
	else
	Insert Into Tip(tip)
	Values(@tip)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create Proc Tip_Delete
@tip nvarchar(20)
AS
Begin TRY
Delete from Tip where tip=@tip
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/* INSERT UPDATE DELETE za UCENIK*/
GO
CREATE PROC Ucenik_Insert
@ime nvarchar(20),
@prezime nvarchar(20),
@jmbg nvarchar(13)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 ime,prezime  FROM Ucenik
	WHERE ime = @ime and prezime=@prezime)
	Return 1
	else
	Insert Into Ucenik(ime,prezime,jmbg)
	Values(@ime,@prezime,@jmbg)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create PROC Ucenik_Update
@id int,
@ime nvarchar(20),
@prezime nvarchar(20),
@jmbg nvarchar(20)
AS
SET LOCK_TIMEOUT 3000;

BEGIN TRY
	IF EXISTS (SELECT TOP 1 ime,prezime FROM Ucenik
	WHERE id = @id)

	BEGIN
	
	Update Ucenik  Set ime=@ime,prezime=@prezime, jmbg=@jmbg where id=@id
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create Proc Ucenik_Delete
@id int
as
Begin TRY
Delete from Ucenik where id=@id
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/* INSERT UPDATE DELETE za PROFESORA*/
Go
CREATE PROC Profesor_Insert
@ime nvarchar(20),
@prezime nvarchar(20),
@email nvarchar(35),
@jmbg nvarchar(13),
@passw nvarchar(20),
@tip_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 ime,prezime  FROM Profesor
	WHERE ime = @ime and prezime=@prezime)
	Return 1
	else
	Insert Into Profesor(ime,prezime,jmbg,email,passw,tip_id)
	Values(@ime,@prezime,@jmbg,@email,@passw,@tip_id)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create PROC Profesor_Update
@id int,
@ime nvarchar(20),
@prezime nvarchar(20),
@email nvarchar(35),
@jmbg nvarchar(13),
@passw nvarchar(20),
@tip_id int
AS
SET LOCK_TIMEOUT 3000;

BEGIN TRY
	IF EXISTS (SELECT TOP 1 ime,prezime FROM Profesor
	WHERE id = @id)

	BEGIN

	Update Profesor  Set ime=@ime, prezime=@prezime, jmbg=@jmbg, email=@email, passw=@passw, tip_id=@tip_id where id=@id
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

Go
Create Proc Profesor_Delete
@id int
as
Begin TRY
Delete from Profesor where id=@id
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/* INSERT UPDATE DELETE za DINAR*/
GO
CREATE PROC Dinar_Insert
@id_ucenika int,
@id_profesora int,
@iznos int,
@datum date,
@uplacen nvarchar(2)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 id_ucenika,id_profesora,datum  FROM Dinar
	WHERE id_ucenika = @id_ucenika and id_profesora=@id_profesora and datum=@datum)
	Return 1
	else
	Insert Into Dinar(id_ucenika,id_profesora,iznos,datum,uplacen)
	Values(@id_ucenika,@id_profesora,@iznos,@datum,@uplacen)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create PROC Dinar_Update
@id_dinara int,
@id_ucenika int,
@id_profesora int,
@iznos int,
@datum date,
@uplacen nvarchar(2)
AS
SET LOCK_TIMEOUT 3000;

BEGIN TRY
	IF EXISTS (SELECT TOP 1 id_ucenika,id_profesora FROM Dinar
	WHERE @id_dinara = @id_dinara)

	BEGIN

	Update Dinar Set id_ucenika=@id_ucenika, id_profesora=@id_profesora, iznos=@iznos, datum=@datum, uplacen=@uplacen where @id_dinara=@id_dinara
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

GO
Create Proc Dinar_Delete
@id_dinara int
as
Begin TRY
Delete from Dinar where id_dinara=@id_dinara
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/* POPUNJAVANJE DATABAZE PODACIMA*/
exec Tip_Insert 'Admin'
exec Tip_Insert 'Profesor'

exec Profesor_Insert 'Jovan','Savic','jovanzsavic@gmail.com','2108003772031','111','1'
exec Profesor_Insert 'Profesor','Gerasimovic','gera@gmail.com','2009985712303','222','2'
exec Profesor_Insert 'Profesorka','Zorka','zorkaprofesorka@gmail.com','2009966712033','222','2'

/*exec Profesor_Delete '1' PROVERA*/

exec Ucenik_Insert 'Aleksandar','Stefanovic','2210003713032'
exec Ucenik_Insert 'Milos','Tomic','2828282828823'
exec Ucenik_Insert 'Pilos','Music','9988966773929'
exec Ucenik_Insert 'Filip','Filipovic','11099990302232'
exec Ucenik_Insert 'Petar','Muzurovic','1506003718008'
exec Ucenik_Insert 'Petar','Ilic','0911003714049'
exec Ucenik_Insert 'Stojan','Ilic','11099990302232'
exec Ucenik_Insert 'Petar','Filipovic','1506003718008'
exec Ucenik_Insert 'Petar','Ilic','0911003714049'
exec Ucenik_Insert 'Filip','Tomic','11099990302232'
exec Ucenik_Insert 'Petar','Music','1506003718008'
exec Ucenik_Insert 'Petar','Ilic','0911003714049'
exec Ucenik_Insert 'Filip','Stefanovic','11099990302232'
exec Ucenik_Insert 'Stefanovic','Muzurovic','1506003718008'
exec Ucenik_Insert 'Petar','Ilic','0911003714049'
exec Ucenik_Insert 'Filip','Filipovic','11099990302232'
exec Ucenik_Insert 'Petar','Muzurovic','1506003718008'
exec Ucenik_Insert 'Petar','Ilic','0911003714049'


exec Dinar_Insert '1','2','750','2022-4-4','Ne'
exec Dinar_Insert '2','2','750','2022-4-4','Da'
exec Dinar_Insert '3','2','750','2022-4-4','Ne'
exec Dinar_Insert '4','3','750','2022-4-4','Da'
exec Dinar_Insert '5','3','750','2022-4-4','Da'
exec Dinar_Insert '6','3','750','2022-4-4','Ne'
exec Dinar_Insert '11','2','750','2022-4-4','Ne'
exec Dinar_Insert '12','3','750','2022-4-4','Da'
exec Dinar_Insert '10','3','750','2022-4-4','Ne'
exec Dinar_Insert '7','2','750','2022-4-4','Ne'
exec Dinar_Insert '8','2','750','2022-4-4','Da'
exec Dinar_Insert '9','2','750','2022-4-4','Ne'
/*SELECT id_dinara, Ucenik.ime, Ucenik.prezime, Profesor.prezime as prezime1, datum, iznos, uplacen from Dinar  
LEFT JOIN Ucenik on id_ucenika = Ucenik.id 
LEFT JOIN Profesor on id_profesora = Profesor.id
           Use Djacki   PROVERA */
GO 
/*PROCEDURA ZA LOGOVANJE*/
GO
Create PROC Logovanje
@email nvarchar(50),
@passw nvarchar(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 email FROM Profesor
	WHERE email = @email and passw=@passw)
	Begin
	RETURN 0
	end
	RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/*PROCEDURA KOJA PROVERAVA TIP PROFESORA*/
GO
Create PROC Jeladmin
@email nvarchar(50),
@passw nvarchar(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
RETURN (SELECT TOP 1 tip_id FROM Profesor
	WHERE email = @email and passw=@passw)
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/* RAZNE PROCEDURE POTREBNE ZA ODREDJENE FUNKCIJE KOJE NISAM HTEO DA KUCAM U C#*/
GO
Create function Dajime (@email nvarchar(50)) RETURNS nvarchar(50)
AS
BEGIN 
 RETURN (SELECT TOP 1 ime +' ' + prezime FROM Profesor
	WHERE email = @email)
END 
GO

create PROC Popuni
@profesor_id int
as
SET LOCK_TIMEOUT 3000;
BEGIN TRY
SELECT id_dinara, Ucenik.ime, Ucenik.prezime, datum, iznos, uplacen from Dinar  LEFT JOIN Ucenik on id_ucenika = Ucenik.id  LEFT JOIN Profesor on id_profesora = Profesor.id  WHERE Profesor.id = @profesor_id
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO

Create PROC Popunirac
as
SET LOCK_TIMEOUT 3000;
BEGIN TRY
SELECT id_dinara, Ucenik.ime, Ucenik.prezime,Profesor.ime, Profesor.prezime, datum, iznos, uplacen from Dinar 
LEFT JOIN Ucenik on id_ucenika = Ucenik.id 
LEFT JOIN Profesor on id_profesora = Profesor.id 
ORDER BY Profesor.prezime
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
exec Popuni '3'

GO
CREATE PROC Dajid
@email nvarchar(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
RETURN (SELECT TOP 1 id FROM Profesor
	WHERE email = @email)
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO

CREATE PROC Dajidprof
@prezime nvarchar(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
RETURN (SELECT TOP 1 id FROM Profesor
	WHERE prezime = @prezime)
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO

GO
CREATE PROC Dajiduc
@ime nvarchar(50),
@prezime nvarchar(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
RETURN (SELECT TOP 1 id FROM Ucenik
	WHERE ime = @ime and prezime = @prezime)
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO

CREATE PROC Ukupaniznos
AS
 RETURN(SELECT SUM(iznos) FROM Dinar WHERE uplacen = 'Da')
 GO
 GO
 CREATE PROC Neukupaniznos
 AS
  RETURN(SELECT SUM(iznos) FROM Dinar WHERE uplacen = 'Ne')




/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/