-- ZADANIE 6
-- ST_Length dł linii, ST_Area pole, ST_Distance najmniejsza odl miedzy dwoma , 
-- ST_Buffer towrzy bufor, ST_Intersection zwraca czesc wspolna dwoch geometrii, 
-- ST_GeomFromText tworzy obiekt geometryczny z tekstowego, 
-- ST_Contains zwraca true jak 1 geometria zawiera sie w calosci w drugiej, 
-- ST_X wspolrzedna x, ST_Y wspolrzedna y


-- a) Całkowita długość dróg w analizowanym mieście

-- SELECT id, name, ST_AsText(geometry) FROM roads; 
-- jak wyglądają dane
SELECT 
SUM(ST_Length(geometry)) AS road_length
FROM roads;

-- b)  Geometria (WKT), pole powierzchni oraz obwód poligonu reprezentującego budynek o nazwie BuildingA

-- SELECT id, name, ST_AsText(geometry) FROM buildings; 
SELECT name, 
ST_AsText(geometry) AS wkt,
ST_Area(geometry) AS area,
ST_Perimeter(geometry) AS perimeter
FROM buildings
WHERE name='BuildingA'

-- c) Nazwy i pola powierzchni wszystkich poligonów w warstwie budynki. Wyniki posortuj alfabetycznie
SELECT name, ST_Area(geometry) as area
FROM buildings
ORDER BY name;

-- d) Wypisz nazwy i obwody 2 budynków o największej powierzchni. 
SELECT name,
ST_Perimeter(geometry) as perimeter
FROM buildings
ORDER BY ST_Area(geometry) DESC
LIMIT 2;

-- e) Wyznacz najkrótszą odległość między budynkiem BuildingC a punktem K. 
SELECT 
ROUND(cast(ST_Distance(b.geometry, p.geometry) as numeric), 2) as distance
FROM buildings b
JOIN poi p ON p.name = 'K'
WHERE b.name = 'BuildingC';


-- f) Wypisz pole powierzchni tej części budynku BuildingC, która znajduje się 
-- w odległości większej niż 0.5 od budynku BuildingB
SELECT 
ST_Area(ST_Difference(bC.geometry, ST_Buffer(bB.geometry, 0.5))) as area
FROM buildings bB, buildings bC
WHERE bB.name='BuildingB' and bC.name='BuildingC'

-- 	pole czesci wpsolnej budynku C i B
-- SELECT
-- ST_Area(ST_Intersection(ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0), bC.geometry))
-- FROM buildings bC
-- WHERE bC.name='BuildingC';

-- g) Wybierz te budynki, których centroid (ST_Centroid) znajduje się powyżej drogi o nazwie RoadX
SELECT name FROM buildings b
WHERE ST_Y(ST_Centroid(b.geometry)) > 
( SELECT ST_Y(ST_StartPoint(geometry))
 FROM roads
 WHERE name='RoadX'
)

-- h) Oblicz pole powierzchni tych części budynku BuildingC i poligonu o współrzędnych 
-- (4 7, 6 7, 6 8, 4 8, 4 7), które nie są wspólne dla tych dwóch obiektów.
-- ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0)

SELECT 
ST_Area( ST_Union( -- laczanie suma
ST_Difference(bC.geometry, ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0)),
ST_Difference(ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0), bC.geometry)
)) as area
FROM buildings bC
WHERE bC.name = 'BuildingC';
	

