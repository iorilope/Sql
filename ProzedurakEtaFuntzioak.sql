--Funtzioa1
CREATE DEFINER=`root`@`localhost` FUNCTION `KaixoMundua`() RETURNS varchar(32) CHARSET utf8mb4
DETERMINISTIC
BEGIN
declare irteera varchar(32) default "Kaixo Mundua";
set irteera = "Kaixo Mundua!!";
return irteera;
END

--Funtzioa2

CREATE DEFINER=`root`@`localhost` FUNCTION `KaixoMundua1`(sarrera VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4
DETERMINISTIC
BEGIN
 DECLARE irteera VARCHAR(20);
 SET irteera = sarrera;
 RETURN irteera;
END

--Prozedura1

CREATE DEFINER=`root`@`localhost` PROCEDURE `KaixoMundua`()
    DETERMINISTIC
BEGIN
select "Kaixo Mundua!!";
END

--Prozedura2

CREATE DEFINER=`root`@`localhost` PROCEDURE `KaixoMundua1`(in mezua2 varchar(30),out mezua varchar(30))
    DETERMINISTIC
BEGIN

 SET mezua = mezua2;
 

END

--Sortu idazleak taula hurrengo eremuekin: kodea, izena eta abizena.

CREATE TABLE umeak(kodea int unsigned auto_increment primary key
,adina tinyint unsigned, izena varchar(50));

CREATE TABLE helduak(kodea int unsigned auto_increment primary key
,adina tinyint unsigned, izena varchar(50));


CREATE procedure pertsonasartu(IN adina tinyint unsigned,IN izena
varchar(50))
begin
IF adina < 18 then
INSERT INTO umeak(adina,izena) VALUES(adina,izena);
else
INSERT INTO helduak(adina,izena) VALUES(adina,izena);end IF;
end;


--Prozedura if then

CREATE TABLE zerrenda(kodea int unsigned auto_increment primary key
,balorea int unsigned);

CREATE procedure nereProk(IN p1 int)
 begin
 declare nerealdg int;
 SET nerealdg = p1 +1 ;
 IF nerealdg = 12 then
INSERT INTO zerrenda(balorea) VALUES(55555);
 else
INSERT INTO zerrenda(balorea) VALUES(7665);
 end IF;
 end;

 --prozedura Switch

 CREATE DEFINER=`root`@`localhost` PROCEDURE `nereProk1`(IN p1 int)
begin
 declare aldg int ;
 SET aldg = p1 +2 ;
 case aldg
 when 2 then INSERT INTO zerrenda(balorea) VALUES (66666);
 when 3 then INSERT INTO zerrenda(balorea) VALUES
(4545665);
 else INSERT INTO zerrenda(balorea) VALUES (77777777);
 end case;
 end

 --Karaktereak konparatu Prozedura

 CREATE procedure konparatu(IN kate1 varchar(25), IN kate2 varchar(25))
 begin
 IF strcmp(kate1, kate2) = 0 then
 SELECT "BERDINAK DIRA!";
 else
 SELECT "DESBERDINAK DIRA!!";
 end IF;
 end;
--karaktereak konpartu prozedura In and Out

CREATE DEFINER=`root`@`localhost` PROCEDURE `konparatu2`(IN kate1 varchar(25), IN kate2 varchar(25),out mezua2 varchar(30))
begin
 IF strcmp(kate1, kate2) = 0 then
 set mezua2 = "BERDINAK DIRA!";

 else
 set mezua2 ="DESBERDINAK DIRA!!";

 end IF;
 end

--Ingurune grafiko gabe egin behar dena
 call proba.konparatu2('Kaixoasd','kaixo',@mezua2);
select @mezua2;


--Egin prozedura bat izena_lortu izenarekin ,non kodea sartu ondoren, idazlearen izena eta abizena itzuliko duen.u

CREATE DEFINER=`root`@`localhost` PROCEDURE `izena_lortu`(in kodea int)
BEGIN
select izena,Abizena from idazleak where id = kodea;
END


--Egin funtzio bat idazlea_ezabatu izenarekin, non idazle baten kodea sartu ondoren, idazle horren datuak ezabatuko duen eta mezu bat itzuliko duen:

CREATE DEFINER=`root`@`localhost` FUNCTION `Idazlea_Ezabatu`(zenbakia int) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare mezua varchar(30);
    declare zenb int;
    set zenb =0;
    select id into zenb from idazleak where id=zenbakia;
    
	if zenb <> 0 THEN
		DELETE FROM idazleak WHERE id=zenb;
        set mezua='Idazlea ongi ezabatu da';
	else
		set mezua='Idazlea ez da existitzen,sartu kodea ondo!';
	end if;
RETURN mezua;
END

-- 2.Enpresa datu-basean egin prozedura bat langilearen seme_alaben kopurua kalkulatzeko.

CREATE DEFINER=`root`@`localhost` PROCEDURE `Seme_alaben_Kopurua`(in zenbakia int, out kopurua int)
    DETERMINISTIC
BEGIN
declare zenb int;
set zenb =0;
select kode_langilea into zenb from langilea where kode_langilea=zenbakia;
set kopurua = (select count(seme_alaba.izena)  from seme_alaba where seme_alaba.kode_langilea = zenb);
select kopurua;
END
