
-- 1. CREATE THE TABLE

CREATE TABLE employees (
    emp_id       SERIAL PRIMARY KEY,
    full_name    VARCHAR(100),
    department   VARCHAR(50),
    job_title    VARCHAR(50),
    salary       NUMERIC(10,2),
    experience   INT,                  -- years of experience
    joining_date DATE,
    city         VARCHAR(50),
    tech_skills  TEXT[]                -- PostgreSQL specific array type
);


-- 2. INSERT 22 ROWS OF DATA

INSERT INTO employees (full_name, department, job_title, salary, experience, joining_date, city, tech_skills) VALUES
('Ayush Mendhe',     'Data Analytics',    'Data Analyst',          47000, 1,  '2024-01-15', 'Nagpur',    ARRAY['Python', 'PowerBI', 'SQL', 'Excel']),
('Riya Sharma',      'Software Dev',      'Backend Developer',     72000, 5,  '2020-03-10', 'Pune',      ARRAY['Java', 'Spring', 'SQL']),
('Rohit Verma',      'Cyber Security',    'Security Analyst',      68000, 4,  '2021-06-22', 'Mumbai',    ARRAY['Linux', 'Networking', 'Python']),
('Sneha Desai',      'Data Analytics',    'Senior Data Analyst',   95000, 8,  '2017-07-20', 'Bangalore', ARRAY['Python', 'R', 'PowerBI', 'SQL']),
('Kabir Singh',      'Cloud Infra',       'Cloud Engineer',        62000, 3,  '2022-01-10', NULL,        ARRAY['AWS', 'Docker']),
('Ananya Gupta',     'Data Analytics',    'BI Developer',          55000, 2,  '2023-05-18', 'Nagpur',    ARRAY['SQL', 'Tableau', 'Excel']),
('Vikram Joshi',     'Software Dev',      'Full Stack Developer',  85000, 6,  '2019-08-05', 'Pune',      ARRAY['JavaScript', 'React', 'NodeJS']),
('Meera Reddy',      'Cloud Infra',       'DevOps Engineer',       90000, 9,  '2016-09-14', 'Hyderabad', ARRAY['AWS', 'Azure', 'Kubernetes', 'Docker']),
('Rahul Mehta',      'Data Analytics',    'Data Analyst',          47000, 1,  '2024-02-01', 'Nagpur',    ARRAY['Python', 'SQL']),
('Pooja Nair',       'Cyber Security',    'Penetration Tester',    78000, 6,  '2019-11-11', 'Chennai',   ARRAY['Ethical Hacking', 'Linux', 'Python']),
('Karan Malhotra',   'Software Dev',      'Junior Developer',      40000, 1,  '2024-03-15', 'Mumbai',    ARRAY['Java', 'C++']),
('Diya Kapoor',      'Data Analytics',    'ML Engineer',           98000, 7,  '2018-07-22', 'Delhi',     ARRAY['Python', 'Machine Learning', 'SQL']),
('Amitabh Das',      'Cloud Infra',       'Cloud Architect',      115000, 11, '2014-05-10', 'Kolkata',   ARRAY['GCP', 'AWS', 'Linux']),
('Tanya Menon',      'Software Dev',      'Backend Developer',     74000, 5,  '2020-09-01', NULL,        ARRAY['Python', 'Django', 'PostgreSQL']),
('Arjun Rao',        'Cyber Security',    'Security Engineer',     70000, 4,  '2021-11-12', 'Nagpur',    ARRAY['Python', 'Networking', 'Firewall']),
('Nisha Choudhury',  'Data Analytics',    'Data Analyst',          52000, 3,  '2022-04-05', 'Bangalore', ARRAY['R', 'Tableau', 'Excel']),
('Siddharth Iyer',   'Cloud Infra',       'SRE Engineer',          88000, 7,  '2018-06-20', 'Chennai',   ARRAY['AWS', 'Kubernetes', 'Terraform']),
('Riya Bhatia',      'Software Dev',      'Frontend Developer',    60000, 3,  '2022-09-10', 'Pune',      ARRAY['React', 'HTML', 'CSS', 'JavaScript']),
('Dev Patel',        'Data Analytics',    'Junior Analyst',        38000, 1,  '2024-01-01', 'Ahmedabad', ARRAY['Excel', 'SQL']),
('Kriti Jain',       'Cyber Security',    'SOC Analyst',           65000, 4,  '2021-12-15', 'Mumbai',    ARRAY['SIEM', 'Linux', 'Networking']),
('Varun Khanna',     'Software Dev',      'Full Stack Developer',  80000, 5,  '2020-08-25', 'Delhi',     ARRAY['JavaScript', 'HTML', 'CSS', 'NodeJS']),
('Alia Sinha',       'Data Analytics',    'Lead Data Scientist',  120000, 12, '2013-07-18', 'Mumbai',    ARRAY['Python', 'SQL', 'ML', 'Hadoop']),
('Ayush Mendhe',     'Data Analytics',    'Data Analyst',          58000, 2,  '2023-01-15', 'Nagpur',    ARRAY['Python', 'PowerBI', 'SQL', 'Excel']);

