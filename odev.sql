-- Odev -- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz

select marka_id as ankaradacalisanid, calisan_sayisi from markalar 
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');


select * from calisanlar2
