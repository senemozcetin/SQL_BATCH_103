CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, -- Ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date
);

--VAROLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE notlar
AS
SELECT isim,not_ort FROM ogrenciler2;

SELECT * FROM notlar;

--TABLO ICINE VERI EKLEME

INSERT INTO notlar VALUES('Busra',85.5);
INSERT INTO notlar VALUES('Seda',65.5);
INSERT INTO notlar VALUES('Esra',85.5);
INSERT INTO notlar VALUES('Emine',95.5);
INSERT INTO notlar VALUES('Bahar',75.5);
INSERT INTO notlar VALUES('Beyza',90.5);

SELECT * FROM notlar;
Create table talebeler
(
isim varchar(4),
notlar real
);

INSERT INTO notlar VALUES('Busra',85.5);
INSERT INTO notlar VALUES('Seda',65.5);
INSERT INTO notlar VALUES('Esra',85.5);
INSERT INTO notlar VALUES('Emine',95.5);
INSERT INTO notlar VALUES('Bahar',75.5);
INSERT INTO notlar VALUES('Beyza',90.5);

select isim from notlar;

--CONSTRAINT
--UNIQUE

CREATE TABLE ogrenciler4
(
ogrenci_no char(7) unique ,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real, 
kayit_tarih date
);
SELECT * FROM ogrenciler4;

INSERT INTO ogrenciler4 VALUES('1234567','Ali','Veli',85.5,now());
INSERT INTO ogrenciler4 VALUES('1234568','Ali','Veli',85.5,now()); --ogrenci no yu ayni girersem error verir cunku unique olarak tanimlamistik
INSERT INTO ogrenciler4 (ogrenci_no,soyisim,not_ort) VALUES ('1234569', 'Evren',85.5)-- not null kisitlamasi oldugu icin bu veri eklenemez 

--PRIMARY KEY ATAMASI

CREATE TABLE ogrenciler5
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real, 
kayit_tarih date
);

--Primary key atamasi 2.yol:
CREATE TABLE ogrenciler6
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, 
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY (ogrenci_no)
);

CREATE TABLE ogrenciler7
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);

Create Table sehirler1
(
alan_kodu char(4) PRIMARY KEY,
isim varchar(25) NOT NULL,
nufus int
);

INSERT INTO sehirler1 VALUES('0232','Asli',123456789);

SELECT * FROM sehirler1;

-- FOREIGN KEY 
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
CREATE TABLE tedarikciler3
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)    
);
CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);
CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);
select * from tedarikciler3;
select * from urunler;
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın. 
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve 
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date    
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)    
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- INT / STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY 
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
   
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * FROM calisanlar;
SELECT * FROM adresler;
-- CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000) NOT NULL,
ise_baslama date    
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14'); 

-- DQL -- WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

-- Calisanlar tablosundan maası 5000 den buyuk olan isimleri listeleyiniz
SELECT isim,maas FROM calisanlar WHERE maas>5000;


-- Calisanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE isim='Veli Han';


-- Calisanlar tablosundan maası 5000 olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE maas=5000;


-- DML -- DELETE KOMUTU

DELETE FROM calisanlar; -- Eğer parent tablo başka bir child tablo ile iliskili ise önce child tablo silinmelidir
DELETE FROM adresler;
SELECT * FROM adresler;

--Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir = 'Antep';


CREATE TABLE ogrenciler8
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler8 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler8 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler8 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler8 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler8;

--ismi 'Nesibe Yilmaz' veya Mustafa Bak olan kayitlari silelim
DELETE FROM ogrenciler8 WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak';
DELETE FROM ogrenciler8 WHERE isim='Ali Can' and id=123;
DELETE FROM ogrenciler8 WHERE id>126; 
DELETE FROM ogrenciler8 WHERE id=123 or id=125 or id=126;






