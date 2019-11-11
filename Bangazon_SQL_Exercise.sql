--1. List each employee first name, last name and supervisor status along with their department name. 
--   Order by department name, then by employee last name, and finally by employee first name.
/*SELECT FirstName + ' ' + LastName AS FullName, IsSupervisor, d.Name
	FROM Employee e
	LEFT JOIN Department d ON d.Id = e.DepartmentId 
	ORDER BY d.Name, e.LastName, e.FirstName;*/

--2 List each department ordered by budget amount with the highest first.
/*SELECT d.Name, d.Budget
	FROM Department d
	ORDER BY d.Budget DESC;*/

--3 List each department name along with any employees (full name) in that department who are supervisors.
/*SELECT d.Name, e.FirstName + ' ' + e.LastName AS FullName
	FROM Department d
	INNER JOIN Employee e ON e.DepartmentId = d.Id
	WHERE e.IsSupervisor = 1;*/

--4 List each department name along with a count of employees in each department.
/*SELECT d.Name AS 'Department Name', COUNT(*) AS 'Number Employees'
	FROM Department d
	INNER JOIN Employee e ON e.DepartmentId = d.Id
	GROUP BY d.Name;*/

--5 Write a single update statement to increase each department's budget by 20%.
/*SELECT d.Budget
	FROM Department d;
UPDATE Department SET Budget = Budget * 1.20;
SELECT d.Budget
	FROM Department d;*/

--6 List the employee full names for employees who are not signed up for any training programs.
/*SELECT FirstName + ' ' + LastName as FullName
	FROM Employee e
	WHERE e.Id NOT IN
		(SELECT e.Id
			FROM Employee e
			INNER JOIN EmployeeTraining et ON et.EmployeeId = e.Id );
SELECT COUNT(*)
	FROM Employee e;*/

--7 List the employee full names for employees who are signed up for at least one training program 
--  and include the number of training programs they are signed up for.