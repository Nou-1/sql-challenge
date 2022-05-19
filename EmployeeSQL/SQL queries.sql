--List the following details of each employee: employee number, last name, first name, sex and salary.
select employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", employees.sex AS "sex", salaries.salary AS "salary"
FROM employees JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name AS "first name", last_name AS "last name", hire_date AS "hire date"
FROM employees
where hire_date LIKE '%1986'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no AS "department number", departments.dept_name AS "department name", dept_manager.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name"
FROM departments JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "department name"
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name AS "first name", last_name AS "last name", sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "department name"
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "department name"
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR
departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name AS "last name", COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;