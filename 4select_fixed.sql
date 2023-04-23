-- выведем количество исполнителей в каждом жанре;
SELECT mg.genre_name, COUNT(artist_id) FROM music_genre_artist mga
	LEFT JOIN music_genre mg ON mg.music_genre_id = mga.music_genre_id
	GROUP BY mg.genre_name
	ORDER BY mg.genre_name ASC;

-- выведем количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(track_id) FROM track_list tl
	JOIN album_list al ON al.album_id = tl.album_id
	WHERE al.year_of_release >= 2019 AND al.year_of_release <= 2020;

-- выведем среднюю продолжительность треков по каждому альбому.
SELECT al.album_name, AVG(track_duration) FROM track_list tl
	JOIN album_list al ON al.album_id = tl.album_id
	GROUP BY al.album_name
	ORDER BY al.album_name ASC;

-- выведем всех исполнителей, которые не выпустили альбомы в 2020 году.
SELECT artist_name FROM artists a
	WHERE artist_name NOT IN (
		SELECT artist_name FROM artists a
		JOIN artist_album aa ON aa.artist_id = a.artist_id
		JOIN album_list al ON al.album_id = aa.album_id
		WHERE al.year_of_release = 2020);

-- выведем названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT collection_name FROM music_collection mc 
	JOIN track_music_collection tmc ON tmc.music_collection_id = mc.music_collection_id 
	JOIN track_list tl ON tl.track_id = tmc.track_id 
	JOIN album_list al ON al.album_id = tl.album_id 
	JOIN artist_album aa ON aa.album_id = al.album_id 
	JOIN artists a ON a.artist_id = aa.artist_id 
	WHERE a.artist_name = 'Beast in black'

-- выведем названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT al.album_name FROM album_list al 
	JOIN artist_album aa ON aa.album_id = al.album_id 
	JOIN artists a ON a.artist_id = aa.artist_id 
	JOIN music_genre_artist mga ON mga.artist_id = a.artist_id 
	GROUP BY album_name, a.artist_id
	HAVING COUNT(mga.music_genre_id)>1

-- выведем наименования треков, которые не входят в сборники.
SELECT track_name FROM track_list tl 
	LEFT JOIN track_music_collection tmc ON tmc.track_id = tl.track_id 
	WHERE tmc.track_id IS NULL

--выведем исполнителя или исполнителей, написавших самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT artist_name FROM artists a 
	JOIN artist_album aa ON aa.artist_id = a.artist_id 
	JOIN album_list al ON al.album_id = aa.album_id 
	JOIN track_list tl ON tl.album_id = al.album_id
	WHERE tl.track_duration = (SELECT MIN(track_duration) FROM track_list)

-- выведем названия альбомов, содержащих наименьшее количество треков.
SELECT al.album_name FROM album_list al 
	JOIN track_list tl ON al.album_id = tl.album_id
	GROUP BY al.album_id
	HAVING COUNT(tl.track_id) = (
		SELECT COUNT(tl.track_id) FROM track_list tl 
			GROUP BY tl.album_id 
			ORDER BY 1
			LIMIT 1);
