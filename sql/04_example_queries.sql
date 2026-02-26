--1 Całkowita kwota sprzedaży każdej herbaty
select h.nazwa NAZWA_HERBATY, sum(hc.CENA_1_GR * hz.ilosc_gr) KWOTA_SPRZEDARŻY from herbata h
join HERBATA_ZAMOWIENIE hz on hz.herbata_id = h.ID
join zamowienie z on z.id = hz.zamowienie_id
join HISTORIA_CENY hc on h.id = hc.HERBATA_ID and z.data >= hc.data_od and z.data < nvl(hc.data_do, DATE '9999-12-31')
group by h.nazwa;

--2 Ile mamy herbaty dla każdego typu
select t.nazwa TYP, count(h.nazwa) ILOŚĆ_HERBATY from herbata h
join typ t on t.id = h.typ_id
group by t.nazwa;

--3 Najdroższa herbata
select h.nazwa TOP_HERBATA, hc.cena_1_gr CENA from herbata h
join HISTORIA_CENY hc on h.id = hc.HERBATA_ID and hc.DATA_DO is null
where (
    select count(*) from HISTORIA_CENY hc1
    where hc1.CENA_1_GR > hc.CENA_1_GR
          ) < 1;

--4 Najpopularniejszy kraj i region pochodzenia herbaty
Select kp.nazwa || ', ' || r.nazwa KRAJ_POCHODZENIA_I_REGION, count(h.id) ILOŚĆ_HERBATY from herbata h
join KRAJ_POCHODZENIA kp on kp.id = h.KRAJ_POCHODZENIA_ID
join REGION r on r.id = h.REGION_ID
group by kp.nazwa, r.nazwa
having count(h.id) = (
    select max(count(h1.id)) from herbata h1
    join KRAJ_POCHODZENIA kp1 on kp1.id = h1.KRAJ_POCHODZENIA_ID
    join REGION r1 on r1.id = h1.REGION_ID
    group by kp1.id, r1.id );

--5
select k.imie_nazwisko KLIENT, m.nazwa MIASTO, sum(z.KWOTA_CALKOWITA) CENA_ZAMÓWIENA from klient k
join ZAMOWIENIE z on k.id = z.KLIENT_ID
join ADRES_DOSTAWY ad on ad.id = z.ADRES_DOSTAWY_ID
join MIASTO m on m.id = ad.MIASTO_ID
having sum(z.KWOTA_CALKOWITA) > 100
group by k.imie_nazwisko, m.nazwa
order by sum(z.KWOTA_CALKOWITA) desc;

--6 Ile razy zamówiliśmy herbatę z każdego kraju i na jaką kwotę
select kp.nazwa KRAJ_POCHODZENIA, count(z.id) ILOŚĆ_ZAMÓWIEŃ, sum(hc.cena_1_gr * hz.ilosc_gr) KWOTA_CAŁKOWITA from KRAJ_POCHODZENIA kp
join HERBATA h on kp.id = h.KRAJ_POCHODZENIA_ID
join HERBATA_ZAMOWIENIE hz on h.id = hz.HERBATA_ID
join ZAMOWIENIE z on z.id = hz.ZAMOWIENIE_ID
join HISTORIA_CENY hc on h.id = hc.HERBATA_ID and z.data >= data_od and z.data < nvl(hc.data_do, DATE '9999-12-31')
group by kp.nazwa;

--7 Jaką herbatę piją w każdym mieście
select distinct m.nazwa MISATO, t.nazwa TYP from typ t
join herbata h on t.id = h.TYP_ID
join HERBATA_ZAMOWIENIE hz on h.id = hz.HERBATA_ID
join ZAMOWIENIE z on z.id = hz.ZAMOWIENIE_ID
join ADRES_DOSTAWY ad on ad.id = z.ADRES_DOSTAWY_ID
join MIASTO m on m.id = ad.MIASTO_ID;

--8 Czy istnieje taka herbata, która nie została jeszcze zamówiona?
select h.nazwa from herbata h
where not exists(
    select 1 from HERBATA_ZAMOWIENIE hz
    where h.id = hz.ZAMOWIENIE_ID);

--9 Za ilę dni zmieniliśmy cenę
select trunc(hc.data_do - hc.data_od) ILOŚĆ_DNI, h.nazwa HERBATA from historia_ceny hc
join herbata h on h.id = hc.HERBATA_ID
where hc.data_do is not null;

--10 Ilość lat pomiędzy pierwszym a ostatnim zamówieniem
select round(months_between(max(data), min(data))/ 12, 2) LATA from zamowienie;

--11 Zamówienie w których jest herbata z regionu 1 ale nie regionu 2
select k.imie_nazwisko, z.data from zamowienie z
join klient k on k.id = z.KLIENT_ID
join HERBATA_ZAMOWIENIE zh on z.id = zh.zamowienie_ID
where exists (
    select 1 from herbata h
    where h.id = zh.herbata_id and region_id = 1)

Minus

select k.imie_nazwisko, z.data from zamowienie z
join klient k on k.id = z.KLIENT_ID
join HERBATA_ZAMOWIENIE zh on z.id = zh.zamowienie_ID
where exists (
    select 1 from herbata h1
    where h1.id = zh.HERBATA_ID and region_id = 2
);
