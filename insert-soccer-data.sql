LOAD DATA LOCAL INFILE '/Users/carolinezanuto/OneDrive - Pace University/Pace University/Spring 2026/CIT 241/Final Project/clean_csvs/teams.csv'
INTO TABLE teams
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/carolinezanuto/OneDrive - Pace University/Pace University/Spring 2026/CIT 241/Final Project/clean_csvs/tournaments.csv'
INTO TABLE tournaments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/Users/carolinezanuto/OneDrive - Pace University/Pace University/Spring 2026/CIT 241/Final Project/clean_csvs/matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE TABLE match_scores;

LOAD DATA LOCAL INFILE '/Users/carolinezanuto/OneDrive - Pace University/Pace University/Spring 2026/CIT 241/Final Project/clean_csvs/match_scores.csv'
INTO TABLE match_scores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_match, home_team_score, away_team_score, home_team_penalty, away_team_penalty, home_team_total, away_team_total, @match_winner)
SET match_winner = NULLIF(@match_winner, '');

LOAD DATA LOCAL INFILE '/Users/carolinezanuto/OneDrive - Pace University/Pace University/Spring 2026/CIT 241/Final Project/clean_csvs/coaches.csv'
INTO TABLE coaches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;