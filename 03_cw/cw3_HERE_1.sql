-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2018_KAR_BUILDINGS.shp public.t2018_kar_buildings | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_BUILDINGS.shp public.t2019_kar_buildings | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
select * from t2018_kar_buildings

-- Zadanie 1
-- Znajdź budynki, które zostały wybudowane lub wyremontowane na przestrzeni roku (zmiana pomiędzy 2018 a 2019)
-- CREATE TABLE new_buildings AS
SELECT buildings2019.*
FROM t2019_kar_buildings buildings2019
LEFT JOIN t2018_kar_buildings buildings2018
    ON buildings2019.polygon_id = buildings2018.polygon_id
WHERE buildings2018.polygon_id IS NULL;

SELECT * FROM new_buildings -- 3 BUDYNKI



