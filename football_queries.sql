-- 1. Find all the matches from 2017.
SELECT * FROM matches WHERE season = 2017;


-- 2. Find all the matches featuring Barcelona.
SELECT * FROM matches WHERE hometeam = 'Barcelona' or awayteam = 'Barcelona';


-- 3. What are the names of the Scottish divisions included?
SELECT  name FROM divisions WHERE code = 'SC0' or code = 'SC1' or code = 'SC2';
-- Alternative solution:
SELECT  name FROM divisions WHERE country = 'Scotland';
-- 3 divisions - Scottish Championship, Scottish League, Scottish Premiership


-- 4. Find the division code for the Bundesliga.
SELECT code FROM divisions WHERE name = 'Bundesliga';
--Use that code to find out how many matches Freiburg have played in the Bundesliga since the data started being collected.
SELECT count(*) FROM matches WHERE division_code = 'D1' or division_code = 'D2' AND (hometeam = 'Freiburg' or awayteam = 'Freiburg');


-- 5. Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT DISTINCT hometeam FROM matches WHERE hometeam ILIKE '%City%';


-- 6. How many different teams have played in matches recorded in a French division?
SELECT DISTINCT code FROM public.divisions WHERE country = 'France'; -- Returns F1 and F2
SELECT COUNT (DISTINCT hometeam) FROM public.matches WHERE division_code = 'F1' or division_code = 'F2';
-- 61 matches


-- 7. Have Huddersfield played Swansea in the period covered?
SELECT * FROM matches WHERE (hometeam = 'Huddersfield' AND awayteam = 'Swansea') OR (hometeam = 'Swansea' AND awayteam = 'Huddersfield');
-- Yes


-- 8. How many draws were there in the Eredivisie between 2010 and 2015?
SELECT code FROM divisions WHERE name = 'Eredivisie';
SELECT count (*) FROM matches WHERE division_code = 'N1' AND ftr = 'D' AND SEASON between 2010 AND 2015;
--431 draws


-- 9. Select the matches played in the Premier League in order of total goals scored from highest to lowest.
SELECT code FROM divisions WHERE name = 'Premier League';
-- Where there is a tie the match with more home goals should come first.
SELECT  * From matches WHERE division_code = 'E0' ORDER BY (fthg + ftag)DESC, fthg DESC;


-- 10. In which division and which season were the most goals scored?
SELECT division_code, season, SUM (fthg + ftag) FROM matches GROUP BY division_code, season ORDER BY sum DESC LIMIT 1;
SELECT name FROM divisions WHERE code = 'EC';