-- Zadanie 2

-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2018_KAR_POI_TABLE.shp public.T2018_KAR_POI_TABLE | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_POI_TABLE.shp public.T2019_KAR_POI_TABLE | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
SELECT * FROM T2019_KAR_POI_TABLE

-- Znajdź ile nowych POI pojawiło się w promieniu 500 m od wyremontowanych lub
-- wybudowanych budynków, które znalezione zostały w zadaniu 1. Policz je wg kategorii
CREATE TABLE POI_new AS
SELECT poi2019.*
FROM T2019_KAR_POI_TABLE poi2019
LEFT JOIN T2018_KAR_POI_TABLE poi2018
ON ST_Equals(poi2019.geom, poi2018.geom) -- spr czy to te same pkt
WHERE poi2018.geom IS NULL; -- tylko nowe POI

SELECT COUNT(*) FROM POI_new; -- 1507 nowych pkt

SELECT COUNT(DISTINCT p.poi_id) AS nowe_poi_blisko_budynkow
FROM POI_new p
JOIN new_buildings b
ON ST_DWithin(p.geom, b.geom, 500); -- 1452 nowych, w poblizu nowych budynkow

-- SELECT 
--     p2018.poi_id,
--     ST_Equals(p2018.geom, p2019.geom) AS identyczne,
--     ST_AsText(p2018.geom) AS geom_2018,
--     ST_AsText(p2019.geom) AS geom_2019
-- FROM T2018_KAR_POI_TABLE p2018
-- JOIN T2019_KAR_POI_TABLE p2019
--     ON p2018.poi_id = p2019.poi_id;