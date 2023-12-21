-- Txertatu hurrengo erregistroa:
-- Alorra: “Departamento de pruebas”
-- Zuzenduta: 4. langilea.
-- Ez dago beste alor baten menpe.
-- Zentroa: DIGE.
-- Aurrekontua: 1000000
-- Zuzendari mota: F.
-- Kodea: PRUEB.



INSERT INTO alorra (izena, kode_langile_zuzendu,kode_alorra_menpe,kode_zentroa,aurrekontua,zuzendari_mota,kode_alorra)
VALUES ("Departamento de pruebas", 4, "PRUEB", "DIGE",1000000,"F","PRUEB");

-- TEMP taula sortu kode langilea, alorreko_izena, langile_izena eta
-- langile_soldata eremuekin. Txertatu taula honetan Murciako zentroetako
-- langileen soldata, izena, alorraren izena eta kodea

INSERT INTO TEMP 
SELECT  langilea.kode_langilea ,alorra.izena,langilea.izena,langilea.soldata,Zentroa.herria
FROM ((langilea
inner join alorra on alorra.kode_alorra = langilea.kode_alorra)
inner join zentroa on alorra.kode_zentroa =zentroa.kode_zentroa)
WHERE zentroa.herria = "Murcia";

--Taula sortu
Create table TEMP (
    kode_langilea TINYINT UNSIGNED NOT NULL,
    alorra_izena VARCHAR(30) NOT NULL,
    langile_Izena VARCHAR(35) NOT NULL,
    soldata INT UNSIGNED NULL DEFAULT NULL,
    Herria VARCHAR(20) NOT NULL,
    PRIMARY KEY (kode_langilea)
)
ENGINE=InnoDB;

--Ezabatu lehenengo ariketan txertatu dugun erregistroa.

Delete from TEMP where herria = "Murcia";
