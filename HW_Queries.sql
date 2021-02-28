--Query 1 - Employee details
SELECT e.emp_no 
		,last_name
		,first_name  
		,sex
		,s.salary
	FROM public."Employees" e
	left join
		public."Salaries" s on
		e.emp_no = s.emp_no;
		
--Query 2  - 1986
SELECT first_name
		, last_name
		, hire_date
	FROM public."Employees" e
	where hire_date between '1/1/1986' and '12/31/1986';

--Query 3 - Department Managers
SELECT  dm.dept_no
		, d.dept_name
		, dm.emp_no
		, e.last_name
		, e.first_name
FROM	public."dept_manager" dm
INNER JOIN
		public."Departments" d on
		dm.dept_no = d.dept_no
INNER JOIN
		public."Employees" e on
		dm.emp_no = e.emp_no;
		
--Query 4 - Departments
SELECT e.emp_no 
		, last_name
		, first_name  
		, d.dept_name
FROM public."Employees" e
INNER JOIN
		public.dept_emp de on
		e.emp_no = de.emp_no
INNER JOIN
		public."Departments" d on
		de.dept_no = d.dept_no;

--Query 5 - Hercules
SELECT first_name 
		, last_name 
		, sex
FROM public."Employees" e
WHERE
		first_name = 'Hercules'
		and last_name like ('B%');
		
--Query 6 - Sales Department
SELECT e.emp_no 
		, last_name
		, first_name  
		, d.dept_name
FROM public."Employees" e
INNER JOIN
		public.dept_emp de on
		e.emp_no = de.emp_no
INNER JOIN
		public."Departments" d on
		de.dept_no = d.dept_no
where	d.dept_name = 'Sales';

--Query 7 - Sales and Development
SELECT e.emp_no 
		, last_name
		, first_name  
		, d.dept_name
FROM public."Employees" e
INNER JOIN
		public.dept_emp de on
		e.emp_no = de.emp_no
INNER JOIN
		public."Departments" d on
		de.dept_no = d.dept_no
where	d.dept_name = 'Sales'
		or d.dept_name = 'Development';	

--Query 8 - Last Names
SELECT  last_name
		, count (emp_no) 
FROM public."Employees" e
group by last_name
order by count (emp_no) desc;