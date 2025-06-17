# Spotify Advanced SQL Project

<img src="/images/spotify.jpg" width="1000">

## Dataset Link: 
https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset?resource=download

## Overview
This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using SQL. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity (easy, medium, and advanced), and optimizing query performance. The primary goals of the project are to practice advanced SQL skills and generate valuable insights from the dataset.

## Project Steps
### 1. Create the Database in pgAdmin
- Open pgAdmin.
- Right-click on Databases → click Create → Database.
- Name the database: spotify_db.
- Click Save.

### 2. Create Table

Create a table named **`spotify`** to store music-related data combining audio features and YouTube metrics. It includes fields for artist, track, album details, song attributes (like danceability, energy, tempo), video statistics (views, likes, comments), streaming counts, and additional metadata such as licensing and video type.

**Query:** [0_create_table.sql](/0_create_table.sql)

### 3. Connect to Database
- Open DBeaver.
- Go to Database → New Database Connection.
- Choose PostgreSQL and click Next.
- Enter connection details:
- Host: localhost
- Port: 5432 (default)
- Database: spotify_db
- Username: postgres
- Password: (enter your password)
- Click Test Connection → then Finish.

### 4. Import Data from CSV
Using DBeaver CSV Import Tool
Right-click on spotify_data table → Import Data.

- Choose CSV file.
- Browse to your CSV: /path_to_csv_file/cleaned_dataset_utf8.csv

Note: Use Header = true if your CSV has headers.

### 5. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:

- Artist: The performer of the track.
- Track: The name of the song.
- Album: The album to which the track belongs.
- Album_type: The type of album (e.g., single or album).
- Various metrics such as danceability, energy, loudness, tempo, and more.

**Query:** [1_eda.sql](/1_eda.sql)

### 6. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into easy, medium, and advanced levels to help progressively develop SQL proficiency.

- **Easy Queries**

Simple data retrieval, filtering, and basic aggregations:

1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where licensed = TRUE.
4. Find all tracks that belong to the album type single.
5. Count the total number of tracks by each artist.

**Query:** [2_data_analysis_easy_category.sql](/2_data_analysis_easy_category.sql)

- **Medium Queries**

More complex queries involving grouping, aggregation functions, and joins:

6. Calculate the average danceability of tracks in each album.
7. Find the top 5 tracks with the highest energy values.
8. List all tracks along with their views and likes where official_video = TRUE.
9. For each album, calculate the total views of all associated tracks.
10. Retrieve the track names that have been streamed on Spotify more than YouTube.

**Query:** [3_data_analysis_mid_category.sql](/3_data_analysis_mid_category.sql)

- **Advanced Queries**

Nested subqueries, window functions, CTEs, and performance optimization:

11. Find the top 3 most-viewed tracks for each artist using window functions.
12. Write a query to find tracks where the liveness score is above the average.
13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
14. Find tracks where the energy-to-liveness ratio is greater than 1.2.
15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

**Query:** [4_data_analysis_high_category.sql](/4_data_analysis_high_category.sql)

## Technology Stack
- **Database:** PostgreSQL
- **SQL Queries:** DDL, DML, Aggregations, Joins, Subqueries, Window Functions
- **Tools:** pgAdmin 4 (or any SQL editor), PostgreSQL, DBeaver
