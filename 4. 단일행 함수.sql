-- # ���ڿ� ��

-- CHARŸ�Գ����� ��
DROP TABLE CHAR_COMPARE;

CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');
INSERT INTO char_compare VALUES ('103', 'SQLD', '  SQLD');

SELECT * FROM char_compare;

SELECT * FROM char_compare
WHERE sn = '103'
    AND char_4 = char_6
;

SELECT * FROM char_compare
WHERE sn = '102'
    AND char_4 > char_6
;


-- ������ VARCHARŸ���� ����� ��
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
INSERT INTO varchar_compare VALUES ('103', 'SQLD', 'SQLD');

COMMIT;

SELECT * FROM varchar_compare;

SELECT * FROM varchar_compare
WHERE sn = '101'
    AND char_4 = varchar_6
;

SELECT * FROM varchar_compare
WHERE sn = '101'
    AND char_4 = TRIM(varchar_6)
;

-- ��� ���ڿ� ��
SELECT
    *
FROM varchar_compare
WHERE sn = '101'
    AND char_4 = 'SQLD  ' -- true
;    

SELECT
    *
FROM varchar_compare
WHERE sn = '101'
    AND varchar_6 = 'SQLD  ' -- true
; 


-- ������ �Լ�
SELECT
    emp_nm, SUBSTR(addr,1,3)
FROM tb_emp
;

SELECT 
    LOWER('Hello WORLD'),  -- ���� �ҹ��ڷ� ��ȯ
    UPPER('hello World'),  -- ���� �빮�ڷ� ��ȯ
    INITCAP('abcDEF')      -- ù���ڸ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ
FROM dual;

SELECT
    ASCII('A'), -- ���ڸ� �ƽ�Ű�ڵ��
    CHR(97)     -- �ƽ�Ű�ڵ带 ���ڷ�
FROM dual;  

SELECT 
    CONCAT('SQL', 'Developer'),   -- ���ڿ��� ����
    SUBSTR('SQL Developer', 1, 3), -- ���ڿ� �ڸ� 1������ 3���ڸ� (ù���ڰ� 1��)
    LENGTH('HELLO WORLD'),         -- ���ڿ��� ����
    TRIM('    HI   '),              -- �¿� ���� ����
    LTRIM('   HELLO     '),
    RTRIM('   HELLO     '),
    LTRIM('HELLOhello', 'HE') -- ���ʿ��� �߰ߵ� HE�� ����
FROM dual;

SELECT 
    RPAD('Steve', 10, '-'), -- �����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*'),  -- ���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java Programmer Java', 'Java', 'BigData') AS "REPLACE" -- ���ڸ� ����
    , REPLACE('Java Programmer', 'Java') AS "REPLACE" -- ���ڸ� ����
FROM dual;

SELECT 
	(LENGTH(C1) - LENGTH(REPLACE(C1, CHR(10))) + 1) AS CC
FROM TAB1;



-- ## ������ �Լ�
SELECT 
    MOD(27, 5) AS MOD, -- ������ �� ��ȯ
    CEIL(38.678) AS ceil, -- �ø��� ��ȯ
    FLOOR(38.678) AS floor, -- ������ ��ȯ
    ROUND(38.678, 2) AS round, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS trunc  -- �ڸ��� ���ϸ� ����
    , ABS(-20) AS abs   -- ���밪
    , SIGN(99) AS sign  -- 0���� ������ -1, 0���� ũ�� 1, 0�̸� 0
FROM dual;



-- ## ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE
FROM dual;

SELECT SYSTIMESTAMP
FROM dual;

-- ��¥ ����
-- ��¥ + ���� = ��¥  => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥  => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ�  => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥  => ��¥�� �ð��� ����

SELECT 
    SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
    SYSDATE - (1/24) AS "1�ð� ����",
    SYSDATE - (1/24/60) * 100 AS "100�� ����",
    SYSDATE - (1/24/60/60) * 30 AS "30�� ����"
FROM dual;


-- ## ��ȯ �Լ�
SELECT * FROM char_compare
WHERE sn = 101;

-- ��¥�� ���ڷ� ��ȯ (TO_CHAR�Լ�)
-- ��¥ ��������: Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð� ��������: HH12 - ��(1~12), HH24 (0-23), MI - ��, SS - ��
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MM - DD') AS "�� - ��",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "��/��/��",
    TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') AS "��¥ - �ѱ�����",
    TO_CHAR(SYSDATE + (1/24) * 6, 'YY/MM/DD HH24:MI:SS') AS "��¥�� �ð�",
    TO_CHAR(SYSDATE - (1/24) * 6, 'YY/MM/DD AM HH12:MI:SS') AS "��¥�� �ð�2"
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
-- ���� ���� ���� -  $: �޷�ǥ��, L: ����ȭ���ȣ
SELECT
    TO_CHAR(9512 * 1.33, '$999,999.99') AS "�޷�",
    TO_CHAR(1350000, 'L999,999,999') AS "��ȭ"
FROM dual;

-- ���ڸ� ���ڷ� ��ȯ
SELECT 
    TO_NUMBER('$5,500', '$999,999') - 4000 AS "�����"
FROM dual;



-- ��¥ ��ȯ �Լ�
SELECT
    TO_DATE('20150101000000', 'YYYYMMDDHH24MISS'),
    TO_DATE('20240101', 'YYYYMMDD'),
    TO_DATE('202401', 'YYYYMM'),
    TO_CHAR(SYSDATE, 'YYYYMM')
FROM dual;



-- CASEǥ���� DECODE�Լ�
SELECT * FROM tb_sal;

-- Searched expression
SELECT 
    sal_cd, 
    sal_nm,
    CASE WHEN sal_cd = '100001' THEN '�⺻�޿�'
         WHEN sal_cd = '100002' THEN '���ʽ��޿�'
         ELSE '��Ÿ'
     END sal_name
FROM tb_sal;


-- Simple expression
SELECT 
    sal_cd, 
    sal_nm,
    CASE sal_cd 
    	  WHEN '100001' THEN '�⺻�޿�'
          WHEN '100002' THEN '���ʽ��޿�'
         ELSE '��Ÿ'
     END sal_name
FROM tb_sal;


SELECT
    sal_cd,
    DECODE(sal_cd, '100001', '�⺻�޿�', '100002', '���ʽ��޿�', '��Ÿ') AS sal_name
FROM tb_sal;


SELECT
    emp_nm,
    