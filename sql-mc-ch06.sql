-- exercise 1
SELECT DISTINCT LastName, FirstName
	FROM Instructors 
  WHERE InstructorID IN
   (SELECT InstructorID
		FROM Courses)
ORDER BY LastName, FirstName

-- exercise 2
SELECT LastName, FirstName, AnnualSalary
	FROM Instructors 
	WHERE  AnnualSalary >
	 (SELECT AVG(AnnualSalary)
		FROM Instructors)
 ORDER BY AnnualSalary DESC
	 
SELECT DISTINCT LastName, FirstName
	FROM Instructors I
    JOIN Courses C
	ON I.InstructorID = c.InstructorID
	 
SELECT *
	FROM Instructors
SELECT *
	FROM Courses