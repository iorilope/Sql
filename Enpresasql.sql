Create database enpresa;

Use enpresa;

--Taulak sortzen ditugu atzerritar gako gabe gero gehituko dizkiogu Alter table bidez

Create table alorra (
    kode_alorra char(5) not null,
    kode_langile_zuzendu tinyint,
    kode_alorra_menpe char(5) not null,
    kode_zentroa char(4),
    izena varchar(30) not null,
    aurrekontua int not null,
    zuzendari_mota char(1) not null,
    Primary key (kode_alorra)
)
ENGINE=InnoDB;

Create table zentroa (
    kode_zentroa char(4) not null,
    izena varchar(30) not null,
    helbidea varchar(30) not null,
    herria varchar(20) not null,
    kode_langilea tinyint,
    Primary key (kode_zentroa)
)
ENGINE=InnoDB;

Create table langilea (
    kode_langilea tinyint not null,
    kode_alorra char(5),
    telf varchar(10),
    data_noiz_hasi DATE,
    jaiotze_data DATE,
    nif char(9) not null,
    izena varchar(35) not null,
    soldata int,
    mota char(1),
    Primary key (kode_langilea)
)
ENGINE=InnoDB;

create table autonomo (
    autonomo_kuota FLOAT,
    langilea_kode_langilea tinyint not null,
    Primary key (langilea_kode_langilea)
)
ENGINE=InnoDB;

create table enpresakoa (
    noiztik DATE not null,
    langilea_kode_langilea tinyint not null,
    Primary key (langilea_kode_langilea)
)
ENGINE=InnoDB;

create table trebetasun_langile_izan (
    kode_trebetasuna char(5) not null,
    kode_langilea tinyint not null,
    maila tinyint,
    PRIMARY KEY (kode_trebetasuna,kode_langilea)
)
ENGINE=InnoDB;

create table trebetasunak (
    kode_trebetasuna char(5) not null,
    azalpena varchar(20),
    Primary key (kode_trebetasuna)
)
ENGINE=InnoDB;
create table seme_alaba (

kode_langilea tinyint not null,
seme_zenbakia tinyint not null,
jaiotze_data DATE, 
izena varchar(30),
PRIMARY KEY (kode_langilea,seme_zenbakia)
)



ALTER TABLE alorra
ADD FOREIGN KEY (kode_langile_zuzendu) REFERENCES langilea(kode_langilea) on update cascade on delete cascade,
ADD FOREIGN KEY (kode_zentroa) REFERENCES zentroa(kode_zentroa) on update cascade on delete cascade,
ADD FOREIGN KEY (kode_alorra_menpe) REFERENCES alorra(kode_alorra) on update cascade on delete cascade;


alter table zentroa
add foreign key (kode_langilea) references langilea(kode_langilea) on update cascade on delete cascade;

alter table langilea
ADD FOREIGN KEY (kode_alorra) REFERENCES alorra(kode_alorra) on update cascade on delete cascade;

alter table autonomo
add foreign key (langilea_kode_langilea) references langilea(kode_langilea) on update cascade on delete cascade;

alter table enpresakoa
add foreign key (langilea_kode_langilea) references langilea(kode_langilea) on update cascade on delete cascade;

alter table seme_alaba
add foreign key (kode_langilea) references langilea(kode_langilea) on update cascade on delete cascade;

alter table trebetasun_langile_izan
add foreign key (kode_langilea) references langilea(kode_langilea) on update cascade on delete cascade;



Load DATA infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\irakasleak.txt'

into table irakasleak
fields terminated by ';'
lines terminated by '\r\n';