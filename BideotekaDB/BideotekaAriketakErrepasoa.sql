--kokalekua gorde

create table kokalekua (
kodea int unsigned auto_increment not null,
izena varchar(30) not null,
leku_mota varchar(30) not null,
herrialdea varchar(30) not null,
primary key (kodea)
);

--N.M taula sortzen dugu gure kasuan Kokalekua has filma izenarekin sortuko dugu

create table Filma_has_kokalekua (
kokalekua_kodea int unsigned not null,
Filma_p_zb int unsigned not null,
primary key (kokalekua_kodea,Filma_p_zb),
foreign key (kokalekua_kodea) references kokalekua(kodea),
foreign key (Filma_p_zb) references filma(p_zb)
);

--Datuak sartu insert bidez

insert into kokalekua (izena,leku_mota,herrialdea) values ("Gobi","Desertua","China");
insert into kokalekua (izena,leku_mota,herrialdea) values ("Monegros","Desertua","Espainia");
insert into kokalekua (izena,leku_mota,herrialdea) values ("Verula","Zenobioa","Espainia");
insert into kokalekua (izena,leku_mota,herrialdea) values ("Loarre","Gaztelua","Espainia");

--Datuak aldatu

update kokalekua set herrialdea = "Mongolia" where herrialdea = "China";
update kokalekua set herrialdea = "China" where herrialdea = "Mongolia"; 

--Datuak ezabatu
Delete from kokalekua where herrialdea = "China";


