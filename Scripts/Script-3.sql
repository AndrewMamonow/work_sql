-- SELECT-запросы, выборка данных из таблиц

--Название и продолжительность самого длительного трека.
SELECT track, track_length 
	FROM tracks
WHERE track_length = (SELECT MAX(track_length) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут (210 секунд).
SELECT track, track_length 
	FROM tracks
WHERE track_length > 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection, CAST(collection_year AS VARCHAR)
	FROM collections
WHERE collection_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT artist 
	FROM artists
WHERE artist NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT track 
	FROM tracks
WHERE track LIKE '%My%';

--Количество исполнителей в каждом жанре.
SELECT genres.genre, count(artist_id) 
	FROM GenreArtist
	JOIN genres 
		ON genres.id = GenreArtist.genre_id 
	GROUP BY genre;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(track) 
	FROM tracks
	JOIN albums ON tracks.album_id = albums.id 
WHERE albums.album_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT albums.album, avg(track_length) 
	FROM tracks
	JOIN albums 
		ON albums.id = tracks.album_id
	GROUP BY albums.album
	ORDER BY albums.album;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artist
	FROM artists
WHERE artist NOT IN
	(SELECT artist
		FROM artists
		JOIN artistalbum 
			ON artistalbum.artist_id = artists.id
		JOIN albums 
			ON albums.id = artistalbum.album_id	
	WHERE albums.album_year = 2020);
		
--Названия сборников, в которых присутствует конкретный исполнитель ('Omnimar').
SELECT DISTINCT collection 
	FROM collections AS cs
	JOIN collectiontrack AS ct 
		ON ct.collection_id = cs.id
	JOIN tracks AS ts
		ON ct.track_id = ts.id
	JOIN albums AS al
		ON ts.album_id = al.id
	JOIN artistalbum AS aa 
		ON al.id = aa.album_id
	JOIN artists AS ar 
		ON ar.id = aa.artist_id
WHERE ar.artist = 'Omnimar';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album
	FROM albums AS a
	JOIN artistalbum AS aa
		ON aa.album_id = a.id
	JOIN genreartist AS ga
		ON ga.artist_id = aa.artist_id 
GROUP BY a.album
HAVING count(album) >= 1;

--Наименования треков, которые не входят в сборники.
SELECT track
	FROM tracks AS tr 
	LEFT JOIN collectiontrack AS ct 
		ON ct.track_id = tr.id
	LEFT JOIN collections AS cs
		ON ct.collection_id = cs.id
WHERE cs.id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT artist, track_length
	FROM artists AS ar
	JOIN artistalbum AS aa
		ON aa.artist_id = ar.id
	JOIN albums AS al
		ON al.id = aa.album_id
	JOIN tracks AS tr
		ON tr.album_id = al.id
WHERE track_length = (SELECT MIN(track_length) FROM tracks);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT album, count(track)
	FROM albums AS a
	JOIN tracks AS ts
		ON ts.album_id = a.id
GROUP BY a.album
HAVING count(track) = (SELECT min(ct) FROM 
			(SELECT count(track) AS ct
				FROM albums AS a
				JOIN tracks AS ts
					ON ts.album_id = a.id
			GROUP BY a.album));

