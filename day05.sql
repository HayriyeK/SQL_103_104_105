CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
delete from personel
--isme gore toplam maaslari bulun
select isim,sum(maas)FROM personel
GROUP BY isim

--personel tablosundaki isimleri gruplayiniz.
SELECT isim, count(sehir) from personel group by isim;

-- 									HAVING CLAUSE
-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
--Gruplamadan once bir sart varsa 'where',gruplamadan sonra sart varsa 'having' kullaniyoruz
--having komutu yanlizca group by komutu ile kullanilir
-- eger gruplamadan sonra bir sart varsa having komutu kullanilir.
--where kullanimi ile aynı mantıkla calişir.


--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000


-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
SELECT isim,sum(maas) as toplam_maas FROM personel
GROUP BY isim 
HAVING SUM(maas)>10000

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir,count(isim) as toplam_personel_sayisi FROM personel
GROUP BY sehir
HAVING count(isim)>1 

-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir, max(maas) as en_yuksek_maas  FROM personel
GROUP BY sehir
HAVING max(maas)<5000

             --UNION OPERATOR
-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
SELECT sehir as isim_veya_sehir_ismi,maas
FROM personel
where maas>5000
UNION
SELECT isim,maas
FROM personel
where maas>4000
--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki 
--personelin maaslarini bir tabloda gosteren sorgu yaziniz
select isim as isim_ve_sehir,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
ORDER BY maas DESC

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

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
SELECT sehir as sehir_ve_tel ,maas as maas_ve_cocuksayisi FROM personel where id =123456789
union
SELECT tel,cocuk_sayisi FROM personel_bilgi where id =123456789

--UNION ALL
/*
union tekrarlı verileri teke dusurur ve bize o sekilde sonuc verir
union all ise tekrarli verilerle birlikte tum sorgulari getirir.

*/

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel where maas<5000
union all
SELECT isim,maas FROM personel where maas<5000

--INTERSECT OPERATOR
-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id FROM personel WHERE sehir in('İstanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);
-- 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- 3) Iki sorguyu INTERSECT ile birlestirin
select id from personel where maas not between 4800 and 5500
INTERSECT
select id from personel_bilgi where cocuk_sayisi IN(2,3)

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin

SELECT isim from personel where sirket='Honda' 
INTERSECT
SELECT isim from personel where sirket='Ford'
INTERSECT
SELECT isim from personel where sirket='Tofas'

--EXCEPT OPERATOR
/*
iki sorgulamada harici bir sorgulama istenirse except komutu kullanilir
*/
--5000'den az maas alip Honda'da calışmayanlari yazdirin
select isim,sirket from personel where maas<5000
EXCEPT 
SELECT isim,sirket from personel where sirket='Honda'
