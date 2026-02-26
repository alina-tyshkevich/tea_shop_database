# tea_shop_database

## Technologie

- Oracle SQL
- PL/SQL (triggery)
- Power BI
- Vertabelo (modelowanie ERD)
- SQL (DDL, DML)

## Opis projektu

Projekt przedstawia bazę danych dla sklepu herbaty.
Celem było odwzorowanie logiki biznesowej, w tym obsługa zamówień, adresów dostawy oraz historii zmian cen produktów.
Baza została utworzona w Oracle SQL i uzupełniona raportem analitycznym w Power BI.

## Struktura bazy danych

Encje:

- `herbata` : Produkty
- `historia_ceny` : Historia cen z okresem obowiązywania
- `zamowienie` : Zamówienia klientów
- `adres_dostawy` : Adres dostawy zamówień
- `miasto` : Miasto dostawy zamówień
- `klient` : Klienci
- `herbata_zamowienie` : Relacja zamówień i herbaty (encja asocjacyjna)
-  `typ` : Typ herbaty
-  `kraj_pochodzenia` : Kraj pochodzenia herbaty
-  `region` : Region pochodzenia herbaty

Diagram ERD znajduje sie w folderze  `/docs`.

## Kod

- Tabele oraz przykładowe dane
- Walidacja danych przy użyciu triggerów
- Przykładowe zapytania analityczne

Kod znajduje się w folderze `/sql`.

## Raport power BI

- Plik `.pbix`
- wersja raportu w PDF

  W raporcie znajduje się analiza przychodów, trendów, zamówień oraz najlepiej sprzedających się produktów.

  Raport znajduje się w folderze `/BI`.

  ## Uruchomienie projektu

  Pliki SQL należy wykonać w następującej kolejności:

  1. 01_schema.sql
  2. 03_sample_data.sql
  3. 02_triggers.sql
  4. 04_example_queries.sql
 
  ## Autor

  Alina Tyshkevich
  Projekt portfolio
