Create table ogrenciler(
ogr_no varchar(10),
isim varchar(10),
tel varchar(15),
email varchar(25),
kayit_tarihi date	
);

--DML -> Data Manupulation Lang. -> INSERT(Tabloya veri ekleme komutu)
--Tüm sütunlara veri ekleme

INSERT INTO ogrenciler VALUES ('1234','Erol','0532154624','erol@gmail.com','06-03-2023');

--Bazı sütunlara veri ekleme, Parçalı veri ekleme

INSERT INTO ogrenciler (isim,tel,email) values ('Evren','046498765','evren@gmail.com');

/*
Practicel:
"tedarikciler" isminde bir tablo oluşturun ve "tedarikci_id", "tedarikci_ismi", "tedarikci_adresi"
ve "ulasim_tarihi" field'lari olsun.
*/
CREATE TABLE tedarikciler(
tedarikci_id char(4),
tedarikci_ismi varchar(25),
tedarikci_adres varchar(50),
ulasim_tarihi date	
);
/*
2) Var olantablodanyeni tablo olusturmak
"tedarikci_ziyaret" isminde bir tabloyu
"tedarikciler" tablosundan olusturun.
Icinde "tedarikci_ismi", "ulasım_tarihi" fied'lari olsun.
*/
CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi,ulasim_tarihi FROM tedarikciler;

--DQL->Data Query Lang. -> SELECT

--Tablodaki tüm sütun bilgilerini getirmek için kullanırız;
SELECT * FROM ogrenciler;

--Tablodaki istediğimiz bir veya birden fazla sütunu getirmek için;
SELECT isim,tel FROM ogrenciler;

--CONSTRAINT(KISITLAMA)
--UNIQUE
--NOT : Kısıtlamalar tablo oluşturulurken yapılmalıdır. Sonradan ALTER komutu ile
--kısıtlama eklenebilir fakat bu ilişkili tablolarda sorun teşkil edebilir.
Create table ogrenciler9(
ogr_no varchar(10),
isim varchar(10) unique,
tel varchar(15) not null,
email varchar(25)not null,
kayit_tarihi date	
constraint uniq_ky UNIQUE (tel),
UNIQUE (email)	
);

SELECT * FROM ogrenciler4

INSERT INTO ogrenciler4 VALUES ('1234','Erol','0532154624','erol@gmail.com','06-03-2023');

INSERT INTO ogrenciler4 (isim,email) VALUES ('Evren','evren@gmail.com');


INSERT INTO ogrenciler5 VALUES ('1234','ErolEvren','','erolcan@gmail.com','06-03-2023');


CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,  soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int
) ;

select * from personel

INSERT INTO personel (id,soyisim) values ('12345','Evren');
/*
--ERROR:  null value in column "isim" of relation "personel" violates not-null constraint
Bu ınsert islemini kabul etmez ve yukardaki gibi hata verir. Cunku isim sütununa NOT NULL kısıtlaması 
tablo oluşturuklurken atanmıştır Dolayısıyla isim sütunu boş geçilemez
*/

--PRIMARY KEY 
--Tabloya Prımary Key Ataması 1.Yol

CREATE TABLE personel
(
id char(10),
isim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int,
CONSTRAINT pk PRIMARY KEY (id)	
);

select * from personel

--FOREIGN KEY -> Primary key olan tablo ile bağlantı kuracak diğer tablodaki sütuna foreign key ataması yapılır

/*
Practice 4:
"tedarikciler" isimli bir tablo olusturun. Tabloda "tedarikci_id", "tedarikci_ismi",
"iletisim_isim" field'ları olsun ve "tedarikci_id" yi Primary Key yapin.
"urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id" field'lari olsun ve
"tedarikci_id" yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler( --> PARENT TABLE
tedarikci_id varchar(10)primary key,
tedarikci_ismi varchar(30),
iletisim_isim varchar(50)	
);

CREATE TABLE urunler( --> CHILD TABLE
tedarikci_id varchar(10),
urun_id varchar(10),
foreign key (tedarikci_id) references tedarikciler(tedarikci_id)
);
--Parebt tablo'nun primary key sütunu ile child tablonun foreign key ataması yapılmış sütunu yukarıdaki şekilde 
--bağlantı kurmuş olur
--Bağlantıkuracağımız sütunların data tipleri aynı olmalıdır
--Aynı olmazsa aşağıdaki hatayı alırız
--Key columns "urun_isim" and "tedarikci_id" are of incompatible types: character varying and integer.




















