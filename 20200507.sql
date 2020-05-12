I-
4����ȸ
SELECT *
FROM dept;

5�� ��ȸ
INSERT INTO dept VALUES (99,'ddit','daejeon');

view�� ������
ddl- > drop- data ���� (rollback �ȵ�)

SELECT *
FROM ranger;

DDL : DATA Definition Language
�����͸� �����ϴ� ���
CREATE, DROP, ALTER
DELETE �� INSERT �����Ŵ� ROLLBACK �� ��ȸ�� �ѹ� ������
****DDL�� ���� �ڵ� Ŀ��(ROLLBACK �Ұ�)****

name CHAR(10)
'test' �̸� 'test     ' �� �ȴ�

name CHAR(10)
���̺� ����
����: DROP TABLE ������ ���̺� ��;

ranger ���̺� ����
DROP TABLE ranger;

ROLLBACK;

SELECT *
FROM ranger;
drop
TABLE ����
����
CREATE TABLE [������].���̺���(
    �÷���1 �÷�Ÿ�� DEFAULT ������ �⺻��,
    �÷���2 �÷�Ÿ��,....
    
    �÷���3 �÷�Ÿ�� �������� �޸� ��
);
CREATE TABLE ranger(
    ranger_no NUMBER,
    ranger_nm VARCHAR2(50),
    reg_dt DATE);
ROLLBACK;
ranger ���̺��� ������ ���� �÷����� ����
ranger_no �÷��� NUMBER Ÿ������
ranger_nm �÷��� VARCHAR2(50) Ÿ������
reg_dt �÷��� DATE Ÿ������ (�� �⺻���� �Է� ����� ������ ���� �ð�)

CREATE TABLE ranger(
    ranger_no NUMBER,
    ranger_nm VARCHAR2(50),
    reg_dt DATE DEFAULT SYSDATE);
DROP TABLE ranger;

INSERT INTO ranger (ranger_no, ranger_nm) VALUES (1, 'brown');
ROLLBACK;
    
SELECT *
FROM ranger;

ranger_no 1
ranger_nm 'brown'

INSERT INTO ranger (ranger_no, ranger_nm, reg_dt) VALUES (1, 'brown', '20/05/01');
reg_dt �÷��� ���� ������ �Է����� �ʾ����� ���̺� ������ ���� 
�⺻�� SYSDATE �� �Էµȴ�.

check
member ���̺� �����̶�� �÷��� ������
���� �÷��� ��� �� �� �ִ� ��: ����, ����, ���� --���⼭ ���ڰ� ���� �ȵ�
�׷��� check �� �������ش�


��������: �������� ���Ἲ�� ��Ű�� ���� ����
�� 4���� ���������� ����
    UNIQUE: ������ �÷��� ���� �ٸ����� ���� �ߺ����� �ʵ��� ����
            ex) ���, �й�
    PRIMARY KEY: UNIQUE ���� + NOT NULL CHECK ����
            ���� �����ؾ� �ϸ�, ���� �ݵ�� ���;� �ϴ� �÷�
            ex) ���, �й�
    FOREIGN KEY: �ش� �÷��� �����ϴ� ���̺��� ���� �����ϴ��� Ȯ���ϴ� ����
            ex) emp���̺��� �űԻ���� ��Ͻ� deptno ���� dept ���̺��� �ݵ��
                �����ϴ� ���� ����� �����ϴ�
    CHECK: �÷��� �ԷµǴ� ���� �����ڰ� ���� ������ ���� üũ, ���� �ϴ� ����
            ex) ���� �÷��� ���� F, M �ΰ��� ���� �� �� �ֵ��� ����
            
���������� �����ϴ� ���
1. ���̺� ������ �÷� �����ٰ� �ش� �÷��� ����� ���������� ���
    ==> �����÷� ������ �Ұ�
2. ���̺� ������ �÷� ����� ������ �ش� ���̺��� ����� ���������� ���
    ==> �����÷� ���� ����
3. ���̺� ���� ����, ������ �������Ǹ� �ش� ���̺��� ����
    ==> ���̺� ����, �����÷� ���� ����
    
1.���̺� ������ �÷� ���� ���������� ���
DESC dept;

�μ���ȣ�� �ߺ��� �Ǹ� �ȵǰ�, ���� ��� �־�� �ȵȴ� (�Ϲ�������)
==> dbms  ���� ���� ������ PRIMARY KEY ���������� �÷� ������ ����

DROP TABLE dept_test;

�������� �̸��� ������� ���� ��� ����Ŭ DBMS �� �ڵ�����
�������� �̸��� �ٿ��ش�
CREATE TABLE dept_test(
    dept NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
    
);

SELECT *
FROM dept_test;

INSERT INTO dept_test VALUES ( 99, 'ddit', 'daejeon');
�� ������ ���������� ����

INSERT INTO dept_test VALUES ( 99, 'ddit2', 'daejeon');
�� ������ ù��° �������� �Է��� �μ���ȣ�� �ߺ� �Ǳ� ������
PRIMARY KEY(UNIQUE) ���� ���ǿ� ����Ǿ� ���������� �����Ͱ� �Էµ��� �ʴ´�
  ==> �츮�� ������ ������ ���Ἲ�� ��������
    
    
DROP TABLE dept_test;

�������� �̸��� ����� ���� �ִ�
�ش� ������ �������� ���� ��Ģ�� ����� �Ѵ�
PRIMARY KEY : pk_���̺���
UNIQUE : u_���̺���
FOREIGN KEY : fk_���̺���_�������̺���
NOT NULL, CHECK : ������ �̸��� ������� �ʴ´�

CREATE TABLE dept_test(
    dept NUMBER(2) CONSTRAINT pk_dept_test PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
    
);

2. ���̺� ������ �÷� ����� ������ �ش� ���̺��� ����� ���������� ���
DROP TABLE dept_test;
    
CREATE TABLE dept_test(
    deptno NUMBER(2),
    dname VARCHAR2(14),
    loc VARCHAR2(13),
    
    CONSTRAINT pk_dept_test PRIMARY KEY (deptno, dname) --�����÷��̸� �޸��� ����
                                                        --
);      
dept_test ���̺��� deptno, dname���� PRIMARY KEY ���������� ����
�ΰ� �÷��� ��� ���ƾ������� �ߺ��Ǵ� ������ �ν�

INSERT INTO dept_test VALUES (99, 'ddit', 'daejeon');
INSERT INTO dept_test VALUES (99, 'ddit2', 'daejeon');

deptno, dname �÷��� ��� �������� ����
INSERT INTO dept_test VALUES (99, 'ddit2', 'daejeon');

SELECT *
FROM dept_test;


