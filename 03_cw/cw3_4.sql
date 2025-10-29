-- Zadanie 4 
-- W tabeli obiekty, jako obiekt7 zapisz obiekt złożony z obiektu 3 i obiektu 4.
INSERT INTO obiekty (name, geometry)
SELECT 
    'obiekt7',
    ST_Union(A.geometry, B.geometry)
FROM obiekty A, obiekty B
WHERE A.name = 'obiekt3' AND B.name = 'obiekt4';
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt7';
