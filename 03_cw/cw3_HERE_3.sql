-- Zadanie 3
-- Utwórz nową tabelę o nazwie ‘streets_reprojected’, która zawierać będzie dane z tabeli
-- T2019_KAR_STREETS przetransformowane do układu współrzędnych DHDN.Berlin/Cassini.  - EPSG:3068

--& "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_STREETS.shp public.T2019_KAR_STREETS | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
--& "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2018_KAR_STREETS.shp public.T2018_KAR_STREETS | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres

CREATE TABLE streets_reprojected AS
SELECT *, ST_Transform(geom, 3068) AS geom_3068
FROM T2019_KAR_STREETS;