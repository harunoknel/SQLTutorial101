----Veritabaný oluþturma
--CREATE DATABASE OVAUN
--ON PRIMARY(
--NAME='METADATA',
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL13.ERHANDB\MSSQL\DATA\OVAUN.MDF',
--SIZE=10 MB,
--MAXSIZE=UNLIMITED,
--FILEGROWTH=5 MB
--)
--LOG ON
--(
--NAME='LOG',
--FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL13.ERHANDB\MSSQL\DATA\OVAUN.LDF',
--SIZE=2 MB,
--MAXSIZE=100 MB,
--FILEGROWTH=50 %
--)



--/**/



--/*TN_CARI TABLO OLUSTURMA*/
--CREATE TABLE TN_CARI
--(
--CARI_ID INT PRIMARY KEY IDENTITY(100000,100),
--ADI NVARCHAR(200) NOT NULL,
--SOYADI NVARCHAR(200) NOT NULL,
--UNVAN NVARCHAR(200),
--ADRESI NVARCHAR(200),
--ADRES_IL NVARCHAR(20),
--VERGI_DAIRE NVARCHAR(20),
--VERGI_NO NVARCHAR(11),
--TEL1 NVARCHAR(15),
--CEP_TEL NVARCHAR(15)
--)



/*KISITLAMALAR*/



/*IN_IL TABLO OLUÞTURMA*/
--CREATE TABLE  IN_IL(
--PLAKA_NO NVARCHAR(3),
--IL_ADI NVARCHAR(20),
--ULKE NVARCHAR(20)
--)


--DECLARE 

--@i INT
--SET @i=1
--WHILE @Ý<10000

--BEGIN 

--INSERT IN_IL

--SELECT CAST(@i AS nvarchar(3)),

--'ILADI'+CAST(@i AS nvarchar(20)),

--'ULKEADI'+CAST(@i AS nvarchar(20));
--SET @i=@i+1
--END




SET STATISTICS IO ON
SET STATISTICS TIME ON

GO
SELECT * FROM TN_IL WHERE PLAKA_NO='550'

/*SÝSTEME INDEX EKELEME VE KALDIRMA*/
CREATE CLUSTERED INDEX IX_1 ON TN_IL(PLAKA_NO)


DROP INDEX IX_1 ON TN_IL



ALTER TABLE TN_IL ADD CONSTRAINT PR_KEY1
PRIMARY KEY(PLAKA_NO)



CREATE TABLE TN_BIRIM
(
BIRIM_ID NVARCHAR(2) PRIMARY KEY NOT NULL,
BIRIM_ADI NVARCHAR(20)
)


INSERT INTO TN_BIRIM(BIRIM_ID,BIRIM_ADI) VALUES ('AD','ADET')

CREATE TABLE TN_IL
(
  IL_ADI NVARCHAR(20),
  ULKE_ADI NVARCHAR(20),
  CONSTRAINT PK_PLAKA_NO PRIMARY KEY TN_IL(PLAKA_NO)
)


ALTER TABLE TN_CARI ADD IL_PLAKA NVARCHAR(3) FOREIGN KEY REFERENCES TN_IL(PLAKA_NO)
