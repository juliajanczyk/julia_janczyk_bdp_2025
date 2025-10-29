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
