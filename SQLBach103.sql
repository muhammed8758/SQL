--Database Olusturma
--DDL -Data Definiation Lang.
--Create -Tablo Olusturma
create table ogrenciler1
(
ogrenci_no char(7),
Isim varchar(20),
soyisim varchar(25),
not_ort real,	-- Ondalikli sayilar kullanilir double gibi
kayit_tarihi date
);

--Varolan Tablodan Yeni bir Tablo Olusturma
create table ogrenci_ortalamalar
as -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
select isim,soyisim,not_ort from ogrenciler1;

--DML- Data Manipulation Language
--Insert (Database Veri Ekleme)

insert into ogrenciler1 values ('1234567','Said','ILHAN',85.5,now());
insert into ogrenciler1 values ('1234567','Said','ILHAN',85.5,'2022-04-05');

--Bir Tabloya Parcali Ver Islemek Istersek
insert into ogrenciler1(isim,soyisim) values ('Muhammed','Dogan');

--DQL- Data Wuery Lang.

select * from ogrenciler1;-- Burdaki Yildiz formulu hersey anlamindadir----










