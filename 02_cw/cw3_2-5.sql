-- Zadanie 2
-- Wyznacz pole powierzchni bufora o wielkości 5 jednostek, który został utworzony wokół najkrótszej linii łączącej obiekt 3 i 4.

SELECT 
    ST_Area( -- pole powierzchni
        ST_Buffer(
            ST_ShortestLine(A.geometry, B.geometry), -- najkrotsza droga miedzy a i b
            5 -- bufor o promieniu 5
        )
    ) AS pole
FROM obiekty A, obiekty B
WHERE A.name = 'obiekt3' AND B.name = 'obiekt4'; -- 180

-- Zadanie 3
-- Zamień obiekt4 na poligon. Jaki warunek musi być spełniony, aby można było wykonać to zadanie? 
-- Zapewnij te warunki.

-- warunki to zamkniety obrys figury - dodajemy punkt startowy jako koncowy aby ją domknąć 

UPDATE obiekty
SET geometry = ST_LineMerge(geometry)
WHERE name = 'obiekt4'; -- First argument must be a LINESTRING 

UPDATE obiekty
SET geometry = ST_AddPoint(geometry, ST_StartPoint(geometry)) -- czyli pkt (20.5 19.5, 22 19)
WHERE name = 'obiekt4'

--SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt4';
-- dodano linie do zamkniecia

UPDATE obiekty
SET geometry = ST_MakePolygon(geometry)
WHERE name = 'obiekt4';
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt4';

-- Zadanie 4 
-- W tabeli obiekty, jako obiekt7 zapisz obiekt złożony z obiektu 3 i obiektu 4.
INSERT INTO obiekty (name, geometry)
SELECT 
    'obiekt7',
    ST_Union(A.geometry, B.geometry)
FROM obiekty A, obiekty B
WHERE A.name = 'obiekt3' AND B.name = 'obiekt4';
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt7';

-- Zadanie 5 
-- Wyznacz pole powierzchni wszystkich buforów o wielkości 5 jednostek, które zostały utworzone
-- wokół obiektów nie zawierających łuków.
SELECT 
    SUM(ST_Area(ST_Buffer(geometry, 5))) AS pole
FROM obiekty
WHERE GeometryType(geometry) NOT IN ('CIRCULARSTRING', 'COMPOUNDCURVE', 'CURVEPOLYGON'); -- 954

