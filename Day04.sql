--ALIASES
drop table if exists calisanlar
CREATE TABLE calisanlar  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar 

-- Eger iki sutunun verilerini birlestirmek istersek concat sembolu olan || kullaniriz
select calisan_id AS id, calisan_isim || calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2.yol:
select calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

--name sutununda null olan degerleri listeleyelim

select name from insanlar where name IS null

-- insanlar tablosunda sadece null olmayan degerleri listeleyiniz

select name from insanlar where name is not null

-- insanlar tablosunda null deger almis verileri no name olarak degistiriniz

update insanlar 
set name='No Name'
where name is null;

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
drop table if exists insanlar
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar
--Insanlar tablosundaki datalari adres’e gore siralayin
select *  from insanlar order by adres;

select *  from insanlar order by soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar where isim='Mine' order by ssn

--order by komutu: tablolardaki verileri siralamak icin order bay komutu kullaniriz 
--buyukten kucuge ya da kucukten buyuge siralama yapabiliriz
-- default olarak kucukten buyuge siralama yapar 
-- eger BUYUKTEN KUCUGE SIRALAMAK iatersek order by komutundan sonra DESC komutunu kullaniriz

/*
NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
*/

select * from insanlar where soyisim='Bulut' order by 2

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar order by ssn DESC

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar ORDER BY isim ASC, soyisim DESC;
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim) DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
--1.yol:
select isim ||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim||soyisim)
--2.yol:
select isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));
--3.yol:
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
--4.yol:
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan','Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--Isme gore alinan toplam urunleri bulun

select sum(urun_miktar) from manav --tek bir sonuc getirir ama biz ali top ne kadar almis .... bunu gormek istiyoruz

select isim,sum(urun_miktar) as aldigi_toplam_urun from manav 
GROUP BY isim;

--isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz

SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

--urun ismine gore urunu alan toplam kisi sayisi

select urun_adi, count(isim) from manav
GROUP BY urun_adi;











