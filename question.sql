-- 1. Tasks for a specific project with employees     (basiically  this shows who is doing what task in project)
SELECT t.task_description, e.name
FROM tasks as t
JOIN employees as e ON t.assignee_id = e.employee_id
WHERE t.project_id ;

-- 2. Number of projects per client     (this gives project count for each client)
SELECT client_id, COUNT(*) AS total_projects
FROM projects
GROUP BY client_id;
-- (all client have only one project becoz this enters are full-focuse enters with one client one project )

-- 3. Employees assigned to more than 1 tasks     (this syntax helps to find more than 1 task assigned)
SELECT employee_id, COUNT(*) AS total_tasks
FROM task_assignments
GROUP BY employee_id
HAVING COUNT(*) > 1;

-- 4. Completed tasks per project     (shows progress of each project)
SELECT project_id, COUNT(*) AS completed_tasks
FROM tasks
WHERE status = 'Completed'
GROUP BY project_id;

-- 5. Overdue projects     (finds late projects)
SELECT *FROM projects
WHERE deadline < CURDATE() -- Current Date for comparation 
AND status != 'Completed'; -- != not equal to


-- 6. Client with most projects     (finds top clients with most projects)
SELECT client_id, COUNT(project_id) AS total_projects
FROM projects
GROUP BY client_id
ORDER BY total_projects DESC
LIMIT 1; -- ( here in enters all client have only one project becoz this enters are full-focuse enters with one client one project )

-- 7. Average number of tasks per project     
SELECT AVG(task_count) AS avg_tasks
FROM (SELECT project_id, COUNT(task_id) AS task_count 
FROM tasks
GROUP BY project_id) AS t;

-- 8. Employees with no assigned tasks     ( finds free emp with no assigned tasks)
SELECT *FROM employees
WHERE employee_id NOT IN (
SELECT assignee_id FROM tasks);

-- 9. Project with highest number of assigned employees
SELECT project_id, COUNT(DISTINCT assignee_id) AS total_employees
FROM tasks
GROUP BY project_id
ORDER BY total_employees DESC
LIMIT 1;

-- 10. Tasks due in next 7 days     (shows upcoming deadlines)
SELECT *
FROM tasks
WHERE due_date BETWEEN '2025-03-20' AND '2025-03-27';


-- conclusion : this projects shows how databases helps in task traking, resource mngt, decision making.