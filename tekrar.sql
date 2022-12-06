/*
“tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi” field’lari olsun.
*/

create table tedarikciler1 
(
tedarikci_id char(5),
tedarikci_ismi varchar,
tedarikci_adres varchar,
ulasim_tarihi date
);

select * from tedarikciler1;

/*
“tedarikçi_ziyaret” isminde bir tabloyu
“tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari
olsun.
*/
Create table tedarikci_ziyaret
as
select tedarikci_ismi,ulasim_tarihi from tedarikciler1;

select * from tedarikci_ziyaret;
/*
“ ogretmenler” isminde tablo olusturun.
Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
Kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
*/
create table ogretmenler
(
kimlik_no char (11),
isim varchar,
brans varchar,
cinsiyet char(5)
);

INSERT INTO ogretmenler VALUES('12345678912','Ayse Guler','Matematik','kadin');

/*
“sehirler” isimli bir Table olusturun.
Tabloda “alan_kodu”, “isim”, “nufus”
field’lari olsun. Isim field’i bos
birakilamasin.
1.Yontemi kullanarak “alan_kodu”
field’ini “Primary Key” yapin
*/

create table sehirler
(
alan_kodu varchar primary key,
isim varchar not null,
nufus int,
CONSTRAINT sehirlerinpki PRIMARY KEY (alan_kodu)
);

/*
“tedarikciler3” isimli bir tablo olusturun.
Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun
ve “tedarikci_id” yi Primary Key yapin. “urunler” isminde baska bir tablo olusturun
“tedarikci_id” ve “urun_id” field’lari olsun ve “tedarikci_id” yi Foreign Key yapin
*/

create table tedarikciler3
(
tedarikci_id char(5),
tedarikci_ismi varchar,
urun_id char(5),
CONSTRAINT urunler_tedid_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
create table urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urunler_tedid_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
,
“ise_baslama” field’lari
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”
,
“sokak”
,
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun
*/

create table calisanlar
(
id char(5),
isim varchar unique,
maas int not null,
ise_baslama date,
CONSTRAINT calisanlar_id_pk PRIMARY KEY (id)
);

create table adresler
(
adres_id varchar,
sokak varchar,
cadde varchar,
sehir varchar,
CONSTRAINT adresler_adres_id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

/*
sehirler2 tablosu olusturalim, nufusun negatif deger girilmemesi icin
sinirlandirma (Constraint) koyalim
*/

CREATE TABLE sehirler2
(
alan_kodu int PRIMARY KEY,
isim varchar(20) NOT NULL,
nufus int CHECK (nufus>0)
);



CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler6;
-- id'si 124 olan ogrenciyi siliniz.
-- ismi Kemal Yasa olan satırını siliniz


delete from ogrenciler6 where id=124;
delete from ogrenciler6 where isim='Kemal Yasa';

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

delete from ogrenciler6 where isim='Nesibe Yilmaz' or isim='Mustafa Bak';
delete from ogrenciler6 where isim IN ('Nesibe Yilmaz','Mustafa Bak');

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
-- id 'si 126'dan büyük olan kayıtları silelim.
-- id'si 123, 125 veya 126 olanları silelim.

delete from ogrenciler6 where isim='Ali Can' and id=123;
delete from ogrenciler6 where id>126;
delete from ogrenciler6 where id=123 or id=125 or id=126;

delete from ogrenciler6 where id in (123,125,126);

delete from ogrenciler6 where id between 123 and 126;

delete from ogrenciler6 where id not between 123 and 126;



CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);


CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124,'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125,'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126,'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127,'Mustafa Bak', 'Can',99);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;

DELETE from notlar where talebe_id='123';-- child
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. parent taki veri silinmez.
DELETE from talebeler where id='124';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.
DELETE FROM talebeler; -- Parent tablo ile birlikte child tablodaki verileride siler
DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent olan talebeler tablosunu siler

CREATE TABLE talebeler1
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler1(id)
);

INSERT INTO talebeler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler1 VALUES(124,'Merve Gul', 'Ayse',85);
INSERT INTO talebeler1 VALUES(125,'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler1 VALUES(126,'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler1 VALUES(127,'Mustafa Bak', 'Can',99);
INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

select * from talebeler1;
select * from notlar1;

DELETE from notlar1 where talebe_id='123';
DELETE from talebeler1 where id='123';

delete from talebeler1 where id='127';

drop table notlar1 cascade;

--subqueries

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2;
select * from markalar;
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

select isim,maas,isyeri from calisanlar2
where isyeri IN (SELECT marka_isim from markalar where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim,maas,sehir from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id>101);

--Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

select marka_id,calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');

select max(maas) from calisanlar2
select sum(maas) from calisanlar2
select avg(maas) from calisanlar2
select round(avg(maas),2) from calisanlar2 
select min(maas) from calisanlar2
select count(maas) from calisanlar2

select * from calisanlar2;
select * from markalar;
select marka_id,marka_isim,

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

select * from calisanlar2;
select * from markalar;

select marka_id,marka_isim, (select count(sehir) from calisanlar2 where isyeri=marka_isim)
from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim,calisan_sayisi, (SELECT sum(maas) from calisanlar2 where isyeri=marka_isim) as maaslartoplami
FROM markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT min(maas) from calisanlar2 where isyeri=marka_isim)as minimummaas,
(SELECT max(maas) from calisanlar2 where isyeri=marka_isim)as maximummaas
from markalar;

CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

/*
MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
*/

select * from mart;
select * from nisan;

select musteri_isim,urun_id from mart where urun_id in(select urun_id from nisan)

select musteri_isim,urun_isim from mart where exists(select urun_isim from nisan where mart.urun_isim=nisan.urun_isim) 

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

Select urun_isim,musteri_isim from nisan where exists (SELECT urun_isim from mart where nisan.urun_isim=mart.urun_isim)

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim,musteri_isim from nisan where not exists (select urun_isim from mart where nisan.urun_isim=mart.urun_isim)
-- UPDATE SET

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino)
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
select * from tedarikciler
select * from urunler

UPDATE tedarikciler
SET firma_ismi='Vestel' where vergi_no=102

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler
SET firma_ismi='Casper', irtibat_ismi='Ali Veli' where vergi_no=101

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
Update urunler
SET urun_isim='Telefon' where urun_isim='Phone'

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

UPDATE urunler
SET urun_id=urun_id+1 where urun_id>1004

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler
SET urun_id=urun_id+ted_vergino 

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler
SET urun_isim = (SELECT firma_ismi from tedarikciler where irtibat_ismi='Adam Eve') WHERE musteri_isim='Ali Bak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler
SET musteri_isim = (SELECT irtibat_ismi from tedarikciler where firma_ismi='Apple') WHERE urun_isim='Laptop'








