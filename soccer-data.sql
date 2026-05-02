CREATE DATABASE IF NOT EXISTS UEFA_soccer;
USE UEFA_soccer;

CREATE TABLE teams (
    team_code VARCHAR(20) PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL
);

CREATE TABLE tournaments (
    tournament_year INT PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL,
    host_country VARCHAR(100) NOT NULL,
    num_teams INT NOT NULL,
    winner VARCHAR(20),
    FOREIGN KEY (winner) REFERENCES teams(team_code)
);

CREATE TABLE matches (
    id_match INT PRIMARY KEY,
    tournament_year INT NOT NULL,
    home_team_code VARCHAR(20) NOT NULL,
    away_team_code VARCHAR(20) NOT NULL,
    game_date DATE NOT NULL,
    stage VARCHAR(50) NOT NULL,
    FOREIGN KEY (tournament_year) REFERENCES tournaments(tournament_year),
    FOREIGN KEY (home_team_code) REFERENCES teams(team_code),
    FOREIGN KEY (away_team_code) REFERENCES teams(team_code)
);

CREATE TABLE match_scores (
    id_match INT PRIMARY KEY,
    home_team_score INT NOT NULL,
    away_team_score INT NOT NULL,
    home_team_penalty INT,
    away_team_penalty INT,
    home_team_total INT NOT NULL,
    away_team_total INT NOT NULL,
    match_winner VARCHAR(20),
    FOREIGN KEY (id_match) REFERENCES matches(id_match),
    FOREIGN KEY (match_winner) REFERENCES teams(team_code)
);

CREATE TABLE coaches (
    id_coach INT PRIMARY KEY,
    country_code VARCHAR(20) NOT NULL,
    coach_name VARCHAR(100) NOT NULL,
    coach_year INT NOT NULL,
    FOREIGN KEY (country_code) REFERENCES teams(team_code),
    FOREIGN KEY (coach_year) REFERENCES tournaments(tournament_year)
);

