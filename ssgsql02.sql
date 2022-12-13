-- Exists Condition
-- Where komutu ile birlikte kullaniliyor 
-- Alt sorgu en az bir satir dondururse True olur 
-- Alt sorgu hic deger dongu donmezse False olur
CREATE TABLE musteriler
(
  id int, 
  isim varchar(50), 
  sehir varchar(50), 
  yas int
);
INSERT INTO musteriler VALUES(100, 'Ahmet Ümit', 'İstanbul', 54);
INSERT INTO musteriler VALUES(101, 'R.Nuri Güntekin', 'Antalya', 18);
INSERT INTO musteriler VALUES(102, 'S.Faik Abasıyanık', 'Bursa', 14);
INSERT INTO musteriler VALUES(103, 'Yaşar Kemal', 'İstanbul', 26);
INSERT INTO musteriler VALUES(104, 'Halide E. Adıvar', 'İzmir', 35);
INSERT INTO musteriler VALUES(105, 'Nazan Bekiroğlu', 'İzmir', 42);
INSERT INTO musteriler VALUES(106, 'Peyami Safa', 'Antalya', 33);
INSERT INTO musteriler VALUES(107, 'Sabahattin Ali', 'İstanbul', 41);
INSERT INTO musteriler VALUES(108, 'Oğuz Atay', 'İstanbul', 28);
INSERT INTO musteriler VALUES(109, 'Orhan Pamuk', 'Ankara', 30);

CREATE TABLE siparisler
(
  id int, 
  musteri_id int, 
  urun_adi varchar(20), 
  tutar int
);

INSERT INTO siparisler VALUES(3001,109, 'kitap',100);
INSERT INTO siparisler VALUES(3002,101, 'kitap',230);
INSERT INTO siparisler VALUES(3003,109, 'defter',100);
INSERT INTO siparisler VALUES(3004,102, 'kalem',80);
INSERT INTO siparisler VALUES(3005,101, 'çanta',550);
INSERT INTO siparisler VALUES(3006,109, 'çanta',440);
INSERT INTO siparisler VALUES(3007,103, 'kitap',160);
INSERT INTO siparisler VALUES(3008,103, 'kalem',75);
INSERT INTO siparisler VALUES(3009,105, 'defter',250);
INSERT INTO siparisler VALUES(3010,108, 'kitap',300);
INSERT INTO siparisler VALUES(3011,106, 'kitap',175);
INSERT INTO siparisler VALUES(3012,109, 'kalem',105);
INSERT INTO siparisler VALUES(3013,107, 'defter',145);

select * from siparisler
select * from musteriler

--1)Siparişlerde defter varsa müşterilerin isim ve şehirlerini listeleyiniz./ defter yokise

select isim, sehir from musteriler WHERE  exists ( SELECT * from siparisler where urun_adi='defter' );

select isim, sehir from musteriler WHERE NOT exists ( SELECT * from siparisler where urun_adi='defter' );

--2)Siparişlerde tutarı 600 den büyük sipariş varsa müşterilerin yaş ortalamasını bul .

select avg (yas) from musteriler where exists (select * from siparisler where tutar>600);

--3)Siparişi olan müşterileri listeleyiniz

select * from musteriler m where exists (select * from siparisler s where s.musteri_id= m.id );

--4)Siparişi olmayan müşterileri listeleyiniz.(ilişkili)

select * from musteriler m where not exists (select * from siparisler s where s.musteri_id=m.id );

--5)Müşterilerden yaşı 18 den küçük varsa siparişini sil.(ilişkili)

delete from siparisler s where exists (select * from musteriler m where m.id=s.musteri_id and yas<18); -- bu daha performanli

delete from siparisler s where musteri_id in (select id from musteriler m where m.id=s.musteri_id and yas<18);

--6)İstanbulda yaşayan müşteri varsa müşteri_id , sipariş verdiği ürün adı ve tutarı listeleyiniz.

select musteri_id, urun_adi, tutar from siparisler s where exists (select * from musteriler m where m.id=s.musteri_id and sehir='İstanbul')

--8)İstanbulda yaşayan müşteri varsa sipariş tutarından 50 br indirim yapınız ve tüm siparişleri listeleyiniz.

update siparisler s set tutar = tutar-50 where exists (select * from musteriler m where m.id=s.musteri_id and sehir='İstanbul')

--8)Çanta siparişi veren müşteri varsa isminin yanına * işareti koyunuz ve tüm müşterileri listeleyiniz.

update musteriler m set isim='*' || isim where exists (select * from siparisler s where s.musteri_id= m.id and urun_adi='çanta');






