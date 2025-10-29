-- Zadanie 6
-- Znajdź wszystkie skrzyżowania, które znajdują się w odległości 200 m od linii zbudowanej z punktów w tabeli ‘input_points’. 
-- Wykorzystaj tabelę T2019_STREET_NODE. Dokonaj reprojekcji geometrii, aby była zgodna z resztą tabel.

-- & "C:\Program Files\PostgreSQL\16\bin\shp2pgsql.exe" -I -s 2180 T2018_STREET_NODE.shp public.T2018_STREET_NODE | & "C:\Program Files\PostgreSQL\16\bin\psql.exe" -d HEREdb -U postgres

CREATE TABLE input_line AS
SELECT 
    ST_MakeLine(geom_3068 ORDER BY id) AS geom
FROM input_points;

CREATE TABLE street_nodes_reproj AS
SELECT 
    *,
    ST_Transform(geom, 3068) AS geom_3068
FROM t2019_kar_street_node;

CREATE TABLE intersections_200m AS
SELECT n.*
FROM street_nodes_reproj n, input_line l
WHERE ST_DWithin(n.geom_3068, l.geom, 200);