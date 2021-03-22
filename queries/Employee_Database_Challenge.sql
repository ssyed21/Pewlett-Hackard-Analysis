-- Deliverable 1:
select e.emp_no, e.first_name, e.last_name, t.titles, t.from_date, t.to_date
INTO retirement_info
from employees e
join titles t on e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order by emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
select DISTINCT ON (emp_no) emp_no, first_name, last_name, titles
into unique_titles
from retirement_info
order by emp_no, to_date desc;

select count(titles) as count, titles
into retiring_titles
from unique_titles
group by titles
order by count desc;

-- Deliverable 2:

select DISTINCT ON(emp_no) e.emp_no, e.first_name, e.last_name, t.titles, d.from_date, d.to_date
into mentorship_eligibilty
from employees e
join dept_emp d on e.emp_no = d.emp_no
join titles t on e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
Order by e.emp_no;