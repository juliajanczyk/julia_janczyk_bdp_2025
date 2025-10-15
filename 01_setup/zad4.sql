INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'Krakowska 10', 123456789),
(2, 'Julia', 'Lewak', 'Dworna 45', 585418187),
(3, 'Klara', 'Bąk', 'Rzemieślnicza 83a', 798579456),
(4, 'Beata', 'Kopeć', 'Ogrodowa 54', 48759642),
(5, 'Kornel', 'Domański', 'Szkolna 67', 784315788),
(6, 'Magdalena', 'Owczarek', 'Cmentarna 147', 453721895),
(7, 'Aleksandra', 'Sadowska', 'Grunwaldzka 89A/3', 138754089),
(8, 'Wiesław', 'Świątek', 'Kasztanowa 91', 475185147),
(9, 'Zdzisław', 'Kania', 'Jarzębinowa 3', 397464818),
(10, 'Bartłomiej', 'Mróz', 'Gruszkowa 35B', 211544569);


INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2-10-2023', 8, 1),
(2, '13-10-2023',4, 2),
(3, '7-10-2023', 7, 3),
(4, '23-10-2023', 8, 4),
(5, '1-10-2023', 5, 5),
(6, '30-10-2023', 4, 6),
(7, '24-10-2023', 8, 7),
(8, '5-10-2023', 7, 8),
(9, '9-10-2023', 6, 9),
(10, '16-10-2023', 3, 10);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota)
VALUES
(1, 'Księgowy', 3565),
(2, 'Asystent Dyrektora', 5355),
(3, 'Kierownik Recepcji', 1222),
(4, 'Sekretarka', 4512),
(5, 'Sekretarz Redakcji', 1952),
(6, 'Specjalista ds. Baz danych', 3485),
(7, 'Kierownik biura', 3524),
(8, 'Asystent Handlowy', 4590),
(9, 'Główna Księowa', 4622),
(10, 'Dyrektor', 6526);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Uznaniowa', 1215),
(2, 'Urodzinowa', 710),
(3, 'Świąteczna', 564),
(4, 'Za frekwencję', 687),
(5, 'Uznaniowa', 752),
(6, 'Świąteczna', 155),
(7, 'Regulaminowa', 710),
(8, 'Regulaminowa', 268),
(9, 'Świąteczna', 1215),
(10, 'Urodzinowa', 854);
