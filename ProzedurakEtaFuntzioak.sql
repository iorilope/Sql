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

--PertsonaSartuprozedura

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


