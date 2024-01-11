-- 1. Sortu ikuspegi bat trebetasunak2 izenarekin.Ikuspegi honek trebetasunak taularen eremu
-- guztiak izango ditu baina trebetasunaren kodea M baino handiago daukaten erregistroekin
-- bakarrik

Create view trebetasunak2 as 
select * from trebetasunak
where kode_trebetasuna > "M";

-- 2.Trebetasunak2 ikuspegian txertatu hurrengo datuak: ('INF','INFORMATIKA') eta
-- ('zuz','zuzendaritza')

insert into trebetasunak2 values ("inf","INFORMATIKA"),("zuz","zuzendaritza");

-- 3.Konprobatu aurreko ariketan txertatu dituzun datuak ea trebetasunak2 ikuspegiaren bidez
-- ikusten diren.

Select * from trebetasunak2; INF ez da txertatzen erregistro hori existitzen baita

-- Aurreko ikuspegia erabiliz, aldatu trebetasunaren kodea bi kasuetan: INF-->INFO eta zuz--
-- >ZUZE

update trebetasunak2
set kode_trebetasuna = "INFO"
where kode_trebetasuna = "INF";

Update trebetasunak2
set kode_trebetasuna = "ZUZE"
where kode_trebetasuna = "zuz";

-- 5.Konprobatu ea aurreko aldaketak egin diren.Zergatik?

Aurreko aldaketak egingo dira zuzendariaren kasuan, INF kodea M baino txikiagoa baita

-- Trebetasunak2 ikuspegia erabiliz, ezabatu txertatu ditugun datuak (INFO ETA ZUZE).Biak
-- ezabatu dira?Zergatik?

Hau borratu egingo da

Delete from trebetasunak2 
where kode_trebetasuna = "ZUZE";

Hau ez da borratuko ez baitugu txertatu

Delete from trebetasunak2
where kode_trebetasuna = "INFO";

-- Trebetasunak2 ikuspegia ezabatu

drop view trebetasunak2;

-- 8.Sortu ikuspegi berri bat zuzendariak izenarekin.Hurrengo eremuak izango ditu:
-- kodea(zuzendariaren kodea),izena(zuzendariaren izena),alorra(alorraren izena),dirua(soldata)
-- eta herria(lana egiten duen lekua) baina bakarrik sartuko ditugu alorretako zuzendariak edo
-- zentroetako zuzendariak diren langileak.(edo biak

Create view Zuzendariak as
Select langilea.kode_langilea,langilea.izena,alorra.izena as alorrIzena,langilea.soldata,zentroa.herria
from ((langilea 
inner join alorra on langilea.kode_alorra = alorra.kode_alorra) inner join zentroa on zentroa.kode_zentroa = alorra.kode_zentroa)
where (kode_langile_zuzendu = langilea.kode_langilea) or kode_langile_zuzendu = zentroa.kode_langilea
;

-- 9.Konprobatu 8. ariketaren emaitza hurrengo datuak direla: 1,2,6,9,5,3

select * from Zuzendariak

-- 10.Zuzendariak ikuspegia erabiliz,atera zuzendarien kodea,izena eta beraien seme-alaben
-- izenak.Sailkatu informazioa zuzendariaren izenagatik eta berdina bada, seme-alabaren
-- izenagatik.

select Zuzendariak.kode_langilea,Zuzendariak.izena as GurasoIzena,seme_alaba.izena as SemeIzena

from Zuzendariak

inner join seme_alaba on seme_alaba.kode_langilea = Zuzendariak.kode_langilea

order by Zuzendariak.izena or seme_alaba.izena;