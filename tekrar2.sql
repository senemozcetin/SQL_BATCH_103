CREATE TABLE parent2 
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson');

select * from parent2;
    
CREATE TABLE child2
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE
);    
    
INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');
    
select * from parent2;
select * from child2;

drop table parent2
delete from parent2 


-- Eger tablolarimizda parent-child iliskisi varsa(primary-foreign key) ve child tablomuzda on delete cascade kullanmissak;
--delete from parent2 dersek parent'taki veriler silinir dolayisiyla iliskili oldugu icin child'daki veriler de silinir.
--drop table parent2 dersek on delete kullansak da kullanmasak da parent tablomuz silinmez, cunku tablolar arasinda parent-child iliskisi var. 
--parenti silmenin tek yolu sonuna cascade yazmaktir. Ya da once child tabloyu, sonra parent tabloyu silmemiz lazim.


--Eger tablolarimizda parent-child iliskisi varsa(primary-foreign key) ve child tablomuzda on delete cascade KULLANMAMISSAK;
--delete from parent3 dersek parent'taki verilerimiz silinmez. Cunku tablolarimiz arasinda parent-child iliskisi var. Eger on delete cascade kullanmis olsaydik
--parent'taki verileri silebilirdik.


CREATE TABLE parent3
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent3 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent3 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent3 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent3 VALUES (104, 'Apple', 'Mick Jackson');
    

CREATE TABLE child3
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent3(vergi_no)
);    
    
INSERT INTO child3 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child3 VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child3 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child3 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child3 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child3 VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child3 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

select * from parent3;
select * from child3;

delete from parent3 
drop table parent3 cascade

create table personel(
id int,
isim varchar,
soyisim varchar,
email varchar,
ise_baslama_tarihi date,
is_unvani varchar,
maas int 
);

INSERT INTO personel VAlues (123456789, 'Ali','Can','alican@gmail.com','10-04-10','isci',5000);
INSERT INTO personel VAlues (123456788, 'Veli','Cem','velicem@gmail.com','10-01-12','isci',5500);
INSERT INTO personel VAlues (123456787, 'Ayse','Gul','aysegul@gmail.com','01-05-14','muhasebeci',4500);
INSERT INTO personel VAlues (123456789, 'Fatma','Yasa','fatmayasa@gmail.com','10-04-09','muhendis',7500);

select * from personel

--b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin

select isim from personel where maas<5000 or is_unvani='isci';

--c) Iscilerin tum bilgilerini listeleyin

select * from personel where is_unvani='isci';

--d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin

select is_unvani, maas,soyisim from personel where soyisim in ('Can','Cem','Gul');

--e) Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin

select email,ise_baslama_tarihi from personel where maas>5000;

--f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin

select * from personel where maas between 5001 and 6999;

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki datalari adres’e gore siralayin

select * from insanlar order by adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

select * from insanlar where isim='Mine' order by ssn;

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar where soyisim='Bulut' order by 2;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc;





CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--Isme gore alinan toplam urunleri bulun
select isim, sum(urun_miktar) from manav group by isim;



