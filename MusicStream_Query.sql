USE MusicStream;



-- 1. ¿Cuál es el artista con más albums?

SELECT
COUNT(*) AS numero_albumes,
artista
FROM albums
GROUP BY artista
HAVING COUNT(*) > 1;


-- 2. ¿Cuál es el artista con más canciones?

SELECT
COUNT(*) AS numero_canciones,
artista
FROM canciones
GROUP BY artista
ORDER BY artista DESC;



-- 3. ¿En qué año se lanzaron más álbumes?

SELECT
año_lanzamiento,
COUNT(nombre) AS album
FROM albums
GROUP BY año_lanzamiento
ORDER BY album DESC; 


-- 4. ¿Cual es el genero con más oyentes?

SELECT
albums.genero,
COUNT(lastFm.oyentes) AS numero_oyentes
FROM lastFm
LEFT JOIN albums
ON albums.artista = lastFm.artista
WHERE albums.genero IS NOT NULL
GROUP BY genero
ORDER BY numero_oyentes DESC;


-- 5. ¿Cual es el genero con más reproducciones?

SELECT
albums.genero,
COUNT(lastFm.reproducciones) AS numero_reproducciones
FROM lastFm
LEFT JOIN albums
ON albums.artista = lastFm.artista
WHERE albums.genero IS NOT NULL
GROUP BY genero
ORDER BY numero_reproducciones DESC;


-- 6. ¿Cuantas canciones hay por genero?

SELECT
COUNT(*) AS numero_canciones,
canciones.genero
FROM canciones
GROUP BY genero
ORDER BY numero_canciones DESC;


-- 7. ¿Cuál es el album mas reproducido de los años pares de mi selección?

SELECT
albums.nombre AS album,
albums.artista,
albums.año_lanzamiento,
lastFm.reproducciones
FROM albums
LEFT JOIN lastFm
ON albums.artista = lastFm.artista
WHERE albums.año_lanzamiento %2 = 0
ORDER BY lastFm.reproducciones DESC;




-- 8. La biografia de los tres artistas más escuchados

SELECT
lastFm.artista,
lastFm.oyentes,
lastFm.biografia
FROM lastFm
ORDER BY lastFm.oyentes 
LIMIT 3;


