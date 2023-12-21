--14000000 baino gehiagoko aurrekontua duten alorreen kodea, izena, aurrekontua eta alor hauen zentroaren izena atera. 
--Sailkatu informazioa zentroaren izenaren arabera, eta hau berdina baldin bada aurrekontuaren arabera haundienetik txikienera

Select alorra.kode_alorra,alorra.izena,alorra.aurrekontua,zentroa.izena 
from zentroa

inner join alorra on alorra.kode_zentroa = zentroa.kode_zentroa
where alorra.aurrekontua > 14000000
order by alorra.aurrekontua desc;

--Atera langileen kodea, izena, beraien trebetasunak eta trebetasunaren maila. Sailkatu informazioa langileen izenaren arabera.

Select langilea.kode_langilea,langilea.izena,trebetasun_langile_izan.maila,trebetasun_langile_izan.kode_trebetasuna
from  langilea
inner join  trebetasun_langile_izan on langilea.kode_langilea = trebetasun_langile_izan.kode_langilea
order by langilea.izena;

--Atera langileen kodea, izena eta trebetasunen datuak (baldin badituzte), langilearen zenbakiaren arabera sailkatuta

 Select langilea.kode_langilea,langilea.izena,trebetasun_langile_izan.maila,trebetasun_langile_izan.kode_trebetasuna,trebetasunak.azalpena
 from ((trebetasun_langile_izan
 right join  langilea on trebetasun_langile_izan.kode_langilea = langilea.kode_langilea)
 right join trebetasunak on trebetasun_langile_izan.kode_trebetasuna = trebetasunak.kode_trebetasuna)
 order by langilea.kode_langilea;

--Zortzigarren langilearen semea jaio zen urte berean kontratatutako langileen izena eta alorra atera. Sailkatu informazioa langilearen alorraren arabera.
select langilea.izena,alorra.izena,seme_alaba.kode_langilea
from ((alorra
inner join langilea  on alorra.kode_alorra = langilea.kode_alorra)
inner join seme_alaba on langilea.kode_langilea = seme_alaba.kode_langilea)
where seme_alaba.kode_langilea = 8  AND seme_alaba.jaiotze_data  = langilea.data_noiz_hasi
order by alorra.izena;

-- Beste modu bat egiteko

Select langilea.izena,alorra.izena 
from seme_alaba,alorra,langilea
where alorra.kode_alorra = langilea.kode_alorra
and seme_alaba.kode_langilea = 8
AND YEAR (seme_alaba.jaiotze_data) = YEAR (langilea.data_noiz_hasi);

--PROZS alorretako langileen izena atera eta trebetasunen datu guztiak (baldin badituzte). Langilearen izenaren arabera informazioa sailkatu.

Select langilea.kode_langilea,langilea.izena,trebetasun_langile_izan.maila,trebetasun_langile_izan.kode_trebetasuna,trebetasunak.azalpena
 from ((trebetasun_langile_izan
 right join  langilea on trebetasun_langile_izan.kode_langilea = langilea.kode_langilea)
 right join trebetasunak on trebetasun_langile_izan.kode_trebetasuna = trebetasunak.kode_trebetasuna)
 where langilea.kode_alorra = "PROZS"
 order by langilea.kode_langilea;