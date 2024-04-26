
select * from tb_emp;

-- ���̺� ���� (DDL: ������ ���Ǿ�)
-- �л����� ���������� ������ ������ ����
CREATE TABLE tbl_score (
    name VARCHAR2(4) NOT NULL,
    kor NUMBER(3) NOT NULL CHECK(kor >= 0 AND kor <= 100),
    eng NUMBER(3) NOT NULL CHECK(eng >= 0 AND eng <= 100),
    math NUMBER(3) NOT NULL CHECK(math >= 0 AND math <= 100),
    total NUMBER(3) NULL,
    average NUMBER(5, 2),
    grade CHAR(1),
    stu_num NUMBER(6) PRIMARY KEY
);

-- ALTER������ �������� �߰��ϱ�
-- stu_num�� �����ϰ� primary key�� �� �ɾ���
ALTER TABLE tbl_score
ADD CONSTRAINT pk_tbl_score
PRIMARY KEY (stu_num);

-- pk�� ����
ALTER TABLE tbl_score
DROP CONSTRAINT pk_tbl_score;

SELECT * FROM tbl_score;

-- �÷� �߰��ϱ�
ALTER TABLE tbl_score
ADD (sci NUMBER(3) NOT NULL);

-- �÷� �����ϱ�
ALTER TABLE tbl_score
DROP COLUMN sci;

-- drop: ���̺� ����, ������ ����
-- ���̺� ���� (CTAS)
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

DROP TABLE tb_emp_copy;

select * from tb_emp_copy;

-- TRUNCATE: 
-- ������ ����� �ȿ� �����͸� �����Ͽ�
-- ���̺��� ������ �ʱ���·� ���ư���.
TRUNCATE TABLE tb_emp_copy;