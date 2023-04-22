-- формирование таблицы Music genre;

CREATE TABLE IF NOT EXISTS music_genre (
	music_genre_ID SERIAL NOT NULL PRIMARY KEY,
	genre_name VARCHAR(40) NOT NULL UNIQUE
);

-- формирование таблицы Artists;

CREATE TABLE IF NOT EXISTS artists (
	artist_ID SERIAL NOT NULL PRIMARY KEY,
	artist_name VARCHAR(60) NOT NULL
);

-- формирование таблицы Music genre - Artist;

CREATE TABLE IF NOT EXISTS music_genre_artist (
	music_genre_ID INTEGER NOT NULL REFERENCES music_genre(music_genre_ID),
	artist_ID INTEGER NOT NULL REFERENCES artists(artist_ID),
	CONSTRAINT pk PRIMARY KEY (music_genre_ID, artist_ID)
);

-- формирование таблицы Album list;

CREATE TABLE IF NOT EXISTS album_list (
	album_ID SERIAL NOT NULL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK (year_of_release > 1800)
);

-- формирование таблицы Artist - Album;

CREATE TABLE IF NOT EXISTS artist_album (
	artist_ID INTEGER NOT NULL REFERENCES artists(artist_ID),
	album_ID INTEGER NOT NULL REFERENCES album_list(album_ID),
	CONSTRAINT pk_1 PRIMARY KEY (artist_ID, album_ID)
);

-- формирование таблицы Track list;

CREATE TABLE IF NOT EXISTS track_list (
	track_ID SERIAL NOT NULL PRIMARY KEY,
	track_name VARCHAR(120) NOT NULL,
	track_duration INTEGER NOT NULL CHECK (track_duration > 0),
	album_ID INTEGER NOT NULL REFERENCES album_list(album_ID)
);

-- формирование таблицы Music collection;

CREATE TABLE IF NOT EXISTS music_collection (
	music_collection_ID SERIAL NOT NULL PRIMARY KEY,
	collection_name VARCHAR(120) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK (year_of_release >= 1800)	
);

-- формирование таблицы Track - Music collection;

CREATE TABLE IF NOT EXISTS track_music_collection (
	music_collection_ID INTEGER NOT NULL REFERENCES music_collection(music_collection_ID),
	track_ID INTEGER NOT NULL REFERENCES track_list(track_ID),
	CONSTRAINT pk_2 PRIMARY KEY (music_collection_ID, track_ID)
);