--Trebetasunaren bat daukaten langileen N.I.Fa atera.

select nif from langilea 
inner join trebetasun_langile_izan on trebetasun_langile_izan.kode_langilea = langilea.kode_langilea
group by nif;


--Azpikonstultarekin eginda
Select nif from langilea 
where kode_langilea in (select kode_langilea from trebetasun_langile_izan )
group by nif;