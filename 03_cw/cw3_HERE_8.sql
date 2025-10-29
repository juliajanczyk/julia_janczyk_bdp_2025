-- Zadanaie 8
-- Znajdź punkty przecięcia torów kolejowych (RAILWAYS) z ciekami (WATER_LINES). 
-- Zapisz znalezioną geometrię do osobnej tabeli o nazwie ‘T2019KARBRIDGES’.

-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_RAILWAYS.shp public.T2019_KAR_RAILWAYS | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres
-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_WATER_LINES.shp public.T2019_KAR_WATER_LINES | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres

CREATE TABLE T2019KARBRIDGES AS
SELECT 
    ST_Intersection(r.geom, w.geom) AS geom
FROM T2019_KAR_RAILWAYS r
JOIN T2019_KAR_WATER_LINES w
    ON ST_Intersects(r.geom, w.geom);


SELECT COUNT(*) AS liczba_mostow FROM T2019KARBRIDGES;