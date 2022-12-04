create table tedarikciler 
(
tedarikci_id char(7),
tedarikci_ismi varchar(20),
tedarikci_adres varchar(25),
ulasim_tarihi date					   
);

create table tedarikci_ziyaret
as select tedarikci_ismi, ulasim_tarihi
from tedarikciler;

select * from tedarikciler
select * from tedarikci_ziyaret

create table ogretmenler
(
kimlik_no char(11),
isim varchar(20),
brans varchar(20),
cinsiyet char(5)
)
insert into ogretmenler values ('36253589450','Muhammed Dogan','Ingilizce','Erkek');
	
select * from ogretmenler	
	
	
	
	
	
	
	
	
	
	
	
	


)
