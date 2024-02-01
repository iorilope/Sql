CREATE DEFINER=`root`@`localhost` TRIGGER `filma_has_aktorea_AFTER_DELETE` AFTER DELETE ON `filma_has_aktorea` FOR EACH ROW BEGIN update
aktorea set film_kopurua = film_kopurua - 1 where a_zb = old.aktorea_a_zb;
insert into film_aktore_historikoa (a_zb,p_zb,Data,Noiz,Zeinek) values (old.Aktorea_a_zb,old.Filma_p_zb,Data,current_date(),current_user());
END