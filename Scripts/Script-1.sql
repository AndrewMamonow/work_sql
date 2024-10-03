--CREATE-запросы, создание таблиц

CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	genre VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	artist VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	album VARCHAR(50) NOT NULL,
	album_year INTEGER NOT NULL CHECK (album_year > 1960)
);
CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	track VARCHAR(50) NOT NULL,
	track_length INTEGER NOT NULL CHECK (track_length > 0),
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);
CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	collection VARCHAR(50) NOT NULL,
	collection_year INTEGER NOT NULL CHECK (collection_year > 1960)
	);
CREATE TABLE IF NOT EXISTS GenreArtist (
	id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	genre_id INTEGER NOT NULL REFERENCES Genres(id)
);
CREATE TABLE IF NOT EXISTS ArtistAlbum (
	id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL REFERENCES Artists(id),
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);
CREATE TABLE IF NOT EXISTS CollectionTrack (
	collection_id INTEGER NOT NULL REFERENCES Collections(id),
	track_id INTEGER NOT NULL REFERENCES Tracks(id),
	CONSTRAINT ct PRIMARY KEY (collection_id, track_id)
	);

