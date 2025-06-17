/*
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where licensed = TRUE.
4. Find all tracks that belong to the album type single.
5. Count the total number of tracks by each artist.
*/

-- Q.1. Retrieve the names of all tracks that have more than 1 billion streams. --
SELECT
	*
FROM
	spotify
WHERE
	stream > 1000000000;
	
-- Q.2. List all albums along with their respective artists. --
SELECT
	DISTINCT album ,
	album_type ,
	artist
FROM
	spotify;
	
-- Q.3. Get the total number of comments for tracks where licensed = TRUE. --
SELECT
	SUM(COMMENTS) AS total_comments
FROM
	spotify
WHERE
	licensed = TRUE;

-- Q.4. Find all tracks that belong to the album type single. --
SELECT
	track
FROM
	spotify
WHERE
	album_type = 'single';

-- Q.5. Count the total number of tracks by each artist. --
SELECT
	COUNT(track) AS num_of_tracks,
	artist
FROM
	spotify
GROUP BY artist;