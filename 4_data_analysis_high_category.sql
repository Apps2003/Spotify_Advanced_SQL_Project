/*
Find the top 3 most-viewed tracks for each artist using window functions.
Write a query to find tracks where the liveness score is above the average.
Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
Find tracks where the energy-to-liveness ratio is greater than 1.2.
Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
*/

-- Q.11. Find the top 3 most-viewed tracks for each artist using window functions. --
WITH ranking_artist AS (
	SELECT
		track,
		artist,
		SUM(VIEWS) AS total_view,
		DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(VIEWS) DESC) AS RANK
	FROM
		spotify
	GROUP BY
		track,
		artist
	ORDER BY
		total_view DESC
)
SELECT
	*
FROM
	ranking_artist
WHERE
	RANK <= 3

--Q.12. Write a query to find tracks where the liveness score is above the average. --
SELECT
	track,
	artist,
	liveness
FROM
	spotify
WHERE
	liveness > (
		SELECT
			AVG(liveness)
		FROM
			spotify
	)

-- Q.13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album. --
WITH energy_val AS(
	SELECT
	album,
	MIN(energy) AS lowest_energy,
	MAX(energy) AS highest_energy
	FROM spotify
	GROUP BY album
)
SELECT
	album,
	highest_energy - lowest_energy AS energy_diff
FROM
	energy_val

-- Q.14. Find tracks where the energy-to-liveness ratio is greater than 1.2. --
WITH tracks_info AS (
	SELECT
		album,
		track,
		energy,
		liveness
	FROM
		spotify
)
SELECT
	album,
	track,
	energy / liveness AS en_to_liv_ratio
FROM
	tracks_info
WHERE
	energy / liveness > 1.2

-- Q.15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions. --
WITH views_count_cte AS (
	SELECT
		track,
		album,
		SUM(likes) AS likes_count,
		SUM(VIEWS) AS num_views
	FROM
		spotify
	GROUP BY
		track,
		album
)
SELECT
	likes_count,
	track,
	album
FROM
	views_count_cte
ORDER BY
	num_views DESC