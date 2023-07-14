WITH composer_avg AS (
    SELECT Name, Composer, Milliseconds, AVG(Milliseconds) OVER (PARTITION BY Composer) AS avg_milliseconds
    FROM {{ source("staging","tracks") }}
)
SELECT Name, Composer, Milliseconds, avg_milliseconds
FROM composer_avg
