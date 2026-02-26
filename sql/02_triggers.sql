--Trigger 1
--Nie pozwoli dodać rekord, jeżeli nowa cena herbaty jest taka sama jak poprzednio

create or replace trigger no_same_price
before insert on HISTORIA_CENY
for each row
declare last_price HISTORIA_CENY.cena_1_gr%TYPE;
begin
select cena_1_gr into last_price
from(
    select CENA_1_GR from HISTORIA_CENY
    where HERBATA_ID = :new.herbata_id
    order by data_od desc
    )
    where rownum = 1;
if last_price = :new.cena_1_gr then
    raise_application_error(-20001, 'Nowa cena nie może być taka sama jak stara');
end if;
end;

--Sprawdzenie
INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO)
VALUES ((select max(id)+1 from HISTORIA_CENY), 5, 1.03, sysdate, null);


--Trigger 2
--Nie pozwoli dodać rekord, jeżeli cena jest ujemna lub równa 0


create or replace trigger right_price
before insert or update on HISTORIA_CENY
for each row
begin
if :new.cena_1_gr <= 0 then
raise_application_error(-20002, 'Cena nie może być ujemną lub równa 0');
end if;
end;

--Sprawdzenie

INSERT INTO historia_ceny (ID, HERBATA_ID, CENA_1_GR, DATA_OD, DATA_DO)
VALUES ((select max(id)+1 from HISTORIA_CENY), 1, -1, sysdate, null);

update HISTORIA_CENY
set cena_1_gr = 0
where herbata_id = 1;

--Trigger 3
--Nie pozwoli dodać rekord, jezeli email nie zawiera "@"

create or replace trigger right_email
before insert or update on KLIENT
for each row
begin
if :new.email is null or :new.email not like '%@%' then
    raise_application_error(-20003, 'Email powinien zawierać "@"');
end if;
end;

--Sprawdzenie

insert into klient (ID, IMIE_NAZWISKO, NUMER_TELEFONU, EMAIL)
VALUES ((select max(id)+1 from klient), 'nowe', '23456789', 'nowe');

update KLIENT
set email = 'nowe'
where id = 1;

--Trigger 4
-- Nie pozwoli dodać rekord, jeżeli herbata o takiej nazwie już istnieje


create or replace trigger individual_only
before insert on HERBATA
for each row
declare count_nazwa NUMBER;
begin
select count(*) into count_nazwa from HERBATA
where lower(nazwa) = lower(:new.nazwa);
if count_nazwa > 0 then
    raise_application_error(-20004, 'Herbata o takiej nazwie już istnieje');
end if;
end;

--Sprawdzenie
insert into HERBATA (ID, NAZWA, OPIS, INTENSYWNOSC_NAPARU, TYP_ID, KRAJ_POCHODZENIA_ID, REGION_ID)
VALUES ((select max(id)+1 from HERBATA), 'Sheng Shan', 'opis', 'mocny', 1, 1, 1);

--Trigger 5
--Nie pozwoli dodać rekord, jeżeli intensywność naparu nie jest "mocna", "zrównoważona" lub "delikatna"


create or replace trigger intens_only
before insert or update of intensywnosc_naparu on HERBATA
for each row
begin
if :new.intensywnosc_naparu is null or lower(trim(:new.INTENSYWNOSC_NAPARU)) not in
('mocny', 'zrównoważony', 'delikatny') then
    raise_application_error(-20005, 'Dozwolone tylko "mocny", "zrównoważony", "delikatny"');
end if;
end;

--Sprawdzenie
insert into HERBATA (ID, NAZWA, OPIS, INTENSYWNOSC_NAPARU, TYP_ID, KRAJ_POCHODZENIA_ID, REGION_ID)
VALUES ((select max(id)+1 from HERBATA), 'nowa', 'nowy', 'nowy', 1, 1, 1);

update HERBATA
set INTENSYWNOSC_NAPARU = 'nowa'
where id = 1;