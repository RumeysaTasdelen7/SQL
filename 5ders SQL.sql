--UNION--> kullanımında sütun sayıları ve data tipleri aynı olmak zorunda
drop table if exists personel

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

SELECT * FROM personel

--Maasi 4000 den çok olan isci isimlerini ve 5000 liradan fazla maasalinan sehirleri listeleyin
SELECT isim as isim_sehir ,maas FROM personel WHERE maas>4000 
UNION
SELECT sehir,maas FROM personel WHERE maas>5000;

--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
SELECT isim as isim_sehir ,maas FROM personel WHERE isim='Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir='Istanbul'

drop table personel
CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id));
    
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi  tablosundan da 
--tel ve cocuk sayısını yazdırın
SELECT sehir as sehir_tel,maas as maas_cocuksayisi FROM personel WHERE id='123456789'
UNION
SELECT tel,cocuk_sayisi FROM personel_bilgi WHERE id='123456789'


UNION ALL ->her iki sorguyuda alat alta getirir
--Personel tablosundan maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel WHERE maas<5000
UNION ALL
SELECT isim,maas FROM personel WHERE maas<5000

--INTERSECT OPERATOR

--Personel tablosunda ıstanbul veya ankara da çalışanlar ile personel bilgi tablosunda 2 veya 3 çocuğu olanların ortak 
--ıdlerini listele

SELECT * FROM personel_bilgi

SELECT id FROM personel WHERE sehir in ('İstanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi in (2,3)

--Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT * FROM personel
SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT
SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT
SELECT isim FROM personel WHERE sirket='Tofas';

--EXCEPT OPERATOR
--5000 den az maaş alıp honda da çalışmayanları listeleyiniz

SELECT isim,maas,sirket FROM personel WHERE maas<5000 and sirket<>'Honda' -- <> eşit değildir işaretidir
--EXCEPT ile çözümü
SELECT isim,maas,sirket FROM personel WHERE maas<5000
EXCEPT
SELECT isim,maas,sirket FROM personel WHERE sirket='Honda'

--ismi mehmet ozturk olup ıstanbulda çaışmayanları listeleyiniz
SELECT isim,sehir FROM personel WHERE isim='Mehmet Ozturk' and sehir<>'Istanbul'
--EXCEPT İLE ÇÖZÜMÜ
SELECT isim,sehir FROM personel WHERE isim='Mehmet Ozturk'
EXCEPT ALL
SELECT isim,sehir FROM personel WHERE sehir='Istanbul'

--JOINS 
--INNER JOİN
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler  (
siparis_id int,  
    sirket_id int,  
    siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');



--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT * FROM siparisler

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

--LEFT JOIN

SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM siparisler LEFT JOIN sirketler
ON sirketler.sirket_id=siparisler.sirket_id;

--RIGHT JOIN
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM siparisler RIGHT JOIN sirketler
ON sirketler.sirket_id=siparisler.sirket_id;

--FULL JOIN 
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
FROM siparisler FULL JOIN sirketler
ON sirketler.sirket_id=siparisler.sirket_id;

--SELF JOINS
CREATE TABLE personel1  (
id int,
isim varchar(20),  
title varchar(60),  
    yonetici_id int
);
INSERT INTO personel1 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel1 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel1 VALUES(3, 'Ayse Gul', 'QA Lead', 4);  
INSERT INTO personel1 VALUES(4, 'Fatma Can', 'CEO', 5);

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select * from personel

SELECT p1.isim as personel_isim,p2.isim as yonetici_isim
FROM personel1 p1 join personel1 p2
ON p1.yonetici_id=p2.id

--LIKE CONDİTİON
--ismi v ile başlayan personeli listele
SELECT * FROM personel1 WHERE isim LIKE 'V%'

-- sonu n ile biten personellerin tüm bilgilerini listeleyiniz
SELECT * FROM personel1 WHERE isim LIKE '%n'

--isminin içinde tm olan personel bilgilerini listele
SELECT * FROM personel1 WHERE isim LIKE '%tm%'


































































