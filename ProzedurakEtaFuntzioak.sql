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

CREATE DEFINER=`root`@`localhost` PROCEDURE `KaixoMundua1`(in mezua2 varchar(30))
    DETERMINISTIC
BEGIN
declare mezua varchar(30);
 SET mezua = mezua2;
 select mezua2;
END