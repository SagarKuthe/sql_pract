CREATE DATABASE SQL_TEST;
USE SQL_TEST;
# 1. From the following table, write a SQL query to count the number of countries that parƟcipated 
-- in the 2016-EURO Cup.
SELECT * FROM SOCCER_COUNTRY;
SELECT * FROM PLAYER_MAST;
SELECT * FROM MATCH_MAST;
SELECT * FROM COACH_MAST;
SELECT * FROM TEAM_COACHES;
SELECT * FROM SOCCER_VENUE;
SELECT * FROM SOCCER_TEAM;
SELECT * FROM ASST_REFEREE_MAST;
SELECT * FROM MATCH_CAPTAIN;


-- SELECT COUNT(COUNNTRY_NAME) AS NO_OF_COUNTRIES
-- FROM SOCCER_COUNTRY AS SC
--  INNER JOIN ASST_REFEREE_MAST AS ARM
-- ON SC.ï»¿country_id=ARM.COUNTRY_ID
-- INNER JOIN





# 2. From the following table, write a SQL query to find the number of matches that ended with a 
-- result. 
SELECT COUNT(RESULTS) AS NUMBER_OF_MATCHES
FROM MATCH_MAST ;

# 3. From the following table, write a SQL query to find out when the Football EURO cup 2016 will 
-- begin.
 SELECT PLAY_DATE AS BEGIN_DATE 
 FROM MATCH_MAST
 ORDER BY PLAY_DATE ASC
 LIMIT 1;
 
 # 4. From the following table, write a SQL query to find out where the final match of the EURO cup 
-- 2016 was played. 
SELECT * FROM SOCCER_VENUE;
SELECT * FROM SOCCER_CITY;
SELECT * FROM MATCH_MAST;

SELECT SV.VENUE_NAME, SC.CITY
FROM SOCCER_VENUE AS SV
INNER JOIN SOCCER_CITY AS SC
ON SV.CITY_id=SC.ï»¿city_id
INNER JOIN MATCH_MAST AS MM
ON SV.ï»¿venue_id=MM.VENUE_ID
WHERE PLAY_STAGE="F";

# 5. From the following tables, write a SQL query to find the number of goals scored by each team in 
-- each match during normal play. 
SELECT * FROM MATCH_DETAILS;
SELECT * FROM SOCCER_COUNTRY;
SELECT * FROM asst_referee_mast;
SELECT * FROM SOCCER_TEAM;

SELECT MD.MATCH_NO, SC.COUNTRY_NAME, MD.GOAL_SCORE
FROM MATCH_DETAILS AS MD
INNER JOIN asst_referee_mast AS ARM
ON MD.ASS_REF=ARM.ASS_REF_ID
INNER JOIN SOCCER_COUNTRY AS SC
ON ARM.COUNTRY_ID=SC.ï»¿country_id
WHERE DECIDED_BY="N";

# 6. From the following table, write a SQL query to count the number of goals scored by each player 
-- within a normal play schedule.
SELECT * FROM GOAL_DETAILS;
SELECT * FROM PLAYER_MAST;
SELECT * FROM SOCCER_COUNTRY;

SELECT PM.PLAYER_NAME, COUNT(GOAL_ID) AS SOCCERER, SC.COUNTRY_NAME
FROM GOAL_DETAILS AS GD
INNER JOIN PLAYER_MAST AS PM
ON GD.PLAYER_ID=PM.ï»¿player_id
INNER JOIN SOCCER_COUNTRY AS SC
ON SC.ï»¿country_id=PM.TEAM_ID
WHERE GOAL_TYPE="N"
GROUP BY PLAYER_NAME, COUNTRY_NAME
ORDER BY SOCCERER DESC;

# 7. From the following table, write a SQL query to find out who scored the most goals in the 2016 
-- Euro Cup.
SELECT * FROM GOAL_DETAILS;
SELECT * FROM PLAYER_MAST;
SELECT * FROM SOCCER_COUNTRY; 

SELECT PM.PLAYER_NAME, COUNT(GOAL_ID) AS SOCCERER, SC.COUNTRY_NAME
FROM GOAL_DETAILS AS GD
INNER JOIN PLAYER_MAST AS PM
ON GD.PLAYER_ID=PM.ï»¿player_id
INNER JOIN SOCCER_COUNTRY AS SC
ON SC.ï»¿country_id=PM.TEAM_ID
WHERE GOAL_TYPE="N"
GROUP BY PLAYER_NAME, COUNTRY_NAME
ORDER BY SOCCERER DESC
LIMIT 1;

# 8. From the following table, write a SQL query to find out which teams played the first match of the 
-- 2016 Euro Cup.
SELECT * FROM MATCH_DETAILS;
SELECT * FROM SOCCER_COUNTRY;
SELECT MD.MATCH_NO, SC.COUNTRY_NAME
FROM MATCH_DETAILS AS MD
INNER JOIN SOCCER_COUNTRY AS SC
ON MD.TEAM_ID=SC.ï»¿country_id
WHERE MATCH_NO=1;
