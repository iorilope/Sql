-- 8.Prozedura bat egin aktore taulan datuak sartzeko. Adibidez:
-- Datuak_sartu(“Brad”,”Pitt”)

CREATE DEFINER=`root`@`localhost` PROCEDURE `Datuak_Sartu`(In izen varchar(20),in abizen varchar(20))
BEGIN

insert into aktorea(Izena,abizena)  values (izen,abizen);
END

--9.Funtzio bat egin jakiteko zenbat pelikula dauden.

CREATE DEFINER=`root`@`localhost` FUNCTION `Pelikula_Kop`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
declare kopurua int;
set kopurua = 0;
set kopurua = (select count(p_zb)  from filma);
RETURN kopurua;
END

--Prozedura bat egin aktore baten film_kopurua egokia den
--balorearekin inizializatzeko.

CREATE DEFINER=`root`@`localhost` PROCEDURE `Aktore_Film_Kop`(in zenbakia int, out kopurua int)
    DETERMINISTIC
BEGIN
declare zenb int;
set zenb =0;
select a_zb into zenb from aktorea where a_zb=zenbakia;
set kopurua = (select film_kopurua  from aktorea where a_zb = zenb);
select kopurua;
END

