

CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3
-- ismi Mustafa Bak ve Nesibe yılmaz olan kayıtlatı silelim
delete from ogrenciler3 where isim='Mustafa Bak' or isim='Nesibe Yılmaz';

--Veli ismi hasan olan kayıtlatı silelim
delete from ogrenciler3 where veli_isim='Hasan';

--TRUNCATE --
--Bir tablodaki tum verileri geri alamayacagımız sekilde siler. sartli silme yapmaz
TRUNCATE table ogrenciler3

--ON DELETE CASCADE
DROP TABLE if exists notlar --Eğer tablo varsa tabloyu siler
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from notlar;
select * from talebeler;

--Notlar tablosundan talebe_id'si 123 olan datayı silelim

DELETE FROM notlar where talebe_id='123';



CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from not1;
select * from talebe;

--Talebeler tablosundan id'si 126 olan detayi silelim
DELETE FROM talebe WHERE id='126';

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

DROP TABLE if exists musteriler
CREATE TABLE musteriler  (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

--Musteriler tablosundan urun ismi orange, apple ve apricot olan tum VERİLERİ listeleyiniz

select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';

select * from musteriler where urun_isim='Orange' and urun_id=10;

--IN CONDITION
select * from musteriler where urun_isim IN ('Orange','Apple','Apricot');

--NOT IN --Yazdıgımız verilerin dısındakileri getirir
select * from musteriler where urun_isim NOT IN ('Orange','Apple','Apricot');

--BETWEEN CONDITION

--Musteriler tablosundan ıd'si 20 ile 40 arasında olan tum verileri listeleyiniz
SELECT * FROM musteriler where urun_id>=20 and urun_id<=40;

SELECT * FROM musteriler where urun_id between 20 and 40;

SELECT * FROM musteriler where urun_id not between 20 and 40;




















