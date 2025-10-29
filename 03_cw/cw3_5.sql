-- Zadanie 5 
-- Wyznacz pole powierzchni wszystkich buforów o wielkości 5 jednostek, które zostały utworzone
-- wokół obiektów nie zawierających łuków.
SELECT 
    SUM(ST_Area(ST_Buffer(geometry, 5))) AS pole
FROM obiekty
WHERE GeometryType(geometry) NOT IN ('CIRCULARSTRING', 'COMPOUNDCURVE', 'CURVEPOLYGON'); -- 954
