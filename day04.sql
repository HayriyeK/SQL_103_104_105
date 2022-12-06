--									ALIASES
-- Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir.
CREATE TABLE calisanlar3 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789,'Ali Can', 'Istanbul');
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');
select * from calisanlar3
--Eger iki sutunun verilerini birlestirmek istersek concat sembol olan || kullaniriz.
select calisan_id AS id,calisan_isim ||' '|| calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar3
--2.yol
select calisan_id AS id, concat(calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar3
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
select * from insanlar
-- Name sutundaki null olan degerleri listeleyin;
select name from insanlar where name is null;
-- insanlar tablosundan sadece null olmayan degerleri listeleyin;
select name from insanlar where name is not null;
-- Insanlar  tablosundan null deger almıs verileri no name olarak değiştiriniz
update insanlar
set name ='No Name' where name is null;
drop table if exists insanlar
--ORDER BY
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
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

--insanlar tablosundaki datalari adres'e gore sıralayın
 select * from insanlar order by adres;
  select * from insanlar order by soyisim;
  
  --insanlar tablosundaki ismi mine olanlar ssn sirali olarak listeleyin
  SELECT * FROM insanlar WHERE isim='Mine' ORDER BY ssn
  
  --NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar where soyisim='Bulut' ORDER BY 2

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar ORDER BY ssn DESC

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar ORDER BY isim ASC, soyisim DESC;

/*Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek  sonuna DESC komutunu ekleriz
*/

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim);

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir
--sütun değerini uzunluğuna göre sıralayınız
SELECT isim ||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim||soyisim)

SELECT isim ||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

select isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));  

--GROUP BY CLAUSE
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav
--Isme gore alinan toplam urunleri listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim

--Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,count(isim) FROM manav
GROUP BY urun_adi;

select isim,count(urun_adi)  from manav
GROUP BY isim





  