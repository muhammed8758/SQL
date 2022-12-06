--Group By Devam

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50),  
maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

delete from personel
--1)Isme gore toplam maaslari bulun

select isim, sum (maas) from personel 
group by isim;

--Personel tablosundaki isimleri gruplayiniz
select isim, count (sehir) from personel 
group by isim;

-- HAVING CLAUSE ( where yerine kullanilir grop by dan sonra sart varsa having kullanilir)

-- 1 Her Sirketin MIN maaslarini eger 4000 den buyukse goster 
select * from personal

select sirket, min (maas) as en_dusuk_maas from personel 
group by sirket 
having min (maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

select isim, sum(maas) from personel as toplam_maas
group by isim 
having sum(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

select sehir, count (isim) as toplam_personel_sayasi from personel
group by sehir
having count(isim)>1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve
--MAX maasi veren sorgu yaziniz

select sehir, max (maas) as en_yuksek_maas from personel
group by sehir 
having max(maas)<5000;

--UNION OPERATOR

/*
Iki Farkli sorgulamamnin sonucunu birlestiren islemdir
*/

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

select sehir from personel where maas>5000
union 
select isim from personel where maas>4000;





-- INTERSECT (Kesişim)
/*
Farkli iki tablodaki ortak verileri INTERSECT komutu ile getirebiliriz
*/
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)



-- 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- 3) Iki sorguyu INTERSECT ile birlestirin


-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin

select isim from personel where sirket ='Honda'
intersect
select isim from personel where sirket ='Ford'
intersect
select isim from personel where sirket ='Tofas';

--EXCEPT OPERATOR

-- haric olan kumeyi getirir

--5000’den az maas alip Honda’da calismayanlari yazdirin

select isim, sirket from personel where maas<5000 
except
select isim, sirket from personel where sirket='Honda' ;





