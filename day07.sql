-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun;

--  Musteri urun tablosundan usurun isimlerini tekrarsiz (grup) listeleyiniz                         

--Group By Cozumu
select urun_isim from musteri_urun
group by urun_isim;

--DISTINCT COZUMU
select distinct (urun_isim) from musteri_urun;

-- Tabloda kac farkli meyve vardir ?

select urun_isim, count (/*distinct*/ urun_isim) from musteri_urun 
group by urun_isim;

-- FETCH NEXT90 ROW ONLY / offset / limit

-- Musteri urun tablosundan ilk 3 kaydi listeleyiniz.

select * from musteri_urun order by urun_id
fetch next 3 row only;

--Limit
select * from musteri_urun order by urun_id 
limit 3;

-- musteri urun tablosundan ilk kaydi listeleyiniz

select * from musteri_urun order by urun_id
fetch next row only; /*limit 1 */

-- musteri urun tablosundan son uc kaydi listeleyiniz

select * from musteri_urun order by urun_id desc
limit 3;


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

--En yuksek maasi alan musteriyi siralayiniz

select * from maas order by maas desc;

--Maas tablosundan en yuksek 2. maasi listeleyiniz

select * from maas order by maas desc limit 2 offset 1;
/* OFFSET --> Satir atlamak istedigimzide offset komutu kullaniriz*/

select * from maas order by maas desc offset 1 fetch next 1 row only;

-- Maas tablosundan en dusuk 4. maasi listeleyiniz

select * from maas order by maas offset 3 fetch next 1 row only;

select * from maas order by maas offset 3 limit 2;

--ALTER TABLE STATEMENT

DROP TABLE PERSONEL

CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
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

select * from personel 

-- 1) ADD default deger ile tabloya bir field ekleme

alter table personel
add ulke varchar(30);

alter table personel
add adres varchar(50) default 'Turkiye';/* default yazarak olusturdugumuz sutune belirttigimiz veriyi tum satirlara ekler*/

--2) DROP tablodan sutun silme

alter table personel 
drop column ulke;



--3) Rename Column Sutun adi degistirme

alter table personel
rename column sehir to il;

--4) Rename tablonun ismini degistirme

alter table personel rename to isciler

select * from isciler

--5)TYPE/SET sutunlarin ozelliklerini degistirme

alter table isciler
alter column il type varchar(30),
alter column maas set not null;


/*
Eger numerik data turune sahip bir sutunun data turune string bir data turu atamak istersek
Type varchar (30) using (maas::varchar(30)) bu formati kullanabiliriz
*/

alter table isciler
alter column maas
type varchar(30) using (maas::varchar(30));


-- Transactions 

/*
	-->	TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT)
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
*/

drop table ogrenciler2

CREATE TABLE ogrenciler2
(
id serial,
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

select * from ogrenciler2

delete from ogrenciler2

drop table ogrenciler2







































































