-- DISTINCT KULLANIMI
CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);
SELECT * FROM maas
-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
--GROUP BY ÇÖZÜMÜ
SELECT urun_isim FROM musteri_urun
GROUP BY urun_isim
--DISTINCT ÇÖZÜMÜ
SELECT DISTINCT(urun_isim) FROM musteri_urun;
-- Tabloda kaç farklı meyve vardır
SELECT urun_isim, count(urun_isim) FROM musteri_urun
GROUP BY urun_isim
-- FETCH NEXT () ROW ONLY / OFFSET / LIMIT
-- Musteri urun tablosundan ilk üç kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id
FETCH NEXT 3 ROW ONLY
-- LIMIT
SELECT * FROM musteri_urun ORDER BY urun_id
limit 3
-- Musteri urun tablosundan ilk kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id
limit 1
-- Müsteri urun tablosundan son üç kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id DESC
limit 3
-- EN yüksek maası alan müsteriyi listeleyiniz
SELECT * FROM maas ORDER BY maas DESC limit 1
-- Maas tablosundan en yüksek ikinci maası listeleyiniz
SELECT * FROM maas ORDER BY maas DESC offset 1 limit 1
/*
OFFSET --> Satır atlamak istediğimizde offset komutunu kullanırız
*/
SELECT * FROM maas ORDER BY maas desc
OFFSET 1 
FETCH NEXT 1 ROW ONLY
-- Maas tablosundan en düşük dördüncü maası listeleyiniz
SELECT * FROM maas ORDER BY maas offset 3 limit 1
-- DDL --> ALTER TABLE
drop table personel cascade -- Tabloyu ortadan kaldırmak için kullanılır
CREATE TABLE personel  (
id int,
isim varchar(50),
sehir varchar(50),
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM personel
-- 1) ADD default deger ile tabloya bir field ekleme
ALTER TABLE personel
add zipcode varchar(30)
ALTER TABLE personel
ADD adres varchar(50) DEFAULT 'Turkiye'
-- DEFAULT yazarsak oluşturduğumuz sütüna belirttiğimiz veriyi tüm satırlara girer

--DROP Tablodan sutun silme

ALTER TABLE personel 
DROP COLUMN zipcode 

ALTER TABLE personel 
DROP adres, drop sirket -- iki sutunu birden sildik

--SUTUN ADI DEGISTIRME -- RENAME COLUMN 

ALTER TABLE personel 
RENAME COLUMN sehir TO il

-- TABLONUN ADINI DEGISTIRME -- RENAME

ALTER TABLE personel
RENAME TO isci 

SELECT * FROM isci

--TYPE / SET(modify) sutunlarin ozelliklerini degistirme

ALTER TABLE isci
ALTER COLUMN il TYPE varchar(30),
ALTER COLUMN maas SET NOT NULL ;

--Eger numeric data turune sahip bir sutunun data turune String bir data turu atamak istersek 
--TYPE varchar(30) USING(maas::varchar(30)) bu formati kullaniriz
ALTER COLUMN maas 
TYPE varchar(30) USING(maas::varchar(30))

-- TRANSACTION 
/*
transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve TRANSACTION i sonlandirmak icin commit kullanmaliyiz
*/
drop table ogrenciler2
CREATE TABLE ogrenciler2
(
id serial,--serial data turu otomatik olarak 1den baslayarak sirali olarak sayi atamasi yapar
	      -- insert into ile tabloya veri eklerken serial data turunu kullandigim veri degeri yerine 
	      --DEFAULT yazariz
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT;

select * from ogrenciler2;
delete from ogrenciler2
drop table ogrenciler2
/*
	Transaction kullaniminda SERIAL data turu kullanimi tercih edilmez. Save pointten sonra ekledigimiz
	veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.
	NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
	yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden
	sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
	kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu
	kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki
	verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka
	"COMMIT" komutu kullanılır.
 */





