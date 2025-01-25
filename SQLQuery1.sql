--exercise 1

SELECT DepartmentName, CourseNumber, CourseDescription
	FROM Courses C
	JOIN Departments D ON C.DepartmentID = D.DepartmentID
ORDER BY DepartmentName, CourseNumber ASC;

--exercise 2

SELECT LastName, FirstName, CourseNumber, CourseDescription
	FROM Instructors I
	JOIN Courses C on I.DepartmentID = C.DepartmentID
WHERE I.Status LIKE 'P'
ORDER BY LastName, FirstName ASC;

--exercise 3

SELECT DepartmentName AS Department, CourseDescription AS Course, FirstName, LastName
	FROM Departments D
	JOIN Courses C ON D.DepartmentID = C.DepartmentID
	JOIN Instructors I ON C.DepartmentID = I.DepartmentID
WHERE C.CourseUnits LIKE '3'
ORDER BY  DepartmentName, CourseDescription ASC;

--exercise 4




SELECT *
	FROM Courses

SELECT * 
	FROM Departments

SELECT * 
	FROM Instructors