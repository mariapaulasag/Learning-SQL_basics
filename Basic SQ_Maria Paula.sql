/* Project 1 */
/* Question 1*/ /*Write a query that includes Employee_ID, Employee_Name, Street_Number, Street_Name, and Postal_Code.
Only include only those employees who have a Postal_Code value that begins with the characters 920.
Order the output table in ascending postal code order. */
select a.Employee_ID, a.Employee_Name, a.Street_Number, a.Street_Name, a.postal_Code
From project1.employee_addresses a
where postal_code like '920%'
order by postal_code;

/* Question 2*/
/*Write a query that does the following:
a.   Includes the columns Employee_ID, Employee_Name, Employee_Hire_Date, Salary, City, Department, and Job_Title.
b.   Filters the rows to include only employees from Australia (AU) who have salaries less than $100,000.
c.   Sorts the data by ascending employee name.*/
select em.Employee_ID, em.Employee_Name, em.Employee_Hire_Date, em.Salary, em.City, em.Department, em.Job_Title
FROM project1.employee_master em  
WHERE em.Country = 'AU' and em.Salary < 100000
order by em.Employee_Name;

/* Question 3 */
/*Generate a list of employee names, id numbers and job titles for employees born after January 1st 1970 who have a SALES job title
(i.e., their job title includes the word sales somewhere in it).
Sort by date of birth. */
select em.Employee_Name, em.Employee_ID, em.Job_Title
FROM project1.employee_master em
where Birth_Date > '1970-01-01' and Job_Title like '%SALES%'
order by Birth_Date;

/* Question 4 */
/*Using the employee master table, return a list of all employees (all fields) where their age at the time of being hired was at least 25 years old. */
/* To see the information organized information, I created a table calculating Employee_Age after Birth_date and Employee_Hire_Date*/
SELECT em.Employee_ID, em.Employee_Name, em.Employee_Gender, em.Birth_Date, em.Employee_Hire_Date,
TIMESTAMPDIFF(YEAR,Birth_Date, Employee_Hire_Date)as Employee_Age, em.Salary, em.Street_Number, em.Street_Name, em.City, em.State, em.Country, em.Postal_Code, em.Department, em.Job_Title, em.Manager_ID
FROM project1.employee_master em 
Having Employee_Age >= 25 
order by employee_Age;

/* Question 5 */
/* Write a query that includes the department and creates three calculated columns calculating the mean, minimum, maximum salary for each department.
Sort by department.*/
 select em.department, AVG(salary) as "Mean salary", MIN(salary) AS "Lowest salary", MAX(salary) AS "Highest salary"
 FROM project1.employee_master em
 GROUP BY em.department;
 
/* Question 6 */
/* Generate a list of departments and the number of employees within each department.  Sort by the number of employees within department.*/
SELECT em.Department, count(*) as Number_Employees
FROM project1.employee_master em
Group by em.Department
order by Number_Employees;

/* Question 7 */
/*Write a query that does the following:
a.   Includes Department and the appropriate calculated columns
b.   Calculate the number of employees, the average salary, and the total salary for each department.
c.   Filter the query to include only those departments with more than 10 employees.
d.   Sort the data by decreasing department size, based on the number of employees.*/
SELECT em.Department, count(*) as Number_Employees, AVG(salary) as average_salary, sum(salary) as total_salary 
FROM project1.employee_master em 
group by em.department 
Having Number_Employees >10
order by Number_Employees desc;