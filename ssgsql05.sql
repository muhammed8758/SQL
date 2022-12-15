--WHERE                                 HAVING
--SATIRLARI FILTRELER                   GRUPLARI FILTRELER
--AGGREATE METHODLARLA KULLANILMAZ      KULLANILIR
--GROUP BY IFADESINDEN ONCE             GROUP BY IFADESINDEN SONRA
--SELCT,  UPDATE, DELETE +              SADECE SELECT ILE KULLANILIR

drop table kisiler
CREATE table KISILER(
id int,
isim varchar(30),
soyisim varchar(30),
yas int,
sehir varchar(20),
cinsiyet char(1),
ulke varchar(30),
maas int)

insert into kisiler values(1, 'Ahmet', 'Yilmaz', 20, 'Ankara', 'E', 'Turkiye',  2000);
insert into kisiler values(2, 'Mehmet', 'Efe', 22, 'Bolu', 'E', 'Turkiye',  2000);
insert into kisiler values(3, 'Ayse', 'Can', 23, 'Istanbul', 'K', 'Turkiye',  3500);
insert into kisiler values(4, 'Fatma', 'Ak', 35, 'Ankara', 'K', 'Turkiye',  3200);
insert into kisiler values(5, 'John', 'Smith', 45, 'New York', 'E', 'USA',  3500);
insert into kisiler values(6, 'Ellen', 'Smith', 40, 'New York', 'K', 'USA',  3500);
insert into kisiler values(7, 'Hans', 'Muller', 30, 'Berlin', 'E', 'Almanya',  4000);
insert into kisiler values(8, 'Frank', 'Cesanne', 35, 'Paris', 'E', 'Fransa',  3700);
insert into kisiler values(9, 'Abbas', 'Demir', 26, 'Adana', 'E', 'Turkiye',  2000);
insert into kisiler values(10, 'Hatice', 'Topcu', 26, 'Hatay', 'K', 'Turkiye',  2200);
insert into kisiler values(11, 'Gulsum', 'Demir', 35, 'Adana', 'K', 'Turkiye',  2000);

SELECT ulke, AVG(maas) FROM kisiler GROUP BY ulke;

--1.YASI 30dan buyuk olan kısılerın ulkelere gore maas ort
select ulke, avg(maas) from kisiler where yas>30 group by ulke;

--2.YAS ort 30dan buyuk olan ulkelerın maas ort
select ulke, avg(maas) from kisiler group by ulke having avg(yas)>30;

--3.sehırlere gore yas ort 30dan cok olan sehırler
select sehir, avg(yas)from kisiler group by sehir having avg(yas)>30;

select sehir, avg(yas) from kisiler where yas>30 group by sehir;

--4.cinsiyet ve ulkelere gore maas ort 4500den cok olanlar
select cinsiyet, ulke, avg(maas)from kisiler 
group by cinsiyet, ulke having avg(maas)>3500;

--5.yas ort 30dan buyuk ulkelerın ulke isimlerini WWW yap
update kisiler set ulke='WWW' where ulke in 
(select ulke from kisiler group by ulke having avg(yas)>30)

--6.çalışan sayısı 1’den fazla olan şehirleri ve 
--çalışan sayılarını getiren sorguyu yazalım
select sehir, count(*)from kisiler group by sehir having count(sehir)>1;

--8.Maaş ortalaması 3000’den fazla olan
--ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round (avg(maas),2) from kisiler where cinsiyet='E' 
group by ulke having avg(maas)>3000;

--8.Erkek çalışanların sayısı 1’den fazla olan 
--ülkelerin maaş ortalamasını getiren sorgu:
select ulke, round(avg(maas),2) from kisiler where cinsiyet='E'
group by ulke having count(*)>1;

create table sahislar
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);

drop table sahislar




