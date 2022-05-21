select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary  
from employee_salary
join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name
from employee_salary
join employees on employee_salary.employee_id  = employees.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary
from salary
join employee_salary on salary.id  = employee_salary.salary_id
left join employees on employee_salary.employee_id  = employees.id 
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary
from salary
join employee_salary on salary.id  = employee_salary.salary_id
left join employees on employee_salary.employee_id  = employees.id 
where employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary
from employee_salary
join salary on employee_salary.salary_id = salary.id 
right join employees on employee_salary.employee_id  = employees.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Java%';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Manual%QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
where role_name like '%Automation%QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, role_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков

select monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Java%';

-- 16. Вывести зарплаты Python разработчиков

select monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Senior JavaScript%';

-- 20. Вывести зарплаты Junior QA инженеров

select employee_name, monthly_salary
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on salary.id = employee_salary.salary_id 
where role_name like '%Junior%QA%engineer%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as Средняя_зарплата
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as Сумма_зарплат_JS_разработчиков
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
where role_name like '%JavaScript developer%';

--23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as Минимальная_ЗП_QA_инженеров
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
where role_name like '%QA%engineer%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as Минимальная_ЗП_QA_инженеров
from roles_employee
join employees on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id
join employee_salary on employees.id = employee_salary.employee_id 
join salary on salary.id = employee_salary.salary_id 
where role_name like '%QA%engineer%';

-- 25. Вывести количество QA инженеров

select count(role_id)
from roles_employee
join roles on roles_employee.role_id = roles.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(role_id)
from roles_employee
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(role_id)
from roles_employee
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary)
from salary 
join employee_salary on salary.id = employee_salary.salary_id 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

select employee_name, role_name, monthly_salary 
from employees
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
order by 3;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary 
from employees
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where monthly_salary between 1700 and 2300
order by 3;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary 
from employees
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where monthly_salary < 2300
order by 3;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary 
from employees
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles.id = roles_employee.role_id
where monthly_salary in(1100, 1500, 2000)
order by 3;

