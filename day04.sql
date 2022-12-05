--ALIASES
CREATE TABLE calisanlar3 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar3

-- Eger iki verileri birlestirmek istersek concet sembolu kullaniriz
select calisan_id as id, calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3;

--2. yol
select calisan_id as id, concat(calisan_isim ||' , '|| calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar3;

-- practice 8 var pdf de odev yap


-- IS NULL Condition

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

-- name sutununda null olan degerleri listeleyiniz

select name from insanlar where name is null;

select name from insanlar where name is not null;

--insanlar tablosunda null deger almis verileri no name olarak degistiriniz

update insanlar
set name ='No_Name'
where name is null;

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
	
	ascending

ascend  X descend
*/
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
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

-- insanlar tablosundaki datalari adrese gore siralayiniz

select * from insanlar order by adres;

select * from insanlar order by soyisim;

-- insanlar tablosundaki ismi mine olanlari ssn siralai olarak yani kucukten buyuge siralayiniz

select * from insanlar where isim='Mine' order by ssn;

--NOT : Order By komutundan sonra field ismi yerine field (sutun) numarasi da kullanilabilir

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar where soyisim='Bulut' order by 4;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar order by ssn desc; -- buyukten kucuge

-- insanlar tablosundaki tum kayitlari isimler Natural sirali soy isimler ters sirali olarak listeleyin

select * from insanlar order by isim asc, soyisim desc;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

select isim, soyisim from insanlar order by length (soyisim); kucukten buyuge

select isim, soyisim from insanlar order by length (soyisim) desc; buyukten kucuge 

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select isim ||' '|| soyisim as isim_soyisim from insanlar order by length (isim||soyisim);

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim) DESC;
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim||soyisim)
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))



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
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--Isme gore alinan toplam urunleri bulun

select isim, sum (urun_miktar) aldigi_toplam_urun from manav group  by isim;

--Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz

select isim, sum (urun_miktar) aldigi_toplam_urun from manav group  by isim order by aldigi_toplam_urun desc;

-- urun isimine gore urunu alan toplam kisi sayisi

select urun_adi, count (isim) from manav group by urun_adi;

select isim, count(urun_adi) from manav group by isim;


