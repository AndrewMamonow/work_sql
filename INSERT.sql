--INSERT-запросы, заполнение таблиц

INSERT INTO genres(genre) 
VALUES 
	('Electronica'),
	('Pop'),
	('Blues');

INSERT INTO artists (artist) 
VALUES 
	('Foretaste'), 
	('Omnimar'),	
	('Joe Bonamassa'), 
	('Blues Cousins');

INSERT INTO albums (album, album_year) 
VALUES 
	('Happy End!', 2021), 
	('Anger', 2018), 
	('Redemption', 2018),
	('Sleepless Night', 2019),
	('Over and Over', 2021),
	('Darkpop', 2020); 

INSERT INTO artistalbum (artist_id, album_id) 
VALUES 
	(1, 1), 
	(2, 2), 
	(3, 3), 
	(4, 4),
	(4, 5),
	(2, 6);

INSERT INTO genreartist (artist_id, genre_id) 
VALUES 
	(1, 1), 
	(2, 1), 
	(2, 2), 
	(3, 3), 
	(4, 3);

INSERT INTO tracks (track, track_length, album_id) 
VALUES 
	('In My Game', 293, 1),
	('Run', 236, 1),
	('Anger', 204, 2),
	('Hungry', 200, 2),
	('Redemption', 357, 3),
	('Love Is A Gamble', 313, 3),
	('The Dream', 475, 4),
	('The Brother', 400, 4),
	('Over and Over', 344, 5),
	('Somebody Hep Me', 588, 5),
	('Serenity', 270, 6);

INSERT INTO collections (collection, collection_year) 
VALUES
	('Electronics', 2018),
	('Instrumental', 2019),
	('My collection', 2020),
	('New blues', 2021);

INSERT INTO collectiontrack (collection_id, track_id) 
VALUES 
	(1, 1), 
	(1, 2), 
	(2, 2), 
	(2, 4),
	(3, 1),
	(3, 3),
	(3, 7),
	(4, 6),
	(4, 8),
	(3, 9),
	(2, 11);