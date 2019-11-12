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
/*	FROM Employee e
	WHERE e.Id NOT IN
		(SELECT e.Id
			FROM Employee e
			INNER JOIN EmployeeTraining et ON et.EmployeeId = e.Id );
SELECT COUNT(*)
	FROM Employee e;*/

--7 List the employee full names for employees who are signed up for at least one training program 
--  and include the number of training programs they are signed up for.  Complete
/*SELECT e.FirstName + ' ' + e.LastName AS 'Full Name', COUNT(*) AS '# of Traing Programs'
	FROM Employee e
	INNER JOIN EmployeeTraining et ON et.EmployeeId = e.Id
	GROUP BY e.FirstName, e.LastName;*/

--8 List all training programs along with the count employees who have signed up for each. Complete
/*SELECT tp.Name, COUNT(*) AS 'Total Attendees'
	FROM TrainingProgram tp
	LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
	--LEFT JOIN Employee e ON e.Id = et.EmployeeId
	GROUP BY tp.Name;*/

--9 List all training programs who have no more seats available. Complete
/*SELECT tp.Name, tp.MaxAttendees, COUNT(*) AS 'NumberSigned' 
	FROM TrainingProgram tp
	LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
	GROUP BY tp.Name, tp.MaxAttendees
	HAVING COUNT(et.EmployeeId) = tp.MaxAttendees;*/


--10 List all future training programs ordered by start date with the earliest date first. Complete
/*SELECT tp.Name, tp.StartDate
	from TrainingProgram tp
	where tp.StartDate > '2019-11-01'
	ORDER BY tp.StartDate;*/


--11 Assign a few employees to training programs of your choice.
SELECT tp.Name
	from TrainingProgram tp
	LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
	LEFT JOIN Employee e ON e.Id = et.EmployeeId
	where tp.StartDate > '2019-11-01'
	GROUP BY tp.Name;

--12 List the top 3 most popular training programs. 
--   (For this question, consider each record in the training program table to be a UNIQUE training program).

--13 List the top 3 most popular training programs. 
--   (For this question consider training programs with the same name to be the SAME training program).

--14 List all employees who do not have computers.
--     inclass exercise
/*select e.*
	from Employee e
	left join ComputerEmployee ce on e.Id = ce.EmployeeId
	where ce.id is null 
		or e.id in (
			select ce.EmployeeId
				from ComputerEmployee ce
				where ce.UnassignDate is  not null
					and ce.EmployeeId not in (
					select ce.EmployeeId
				from ComputerEmployee ce
				where ce.UnassignDate is null));*/

--select * from Employee where Employee.Id = 1
	
	
	
	
	




-- 15 List all employees along with their current computer information make and manufacturer 
--    combined into a field entitled ComputerInfo. If they do not have a computer, this field should say "N/A".
				-- did this in class*/

/*SELECT e.FirstName, e.LastName, 
	ISNULL(c.Make + ' ' + c.Manufacturer, 'N/A') AS ComputerInfo
	from employee e
	left join ComputerEmployee ce on e.id = ce.EmployeeId and ce.UnassignDate is null
	left join Computer c on c.Id = ce.ComputerId;
*/	



--16 List all computers that were purchased before July 2019 that are have not been decommissioned.
--17 List all employees along with the total number of computers they have ever had.
--18 List the number of customers using each payment type
--19 List the 10 most expensive products and the names of the seller
--20 List the 10 most purchased products and the names of the seller
--21 Find the name of the customer who has made the most purchases
/*
select c.FirstName, c.LastName, count(o.CustomerId) as ordersplaced
	from Customer c
	left join [Order] o ON c.id = o.CustomerId
	group by c.FirstName, c.LastName
	order by ordersplaced DESC;

select top 1 with ties c.FirstName, c.LastName, count(o.CustomerId) as productspurchased
	from Customer c
	left join [Order] o ON c.id = o.CustomerId
	left join OrderProduct op on o.Id = op.OrderId
	group by c.FirstName, c.LastName
	order by productspurchased DESC;
*/



--22 List the amount of total sales by product type
--23 List the total amount made from all sellers