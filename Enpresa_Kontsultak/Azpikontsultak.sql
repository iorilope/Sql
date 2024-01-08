--Trebetasunaren bat daukaten langileen N.I.Fa atera.

select nif from langilea 
inner join trebetasun_langile_izan on trebetasun_langile_izan.kode_langilea = langilea.kode_langilea
group by nif;


--Azpikonstultarekin eginda
Select nif from langilea 
where kode_langilea in (select kode_langilea from trebetasun_langile_izan )
group by nif;

--Hurrengo baldintza betetzen duten alorren izena atera:
-- a) Soldaten batuketak aurrekontuaren % 25a baino handiago edo berdina
-- izan behar du.

Select izena from alorra 
where (aurrekontua * 0.25)  <=  (select sum(soldata) from langilea where alorra.kode_alorra = langilea.kode_alorra); 

-- Hurrengo baldintza betetzen duten alorren izenak atera:
-- a) Aurrekontua maximora iristen ez diren alorrak.

select izena from alorra
where Not aurrekontua = (select MAX(aurrekontua) from alorra)
group by Izena;

-- “Correa” abizena daukan langilearen seme-alaben izena atera.

select izena from seme_alaba 
where kode_langilea in (select kode_langilea from langilea where izena like "%Correa%" );