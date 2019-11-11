--List each employee first name, last name and supervisor status along with their department name. 
--Order by department name, then by employee last name, and finally by employee first name.
/*SELECT FirstName + ' ' + LastName AS FullName, IsSupervisor, d.Name
	FROM Employee e
	LEFT JOIN Department d ON d.Id = e.DepartmentId 
	ORDER BY d.Name, e.LastName, e.FirstName;*/

--List each department ordered by budget amount with the highest first.


--List each department name along with any employees (full name) in that department who are supervisors.


--List each department name along with a count of employees in each department.


--Write a single update statement to increase each department's budget by 20%.


--List the employee full names for employees who are not signed up for any training programs.








--List the employee full names for employees who are signed up for at least one training program 
--and include the number of training programs they are signed up for.