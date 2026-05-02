CREATE USER 'coach_user'@'localhost' IDENTIFIED BY 'coach_password';

CREATE USER 'referee_user'@'localhost' IDENTIFIED BY 'referee_password';

CREATE USER 'player_user'@'localhost' IDENTIFIED BY 'player_password';

SELECT USER FROM mysql.user;

CREATE ROLE uefa_user;

GRANT select on UEFA_soccer.* to uefa_user;

select * from mysql.roles_mapping;

GRANT uefa_user to 'coach_user'@'localhost', 'referee_user'@'localhost', 'player_user'@'localhost';