SELECT * FROM employees



-- DIFFERENT WAYS TO USE THE "WHERE" CLAUSE


-- 1. BASIC COMPARISON OPERATORS

-- Equal to (=)
-- Find all employees in the Data Analytics department
SELECT * FROM employees
WHERE department = 'Data Analytics';

-- Not equal to (!=)
-- Find employees NOT located in Mumbai
SELECT * FROM employees
WHERE city != 'Mumbai';

-- Not equal to (Standard SQL <>)
-- Find employees NOT in the Pune office
SELECT * FROM employees
WHERE city <> 'Pune';

-- Greater than (>)
-- Find employees earning more than 80,000
SELECT * FROM employees
WHERE salary > 80000;

-- Less than (<)
-- Find employees with less than 3 years of experience
SELECT * FROM employees
WHERE experience < 3;

-- Greater than or equal to (>=)
-- Find employees with 5 or more years of experience
SELECT * FROM employees
WHERE experience >= 5;

-- Less than or equal to (<=)
-- Find employees earning 50,000 or less (entry-level salaries)
SELECT * FROM employees
WHERE salary <= 50000;


-- 2. LOGICAL OPERATORS

-- AND: Both conditions must be true
-- Find Data Analytics employees specifically located in Nagpur
SELECT * FROM employees
WHERE department = 'Data Analytics' AND city = 'Nagpur';

-- OR: At least one condition must be true
-- Find employees located in either Pune or Mumbai
SELECT * FROM employees
WHERE city = 'Pune' OR city = 'Mumbai';

-- NOT: The condition must be false
-- Find employees who are NOT in the Software Dev department
SELECT * FROM employees
WHERE NOT (department = 'Software Dev');


-- 3. PATTERN MATCHING (STRINGS)

-- LIKE (Case-Sensitive): Names starting with 'A'
SELECT * FROM employees
WHERE full_name LIKE 'A%';

-- LIKE with underscore: Job titles where 2nd character is 'a'
-- (e.g., Data Analyst, Back..etc)
SELECT * FROM employees
WHERE job_title LIKE '_a%';

-- ILIKE (Case-Insensitive - PostgreSQL Specific): Names containing 'sharma'
SELECT * FROM employees
WHERE full_name ILIKE '%sharma%';

-- POSIX Regex (~): Case-sensitive - Names starting with 'R' and ending with 'a'
SELECT * FROM employees
WHERE full_name ~ '^R.*a$';

-- POSIX Regex (~*): Case-insensitive - Names starting with a vowel
SELECT * FROM employees
WHERE full_name ~* '^[AEIOU]';

-- POSIX Regex NOT Match (!~*): Case-insensitive - Names NOT starting with a vowel
SELECT * FROM employees
WHERE full_name !~* '^[aeiou]';


-- 4. LISTS AND RANGES

-- IN: Exists in this exact list
-- Find employees in Bangalore, Hyderabad, or Chennai
SELECT * FROM employees
WHERE city IN ('Bangalore', 'Hyderabad', 'Chennai');

-- NOT IN: Does not exist in this list
-- Find employees NOT in Nagpur, Pune, or Mumbai
SELECT * FROM employees
WHERE city NOT IN ('Nagpur', 'Pune', 'Mumbai');

-- BETWEEN: In this inclusive range
-- Find employees earning between 50,000 and 90,000
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 90000;

-- NOT BETWEEN: Outside of this inclusive range
-- Find employees who joined outside the year 2021–2022
SELECT * FROM employees
WHERE joining_date NOT BETWEEN '2021-01-01' AND '2022-12-31';


-- 5. HANDLING MISSING DATA (NULLs)

-- IS NULL: Find employees whose city information is missing
SELECT * FROM employees
WHERE city IS NULL;

-- IS NOT NULL: Find employees who have a city assigned
SELECT * FROM employees
WHERE city IS NOT NULL;


-- 6. SUBQUERIES AND EXISTENCE

-- EXISTS: Find employees in cities where at least one person earns above 90,000
SELECT * FROM employees e1
WHERE EXISTS (
    SELECT 1 FROM employees e2
    WHERE e1.city = e2.city AND e2.salary >= 90000
);

