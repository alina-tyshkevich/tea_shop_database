INSERT INTO herbata_zamowienie (HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (1, 1, 100);
INSERT INTO herbata_zamowienie(HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (1, 2, 20);
INSERT INTO herbata_zamowienie (HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (2, 2, 20);
INSERT INTO herbata_zamowienie (HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (2, 3, 100);
INSERT INTO herbata_zamowienie(HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (3, 4, 50);
INSERT INTO herbata_zamowienie (HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (4, 5, 50);
INSERT INTO herbata_zamowienie (HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (4, 6, 20);
INSERT INTO herbata_zamowienie(HERBATA_ID, ZAMOWIENIE_ID, ILOSC_GR) VALUES (5, 6, 20);

INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (1, 1, 0.90, DATE '2023-12-18', DATE '2025-01-01');
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (2, 1, 0.97, DATE '2025-01-02', null);
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (3, 2, 2.76, DATE '2023-12-18', null);
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (4, 3, 1.30, DATE '2023-12-18', null);
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (5, 4, 0.95, DATE '2023-12-18', null);
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO) VALUES (6, 5, 1.03, DATE '2023-12-18', null);

INSERT INTO klient (ID, IMIE_NAZWISKO, NUMER_TELEFONU, EMAIL) VALUES (1, 'Anna Chełkowska', '111111111', 'anna@gmail.com');
INSERT INTO klient (ID, IMIE_NAZWISKO, NUMER_TELEFONU, EMAIL) VALUES (2, 'Urszula Ambroziak', '222222222', 'urszula@gmail.com');
INSERT INTO klient (ID, IMIE_NAZWISKO, NUMER_TELEFONU, EMAIL) VALUES (3, 'Leon Blasiak', '333333333', 'leon@gmail.com');
INSERT INTO klient (ID, IMIE_NAZWISKO, NUMER_TELEFONU, EMAIL) VALUES (4, 'Michał Taranek', '444444444', 'michał@gmail.com');

INSERT INTO kraj_pochodzenia (ID, NAZWA) VALUES (1, 'Chiny');
INSERT INTO kraj_pochodzenia (ID, NAZWA) VALUES (2, 'Tajwan');
INSERT INTO kraj_pochodzenia (ID, NAZWA) VALUES (3, 'Gruzja');


INSERT INTO miasto (ID, NAZWA) VALUES (1, 'Warszawa');
INSERT INTO miasto (ID, NAZWA) VALUES (2, 'Gnańsk');
INSERT INTO miasto (ID, NAZWA) VALUES (3, 'Łódź');
INSERT INTO miasto (ID, NAZWA) VALUES (4, 'Kraków');

INSERT INTO region (ID, NAZWA) VALUES (1, 'Lincang');
INSERT INTO region (ID, NAZWA) VALUES (2, 'Lugu');
INSERT INTO region (ID, NAZWA) VALUES (3, 'Guria');
INSERT INTO region (ID, NAZWA) VALUES (4, 'Dehong');


INSERT INTO typ (ID, NAZWA, OPIS) VALUES (1, 'Pu-Erh', 'Herbata fermentowana o „dojrzałym” charakterze: ziemista, drzewna, czasem orzechowa. Działa pobudzająco, ale łagodnie i długofalowo. Im starsza, tym ciekawsza.');
INSERT INTO typ (ID, NAZWA, OPIS) VALUES (2, 'Oolong', 'Herbata półfermentowana, pomiędzy zieloną a czerwoną. Smak może przechodzić od kremowo-kwiatowego do pieczono-owocowego. Bardzo uniwersalna.');
INSERT INTO typ(ID, NAZWA, OPIS) VALUES (3, 'Zielona herbata', 'Niefermentowana. Świeża, trawiasta, czasem morska. Lekka i orzeźwiająca, bywa cierpka przy zbyt mocnym parzeniu.');
INSERT INTO typ (ID, NAZWA, OPIS) VALUES (4, 'Czerwona herbata', 'W pełni fermentowana. Intensywna, ciepła, z nutami miodu, suszonych owoców i karmelu. Wyraźnie pobudzająca.');
INSERT INTO typ(ID, NAZWA, OPIS) VALUES (5, 'Biała herbata', 'Minimalnie przetworzona. Delikatna, subtelnie słodka, kwiatowa. Smak bardzo lekki, nienarzucający się.');


INSERT INTO zamowienie (ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (1, DATE '2024-01-20', 90.00, 1, 1);
INSERT INTO zamowienie (ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (2, DATE '2025-01-20', 74.60, 1, 1);
INSERT INTO zamowienie(ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (3, DATE '2025-12-12', 276.00, 2, 2);
INSERT INTO zamowienie(ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (4, DATE '2024-06-11', 65.00, 3, 3);
INSERT INTO zamowienie (ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (5, DATE '2024-08-27', 47.50, 4, 4);
INSERT INTO zamowienie (ID, DATA, KWOTA_CALKOWITA, ADRES_DOSTAWY_ID, KLIENT_ID) VALUES (6, DATE '2025-02-11', 39.60, 4, 4);


