-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� 
--    ��� �޿�(salary)�� ��ȸ�ϼ���. 
--    ��, �μ���ȣ�� null�̸� 0���� �����Ͽ� ��ȸ����.

 
SELECT 
  NVL(department_id, 0) AS dep_id
  , ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY dep_id
;


-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.
--    ��, �μ���ȣ�� null�̸� 0���� �����Ͽ� ��ȸ����.
SELECT 
    NVL(department_id, 0) AS dep_id
     , COUNT(employee_id) AS total_count
FROM employees
GROUP BY department_id
ORDER BY dep_id
;




-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
    department_id,
    ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY department_id
;




-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
-- ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� ������ �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT 
    job_id
    , ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY avg_sal DESC
;