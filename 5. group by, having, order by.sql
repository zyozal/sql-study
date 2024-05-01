SELECT * FROM tb_sal_his;

-- ���� �Լ� (������ �Լ�)
-- ���� ���� ��� �ѹ��� �Լ��� ����

SELECT
    COUNT(*) "���� Ƚ��",
    SUM(pay_amt) "���� �Ѿ�",
    AVG(pay_amt) "��� ���޾�",
    MAX(pay_amt) "�ִ� ���޾�",
    MIN(pay_amt) "�ּ� ���޾�"
FROM tb_sal_his
;

SELECT
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp;


SELECT 
    * 
FROM tb_emp;

SELECT 
    COUNT(*) 
FROM tb_emp;

SELECT 
    emp_nm 
FROM tb_emp;

SELECT 
    COUNT(emp_nm) 
FROM tb_emp;

SELECT 
    emp_nm 
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT 
    COUNT(emp_nm) 
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT 
    direct_manager_emp_no
FROM tb_emp
;

SELECT 
    COUNT(direct_manager_emp_no)
FROM tb_emp
;

SELECT 
    COUNT(emp_no) "�� �����",
    MIN(birth_de) "�ֿ����� ����",
    MAX(birth_de) "�ֿ����� ����"
FROM tb_emp
;

-- �μ����� ������� �������
-- �μ����� �ֿ������� ������ ������?

-- GROUP BY : ������ �÷����� �ұ׷�ȭ �� ��
--  �� �׷캰�� �����Լ��� ���� ����

SELECT 
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT 
    dept_cd, 
    COUNT(*) "�μ��� �����",
    MIN(birth_de) "�μ��� �ֿ�����"
FROM tb_emp
GROUP BY dept_cd
;


SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� ��ձ޿���",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;

SELECT 
    emp_no, 
    emp_nm, 
    dept_cd,
  COUNT(*)
FROM tb_emp
;

SELECT 
    emp_no
FROM tb_emp
;

SELECT 
  COUNT(*)
FROM tb_emp
;

-- GROUP BY���� ����� �÷���
-- SELECT���� ������ȸ ����
SELECT 
  emp_no, COUNT(*)
FROM tb_emp
GROUP BY emp_no
;

SELECT 
  dept_cd, sex_cd, COUNT(*), MAX(birth_de)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd
;

-- ������� 2019�⿡ �޿� ��վ�, 
-- �ּ����޾�, �ִ����޾� ��ȸ

-- WHERE : ���� �� ���͸�
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� ��ձ޿���",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- HAVING : ���� �� ���͸�
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� ��ձ޿���",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;


-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.

SELECT 
    dept_cd AS dc,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd
;


SELECT
    SUBSTR(emp_nm, 1, 1)
FROM tb_emp
WHERE addr = SUBSTR(addr, 1, 2)
;



-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC
;


SELECT 
    emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY �̸� DESC
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
;


SELECT 
    emp_no
    , emp_nm en
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS ���, emp_nm AS �̸�, addr AS �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC
;

SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no DESC
;


SELECT
    emp_nm, 
    direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;




SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- ������� 2019�� ����� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ
SELECT 
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;