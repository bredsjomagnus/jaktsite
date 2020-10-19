#show databases;
use jaktsite;
show tables;
select * from users;
UPDATE users SET firstname = "Göte" WHERE id = 9;
UPDATE users SET username = "göte" WHERE id = 9;
UPDATE users SET lastname = "Hellström" WHERE id = 25;
UPDATE users SET lastname = "Kågström" WHERE id = 21;
UPDATE users SET lastname = "Törnqvist" WHERE id = 14;