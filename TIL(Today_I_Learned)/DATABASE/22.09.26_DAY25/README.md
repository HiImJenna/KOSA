# 2022.09.26.MON π
----------------
<br>

## 1. 1μ°¨νλ‘μ νΈ μ‘°λ³ λ°ν β
<br>

## 2. Oracle β
<br>

### π Oracle λ²μ 
#### - [Express Edition] : κ°λ° λ° λ°°ν¬κ° μμ λ‘μ (λ¬΄λ£)  
![image](https://camo.githubusercontent.com/297829349af8be25e4e0f8799452b0d0cd3a58031e5385a0a153a69deb74300e/68747470733a2f2f706f737466696c65732e707374617469632e6e65742f32303134303832385f3235332f6974755f6974755f3134303932313330323237363174336a37465f4a5045472f2542462543302542362546332543352541432542392546362543302546432542412542302543322546372543302543432543312541315f312e6a70673f747970653d7732)
<br>

#### - [Standard Edition One] : νμ μ£Όλ‘ μ¬μ©  
![image](https://camo.githubusercontent.com/3c64fb2e2d5fc48254d5236813f1bbddee0db160b7bcccadf2f259f965657d99/68747470733a2f2f706f737466696c65732e707374617469632e6e65742f32303134303832385f3234342f6974755f6974755f31343039323133303233333935754d47566b5f4a5045472f2542462543302542362546332543352541432542392546362543302546432542412542302543322546372543302543432543312541315f322e6a70673f747970653d7732)
<br>

#### - [Standard Edition] : νμ μ£Όλ‘ μ¬μ©  
![image](https://camo.githubusercontent.com/c60681d0573d909e511663f7c11cac47963cf44863a1f6d7fe9094b1282d6bcb/68747470733a2f2f706f737466696c65732e707374617469632e6e65742f32303134303832385f3234362f6974755f6974755f31343039323133303233313232663164786f5f4a5045472f2542462543302542362546332543352541432542392546362543302546432542412542302543322546372543302543432543312541315f332e6a70673f747970653d7732)
<br>

#### - [Enterprise Edition] : ν° κΈ°μμμ μ¬μ©  
![image](https://camo.githubusercontent.com/21a6854283b1de4b700a01027786e1dcf12eedb29228467790eab754a8b71cd1/68747470733a2f2f706f737466696c65732e707374617469632e6e65742f32303134303832385f3139312f6974755f6974755f313430393231333032343333337a6b6d374d5f4a5045472f2542462543302542362546332543352541432542392546362543302546432542412542302543322546372543302543432543312541315f342e6a70673f747970653d7732)
<br>

#### - [μ μ²΄ λΉκ΅]  
![image](https://camo.githubusercontent.com/c3f019cb101d8f7ea4cf4a40ba1c74f12d362d72617ee9335dc7d0cea47cc825/68747470733a2f2f706f737466696c65732e707374617469632e6e65742f32303134303832385f3139332f6974755f6974755f3134303932313330323430363148613470735f4a5045472f2542462543302542362546332543352541432542392546362543302546432542412542302543322546372543302543432543312541315f352e6a70673f747970653d7732)
<br>

### π Oracle SQL developer
![imgae](https://user-images.githubusercontent.com/92353613/192208966-be028bbe-7c2d-4f85-981f-3287efc8cbc7.png)  
βΆ μ μ νμ©!  
<br>  

![image](https://user-images.githubusercontent.com/92353613/192213860-f591d60c-27a5-4d83-95e3-2a9580a34fb4.png)    
βΆHRμ employees λλ―Έλ°μ΄ν° μΆλ ₯  
<br>

### π 1μΌμ°¨ μμ
1. μ€λΌν΄ μννΈμ¨μ΄ λ€μ΄λ‘λ : 
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html
2. Oracle Database 11g Release 2 Express Edition for Windows 64 (λ¬΄λ£μ€μΉ)  
3. Oracle μ€μΉ(SYS, SYSTEM κ³μ μ λν μνΈ : 1004)  
4.Sqlplus νλ‘κ·Έλ¨ μ κ³΅(CMD) : GUI νκ²½ μΌλ°κ°λ°μ μ¬μ© λΆνΈ  
5.λ³λμ Tool μ€μΉ λ¬΄λ£(SqlDeveloper , https://dbeaver.io/),  
                 μ λ£(ν λ , μ€λ μ§ , SqlGate) νλ‘μ νΈμ μ€μΉ νμ© ^^  
6. SqlDeveloper ν΄μ ν΅ν΄μ Oracle Server μ μ ....  
   -> HR κ³μ  : μνΈ 1004 , Unlock 2κ°μ§ μ¬μ©κ°λ₯ .... (μ¬μκ΄λ¦¬ μ€μ΅ νμ΄λΈ)  
   -> μλ‘μ΄ κ³μ  : KOSA  

```sql
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

7. νμ¬ μ μ κ³μ  νμΈ : show user;   >> USERμ΄(κ°) "KOSA"μλλ€.  

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
``` 
<br>

### π [μ€μ΅μ½λ]

```sql
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

commit;                                                     --COMMIT ν΄μΌ λ°μ΄ν° μλ ₯ μλ£λ¨

select * from emp;                                          --emp νμ΄λΈ μΆλ ₯
```
[μΆλ ₯κ°] :   
![image](https://user-images.githubusercontent.com/111114507/192230088-19b8b3bc-adac-480d-a977-d8990df4e752.png)  
<br>

#### - select * from dept;    
![image](https://user-images.githubusercontent.com/111114507/192231155-637ffa88-cac8-43ae-8eab-bb4f700b8377.png)  
<br>

#### - select * from salgrade;  
![image](https://user-images.githubusercontent.com/111114507/192232257-1c91c83b-6860-4f31-825b-30ac7ed630ad.png)  
<br>


### π λ¬Έλ²
#### - [μΏΌλ¦¬λ λμλ¬Έμ κ΅¬λ³ x]
```sql
select * from emp;
SELECT * FROM emp;
```

#### - [νΉμ  μ»¬λΌ λ°μ΄ν° μΆλ ₯νκΈ°]
```sql
select empno, ename, sal
from emp;

select ename from emp;
```
μΆλ ₯κ° :  
![image](https://user-images.githubusercontent.com/111114507/192233496-d086cfc4-ae26-4493-8ea3-a6cb575f02c7.png)
<br>

#### - [μ»¬λΌλͺ κ°λͺμΉ­(alias) λ³μΉ­ λΆμ¬νκΈ°]
```sql
select empno μ¬λ², ename μ΄λ¦
from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192236926-ffa22a75-b91e-4435-820a-ea6393b74fe5.png)
```sql
select empno μ¬      λ², ename μ΄     λ¦
from emp;
```
βΆ ORA-00923: FROM keyword not found where expected λ¬Έμ  λ°μ    
<br>

```sql
select empno "μ¬     λ²", ename "μ΄     λ¦"
from emp;
```
βΆ SQL νμ€λ¬Έλ² ( ANSI λ¬Έλ² ) >> νμ€ >> oracle or MS-sql or Mysqlμμ μ¬μ© κ°λ₯  
<br>

#### - [λ¬Έμμ΄]
- Oracle μμ λ¬Έμμ΄ λ°μ΄ν°λ '' μ¬μ©ν΄μ νν
- Oracle λ¬Έμμ΄ λ°μ΄ν° μκ²©νκ² λμλ¬Έμ κ΅¬λΆ 
- JAVA : λ¬Έμ 'A', λ¬Έμμ΄ "AAA"
- Oracle : λ¬Έμμ΄ 'A', 'AA', 'AAA'
- Oracle :  A, a >> λ€λ₯Έ λ¬Έμ
```sql
select empno, ename
from emp
where ename = 'KING'
```
βΆ 'king'μΌλ‘ νλ©΄ λ°μ΄ν° κ²μ μλ¨!
<br>

#### - [μ°μ°μ]
- <JAVA>
- JAVA : + μ«μ(μ°μ μ°μ°)
- JAVA : + λ¬Έμμ΄(κ²°ν©μ°μ°)
<br>

- <Oracle>
- Oracle μ°μ°μλ κ²°ν©κ³Ό μ°μ  λΆλ¦¬! 
- Oracle κ²°ν©μ°μ°μ : ||
- Oracle μ°μ μ°μ°μ : + (μ°μ )
- javaμ κ±°μ λμΌ  ( + - * / ) λλ¨Έμ§ %
- Oracle λμΌ    ( + - * / ) λλ¨Έμ§ μ°μ°μλ μμ >> ν¨μλ₯Ό ν΅ν΄μ Mod()
- ename like '%κΉ%'

```sql
select 'μ¬μμ μ΄λ¦μ' || ename || 'μλλ€' as "μ¬μμ λ³΄"
from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192239763-6a257c61-f004-4655-a2a8-6e7a7b51eb58.png)
<br>

```sql
desc emp;
```
βΆ desc : λ°μ΄ν° νμ λ³΄μ¬μ£Όλκ±°μ!  
<br>

![image](https://user-images.githubusercontent.com/111114507/192240023-e4c04d41-f1a6-4577-8e82-37a18431407e.png)   
βΆ ENAMEμ VARCHAR2(10)νμμμ λ³΄μ¬μ£Όκ³  μλ€.    
βΆ varchar2(10) : 10byte -> νκΈ 1μ 2byte, μλ¬Έμ&νΉμλ¬Έμ&κ³΅λ°± 1byte (νκΈ 5μ, μλ¬Έ 10μ)   
<br>

#### -[νλ³ν] : (λ΄λΆμ μΌλ‘ μ«μ (λ¬Έμμ΄λ‘) μλ νλ³ν
```sql
select empno || ename -- μ«μ || λ¬Έμμ΄
from emp;

select empno + ename --ORA-01722: invalid number
from emp;
```

#### - [μ€λ³΅λ°μ΄ν°] : distinct
```sql
select job from emp; --μ€λ³΅λ°μ΄ν°λ₯Ό κ±°λ₯΄μ§ μμ
```
μΆλ ₯κ° : 
![image](https://user-images.githubusercontent.com/111114507/192241901-183e3564-8118-4e15-9d26-8317fe640abe.png)
<br>


```sql
select distinct job from emp;
```
μΆλ ₯κ° : 
![image](https://user-images.githubusercontent.com/111114507/192241816-9417f99a-0a3b-4206-addf-ed3fc0804382.png)
<br>

Q) μ¬μνμ΄λΈμμ μ¬μμ κΈμ¬λ₯Ό 100λ¬λΌ μΈμν κ²°κ³Όλ₯Ό μΆλ ₯νμΈμ : 
```sql
select empno, ename, sal, sal+100 as "μΈμκΈμ¬"
from emp;
desc emp;
```
![image](https://user-images.githubusercontent.com/111114507/192242711-a754d3aa-11fd-4dbb-b8b7-60ec9bc3e20d.png)  
 βΆ salμ 100μ΄ λν΄μ§ κ°μ΄ μΆλ ₯
<br>

#### - [dual μμ κ°μνμ΄λΈ]
```sql
select 100 + 100 from dual; --dualμ μλ€κ³  κ°μ νκ³ ..?!
select 100 || 100 from dual; --100100
select '100' + 100 from dual; --μ«μν λ¬Έμ(νλ³νκ°λ₯) ****
select 'A100' + 100 from dual; --Error 
-- μμ λ΄μ©λ¬Όμ΄ μ«μλ‘ λ³κ²½ κ°λ₯νλ€λ©΄..!!
```
