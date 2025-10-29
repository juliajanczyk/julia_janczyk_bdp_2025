-- Zadanie 1
-- Utwórz tabelę obiekty. W tabeli umieść nazwy i geometrie obiektów przedstawionych poniżej. 
-- Układ odniesienia ustal jako niezdefiniowany.

-- sprawdzam kształt na https://geojson.io dając wyniki selecta z ST_AsGeoJSON()
CREATE TABLE IF NOT EXISTS obiekty (
	id SERIAL PRIMARY KEY,
	geometry GEOMETRY,
	name TEXT
)

-- -OO- polokregi
INSERT INTO obiekty (name, geometry) VALUES(
	'obiekt1', ST_GeomFromText(
		'COMPOUNDCURVE(
		(0 1, 1 1),
		CIRCULARSTRING(1 1, 2 0, 3 1),
		CIRCULARSTRING(3 1, 4 2, 5 1),
		(5 1, 6 1))',
		0
	)
);
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt1';
	
-- serce okrag w srodku
INSERT INTO obiekty (name, geometry) VALUES(
-- CURVEPOLYGON is like a polygon, with an outer ring and zero or more inner rings.
	'obiekt2', ST_GeomFromText(
		'CURVEPOLYGON( 
		COMPOUNDCURVE( 
		(10 6, 14 6),
		CIRCULARSTRING(14 6, 16 4, 14 2),
		CIRCULARSTRING(14 2, 12 0, 10 2),
		(10 2, 10 6)),
		CIRCULARSTRING(11 2, 13 2, 11 2))',
		0
	)
); -- a closed circle the start and end points are the same and the middle point is the opposite point on the circle diameter
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt2';

	
-- trojkat
INSERT INTO obiekty (name, geometry) VALUES(
	'obiekt3', ST_GeomFromText(
		'LINESTRING(7 15, 12 13, 10 17, 7 15)', 
		0
	)
);
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt3';

-- linia łamana
INSERT INTO obiekty (name, geometry) VALUES(
	'obiekt4', ST_GeomFromText(
		'MULTILINESTRING(
		(20.5 19.5, 22 19),
		(22 19, 26 21),
		(26 21, 25 22),
		(25 22, 27 24),
		(27 24, 25 25),
		(25 25, 20 20))'
	)
);

-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt4';
-- DELETE FROM obiekty WHERE name = 'obiekt4';

-- obiekt 3D
INSERT INTO obiekty (name, geometry) VALUES(
	'obiekt5', ST_GeomFromText(
-- A MultiPoint is a collection of Points; Z dla 3DZ 
		'MULTIPOINT Z((30 30 59), (38 32 234))'
	)
);

-- linia i punkt / .
INSERT INTO obiekty (name, geometry) VALUES(
	'obiekt6', ST_GeomFromText(
--  GeometryCollection is a heterogeneous (mixed) collection of geometries.
		'GEOMETRYCOLLECTION(
			LINESTRING (1 1, 3 2),
			POINT (4 2)
		)'
	)
);
-- SELECT ST_AsGeoJSON(ST_CurveToLine(geometry)) FROM obiekty WHERE name = 'obiekt6';



-- ST_LineToCurve - converts a LINESTRING/POLYGON to a CIRCULARSTRING, CURVED POLYGON;
-- ST_CurveToLine - converts a CIRCULARSTRING/CURVEDPOLYGON to a LINESTRING/POLYGON
-- ST_Line_Interpolate_Point — Returns a point interpolated along a line. Second argument is a float8
-- between 0 and 1 representing fraction of total length of linestring the point has to be located.
-- ST_GeometryType - return the geometry type of the ST_Geometry value.
-- ST_LineFromMultiPoint — Creates a LineString from a MultiPoint geometry.
-- ST_HasArc - Returns true if a geometry or geometry collection contains a circular string.
-- ST_ShortestLine — Returns the 2-dimensional shortest line between two geometries (for version 1.5.0).