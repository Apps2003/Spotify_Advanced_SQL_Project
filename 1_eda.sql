SELECT
	COUNT(*)
FROM
	spotify

SELECT
	COUNT(DISTINCT artist)
FROM
	spotify
	
SELECT
	DISTINCT album_type
FROM
	spotify
	
SELECT
	MAX(duration_min)
FROM
	spotify
	
SELECT
	MIN(duration_min)
FROM
	spotify
	
-- There are 2 songs which has 0 duration but it is not possible thus delete them --
SELECT
	*
FROM
	spotify
WHERE
	duration_min = 0
	
DELETE FROM spotify 
WHERE duration_min = 0

SELECT
	DISTINCT channel
FROM
	spotify
	
SELECT
	DISTINCT most_played_on
FROM
	spotify