--DML--> UPDATE --
--SYNTAX
  --Eğer soryda bir veriyi değiştiriniz gibi bir soruylakarşılaşırsak
  --önce UPDATE tablo_adi
  --   SET sütun_adi (SELECT)
SELECT * FROM personel
drop
--Personel tablosunda id si 1001 olan öğrencinin ismini Erol Evren olarakdeğiştir
UPDATE personel
SET isim ='Erol Evren'
WHERE id='1001';

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel


CREATE TABLE hastaneler
(
id char(5) primary key, 
isim char(30),
sehir char(15),
ozel char(1)
); 
insert into hastaneler values('H101', 'Aci Madem Hastanesi', 'Istanbul', 'Y');
insert into hastaneler values('H102', 'HasZeki Hastanesi', 'Istanbul', 'N');
insert into hastaneler values('H103', 'Medikol Hastanesi', 'Izmir', 'Y');
insert into hastaneler values('H104', 'Memoryil Hastanesi', 'Ankara', 'Y');
CREATE TABLE hastalar(
  kimlik_no CHAR(11) PRIMARY Key,
  isim CHAR(50) ,
  teshis  CHAR(20)
  );
  insert INTO hastalar values('12345678901','Ali Can','Gizli Seker');
  insert INTO hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
  insert INTO hastalar values('78901123451','Steve Jobs','Pankreatit');
  insert INTO hastalar values('12344321251','Tom Hanks','COVID 19');
   
create table bolumler(
bolum_id char(5),
bolum_adi char(20)
);
insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak Burun Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastoroloji');
insert into bolumler values('KARD','Kardioloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');
create table hasta_kayitlar(
kimlik_no char(11) Primary key,
hasta_ismi char(20),
hastane_adi char(50),
bolum_adi char(20),
teshis char(20)
);
insert into hasta_kayitlar values('1111','NO NAME','','','');
insert into hasta_kayitlar values('2222','NO NAME','','','');
insert into hasta_kayitlar values('3333','NO NAME','','','');
insert into hasta_kayitlar values('4444','NO NAME','','','');
insert into hasta_kayitlar values('5555','NO NAME','','','');


/*
hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/
SELECT * FROM hasta_kayitlar;


UPDATE hasta_kayitlar
SET hasta_ismi='Salvadore Dali',
   hastane_adi='John Hopins',
   bolum_adi='Noroloji',
   teshis='Parkinson',
   kimlik_no='99991111222'
WHERE kimlik_no='3333';

/*
hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki kimlik nosu ‘12345678901’ olan kişinin ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
*/
UPDATE hasta_kayitlar 
SET hasta_ismi=(SELECT isim FROM hastalar WHERE kimlik_no='12345678901'),
    hastane_adi=(SELECT isim FROM hastaneler WHERE id='H104'),
    bolum_adi=(SELECT bolum_adi FROM bolumler WHERE bolum_adi='DHL'),
	teshis= (SELECT teshis FROM hastalar WHERE isim='Ali Can'),
	kimlik_no=(SELECT kimlik_no FROM hastalar WHERE isim='Ali Can')
WHERE kimlik_no='1111'

--ALIES
select hasta_ismi as isim from hasta_kayitlar

--IS NULL CONDİTİON
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

SELECT * FROM insanlar
--İnsanlar tablosunda name değeri null olan tüm verilerilisteleyiniz
SELECT * FROM insanlar WHERE name is NULL;

--İnsanlar tablosundan name değeri null olmayan tüm verileri listeleyiniz
SELECT * FROM insanlar Where name is not NULL;

--İnsanlar tablosunda name değeri null olan verilerin yerine 'isim girilmemiş' yazzdırın
UPDATE insanlar
SET name = 'isim girilmemis'
WHERE name is NULL

SELECT * FROM insanlar

