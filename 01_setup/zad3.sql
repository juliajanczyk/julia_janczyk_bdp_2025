CREATE TABLE IF NOT EXISTS księgowość.pracownicy (
	id_pracownika int PRIMARY KEY,
	imie char(50) NOT NULL,
	nazwisko char(50) NOT NULL,
	adres char(50),
	telefon	int
);
COMMENT ON TABLE księgowość.pracownicy IS 'Tabela przechowujaca dane na temat pracowników firmy';


CREATE TABLE IF NOT EXISTS księgowość.godziny (
	id_godziny int PRIMARY KEY,
	data date,
	liczba_godzin int NOT NULL,
	id_pracownika int,
	CONSTRAINT pracownicy_fkey
	FOREIGN KEY (id_pracownika)
	REFERENCES księgowość.pracownicy(id_pracownika)
);
COMMENT ON TABLE księgowość.godziny IS 'Tabela przechowuje informacje o liczbie przepracowanych godzin przez pracowników danego dnia';

CREATE TABLE IF NOT EXISTS  księgowość.pensja (
	id_pensji int PRIMARY KEY,
	stanowisko char(200),
	kwota  money NOT NULL
);
COMMENT ON TABLE księgowość.pensja IS 'Tabela zawiera dane o wynagrodzeniach dla danych stanowisk';

CREATE TABLE IF NOT EXISTS księgowość.premia (
	id_premii int PRIMARY KEY,
	rodzaj char(200),
	kwota  money 
);
COMMENT ON TABLE księgowość.premia IS 'Tabela zawiera dane o premiach przyznawanych pracownikom';

CREATE TABLE IF NOT EXISTS księgowość.wynagrodzenie (
	id_wynagrodzenia int PRIMARY KEY,
	data date,
	id_pracownika int,
	id_godziny int,
	id_pensji int,
	id_premii int,
	CONSTRAINT pracownicy_fkey
		FOREIGN KEY (id_pracownika)
			REFERENCES księgowość.pracownicy(id_pracownika),
	CONSTRAINT godziny_fkey
		FOREIGN KEY (id_godziny)
			REFERENCES księgowość.godziny(id_godziny),
	CONSTRAINT pensje_fkey
		FOREIGN KEY (id_pensji)
			REFERENCES księgowość.pensje(id_pensji),
	CONSTRAINT premie_fkey
		FOREIGN KEY (id_premii)
			REFERENCES księgowość.premie(id_premii)
);
COMMENT ON TABLE księgowość.wynagrodzenie IS 'Tabela przechowuje dane dotyczące wynagrodzeń pracowników, uwzględniających pensję i premię, przepracowane godziny oraz datę';

