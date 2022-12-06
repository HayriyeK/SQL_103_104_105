CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
--varolan tablodan yeni bir tablo olusturma
CREATE TABLE NOTLAR
AS 
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--TABLO İCİNE VERİ EKLEME

INSERT INTO notlar VALUES ('Orhan',95.5);
INSERT INTO notlar VALUES ('Ali',75.5);
INSERT INTO notlar VALUES ('Musa',45.5);
INSERT INTO notlar VALUES ('Hakan',65.5);
INSERT INTO notlar VALUES ('Adem',75.5);
INSERT INTO notlar VALUES ('Sumeyye',85.5);

select * from notlar;

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date
);
select * from ogrenciler6
INSERT INTO ogrenciler7 VALUES ('1234567''Erol','Evren',75.5);
INSERT INTO ogrenciler7 VALUES ('1234567''Ali','Veli',75.5);
INSERT INTO ogrenciler7