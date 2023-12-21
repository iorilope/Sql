--Langileen soldaten bataz bestekoa atera.

Select AVG(soldata) from langilea;

--Murcian dauden alorren aurrekontuen batuketa atera.

Select SUM(alorra.aurrekontua) from alorra
inner join zentroa on alorra.kode_zentroa =zentroa.kode_zentroa
where zentroa.herria = "Murcia";

-- Soldaten balorerik haundiena eta txikiena atera.
--Ez erabili AND , erabili honen ordez

Select MAX(soldata) as Maximoa,MIN(soldata) as Minimoa
from langilea;

--Trebetasun mota kopurua atera

select Count(kode_trebetasuna) as Kopurua from trebetasunak;

--Alor bakoitzeko soldaten balorerik txikiena, handia eta bataz bestekoa atera. Dagokion alor kodea atera dato bakoitzarekin

Select MAX(soldata) as SoldataMaximoa,MIN(soldata) as SoldataMinimoa,AVG(soldata) as SoldataBatabestekoa,alorra.kode_alorra as AlorraIzena
from langilea
inner join alorra on langilea.kode_alorra =alorra.kode_alorra
group by alorra.kode_alorra;
