-- Zadanaie 7
-- Policz jak wiele sklepów sportowych (‘Sporting Goods Store’- tabela POIs) znajduje sięw odległości 300 m od parków (LAND_USE_A).
-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2019_KAR_LAND_USE_A.shp public.T2019_KAR_LAND_USE_A | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres

SELECT 
    COUNT(DISTINCT p.gid) AS liczba_sklepow_sportowych
FROM t2019_kar_poi_table p
JOIN t2019_kar_land_use_a l
    ON ST_DWithin(p.geom, l.geom, 300)
WHERE p.type = 'Sporting Goods Store';