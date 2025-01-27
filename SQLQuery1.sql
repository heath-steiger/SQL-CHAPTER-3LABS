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

SELECT DepartmentName, CourseDescription, LastName, FirstName
	FROM Departments D
	JOIN Courses C ON D.DepartmentID = C.DepartmentID
	JOIN StudentCourses SC ON C.CourseID = SC.CourseID
	JOIN Students S ON SC.StudentID = S.StudentID
WHERE D.DepartmentName LIKE 'English'
ORDER BY CourseDescription ASC;

--exercise 8

SELECT D1.DepartmentName as InstructorDept, LastName, FirstName,
CourseDescription, D2.DepartmentName AS CourseDept
	FROM Courses C
	JOIN Departments D1 ON C.DepartmentID = D1.DepartmentID
	JOIN Instructors I ON C.InstructorID = I.InstructorID
	JOIN Departments D2 ON I.DepartmentID = D2.DepartmentID
WHERE D1.DepartmentID != D2.DepartmentID;

--Extra example - Any instuctors who aren't assigned a couse?
SELECT LastName + ',' + FirstName as Instructor, CourseDescription
	FROM Instructors I
	LEFT JOIN Courses C ON I.InstructorID = C.InstructorID
  WHERE CourseDescription is NULL;



SELECT *
	FROM Courses;
SELECT * 
	FROM Departments;
SELECT *
	FROM Instructors;
SELECT * 
	FROM  StudentCourses;
SELECT * 
	FROM Students;
