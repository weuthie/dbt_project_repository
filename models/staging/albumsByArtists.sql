{{ config(materialized='table') }}


SELECT artists.ArtistId, artists.Name, albums.AlbumId, albums.Title
FROM {{ source("staging","artists") }}
JOIN {{ source("staging","albums") }} ON artists.ArtistId = albums.ArtistId