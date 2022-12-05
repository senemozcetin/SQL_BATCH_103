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

















