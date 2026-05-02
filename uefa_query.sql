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
