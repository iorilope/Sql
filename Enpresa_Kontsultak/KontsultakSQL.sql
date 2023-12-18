
--Kontsultak taula batekin

--Umeak dauzkaten langileak
select  kode_langilea,Izena from seme_alaba;

--92/01/01 baino lehenago enpresan sartu diren langileen alor kodea DISTINCT erabili griu by ordez kalkuluak ez baditugu egin behar

Select distinct kode_alorra from langilea where Data_noiz_hasi < '1992-01-01';

--telefonorik ez daukaten langileaen izena atera

Select Izena from langilea where telf = "";


--Atera izena eta aurrekontua alorretatik  DIGE eta FAZS  kodea ez dutena

select Izena,aurrekontua from alorra WHERE NOT kode_zentroa = 'DIGE,FAZS';

--1,4,8,6,10 kode ez duten izena atera langileetatik

SELECT Izena FROM langilea WHERE kode_langilea NOT IN (1, 4, 6, 8, 10);

--Langileen seme alaben izena eta jaiotze data seme alaben izenean leon egon behar du

SELECT * FROM seme_alaba
WHERE izena LIKE '%Leon%';


--Soldata between

select izena from langilea where Soldata < 2000000 AND   > 5000000;

--1985 baino lehen enrpesan sartutako langileetatik 4000000 baino gutxiago langileen izena eta  soldata atera

Select Izena,soldata from langilea where  Not Data_noiz_hasi > '1985-01-01' AND soldata < 4000000;

--N.I.Fean D edo V bat daukaten langileen izena eta N.I.F.a atera eta hurrengo baldintzak betetzen dituztenak: a) IN&Di edo DIRGE alorretan lana egiten dutenak eta 5000000 baino gehiago irabazten dutenak, edo b) 1994 urtean kontratatuak izan zirenak.

SELECT Izena,nif FROM langilea
WHERE kode_alorra ='IN&DI' OR 'DIRGE' AND soldata > 5000000;

--Alorretako kodea, izena eta aurrekontua atera, aurrekontuaren arabera handienetik txikienera sailkatuta.

Select Kode_alorra,Izena,aurrekontua from alorra order by aurrekontua DESC;

