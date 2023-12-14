Create database Ariketa1;


use Ariketa1;

Create table Irakasleak (
    Nan char (9) not null,
    Izena varchar(20) not null,
    Abizena varchar(40) not null,
    Helbidea varchar(50),
    Herria varchar(50),
    Soldata float(6,2) unsigned,
    Adina tinyint unsigned,
    PRIMARY KEY (Nan)
)
ENGINE=InnoDB;

Create table Lekua (
    Pisua tinyint unsigned not null,
    Gela varchar(15) not null,
    Mahaia char(2),
    PRIMARY KEY (Pisua,Gela,Mahaia)
)
ENGINE=InnoDB;


Create table Ikasleak (
    Kodea smallint unsigned not null,
    Izena varchar(20) not null,
    Abizena varchar(40) not null,
    Adina tinyint unsigned not null,
    Nan char (9) not null,
    Pisua tinyint unsigned not null,
    Gela varchar(15) not null,
    Mahaia char(2),
    PRIMARY KEY (Kodea),
    FOREIGN KEY (Nan) REFERENCES Irakasleak(Nan) ON UPDATE CASCADE on delete CASCADE,
    FOREIGN KEY (Pisua,Gela,Mahaia) REFERENCES Lekua(Pisua,Gela,Mahaia) ON UPDATE CASCADE on delete CASCADE
)
ENGINE=InnoDB;

Create table Ikasgaia(
    Kodea char (4) not null,
    Izena varchar(2) not null,
    Maila tinyint unsigned,
    Primary KEY (Kodea)
)
ENGINE=InnoDB;

Create table Matrikulatu (
    Kodea smallint unsigned not null,
    Kodea_Ikasgai char (4) not null,
    PRIMARY KEY (Kodea,Kodea_Ikasgai),
    FOREIGN KEY (Kodea) REFERENCES Ikasleak(Kodea) ON UPDATE CASCADE on delete CASCADE,
    FOREIGN KEY (Kodea_Ikasgai) REFERENCES Ikasgaia(Kodea) ON UPDATE CASCADE on delete CASCADE
)
ENGINE=InnoDB;



Alter table Ikasleak 

   FOREIGN KEY (Nan) REFERENCES Irakasleak(Nan);



Insert into Irakasleak values (
    '12345678L',
    'Peru',
    'Abarka',
    'San francisco 12',
    'Tolosa',
    1030.50,
    30
);

Insert into Lekua values (
0,
'Enara',
'01'
);

Insert into Ikasleak values (
    1,
    'Unai',
    'Martinez',
    18,
    '12345678L',
    0,
    'Enara',
    '01'
);


--Borratu tolosako Irakasleak

Delete from Irakasleak where Herria = 'Tolosa';

--Igo soldata irakasleei 110% 1500 > irabazten dutenei

Update Irakasleak set Soldata =Soldata + soldata *0.1  where soldata > 1500;


--Irakaslea izenak lortu

Select Izena from Irakasleak;

--Irakaslea izenak lortu bakarrik 1500 soldata >

Select izena from Irakasleak where soldata >1500;


--Irakaslea izenak lortu bakarrik 1500 > soldata  eta  koldo izena ez

Select izena from Irakasleak where soldata >1500 AND Not (izena='koldo'); 

--ATera ikasleen eta irakasleen izen eta abizenak

Select ikasleak.izena,ikasleak.abizena, irakasleak.izena,irakasleak.abizena from Irakasleak 
    inner JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan;


--ATera ikasleen eta irakasleen izen eta abizenak ordenatuta abizen bidez 

Select ikasleak.izena,ikasleak.abizena, irakasleak.izena,irakasleak.abizena from Irakasleak 
    inner JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan
    order by irakasleak.abizena,ikasleak.abizena Desc;


--tutoreen izena eta abizena eta tutore bakoitzaren iaksle kopurua

Select  irakasleak.izena,irakasleak.abizena,  count(ikasleak.izena) from irakasleak  

 inner JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan

 group by irakasleak.izena,irakasleak.abizena;

--tutoreen izena eta abizena eta tutore bakoitzaren iaksle kopurua bakarrik tutoreen soldata 1500 <

Select  irakasleak.izena,irakasleak.abizena, count(ikasleak.izena) from irakasleak  

 inner JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan

  where Irakasleak.soldata < 1500

 group by irakasleak.izena,irakasleak.abizena;



 Select  irakasleak.izena,irakasleak.abizena,count(ikasleak.izena) from irakasleak  

 inner JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan

 group by irakasleak.izena,irakasleak.abizena having count(ikasle.izenak) >20;

-- tutoreak ez diren izenak

Select  irakasleak.izena,irakasleak.abizena  from irakasleak  

 left JOIN ikasleak ON irakasleak.Nan = ikasleak.Nan

 where ikasleak.izena  is null;

 --Ikasle kopurua atera nahi dugu

Select count(izena) from ikasleak;


--Atera ikasle kopurua herri bakoitzean

Select   count (ikasleak.Kodea),Herria from ikasleak
group by Herria;

--Irakasleen soldataren batazbeteskoa herri bakoitzez sailkatuta

Select AVG(Soldata),Herria From irakasleak
(where Herria = "Tolosa")
group by Herria
(having Herria"Tolosa"); group by dagoenean erabili daiteke

--Adina aldatu 35-era  Koldo Villabonakoari

Update Irakasleak set Adina =35  where Nan = 4;

--Borratu koldoren datuak zumarragakoak

Delete from irakasleak where Nan=6;

