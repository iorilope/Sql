
load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/trebetasuna.txt' into table trebetasunak 
lines terminated by '\r\n';

load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/zentrodatuak.txt' into table zentroa 
lines terminated by '\r\n'(kode_zentroa,izena,helbidea,herria);

load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/alorra_datuak.txt' into table alorra 
lines terminated by '\r\n'(kode_alorra,kode_zentroa,izena,aurrekontua,zuzendari_mota);

load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/langilea.txt' into table langilea 
lines terminated by '\r\n';


load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/seme_alabak.txt' into table seme_alaba 
lines terminated by '\r\n';

load data  infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fitxategiak_datuak_sartzeko/trebe_izan.txt' into table trebetasun_langile_izan lines terminated by '\r\n';



update zentroa 
set kode_langilea=1
where kode_zentroa='DIGE';
update zentroa 
set kode_langilea=6
where kode_zentroa='FAZS';
update zentroa 
set kode_langilea=5
where kode_zentroa='OFZS';

update alorra 
set kode_langile_zuzendu=5
where kode_alorra='ADMZS';
update alorra 
set kode_langile_zuzendu=1
where kode_alorra='DIRGE';
update alorra 
set kode_langile_zuzendu=2,kode_alorra_menpe='DIRGE'
where kode_alorra='IN&DI';
update alorra 
set kode_langile_zuzendu=6
where kode_alorra='JEFZS';
update alorra 
set kode_langile_zuzendu=9,kode_alorra_menpe='JEFZS'
where kode_alorra='PROZS';
update alorra 
set kode_langile_zuzendu=3,kode_alorra_menpe='ADMZS'
where kode_alorra='VENZS';

update langilea 
set mota="A"
where kode_langilea <6;
update langilea 
set mota="E"
where kode_langilea >5 and kode_langilea<11;

insert into autonomo values (200,1),(200,2),(220,3),(200,4),(230,5);
insert into enpresakoa values ('1987-01-01',6),('1990-12-02',7),('2000-03-06',8),('1999-11-23',9),('2001-04-12',10);

