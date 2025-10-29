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