--ORDER BY KOMUTU
--asc->küçükten büyüğeveya alfabetik olarak sıralama özelliği vardır
--Desc->büyükten küçüğe alfabetik olarak sıralama özelliği vardır


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

--İnsanlar tablosundaki adres sütununu alfabetik sıralı şekilde alfabetik olarak sıralayınız
SELECT * FROM insanlar ORDER BY adres asc

--Insanlar tablosundaki soyisim sütununu tersten sıralayınız
SELECT * FROM insanlar ORDER BY soyisim DESC

--Insanlar tablosunda isim ve soyisimleri isime göre natural soyisime göre tersten sıralayınız
SELECT * FROM insanlar ORDER BY isim ASC, soyisim DESC

--isim ve soyisim sütunlarını soyisim kellime uzunluklarına göre sırala
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH(soyisim);

--isim ve soyisim sütunlarını birleştiriniz
SELECT CONCAT(isim,soyisim) as isim_soyisim FROM insanlar ORDER BY LENGTH (isim)

--isim soyisim adres sütunlaını getir
SELECT ssn,CONCAT('isim','soyisim','adres') as isim_soyisim FROM insanlar ORDER BY LENGTH (isim)

--Grup by
create table sirket(
isim varchar(20),    
sehir varchar(20),
maas int    
);
insert into sirket values ('erol','burdur',1000);
insert into sirket values ('erol','antalya',2000);
insert into sirket values ('erol','izmir',1500);
insert into sirket values ('ahmet','bursa',900);
insert into sirket values ('ahmet','izmir',2500);
insert into sirket values ('ahmet','istanbul',1800);
insert into sirket values ('mert','trabzon',1200);
insert into sirket values ('mert','istanbul',1000);
insert into sirket values ('mert','antep',2000);
insert into sirket values ('mert','tokat',3000);
insert into sirket values ('eda','antep',1200);
insert into sirket values ('eda','urfa',1500);
insert into sirket values ('erol','usak',2000);
insert into sirket values ('erol','burdur',900);

SELECT * FROM sirket

--şirkette çalışanların isimlerini listeleyin
select isim from sirket
GROUP BY isim

--ŞİRKETTE KİM HANGİ ŞEHİRDE ÇALIŞIYOR LİSTELEYİNİZ
select isim,sehir from sirket
GROUP BY isim,sehir

--GROUP BY KOMUTU AGGREGATE METHODLARLA KULLANIMI

--Sirkette çalışanların toplam maaşını listeleyiniz
SELECT isim,sum(maas) as toplam_maas FROM sirket
GROUP BY isim

--Sirkette çalışanların en yüksek ve en düşük maaşlarını listeleyiniz

SELECT isim,max(maas),min(maas) FROM sirket
GROUP BY isim

--Sirkette çalışanların en yüksek ve en düşük maaşlarını yuvarlayıp listeleyiniz
SELECT isim,max(maas) as enyuksekmaas,min(maas) as endusukmaas,round(avg(maas),2)  as maasort FROM sirket
GROUP BY isim

--Tabloda kim kaçilde çalıştığını listeleyiniz
SELECT isim,count(sehir) FROM sirket
GROUP BY isim

--Having --> Sadece Group by comutu ile kullanılır Gruplamadan sonra bir şart vra isewhere komutu kullanamayız 
--onun yerine aynı anlama gelen having komutu kullanılır

--Toplam maaşı 7000 in altında olan kişileri listeleyiniz
SELECT isim,sum(maas) FROM sirket 
GROUP BY isim HAVING sum(maas)<7000;

--Sehirlere göre ortalama maaşları listeleyiniz
SELECT sehir,round(avg(maas)) as ortalama_maas FROM sirket
GROUP BY sehir

select * from sirket order by isim

--Sehirlere göre ortalama maaşları 2000 in altındakilerilisteleyiniz
SELECT sehir,round(avg(maas)) as ortalama_maas FROM sirket
GROUP BY sehir
HAVING avg(maas)<2000














