-- Scalar Subquery: Find employees who earn more than the company average salary
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- ANY: Find employees whose salary is higher than at least one Cyber Security employee
SELECT * FROM employees
WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'Cyber Security');

-- ALL: Find employees whose experience is greater than EVERY Cloud Infra employee
SELECT * FROM employees
WHERE experience > ALL (SELECT experience FROM employees WHERE department = 'Cloud Infra');


-- 7. WHERE with JOINs

-- (Self Join Example)
-- Find employees in the same city as 'Ayush Mendhee'
SELECT e2.full_name, e2.city, e2.department
FROM employees e1
JOIN employees e2 ON e1.city = e2.city
WHERE e1.full_name = 'Ayush Mendhee'
  AND e2.full_name != 'Ayush Mendhee';


-- 8. WHERE vs HAVING (Pre-Grouping Filter)

-- WHERE filters rows BEFORE grouping, HAVING filters AFTER grouping
-- Find departments where average salary is above 70,000
-- (Only considering employees with more than 1 year of experience)
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE experience > 1                   -- filters individual rows first
GROUP BY department
HAVING AVG(salary) > 70000;           -- filters group result after


-- 9. WHERE with BUILT-IN FUNCTIONS

-- Using UPPER() function
-- Find employee with name 'AYUSH MENDHEE' (case-insensitive search)
SELECT * FROM employees
WHERE UPPER(full_name) = 'AYUSH MENDHEE';

-- Using LENGTH() function
-- Find employees whose full name has more than 12 characters
SELECT * FROM employees
WHERE LENGTH(full_name) > 12;

-- Using EXTRACT() date function
-- Find employees who joined in the year 2024
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2024;

-- Using CAST() for type conversion
-- Find employees who joined on or after January 1, 2022
SELECT * FROM employees
WHERE CAST(joining_date AS DATE) >= '2022-01-01';


-- 10. WHERE in UPDATE Statement

-- Give a 10% salary raise to all Data Analytics employees in Nagpur
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'Data Analytics' AND city = 'Nagpur' AND emp_id = 6;


-- 11. WHERE in DELETE Statement

-- Remove all employee records with less than 1 year of experience
DELETE FROM employees
WHERE experience <= 1;


-- 12. ARRAY OPERATORS (PostgreSQL Specific)

-- Contains (@>): Find employees who have BOTH 'Python' AND 'SQL' in their skills
SELECT * FROM employees
WHERE tech_skills @> ARRAY['Python', 'SQL'];

-- Is Contained By (<@): Find employees whose entire skill set is within this list
SELECT * FROM employees
WHERE tech_skills <@ ARRAY['HTML', 'CSS', 'JavaScript', 'NodeJS'];

-- Overlap (&&): Find employees who have EITHER 'AWS' OR 'Docker' in their skills
SELECT * FROM employees
WHERE tech_skills && ARRAY['AWS', 'Docker'];

-- ANY with array column: Find employees who have 'Excel' as one of their skills
SELECT * FROM employees
WHERE 'Excel' = ANY(tech_skills);


-- 13. JSON/JSONB OPERATORS (PostgreSQL Specific)

-- (Requires adding a jsonb column: ALTER TABLE employees ADD COLUMN metadata JSONB;)

-- JSON Contains (@>): Find employees who are on a project named 'Apollo'
SELECT * FROM employees
WHERE metadata @> '{"project": "Apollo"}'::jsonb;

-- JSON Has Key (?): Find employees who have a 'bonus' field in their metadata
SELECT * FROM employees
WHERE metadata ? 'bonus';

-- JSON Key Value Access (->>): Find employees on a 'Remote' work mode
SELECT * FROM employees
WHERE metadata->>'work_mode' = 'Remote';


-- 14. FULL-TEXT SEARCH (PostgreSQL Specific)

-- (Requires adding a text column: ALTER TABLE employees ADD COLUMN bio TEXT;)

-- Match (@@): Find employees whose bio contains the word 'data' or 'analytics'
SELECT * FROM employees
WHERE to_tsvector('english', bio) @@ to_tsquery('english', 'data & analytics');


-- To add new columns for 13th and 14th category
-- (Requires adding a jsonb column: ALTER TABLE employees ADD COLUMN metadata JSONB;)
-- (Requires adding a text column: ALTER TABLE employees ADD COLUMN bio TEXT;)

ALTER TABLE employees ADD COLUMN metadata JSONB;
ALTER TABLE employees ADD COLUMN bio TEXT;

UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 1;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Hybrid", "bonus": false}'::jsonb WHERE emp_id = 2;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 3;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Office", "bonus": true}'::jsonb WHERE emp_id = 4;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Remote", "bonus": false}'::jsonb WHERE emp_id = 5;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Hybrid", "bonus": true}'::jsonb WHERE emp_id = 6;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Office", "bonus": false}'::jsonb WHERE emp_id = 7;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 8;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Hybrid", "bonus": true}'::jsonb WHERE emp_id = 9;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Remote", "bonus": false}'::jsonb WHERE emp_id = 10;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Office", "bonus": false}'::jsonb WHERE emp_id = 11;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 12;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Hybrid", "bonus": true}'::jsonb WHERE emp_id = 13;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": false}'::jsonb WHERE emp_id = 14;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Office", "bonus": true}'::jsonb WHERE emp_id = 15;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Hybrid", "bonus": false}'::jsonb WHERE emp_id = 16;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 17;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Office", "bonus": false}'::jsonb WHERE emp_id = 18;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 19;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Hybrid", "bonus": true}'::jsonb WHERE emp_id = 20;
UPDATE employees SET metadata = '{"project": "Zeus", "work_mode": "Remote", "bonus": false}'::jsonb WHERE emp_id = 21;
UPDATE employees SET metadata = '{"project": "Titan", "work_mode": "Office", "bonus": true}'::jsonb WHERE emp_id = 22;
UPDATE employees SET metadata = '{"project": "Apollo", "work_mode": "Remote", "bonus": true}'::jsonb WHERE emp_id = 23;

UPDATE employees SET bio = 'Ayush is a data analyst skilled in Python and SQL for business analytics.' WHERE emp_id = 1;
UPDATE employees SET bio = 'Riya is a backend developer focused on building scalable Java applications.' WHERE emp_id = 2;
UPDATE employees SET bio = 'Rohit specializes in network security and threat detection using Linux tools.' WHERE emp_id = 3;
UPDATE employees SET bio = 'Sneha is a senior data analytics expert proficient in R and business intelligence.' WHERE emp_id = 4;
UPDATE employees SET bio = 'Kabir is a cloud engineer managing AWS infrastructure and container deployments.' WHERE emp_id = 5;
UPDATE employees SET bio = 'Ananya is a BI developer creating data dashboards and analytics reports.' WHERE emp_id = 6;
UPDATE employees SET bio = 'Vikram is a full stack developer building modern web applications with React.' WHERE emp_id = 7;
UPDATE employees SET bio = 'Meera is a DevOps engineer automating cloud deployments on Azure and AWS.' WHERE emp_id = 8;
UPDATE employees SET bio = 'Rahul is a junior data analyst working on analytics and SQL reporting.' WHERE emp_id = 9;
UPDATE employees SET bio = 'Pooja is an ethical hacking expert conducting penetration testing on systems.' WHERE emp_id = 10;
UPDATE employees SET bio = 'Karan is a junior developer learning Java and object-oriented programming concepts.' WHERE emp_id = 11;
UPDATE employees SET bio = 'Diya is a machine learning engineer building predictive analytics models with Python.' WHERE emp_id = 12;
UPDATE employees SET bio = 'Amitabh is a cloud architect designing large-scale GCP and AWS infrastructure.' WHERE emp_id = 13;
UPDATE employees SET bio = 'Tanya is a backend developer building REST APIs using Python and Django framework.' WHERE emp_id = 14;
UPDATE employees SET bio = 'Arjun is a security engineer handling firewall configurations and network protection.' WHERE emp_id = 15;
UPDATE employees SET bio = 'Nisha is a data analyst specializing in R programming and Tableau visualizations.' WHERE emp_id = 16;
UPDATE employees SET bio = 'Siddharth is an SRE engineer ensuring system reliability using Kubernetes and Terraform.' WHERE emp_id = 17;
UPDATE employees SET bio = 'Riya is a frontend developer building responsive user interfaces using React.' WHERE emp_id = 18;
UPDATE employees SET bio = 'Dev is a junior analytics trainee learning SQL and Excel for data reporting.' WHERE emp_id = 19;
UPDATE employees SET bio = 'Kriti is a SOC analyst monitoring security events and analyzing threat intelligence.' WHERE emp_id = 20;
UPDATE employees SET bio = 'Varun is a full stack developer working on JavaScript-based web applications.' WHERE emp_id = 21;
UPDATE employees SET bio = 'Alia is a lead data scientist with expertise in big data analytics and Hadoop ecosystem.' WHERE emp_id = 22;
UPDATE employees SET bio = 'Ayush is a data analyst skilled in Python and SQL for business analytics.' WHERE emp_id = 23;

SELECT * FROM employees