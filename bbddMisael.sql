DROP DATABASE IF EXISTS actividad_entregable2;

CREATE DATABASE actividad_entregable2;
USE actividad_entregable2;


-- 1
CREATE TABLE vectores 
	(
	cod_vec CHAR(4) NOT NULL PRIMARY KEY,
	nombre_vec VARCHAR(16) UNIQUE,
	alturaM_vec  FLOAT UNSIGNED NOT NULL,
	diametroM_vec FLOAT UNSIGNED NOT NULL,
	masaKG_vec MEDIUMINT(9) NOT NULL,
	etapas_vec TINYINT(3) UNSIGNED NOT NULL 
	);
	

CREATE TABLE misiones 
	(
    cod_mis CHAR(5) NOT NULL PRIMARY KEY,
    nombre_mis VARCHAR(16) NOT NULL UNIQUE,
    fechaLanz_mis DATE NOT NULL,
    exitosa_mis TINYINT(1) NOT NULL DEFAULT 1,
    observaciones_mis VARCHAR(128),
    cod_vec char(4) NOT NULL,
    CONSTRAINT mis_codvec_fk FOREIGN KEY (cod_vec) REFERENCES vectores(cod_vec) ON DELETE CASCADE 
);

CREATE TABLE tripulantes 
	(
    id_trip BIGINT(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    apellido_trip VARCHAR(16) NOT NULL,
    nombre_trip VARCHAR(32) NOT NULL,
    anyoNac_trip YEAR(4) NOT NULL	
);	
	

CREATE TABLE tripulantes_misiones 
	(
    cod_mis CHAR(5) NOT NULL,
    id_trip BIGINT(20) unsigned NOT NULL,
    FOREIGN KEY (cod_mis) REFERENCES misiones(cod_mis) ON DELETE CASCADE,
    FOREIGN KEY (id_trip) REFERENCES tripulantes(id_trip) ON DELETE CASCADE
);


-- 2

INSERT INTO vectores 
		(cod_vec,nombre_vec, alturaM_vec, diametroM_vec, masaKG_vec, etapas_vec ) 
VALUES 
	("STIB", "Saturn IB", 43.20,  6.61,  589770,  2),
	("STV",  "Saturn V",  110.60, 10.10, 2882000, 3);
	

INSERT INTO misiones
  (cod_mis, nombre_mis, fechaLanz_mis, exitosa_mis, observaciones_mis, cod_vec)
VALUES
  ("APL1",  "Apollo 1",  "1967-03-21", FALSE, "Incendio en un panel de control. Sin sobrevivientes.", "STIB"),
	("APL7",  "Apollo 7",  "1968-10-11", TRUE,  NULL, "STIB"),
	("APL8",  "Apollo 8",  "1968-12-21", TRUE,  NULL, "STV"),
	("APL9",  "Apollo 9",  "1969-03-03", TRUE,  NULL, "STV"),
	("APL10", "Apollo 10", "1969-05-18", TRUE,  NULL, "STV"),
	("APL11", "Apollo 11", "1969-07-16", TRUE,  NULL, "STV"),
	("APL12", "Apollo 12", "1969-11-14", TRUE,  NULL, "STV"),
	("APL13", "Apollo 13", "1970-04-11", FALSE, "Falla en un tanque de oxígeno. La tripulación sobrevivió.", "STV"),
	("APL14", "Apollo 14", "1971-01-31", TRUE,  NULL, "STV"),
	("APL15", "Apollo 15", "1971-07-26", TRUE,  NULL, "STV"),
	("APL16", "Apollo 16", "1972-04-16", TRUE,  NULL, "STV"),
	("APL17", "Apollo 17", "1972-12-07", TRUE,  NULL, "STV");


INSERT INTO tripulantes
          (apellido_trip, nombre_trip, anyoNac_trip)
VALUES
      ("Aldrin",      "Edwin 'Buz'",      1930),
	    ("Anders",      "William",          1933),
	    ("Armstrong",   "Neil",             1930),
	    ("Bean",        "Alan",             1932),
      ("Borman",      "Frank",            1928),
      ("Cernan",      "Eugene",           1934),
      ("Chaffee",     "Roger B.",         1935),
      ("Collins",     "Michael",          1930),
      ("Conrad",      "Charles (Pete)",   1930),
      ("Cunningham",  "Walter",           1932),
      ("Duke",        "Charles",          1935),
      ("Eisele",      "Donn F.",          1930),
      ("Evans",       "Ronald",           1933),
      ("Gordon",      "(Jr.) Richard F.", 1929),
      ("Grissom",     "Gus",              1926),
      ("Haise",       "Fred",             1933),
      ("Irwin",       "James",            1930),
      ("Lovell",      "James",            1928),
      ("Mattingly",   "Ken",              1936),
      ("McDivitt",    "James",            1929),
      ("Mitchell",    "Edgar",            1930),
      ("Roosa",       "Stuart",           1933),
      ("Schirra",     "Wally",            1923),
      ("Schmitt",     "Harrison",         1935),
      ("Schweickart", "Rusty",            1935),
      ("Scott",       "David",            1932),
      ("Shepard",     "Alan",             1923),
      ("Stafford",    "Thomas P.",        1930),
      ("Swigert",     "Jack",             1931),
      ("White",       "Ed",               1930),
      ("Worden",      "Alfred",           1932),
      ("Young",       "John",             1930);


INSERT INTO tripulantes_misiones
  (cod_mis, id_trip)
VALUES
  ("APL1",  15),
	("APL1",  30),
	("APL1",  7),
	("APL7",  23),
	("APL7",  12),
	("APL7",  10),
	("APL8",  5),
	("APL8",  18),
	("APL8",  2),
	("APL9",  20),
	("APL9",  26),
	("APL9",  25),
	("APL10", 28),
	("APL10", 32),
	("APL10", 6),
	("APL11", 3),
	("APL11", 8),
	("APL11", 1),
	("APL12", 9),
	("APL12", 14),
	("APL12", 4),
	("APL13", 18),
	("APL13", 29),
	("APL13", 16),
	("APL14", 27),
	("APL14", 22),
	("APL14", 21),
	("APL15", 26),
	("APL15", 31),
	("APL15", 17),
	("APL16", 32),
	("APL16", 19),
	("APL16", 11),
	("APL17", 6),
	("APL17", 13),
	("APL17", 24);


-- 3
ALTER TABLE vectores MODIFY COLUMN masaKg_vec INT(10) UNSIGNED NOT NULL DEFAULT 0;


-- 4 A

SELECT DISTINCT
	CONCAT(nombre_trip," ", apellido_trip) AS Tripulante,
	nombre_mis AS Mision,
	fechaLanz_mis AS "Fecha lanzamiento ",
	nombre_vec AS "Vector",
	CASE 
		WHEN exitosa_mis = TRUE THEN "SI"
		ELSE "NO"
	END AS exitosa_mis
	
	FROM 
		vectores INNER JOIN misiones USING(cod_vec)
					INNER JOIN tripulantes_misiones USING(cod_mis)
					INNER JOIN tripulantes USING(id_trip)
	ORDER BY fechaLanz_mis ASC;

-- 4 B
SELECT 
	apellido_trip AS Apellido, 
	nombre_trip AS Nombre, 
	anyoNac_trip AS "Año de Nacimiento"
	FROM tripulantes INNER JOIN tripulantes_misiones USING(id_trip)
						  INNER JOIN misiones USING(cod_mis)
	WHERE exitosa_mis = FALSE;
	

UPDATE tripulantes 
	SET nombre_trip = "Edwin `Buzz`" WHERE id_trip = 1;
	
SELECT * FROM tripulantes 
WHERE id_trip = 1;

-- 5
DELETE FROM vectores WHERE nombre_vec = "Saturn V";

-- 6 

SELECT DISTINCT
	CONCAT(nombre_trip," ", apellido_trip) AS Tripulante,
	nombre_mis AS Mision,
	fechaLanz_mis AS "Fecha lanzamiento ",
	nombre_vec AS "Vector",
	CASE 
		WHEN exitosa_mis = TRUE THEN "SI"
		ELSE "NO"
	END AS exitosa_mis
	
	FROM 
		vectores INNER JOIN misiones USING(cod_vec)
					INNER JOIN tripulantes_misiones USING(cod_mis)
					INNER JOIN tripulantes USING(id_trip)
	ORDER BY fechaLanz_mis ASC;

