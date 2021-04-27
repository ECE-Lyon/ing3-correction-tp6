# a
SELECT *
FROM album;

# b
SELECT DISTINCT artist_name
FROM album;

# c
SELECT release_year
FROM album
WHERE title = 'The Black Market';

# d
SELECT COUNT(*)
FROM `track`
WHERE duration < 120;

# e
SELECT track.id, track.title
FROM track
         INNER JOIN album on track.id_album = album.id
WHERE album.title = 'Toto IV';

# f
SELECT album.title, COUNT(*)
FROM album
         JOIN track ON album.id = track.id_album
GROUP BY album.title;

SELECT title, duration
FROM track
ORDER BY duration DESC
LIMIT 10;