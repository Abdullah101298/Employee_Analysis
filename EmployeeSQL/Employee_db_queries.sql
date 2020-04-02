-- Task #1 - t the following details of each employee: employee number, last name, 
-- first name, gender, and salary.

SELECT "Employees"."Employee_Number", "Employees"."First_Name",
  "Employees"."Last_Name", "Employees"."Gender",
  "Salaries"."Salary_Number"
FROM "Employees"
INNER JOIN "Salaries" ON
"Employees"."Employee_Number" = "Salaries"."Employee_Number";

-- Task #2 - List employees who were hired in 1986.

select * from "Employees"
where "Hire_Date" like '%1986%';

-- Task #3 - List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.

SELECT "Managers"."Department_Number", "Departments"."Department_Name",
  "Managers"."Manager_Number", "Employees"."Last_Name",
  "Employees"."First_Name", "Managers"."From_Date",
  "Managers"."To_Date"
FROM "Managers"
INNER JOIN "Departments" ON
"Managers"."Department_Number" = "Departments"."Department_Number"
INNER JOIN "Employees" ON
"Managers"."Manager_Number" = "Employees"."Employee_Number";

-- Task 4: List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT 
  "Employees_Department"."Employee_Number",
  "Employees"."Last_Name", "Employees"."First_Name",
  "Departments"."Department_Name"
FROM "Employees"
INNER JOIN "Employees_Department" ON
"Employees"."Employee_Number" = "Employees_Department"."Employee_Number"
INNER JOIN "Departments" ON
"Employees_Department"."Department_Number" = "Departments"."Department_Number";

--- Task 5: List all employees whose first name is "Hercules" and last names 
--- begin with "B."

select * from "Employees" 
where ("First_Name" = 'Hercules' and "Last_Name" like 'B%')

--- Task 6: List all employees in the Sales department, including their employee 
--- number, last name, first name, and department name.

SELECT "Employees_Department"."Employee_Number", 
"Employees"."Last_Name", "Employees"."First_Name", 
"Departments"."Department_Name"
FROM "Employees_Department"
JOIN "Employees" ON 
"Employees_Department"."Employee_Number" = "Employees"."Employee_Number"
JOIN "Departments" ON 
"Departments"."Department_Number" =  "Employees_Department"."Department_Number"
WHERE "Departments"."Department_Name" = 'Sales';


--- Task 7: List all employees in the Sales and Development departments, including 
--  their employee number, last name, first name, and department name.


SELECT "Employees_Department"."Employee_Number", 
"Employees"."Last_Name", "Employees"."First_Name", 
"Departments"."Department_Name"
FROM "Employees_Department"
JOIN "Employees" ON 
"Employees_Department"."Employee_Number" = "Employees"."Employee_Number"
JOIN "Departments" ON 
"Departments"."Department_Number" =  "Employees_Department"."Department_Number"
WHERE "Departments"."Department_Name" = 'Sales' OR 
"Departments"."Department_Name" = 'Development';

--- Task 8: In descending order, list the frequency count of employee last names, 
--  i.e., how many employees share each last name.

Select "Last_Name", count("Last_Name") from "Employees"
GROUP BY "Last_Name"
ORDER BY COUNT("Last_Name") DESC;
