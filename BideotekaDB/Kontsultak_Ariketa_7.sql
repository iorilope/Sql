--Select Taula batekin

Select Izena,Abizena from aktorea where film_kopurua > 2;

--Select bi taulekin

Select filma.izenburua,film_mota.deskribapena from filma
inner join  film_mota on film_mota.m_zb = filma.Film_Mota_m_zb
order by filma.izenburua;

--Select Funtzioekin

select count(aktorea.film_kopurua) as Filma_Kopurua from aktorea;

select AVG(aktorea.film_kopurua) as Film_Media from aktorea;
--Lehenik taula sortu

CREATE TABLE aktore_zaharrak (
  id INT PRIMARY KEY AUTO_INCREMENT,
  izena VARCHAR(20) NOT NULL,
  abizena VARCHAR(20) NOT NULL,
  film_kopurua int not null
);
Engine = INNODB

--Select datuak sartu
insert into aktore_zaharrak
select * from aktorea 

--Datuak aldatu

update aktore_zaharrak set abizena = "Forde" where abizena ="Ford";

--Datuak ezabatu

delete from aktore_zaharrak where abizena = "forde"

--Ikuspegiak egin
Create view  2FilmBainogehiagoAktoreak   as 
Select Izena,Abizena from aktorea where film_kopurua > 2;

--Erabiltzaileak sortu

Create user Langilea identified by "langilea"
 grant all on *.* to Langilea


create user bezeroa identified by "bezeroa"

grant select on bideoteka.aktorea  to bezeroa
grant select on bideoteka.filma  to bezeroa



