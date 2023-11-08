CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);


--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
--QUERY yazin
--SORU  : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
--QUERY yazin

SELECT * FROM kelimeler WHERE kelime ~~ 'h%';

--Kelimeler sütunundaki bütün dataları küçük yazdıralım
SELECT LOWER(kelime) as kelime FROM kelimeler

--Kelimler sütunundaki tüm dataların ilk harfini büyük yazdırın
SELECT INITCAP(kelime) as kelime FROM kelimeler

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (30, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (40, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (50, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (60, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (70, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (80, 'Elif', 'Elma');

select * from musteri_urun

--Musteri_urun tablosundan musteri_isimlerini tekrarsız listeleyiniz
SELECT DISTINCT(musteri_isim) FROM musteri_urun
--group by ile çözümü
select musteri_isim FROM musteri_urun
group by musteri_isim

--musteri_ürün tablosundaki meyve çeşitlerin listeleyiniz
SELECT DISTINCT(urun_isim) FROM musteri_urun

--Musteri_urun tablosunda kaç çeşit meyve satılıyor listeleyiniz
select count(DISTINCT urun_isim) as urun_cesit_sayısı from musteri_urun

--FETCH NEXT (SAYI) ROW ONLY- OFFSET
--Musteri ürün tablosundan son 3 ismi listelyiniz

--limitle çözümü
SELECT * FROM musteri_urun
ORDER BY urun_id desc limit 3

--fetch ile çözümü
SELECT * FROM musteri_urun
ORDER BY urun_id desc 
FETCH NEXT 3 ROW ONLY

--Musteri urun tablosundan bastan 3. kaydı listeleyiniz
SELECT * FROM musteri_urun
OFFSET 2 limit 1

--Musteri_urun tablosundan 4. ve 6. kaydı listeleyiniz
SELECT * FROM musteri_urun
OFFSET 3 limit 3

--FETCH NEXT ile çözümü
SELECT * FROM musteri_urun
order by urun_id
OFFSET 3 ROW FETCH NEXT 3 ROW ONLY

--ALTER TABLE -->Tablodaki sütun ve sütunların data tipleri ve tablonun kendisine müdahaleedebilmek için kullanılır
--ADD
/*SYNTAX
ALTER TABLE tablo_adı
ADD sutün_adi
*/
SELECT * FROM musteri_urun

ALTER TABLE musteri_urun 
ADD kasa_sayisi varchar(5);

ALTER TABLE musteri_urun
ADD sehir varchar(20) default 'Ankara';

--urun_id sütunun aprimary key ekleyelim 
/*
Constraintler genelikle tablo oluşturulurken atanmalı. Constrain olmayan bir tabloya sonradan constrain ekleme 
ilişkili tablolarda karışıklığa yol açabilir
*/
ALTER TABLE musteri_urun
ADD primary key (urun_id); -->bu atamayı ürün_id sütunu unique olmadığı için hata verir

ALTER TABLE musteri_urun
ADD primary key (kasa_sayisi);

SELECT * FROM meyveler

--Rename
ALTER TABLE musteri_urun
rename urun_isim to meyve

ALTER TABLE musteri_urun
RENAME to meyveler

--Transaction BLOCK
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
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);

select * from ogrenciler2
delete from ogrenciler2

rollback to x;

COMMIT;

--Interview
Create table isci(
id char(2),
isim varchar(10),
maas int    
);
insert into isci values ('10','Erol',1000);
insert into isci values ('11','Evren',1500);
insert into isci values ('12','Emre',2000);
create table isci_adres(
id char(2),
sehir varchar(20),
tel varchar(15)    
);
insert into isci_adres values ('10','Burdur','0523125465');
insert into isci_adres values ('11','Ankara','0546532133');
insert into isci_adres values ('12','Bursa','0213213545');

select * from isci

--Personellerin isim ve sehirlerini yazdırınız
SELECT isci.isim,isci_adres.sehir FROM 
isci full join isci_adres ON isci.id=isci_adres.id


--Ankarada çalışan personelin id ve ismini listeleyiniz
SELECT id,isim FROM isci WHERE id in 
(SELECT id FROM isci_adres WHERE sehir='Ankara')


























