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

select * from ogrenciler11

--ismi Mustafa Bak ve Nesibe Yilmaz olan kayitlari silelim

delete from ogrenciler11 where isim = 'Mustafa Bak' or isim='Nesibe Yilmaz';

-- veli ismi hasan olani datayi silelim

delete from ogrenciler11 where veli_isim =  'Ayse';

-- Truncate Table ---
-- Bir tablodaki tum verileri geri almaksizin siler Sartli silme yapmaz

truncate table ogrenciler11

-- On Delete Cascade -- 

Drop Table if exists notlar -- eger bu isim de  tablo varsa siler

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT not1_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe
select * from not1

-- notlar tablosundan id si 123 olan datayi silelim

delete from not1 where talebe_id = '123';

-- talebelr tablosundan id si 126 olan datayi silelim

delete from talebe where id = '126';


/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

-- IN Condition

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler

-- musteriler tablosundan orange apple ve apricot verileri listeleyiniz

select * from musteriler where urun_isim = 'Orange'or urun_isim ='Apple'or urun_isim ='Apricot';

select * from musteriler where urun_isim in ('Orange','Apple','Apricot');

--not in  istenilenler haricindekileri getirir

select * from musteriler where urun_isim not in ('Orange','Apple','Apricot');

-- Between Condition

-- Baslangic ve sonundaki veriler dahil olmak uzere aradki verileri getirir

--Musteriler tablosundan id si 20 ile 40 arasinda olanla verileri listeleyinoz

select * from musteriler where urun_id >=20 and urun_id <=40;

select * from musteriler where urun_id between 20 and 40;

--not between 

	select * from musteriler where urun_id not between 20 and 40;

/*
SUBQUARY 

--SUBQUERIES(ALT SORGU) Iki tablodan gecici olarak tek bir tabloda sorgulama--> sorgu icinde sorgu

*/
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

select * from calisanlar2
select * from markalar

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
-- bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

select isim, maas, isyeri from calisanlar2 
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select isim, maas, sehir from calisanlar2
where isyeri in(select marka_isim from markalar where marka_id>101);

/*
ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
*/


---Aggregate Method

select max (maas) as maximum_maas from calisanlar2;
/*
Eger bir sutuna gecici olarak bir isim vermek istersek as komutu yazdiktan sonra vermek istedigimiz ismi yazariz 
*/

-- Calisanlar tablosundan en dusuk maasi listeleyelim 


select min (maas) from calisanlar2;

-- CAlisanlar tablosundaki maaslarin toplamini listeleyinzi

select sum(maas) from calisanlar2;

-- CAlisanlar tablosundaki maaslarin ortalamasini listeleyinzi

select avg (maas) from calisanlar2;
select round(avg (maas),2 ) from calisanlar2;

-- CAlisanlar tablosundaki maaslarin sayisini listeleyinzi

select count (*) from calisanlar2;

/*
Eger count(*) kullanirsak tablodaki tum satirlarin sayisini verir
sutun adi kullanirsak o sutundakilari verir
*/

---Aggregate Method 
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu
---listeleyen bir SORGU yaziniz

select * from calisanlar2
select * from markalar

select marka_id,marka_isim,
(select count (sehir) as sehir_sayisi from calisanlar2
							where marka_isim=isyeri) from markalar;
							
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

create view summaas
as
select marka_isim,calisan_sayisi,(select sum (maas) from calisanlar2 where isyeri=marka_isim )as toplam_maas
from markalar;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz

select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim),
(select min(maas) from calisanlar2 where isyeri=marka_isim)
from markalar;

--view Kullanimi

--yaptigimiz kodlari hafizasina alarak isimden sonra cagrilir

create view maxminmaas
as
select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim),
(select min(maas) from calisanlar2 where isyeri=marka_isim)
from markalar;

select * from maxminmaas;
select * from summaas;

			--EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
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
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
							
select * from mart
select * from nisan
							

/* soru
	MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
	URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
	MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 */

select urun_id, musteri_isim from mart 
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);


/*
soru
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve 
bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

*/

select urun_Isim, musteri_isim from nisan where exists 
(select urun_isim from mart where mart.urun_isim=nisan.urun_isim );


/* odev
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 */
 
 -- UPDATE
 
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
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);  
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler
select * from urunler

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.


update tedarikciler
set firma_ismi='Vestel' where vergi_no=102;


-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

update tedarikciler
set firma_ismi='Casper', irtibat_ismi='Ali Veli' where vergi_no=101;

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.

update urunler
set urun_isim='Telefon' where urun_isim='Phone';


-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

update urunler
set urun_id = urun_id+1 where urun_id> 1004;


-- urunler tablosundaki tüm ürünlerin urun_id değerini
---ted_vergino sutun değerleri ile toplayarak güncelleyiniz.

update urunler
set urun_id = urun_id+ted_vergino;

delete from urunler

select * from tedarikciler
select * from urunler

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

update urunler
set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
where musteri_isim='AliBak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.

update urunler
set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple'  )where urun_isim='Laptop';







































