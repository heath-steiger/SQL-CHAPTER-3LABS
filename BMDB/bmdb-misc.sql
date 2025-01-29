-- ch7
-- update and delete

SELECT *
	FROM Movie

-- insert a test/dummy record
INSERT INTO Movie (Title, Year, Rating, Director)
Values ('Test', 2025, 'R', 'Test Director');

-- get record by ID (primary Key)
SELECT *
	FROM Movie
	WHERE ID = 3

-- update Test movei to Test Movie 2, year 2026
UPDATE Movie
	SET Title = 'The Lord of the Rings: The Two Towers',
	Year = 2002
WHERE ID = 3;

-- delete
DELETE MOVIE
	WHERE ID = 6;

SELECT *
	FROM Actor A
	JOIN Movie M ON A.ID = M.ID;

-- Actor Table
INSERT INTO Actor (FirstName,LastName, Gender, BirthDate)
VALUES ('Will', 'Ferrell', 'M', '1967-07-16'),
	('Zooey', 'Deschanel', 'F', '1980-01-17'),
	('Peter', 'Dinklage', 'M', '1969-06-11'),
	('John C.', 'Reilly', 'M', '1965-05-24'),
	('Mary','Steenburgen', 'F', '1953-02-08');
	
-- add credits
SELECT *
	FROM Actor;
SELECT *
	FROM Movie;
SELECT *
	FROM Credit
	ORDER BY MovieID
-- credits:
-- ELF (2);
-- Will Ferell (1) - buddy
-- Zooey Deschanel (2) - Jovie
-- Mary S (5) - Emily Hobbs
-- Peter Dinklage (3) - Miles Finch
-- Step Brothers (1) 
-- Will Ferell (1) - Brennan Huff
-- John C Reilly (4) - Dale Doback
-- Mary S (5) - Nancy Huff
INSERT INTO Credit (MovieID, ActorID, Role)
Values
	(2,1,'Buddy'),
	(2,2,'Jovie'),
	(2,3,'Miles Finch'),
	(2,5,'Emily Hobbs'),
	(1,1,'Brennan Huff'),
	(1,4,'Dale Doback'),
	(1,5,'Nancy Huff');

SELECT Title, CONCAT(FirstName, ',' , LastName) AS Actor, Role
	FROM Credit C
	JOIN Movie M ON C.MovieID = M.ID
	JOIN Actor A ON C.ActorID = A.ID

-- copy the movie table into moviecopy
SELECT *
	INTO MovieCopy
	FROM Movie;