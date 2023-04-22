-- заполняем таблицу Music genre;
INSERT INTO music_genre(music_genre_ID, genre_name)
	VALUES
	(1, 'Punk'),
	(2, 'Heavy metal'),
	(3, 'Power metal'),
	(4, 'Hard rock'),
	(5, 'Industrial core');
		
-- заполняем таблицу Artists;
INSERT INTO artists(artist_ID, artist_name)
	VALUES 
	(1, 'Metallica'),
	(2, 'AC/DC'),
	(3, 'Beast in black'),
	(4, 'Battle beast'),
	(5, 'Rammstein'),
	(6, 'Ария'),
	(7, 'Король и Шут'),
	(8, 'Сектор газа');

-- заполняем таблицу Music genre - Artist;
INSERT INTO music_genre_artist(music_genre_ID, artist_ID)
	VALUES 
	(1, 7),
	(1, 8),
	(2, 1),
	(2, 3),
	(2, 4),
	(2, 6),
	(3, 3),
	(3, 4),
	(4, 1),
	(4, 2),
	(4, 6),
	(4, 8),
	(5, 5);
		
-- заполняем таблицу Album list;
INSERT INTO album_list(album_ID, album_name, year_of_release)
	VALUES 
	(1, 'Zeit', 2022),
	(2, 'Ride the ligthning', 1984),
	(3, 'High voltage', 1975),
	(4, 'Dark connection', 2021),
	(5, 'Battle beast', 2018),
	(6, 'Как в старой сказке', 2001),
	(7, 'Химера', 2019),
	(8, 'Колхозный панк', 1991);
	
-- заполняем таблицу Artist - Album;
INSERT INTO artist_album(artist_ID, album_ID)
	VALUES 
	(1, 2),
	(2, 3),
	(3, 4),
	(4, 5),
	(5, 1),
	(6, 7),
	(7, 6),
	(8, 8);
	
-- заполняем таблицу Track list;
INSERT INTO track_list(track_ID, track_name, track_duration, album_ID)
	VALUES 
	(1, 'Blade runner', 283, 4),
	(2, 'Zeit', 118, 1),
	(3, 'Наркоман', 133, 8),
	(4, 'Патриот', 158, 8),
	(5, 'Химера', 302, 7),
	(6, 'Горящая стрела', 328, 7),
	(7, 'Рогатый', 151, 6),
	(8, 'Ответ - лютая месть!', 182, 6),
	(9, 'Let it roar', 225, 5),
	(10, 'Raven', 329, 5),
	(11, 'TNT', 210, 3),
	(12, 'High voltage', 256, 3),
	(13, 'Escape', 359, 2),
	(14, 'Angst', 248, 1),
	(15, 'My Dystopia', 258, 4);
	

-- заполняем таблицу Music collection;
INSERT INTO music_collection(music_collection_ID, collection_name, year_of_release)
	VALUES 
	(1, 'Greatest hits', 2013),
	(2, 'Золотой сборник', 2001),
	(3, 'Best of the best', 2022),
	(4, 'Beast collection', 2021),
	(5, 'Punks never die!', 2001),
	(6, 'Metal hits', 1984),
	(7, 'Good old classic', 2023),
	(8, 'Brand new vision', 2022);

-- заполняем таблицу Track - Music collection;
INSERT INTO track_music_collection(music_collection_ID, track_ID)
	VALUES 
	(1, 6),
	(1, 8),
	(1, 11),
	(1, 12),
	(1, 13),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 11),
	(2, 12),
	(2, 13),
	(3, 1),
	(3, 2),
	(3, 6),
	(3, 8),
	(3, 9),
	(3, 11),
	(3, 14),
	(3, 15),
	(4, 1),
	(4, 9),
	(4, 10),
	(4, 15),
	(5, 3),
	(5, 4),
	(5, 7),
	(5, 8),
	(6, 11),
	(6, 12),
	(6, 13),
	(7, 5),
	(7, 6),
	(7, 7),
	(7, 8),
	(7, 11),
	(7, 12),
	(8, 1),
	(8, 2),
	(8, 14),
	(8, 15);
	