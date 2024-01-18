Create user Langilea identified by "langilea";
 grant all on *.* to Langilea;

create user bezeroa identified by "bezeroa";

grant select on bideoteka.aktorea  to bezeroa;

grant select on bideoteka.filma  to bezeroa;

Select Izena,Abizena from aktorea where film_kopurua > 2;

Select filma.izenburua,film_mota.deskribapena from filma
inner join  film_mota on film_mota.m_zb = filma.Film_Mota_m_zb
order by filma.izenburua;

select count(aktorea.film_kopurua) as Filma_Kopurua from aktorea;

select AVG(aktorea.film_kopurua) as Film_Media from aktorea;

/* errorea ematen badu SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); pegatu kontsolan */
SELECT Izena,abizena,MAX(film_kopurua) FROM aktorea WHERE film_kopurua<10 group by a_zb;
SELECT Izena,Abizena,MIN(film_kopurua) FROM aktorea WHERE film_kopurua>1 group by a_zb;

CREATE TABLE aktore_zaharrak (
  id INT PRIMARY KEY AUTO_INCREMENT,
  izena VARCHAR(20) NOT NULL,
  abizena VARCHAR(20) NOT NULL,
  film_kopurua int not null
);

insert into aktore_zaharrak
select * from aktorea;

update aktore_zaharrak set abizena = "Forde" where abizena ="Ford";

delete from aktore_zaharrak where abizena = "forde";

Create view  2FilmBainogehiagoAktoreak   as 
Select Izena,Abizena from aktorea where film_kopurua > 2;



