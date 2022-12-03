--DATABASE (Veri Tabani) OLUSTURMA
Create Database senem;

--DDL DATA DEFINITION LANG.
--CREATE- TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, -- Ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENI TABLO OLUSTURMA 
CREATE TABLE ogrenci_notlari
AS   --Benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin
     --normal tablo olustururkenki parantezler yerine AS kullanip select koutuyla almak istedigimiz verileri aliriz
SELECT isim,soyisim,not_ort FROM ogrenciler;

INSERT INTO ogrenciler VALUES('1234567','SENEM','OZCETIN',85.5,now());
INSERT INTO ogrenciler VALUES('1234567','SENEM','OZCETIN',85.5,'2020-12-11');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK
INSERT INTO ogrenciler(isim,soyisim) VALUES ('Serdal','Ozcetin');

--DQL - DATA QUERY LANG
--SELECT
SELECT * FROM ogrenciler;--Burdaki * sembolu hersey anlamindadir


















