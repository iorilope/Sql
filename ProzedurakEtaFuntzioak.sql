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
 