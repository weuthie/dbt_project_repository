
SELECT TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes
FROM {{ ref("tracks") }}
WHERE Milliseconds >= 180000 AND Milliseconds <= 240000 AND Bytes > 6600000
