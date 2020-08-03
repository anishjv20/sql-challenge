-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name
SELECT
	d.dept_no department_number,
	d.dept_name department_name,
	e.emp_no,
	e.last_name manager_last_name,
	e.first_name manager_first_name
FROM employees e
INNER JOIN dept_manager m
ON m.emp_no = e.emp_no
INNER JOIN departments d
ON d.dept_no = m.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, 
-- and department name
SELECT
	e.emp_no,
	e.last_name employee_last_name,
	e.first_name employee_first_name,
	d.dept_name department_name
FROM employees e
INNER JOIN dept_emp m
ON m.emp_no = e.emp_no
INNER JOIN departments d
ON d.dept_no = m.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' ;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name employee_last_name,
	e.first_name employee_first_name,
	d.dept_name department_name
FROM employees e
INNER JOIN dept_emp m
ON m.emp_no = e.emp_no
INNER JOIN departments d
ON d.dept_no = m.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name
SELECT last_name, COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

