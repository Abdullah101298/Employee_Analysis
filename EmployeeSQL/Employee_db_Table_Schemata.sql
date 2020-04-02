-- Drop table if exists
DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Employees_Department";
DROP TABLE IF EXISTS "Managers";
DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";
DROP TABLE IF EXISTS "Employees";

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Y3pcg9

-- Table # 1 consisting of department numbers and department names. 
CREATE TABLE "Departments" (
    "Department_Number" VARCHAR(30) NOT NULL,
    "Department_Name" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_Number"
     )
);

-- Table #2 - Showing employees, their corresponding departments, and the dates 
-- they have been working at the company. 

CREATE TABLE "Employees_Department" (
    "Employee_Number" INT NOT NULL,
    "Department_Number" VARCHAR(30) NOT NULL,
    "From_Date" VARCHAR(30) NOT NULL,
    "To_Date" VARCHAR(30) NOT NULL
);

-- Table #3 - Showing Managers, their corresponding departments, and the dates 
-- they have been working at the company. 

CREATE TABLE "Managers" (
    "Department_Number" VARCHAR(30) NOT NULL,
    "Manager_Number" INT NOT NULL,
    "From_Date" VARCHAR(30) NOT NULL,
    "To_Date" VARCHAR(30) NOT NULL
);

-- Table #4 - Showing employees, their number, name, gender, birthday, and the date 
-- they were hired. 

CREATE TABLE "Employees" (
    "Employee_Number" INT NOT NULL,
    "Birth_Date" VARCHAR(30) NOT NULL,
    "First_Name" VARCHAR(30) NOT NULL,
    "Last_Name" VARCHAR(30) NOT NULL,
    "Gender" VARCHAR(30) NOT NULL,
    "Hire_Date" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_Number"
     )
);

-- Table #5 - Showing employee number, salary, and the dates  they have 
-- been working at the company. 

CREATE TABLE "Salaries" (
    "Employee_Number" INT NOT NULL,
    "Salary_Number" INT NOT NULL,
    "From_Date" VARCHAR(30) NOT NULL,
    "To_Date" VARCHAR(30) NOT NULL
);

-- Table #6 - Showing employee number, title, and the dates  they have 
-- been working at the company.

CREATE TABLE "Titles" (
    "Employee_Number" INT NOT NULL,
    "Title" VARCHAR(30) NOT NULL,
    "From_Date" VARCHAR(30) NOT NULL,
    "To_Date" VARCHAR(30) NOT NULL
);

-- Insert foreign keys not done by QuickDBD

ALTER TABLE "Employees_Department" 
ADD CONSTRAINT "fk_Employees_Department_EMP" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Employees_Department" 
ADD CONSTRAINT "fk_Employees_Department_DPT" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Managers" 
ADD CONSTRAINT "fk_Managers_DPT" FOREIGN KEY("Department_Number")
REFERENCES "Departments" ("Department_Number");

ALTER TABLE "Managers" 
ADD CONSTRAINT "fk_Managers_EMP" FOREIGN KEY("Manager_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Salaries" 
ADD CONSTRAINT "fk_salaries_EMP" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");

ALTER TABLE "Titles" 
ADD CONSTRAINT "fk_titles_EMP" FOREIGN KEY("Employee_Number")
REFERENCES "Employees" ("Employee_Number");