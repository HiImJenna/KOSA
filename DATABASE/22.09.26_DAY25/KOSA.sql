show user; 
--USER��(��) "KOSA"�Դϴ�.

/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper , https://dbeaver.io/),
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : KOSA

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. ���� ���� ���� Ȯ�� : show user;   >> USER��(��) "KOSA"�Դϴ�.


-- USER SQL
CREATE USER "KOSA" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "KOSA" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "KOSA" WITH ADMIN OPTION;
ALTER USER "BITUSER" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES


*/

show user;

/*
�ǽ��ڵ�

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/
select * from emp;
select * from dept;
select * from salgrade;


-----------------------------------

 --1. ������̺��� ��� �����͸� ����ϼ���
 -- ������ ��ҹ��� ���� (x)
select * from emp;
SELECT * FROM emp;

--2. Ư�� �÷� ������ ����ϱ�
select empno, ename, sal
from emp;

select ename from emp;

--3. �÷��� ����Ī(alias) ��Ī �ο��ϱ�
select empno ���, ename �̸�
from emp;

--select empno ��      ��, ename ��     ��
--from emp;

select empno "��     ��", ename "��     ��"
from emp;

-- SQL ǥ�ع��� ( ANSI ���� ) >> ǥ�� >> oracle or MS-sql or Mysql���� ��� ����
select empno as "��     ��", ename as "��     ��"
from emp;

-- Oracle ���� ���ڿ� �����ʹ� '' ����ؼ� ǥ��
-- Oracle ���ڿ� ������ �����ϰ� ��ҹ��� ���� 
/*
JAVA : ���� 'A', ���ڿ� "AAA"
Oracle : ���ڿ� 'A', 'AA', 'AAA'
Oracle :  A, a >> �ٸ� ����
*/
select empno, ename
from emp
where ename = 'KING'

/*
select �� 3��
from �� 1��
where�� 2��
*/

--Oracle query(���Ǿ�) : ���
--������
--JAVA : + ����(�������)
--JAVA : + ���ڿ�(���տ���)
--������ : ���հ� ��� �и�
--Oracle ���տ����� : ||
--Oracle ��������� : + (���)

select '����� �̸���' || ename || '�Դϴ�' as "�������"
from emp;

desc emp;

/*
Ÿ��
java class EMP { private int empno, private String ename }
oracle create table Emp(empno number, ename varchar2(20);
oracle(�÷�) : ����, ���ڿ�, ��¥
varchar2(10) >> 10 : 10byte > �ѱ� 1�� 2byte, ������&Ư������&���� 1byte
--�ѱ� 5��, ���� 10��
*/

--����ȯ(���������� ���� (���ڿ���) �ڵ� ����ȯ
select empno || ename -- ���� || ���ڿ�
from emp;

select empno + ename --ORA-01722: invalid number
from emp;

--�츮 ȸ�翡 ������ ��� �ֳ� Ȯ��
select job from emp; --©��
--�ߺ������͸� �����ϴ� Ű���� : disitnct
select distinct job from emp;

-- distinct ���� >> �׷���
select distinct deptno, job
from emp
order by deptno;

-- Oracle������
-- java ���� ����  ( + - * / ) ������ %
-- Oracle ����    ( + - * / ) ������ �����ڴ� ���� >> �Լ��� ���ؼ� Mod()
-- eame like '%��%'

--������̺��� ����� �޿��� 100�޶� �λ��� ����� ����ϼ��� : 
select empno, ename, sal, sal+100 as "�λ�޿�"
from emp;

desc emp;

--dual �ӽ� �������̺�
select 100 + 100 from dual; --dual�� �ִٰ� �����ϰ�..?!
select 100 || 100 from dual; --100100
select '100' + 100 from dual; --������ ����(����ȯ����) ****
select 'A100' + 100 from dual; --Error 
-- �ȿ� ���빰�� ���ڷ� ���� �����ϴٸ�..!!


