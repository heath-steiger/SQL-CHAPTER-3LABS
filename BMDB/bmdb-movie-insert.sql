--BMDB data
-- insert Movie records
USE BMDB
Go

INSERT INTO Movie (Title,Year, Rating, Director)
VALUES ('Step Brothers', 2008, 'R', 'Adam McKAy'),
		('Elf', 2003, 'PG', 'Jon Favreau');


--LOTR The Two Towers
INSERT INTO Movie (Title, [Year], Rating, Director)
VALUES ('The Lord of the Rings: The Two Towers', 2002, 'PG-13', 'Peter Jackson');
-- Insert into Actor table
INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
VALUES 
    ('Elijah', 'Wood', 'M', '1981-01-28'),
    ('Ian', 'McKellen', 'M', '1939-05-25'),
    ('Viggo', 'Mortensen', 'M', '1958-10-20');
-- Insert into Credit table (using CreditID starting at 8, MovieID = 3, and ActorIDs starting at 6)
INSERT INTO Credit (MovieID, ActorID, Role)
VALUES 
    (3, 6, 'Frodo Baggins'),
    (3, 7, 'Gandalf the White'),
    (3, 8, 'Aragorn');


--LOTR The Fellowship Of The Ring
INSERT INTO Movie (Title, [Year], Rating, Director)
VALUES ('The Lord of the Rings: The Fellowship of the Ring', 2001, 'PG-13', 'Peter Jackson');
-- Insert into Credit table for The Fellowship of the Ring
INSERT INTO Credit (MovieID, ActorID, Role)
VALUES 
    (5, 6, 'Frodo Baggins'),
    (5, 7, 'Gandalf the Grey'),
    (5, 8, 'Aragorn');


--Interstellar
INSERT INTO Movie (Title, [Year], Rating, Director)
VALUES ('Interstellar', 2014, 'PG-13', 'Christopher Nolan');
-- Insert into Actor table for Interstellar
INSERT INTO Actor (FirstName, LastName, Gender, BirthDate)
VALUES 
    ('Matthew', 'McConaughey', 'M', '1969-11-04'),
    ('Anne', 'Hathaway', 'F', '1982-11-12'),
    ('Jessica', 'Chastain', 'F', '1977-03-24');
-- Insert into Credit table for Interstellar
INSERT INTO Credit (MovieID, ActorID, Role)
VALUES 
    (4, 9, 'Cooper'),
    (4, 10, 'Dr. Amelia Brand'),
    (4, 11, 'Murph (adult)');

