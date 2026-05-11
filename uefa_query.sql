USE UEFA_soccer;

Select * from tournaments LIMIT 100;

SELECT * FROM teams LIMIT 100;

Select * from match_scores LIMIT 100;

SELECT * FROM matches LIMIT 100;

SELECT * FROM coaches LIMIT 100;

SELECT ms.id_match, m.home_team_code, m.away_team_code, ms.match_winner
FROM match_scores ms
JOIN matches m ON ms.id_match = m.id_match
WHERE ms.match_winner IS NOT NULL
LIMIT 100;

SELECT m.tournament_year, 
       COUNT(*) AS total_matches,
       SUM(ms.home_team_total + ms.away_team_total) AS total_goals,
       AVG(ms.home_team_total + ms.away_team_total) AS avg_goals_per_match
FROM match_scores ms
JOIN matches m ON ms.id_match = m.id_match
GROUP BY m.tournament_year
ORDER BY m.tournament_year;

SELECT COUNT(match_winner) AS total_spain_winner
FROM match_scores
WHERE match_winner = 'ESP';

CREATE VIEW view_team_coaches AS
    SELECT teams.team_name, coaches.coach_name, coaches.coach_year 
    FROM teams 
    JOIN coaches ON teams.team_code = coaches.country_code;

CREATE VIEW view_performance AS
SELECT 
    t.team_name,
    m.tournament_year,
    COUNT(m.id_match) AS games_played,
    SUM(CASE WHEN ms.match_winner = t.team_code THEN 1 ELSE 0 END) AS wins,
    SUM(ms.home_team_total + ms.away_team_total) AS total_goals_in_matches
FROM teams t
JOIN matches m ON t.team_code IN (m.home_team_code, m.away_team_code)
JOIN match_scores ms ON m.id_match = ms.id_match
GROUP BY t.team_name, m.tournament_year;

-------------------------------------------------
-----RUN DURING PRESENTATION(database slide)-----
-------------------------------------------------

SELECT * FROM matches
WHERE stage != 'GROUP_STANDINGS';

SELECT * FROM coaches;

-- Show table data
SELECT * FROM teams LIMIT 10;
SELECT * FROM tournaments;

-- Show JOIN query results
SELECT * FROM matches m
JOIN match_scores ms ON m.id_match = ms.id_match
LIMIT 10;

-- Show aggregate results
SELECT m.tournament_year, COUNT(*) AS total_matches,
SUM(ms.home_team_total + ms.away_team_total) AS total_goals
FROM match_scores ms
JOIN matches m ON ms.id_match = m.id_match
GROUP BY m.tournament_year;

-- Show View Performance results
SELECT * FROM view_performance 
ORDER BY wins DESC 
LIMIT 5;