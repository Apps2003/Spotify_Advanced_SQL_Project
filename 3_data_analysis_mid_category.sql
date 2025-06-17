-- Q.6. Calculate the average danceability of tracks in each album. --
SELECT
	album,
	track,
	AVG(danceability)
FROM
	spotify
GROUP BY
	album,
	track;

-- Q.7. Find the top 5 tracks with the highest energy values. --
SELECT
	MAX(energy) AS energy_val,
	track
FROM
	spotify
GROUP BY
	track
ORDER BY
	energy_val DESC
LIMIT 5;

-- Q.8 List all tracks along with their views and likes where official_video = TRUE. --
SELECT
	track,
	SUM(VIEWS),
	SUM(likes)
FROM
	spotify
WHERE
	official_video = TRUE
GROUP BY
	track;

-- Q.9. For each album, calculate the total views of all associated tracks. --
SELECT
	album ,
	track,
	SUM(VIEWS) AS total_views
FROM
	spotify
GROUP BY
	album ,
	track;

-- Q.10. Retrieve the track names that have been streamed on Spotify more than YouTube. --
WITH streams AS (
	SELECT
			track,
			CASE
				WHEN most_played_on = 'Youtube' THEN stream
		END AS stream_on_youtube,
			CASE
				WHEN most_played_on = 'Spotify' THEN stream
		END AS stream_on_spotify
	FROM
			spotify
)
SELECT
	track,
	SUM(stream_on_youtube) AS total_streams_on_youtube,
	SUM(stream_on_spotify) AS total_streams_on_spotify
FROM
	streams
GROUP BY
	track
HAVING
	SUM(stream_on_youtube) < SUM(stream_on_spotify)
	AND SUM(stream_on_youtube) <> 0;