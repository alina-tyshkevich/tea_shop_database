
-- tables
-- Table: adres_dostawy
CREATE TABLE adres_dostawy (
    ID integer  NOT NULL,
    ulica varchar2(50)  NOT NULL,
    numer_budynku varchar2(20)  NOT NULL,
    pietro integer  NOT NULL,
    mieszkanie varchar2(10)  NOT NULL,
    miasto_ID integer  NOT NULL,
    CONSTRAINT adres_dostawy_pk PRIMARY KEY (ID)
) ;

-- Table: herbata
CREATE TABLE herbata (
    ID integer  NOT NULL,
    nazwa varchar2(50)  NOT NULL,
    opis varchar2(1000)  NOT NULL,
    intensywnosc_naparu varchar2(20)  NOT NULL,
    typ_ID integer  NOT NULL,
    kraj_pochodzenia_ID integer  NOT NULL,
    region_ID integer  NOT NULL,
    CONSTRAINT herbata_pk PRIMARY KEY (ID)
) ;

-- Table: herbata_zamowienie
CREATE TABLE herbata_zamowienie (
    herbata_ID integer  NOT NULL,
    zamowienie_ID integer  NOT NULL,
    ilosc_gr integer  NOT NULL,
    CONSTRAINT herbata_zamowienie_pk PRIMARY KEY (herbata_ID,zamowienie_ID)
) ;

-- Table: historia_ceny
CREATE TABLE historia_ceny (
    ID integer  NOT NULL,
    herbata_ID integer  NOT NULL,
    cena_1_gr number(10,2)  NOT NULL,
    data_od date  NOT NULL,
    data_do date  NULL,
    CONSTRAINT historia_ceny_pk PRIMARY KEY (ID)
) ;

-- Table: klient
CREATE TABLE klient (
    ID integer  NOT NULL,
    Imie_nazwisko varchar2(50)  NOT NULL,
    numer_telefonu varchar2(9)  NOT NULL,
    email varchar2(50)  NOT NULL,
    CONSTRAINT klient_pk PRIMARY KEY (ID)
) ;

-- Table: kraj_pochodzenia
CREATE TABLE kraj_pochodzenia (
    ID integer  NOT NULL,
    nazwa varchar2(50)  NOT NULL,
    CONSTRAINT kraj_pochodzenia_pk PRIMARY KEY (ID)
) ;

-- Table: miasto
CREATE TABLE miasto (
    ID integer  NOT NULL,
    nazwa varchar2(50)  NOT NULL,
    CONSTRAINT miasto_pk PRIMARY KEY (ID)
) ;

-- Table: region
CREATE TABLE region (
    ID integer  NOT NULL,
    nazwa varchar2(50)  NOT NULL,
    CONSTRAINT region_pk PRIMARY KEY (ID)
) ;

-- Table: typ
CREATE TABLE typ (
    ID integer  NOT NULL,
    nazwa varchar2(40)  NOT NULL,
    opis varchar2(1000)  NOT NULL,
    CONSTRAINT typ_pk PRIMARY KEY (ID)
) ;

-- Table: zamowienie
CREATE TABLE zamowienie (
    ID integer  NOT NULL,
    data date  NOT NULL,
    kwota_calkowita number(10,2)  NOT NULL,
    adres_dostawy_ID integer  NOT NULL,
    klient_ID integer  NOT NULL,
    CONSTRAINT zamowienie_pk PRIMARY KEY (ID)
) ;

-- foreign keys
-- Reference: adres_dostawy_miasto (table: adres_dostawy)
ALTER TABLE adres_dostawy ADD CONSTRAINT adres_dostawy_miasto
    FOREIGN KEY (miasto_ID)
    REFERENCES miasto (ID);

-- Reference: herbata_kraj_pochodzenia (table: herbata)
ALTER TABLE herbata ADD CONSTRAINT herbata_kraj_pochodzenia
    FOREIGN KEY (kraj_pochodzenia_ID)
    REFERENCES kraj_pochodzenia (ID);

-- Reference: herbata_region (table: herbata)
ALTER TABLE herbata ADD CONSTRAINT herbata_region
    FOREIGN KEY (region_ID)
    REFERENCES region (ID);

-- Reference: herbata_typ (table: herbata)
ALTER TABLE herbata ADD CONSTRAINT herbata_typ
    FOREIGN KEY (typ_ID)
    REFERENCES typ (ID);

-- Reference: herbata_zamowienie_herbata (table: herbata_zamowienie)
ALTER TABLE herbata_zamowienie ADD CONSTRAINT herbata_zamowienie_herbata
    FOREIGN KEY (herbata_ID)
    REFERENCES herbata (ID);

-- Reference: herbata_zamowienie_zamowienie (table: herbata_zamowienie)
ALTER TABLE herbata_zamowienie ADD CONSTRAINT herbata_zamowienie_zamowienie
    FOREIGN KEY (zamowienie_ID)
    REFERENCES zamowienie (ID);

-- Reference: historia_ceny_herbata (table: historia_ceny)
ALTER TABLE historia_ceny ADD CONSTRAINT historia_ceny_herbata
    FOREIGN KEY (herbata_ID)
    REFERENCES herbata (ID);

-- Reference: zamowienie_adres_dostawy (table: zamowienie)
ALTER TABLE zamowienie ADD CONSTRAINT zamowienie_adres_dostawy
    FOREIGN KEY (adres_dostawy_ID)
    REFERENCES adres_dostawy (ID);

-- Reference: zamowienie_klient (table: zamowienie)
ALTER TABLE zamowienie ADD CONSTRAINT zamowienie_klient
    FOREIGN KEY (klient_ID)
    REFERENCES klient (ID);

