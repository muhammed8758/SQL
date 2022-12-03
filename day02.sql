create table ogrenciler5
(
ogrenci_no char(7),
Isim varchar(20),
soyisim varchar(25),
not_ort real,	-- Ondalikli sayilar kullanilir double gibi
kayit_tarihi date
);

--VAr olan tablodan yeni tablo olusturma
create table notlar
as
select isim,not_ort from ogrenciler5;


--Insert Tablo icine ver ekleme

insert into notlar values('Zeynep',95.5);
insert into notlar values('Veli',85.5);
insert into notlar values('Burak',65.5);
insert into notlar values('Xhavi',95.5);
insert into notlar values('Mehmet',95.5);
insert into notlar values('Cem',85.5);

select * from notlar;

create table ogrenciler6
(
ogrenci_no char(7) unique,
Isim varchar(20) not null,
soyisim varchar(25),
not_ort real,	-- Ondalikli sayilar kullanilir double gibi
kayit_tarihi date
);

select * from ogrenciler6

insert into ogrenciler6 values('1234567','Muhammed', 'Dogan',80,now());
insert into ogrenciler6 values('1234568','Ali', 'Veli',80,now());
insert into ogrenciler6 (ogrenci_no,soyisim,not_ort) values ('1234569','Dogan',85.5);-- not null kisitlamasindan dolayi ismi bos gecemeyiz hata aliriz

-- Primary Key Atamasi

create table ogrenciler8
(
ogrenci_no char(7) primary key ,
Isim varchar(20) ,
soyisim varchar(25),
not_ort real,	
kayit_tarihi date
);

--Primary Key Atamasi 2. yol

create table ogrenciler9
(
ogrenci_no char(7)  ,
Isim varchar(20) ,
soyisim varchar(25),
not_ort real,	
kayit_tarihi date,
constraint ogr primary key (ogrenci_no)
);

create table ogrenciler10
(
ogrenci_no char(7)  ,
Isim varchar(20) ,
soyisim varchar(25),
not_ort real,	
kayit_tarihi date,
primary key (ogrenci_no)
);

--Foreign Key 

--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

create table tedarikciler3
(
tedarikci_id char (5) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)

);

create table urunler
(
tedarikci_id char (5) ,
urun_id char(5),
foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)
);

select * from tedarikciler3
select * from urunler

--“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
--“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.


create table calisanlar
(
id char(7)primary key,
isim varchar(20) unique,
maas int not null,
ise_baslama date
)

create table adresler
(
adres_id char(7),
sokak varchar(20) ,
cadde varchar(20),
sehir varchar(20),

foreign key (adres_id) references calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');-- unique constrate oldugu icin kabukl etmedi
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- not null oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- unique constrate oldugu icin kabukl etmedi
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- syntex hasi kabul etmez
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- primary key unique olmasi gereki 2. hicligi kabul etmedi
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');-- primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- primary key null kabul etmez

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');-- parent tablosunda olmayan id ye ekleme yapazsin
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');


select * from calisanlar
select * from adresler

--Check Key 

create table calisanlar1
(
id char(7)primary key,
isim varchar(20) unique,
maas int check (maas>10000) not null,
ise_baslama date
)
INSERT INTO calisanlar1 VALUES('100821', 'Mehmet Yılmaz5' ,20000, '2018-04-14');


--DQL --WHERE Kullanimi

select * from calisanlar
select isim from calisanlar

-- Calaisanlar tablosnda maasi 5000 den yuksek olanlari listele

select isim, maas from calisanlar where maas>5000

-- calisanlar tablosundan ismi veli han olan veriyi getiriniz

select * from calisanlar where isim='Veli Han' 


-- Calisanlar tablosnda maasi 5000 olan tum verileri listele

select * from calisanlar where maas=5000

--DML -- Delete Komutu

delete from adresler; -- eger parent child iliskisi varsa once child sonra parent

-- Adresler tablosondan sehri antep olan veriyi silelim 
delete  from adresler where sehir='Antep' 


CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);



























































