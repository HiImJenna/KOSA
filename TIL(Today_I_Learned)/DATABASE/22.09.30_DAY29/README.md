# 2022.09.30. FRI ๐
----------------
<br>

## 1. DDB โ
----------------------
<br>

### ๐ CHECK(CK) 
- ์ฐธ์ด์ด์ผ ํ๋ ์กฐ๊ฑด์ ์ง์ ํจ(๋๋ถ๋ถ ์๋ฌด ๊ท์น์ ์ค์ 
```sql
create table temp10(
id number constraint pk_temp10_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp10_jumin unique,์ฐธ
addr varchar2(20),
age number constraint ck_temp10_age check(age>=19) --where age >= 19
);
```
โถ age number constraint ck_temp10_age check(age>=19) : ๋์ด๊ฐ 19์ธ ์ด์์ด์ด์ผ ํ๋ค.  
<br>

```sql
insert into temp10(id, name, jumin, addr, age)
values(100, 'ํ๊ธธ๋', '123456', '์์ธ์', 15);
```
โถ age๊ฐ ์กฐ๊ฑด์ ์ถฉ์กฑํ์ง ์๊ธฐ์ ์ค๋ฅ ๋ฐ์  
<br>

### ๐ FOREIGN KEY(FK)
- ์ด๊ณผ ์ฐธ์กฐ๋ ์ด ์ฌ์ด์ ์ธ๋ํค ๊ด๊ณ๋ฅผ ์ ์ฉํ๊ณ  ์ค์ 
- not null์ ๊ฐ์ ํ์ง ์์ผ๋ฉด null๊ฐ ํ์ฉ -> ์๊ตฌ์ฌํญ์ ๋ฐ๋ผ ๋ง๊ฒ ์ค๊ณ

```sql
create table c_emp -- ()
as 
    select empno, ename, deptno from emp where 1 = 2; --ํ์ด๋ธ์ ๊ตฌ์กฐ(์คํค๋ง)
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/193167325-43df116a-5a99-4757-ab43-74a55fbfadde.png)
<br>

```sql
create table c_dept
as
    select deptno, dname from dept where 1 = 2;
```
[์ถ๋ ฅ๊ฐ]   
![image](https://user-images.githubusercontent.com/111114507/193167370-2b56eaf1-f573-4d79-b70e-1f2b8b7dc38d.png)
<br>

```sql
alter table c_emp
add constraint fk_c_emp_deptno foreign key (deptno) references c_dept(deptno);
--ORA-02270: no matching unique or primary key for this column-list
```
- foreign key (deptno)๊ฐ ์ฑ๋ฆฝํ๊ธฐ ์ํด์๋ c_dept(deptno)์ ๋ฐ์ดํฐ๊ฐ ๋ฌด๊ฒฐ์ฑ(์ค๋ณต, null X)์์ ์๋ ค์ผํจ
- -> pk >> c_dept(deptno) -> unique, priamry key
- ๋ฐ๋์ c_dept์ PK ์ค์ ๋์ด ์์ด์ผ ํ๋ค
<br>

```sql
alter table c_dept
add constraint pk_c_dept_deptno primay key(deptno); --์ ์ฉํ๋ณด
```
<br>

### #Q1)
```sql
-์๋ฌธํ์ด๋ธ , ์๋ฌธ ์ปฌ๋ผ๋ช

--[ํ์ ์ฑ์  ํ์ด๋ธ]

--ํ๋ฒ์ ๋ฐ์ดํฐ๋ ์ค๋ณต๋๊ฑฐ๋ NULL ๊ฐ์ ํ์ฉํ๋ฉด ์๋๋ค

--์ด๋ฆ NULL ๊ฐ์ ํ์ฉํ์ง ์๋๋ค

--๊ตญ์ด

--์์ด

--์ํ ์ ์ ์ปฌ๋ผ์ ์ซ์ ํ์์ด๊ณ  NULL ๊ฐ์ ํ์ฉ

--๊ฐ์ ์๋ ฅํ์ง ์์ผ๋ฉด default๋ก 0๊ฐ์ ๊ฐ๋๋ค

--์ด์  ,ํ๊ท  ์ปฌ๋ผ์ ๊ฐ์์ปฌ๋ผ์ผ๋ก(์กฐํฉ์ปฌ๋ผ) ์์ฑํ๋ค

--ํ๊ณผ์ฝ๋๋ ํ๊ณผ ํ์ด๋ธ์ ํ๊ณผ์ฝ๋๋ฅผ ์ฐธ์กฐํ๋ค

--ํ๋ฒ , ์ด๋ฆ , ๊ตญ์ด , ์์ด , ์ํ , ์ด์  , ํ๊ท  , ํ๊ณผ์ฝ๋

โ
--[ํ๊ณผ ํ์ด๋ธ]

--ํ๊ณผ์ฝ๋ ๋ฐ์ดํฐ๋ ์ค๋ณต๋๊ฑฐ๋ NULL ๊ฐ์ ํ์ฉํ๋ฉด ์๋๋ค,

--ํ๊ณผ๋ช ์ null๊ฐ์ ํ๋ฝํ์ง ์๋๋ค

--ํ๊ณผ์ฝ๋ , ํ๊ณผ๋ช
โ
--์ํ ๋ฐ์ดํฐ insert ..

--๊ทธ๋ฆฌ๊ณ  select ๊ฒฐ๊ณผ๋

--ํ๋ฒ , ์ด๋ฆ , ์ด์ , ํ๊ท  , ํ๊ณผ์ฝ๋ , ํ๊ณผ๋ช ์ ์ถ๋ ฅํ์ธ์
```
[ํ์ด]  
```sql
create table student(
    studentno number constraint pk_student_studentno primary key,
    name nvarchar2(10) not null,
    rnr number default 0,
    dud number default 0,
    tn number default 0,
    sum number generated always as (rnr + dud + tn) virtual,
    avg number generated always as ((rnr+dud+tn)/3) virtual,
    departmentno number
);

create table department(
    departmentno number constraint pk_department_departmentno primary key,
    dname nvarchar2(20) not null
);


alter table student
add constraint fk_student_departmentno foreign key(departmentno) references department(departmentno);

insert into department(departmentno,dname) values (10,'์ปดํจํฐ');
insert into department(departmentno,dname) values (20,'์ฌํ๋ณต์ง');
insert into department(departmentno,dname) values (30,'์์');
insert into department(departmentno,dname) values (40,'์ฒ ํ');
select * from department;
commit;

select * from student;
insert into student(studentno,name,rnr,dud,tn,departmentno)
values (100,'ํ๊ธธ๋',100,90,80,10);
insert into student(studentno,name,rnr,dud,departmentno)
values (200,'๊น์ ์ ',100,90,20);
insert into student(studentno,name,rnr,departmentno)
values (300,'์ ๊ด์',100,30);
commit;

select s.studentno as ํ๋ฒ, s.name as ์ด๋ฆ, s.sum as ์ด์ , round(s.avg) as ํ๊ท , 
s.departmentno as ํ๊ณผ์ฝ๋, d.dname as ํ๊ณผ์ด๋ฆ
from student s join department d
on s.departmentno = d.departmentno;

select * from user_constraints where lower(table_name) = 'student';
select * from user_constraints where lower(table_name) = 'department';
```
<br>

### Q2) 
```sql
--EMP empno pk
--DEPT deptno pk
--EMP deptno FK
```
```sql
alter table emp
add constraint pk_emp_empno primary key(empno);

alter table dept
add constraint pk_dept_deptno primary key(deptno);

alter table emp
add constraint fk_dept_to_emp foreign key (empno) references dept (deptno);
```
<br>

# 2. view โ 
[์ค๋ผํด pdf 9186]
```sql
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY]
OR REPLACE ์ด๋ฏธ ์กด์ฌํ๋ค๋ฉด ๋ค์ ์์ฑํ๋ค.
FORCE Base Table ์ ๋ฌด์ ๊ด๊ณ์์ด VIEW ์ ๋ง๋ ๋ค.
NOFORCE ๊ธฐ๋ณธ ํ์ด๋ธ์ด ์กด์ฌํ  ๊ฒฝ์ฐ์๋ง VIEW ๋ฅผ ์์ฑํ๋ค.
view_name VIEW ์ ์ด๋ฆ
Alias Subquery ๋ฅผ ํตํด ์ ํ๋ ๊ฐ์ ๋ํ Column ๋ช์ด ๋๋ค.
Subquery SELECT ๋ฌธ์ฅ์ ๊ธฐ์ ํ๋ค.
WITH CHECK OPTION VIEW ์ ์ํด ์ก์ธ์ค ๋  ์ ์๋ ํ๋ง์ด ์๋ ฅ,๊ฐฑ์ ๋  ์ ์๋ค. 
Constraint CHECK OPTON ์ ์ฝ ์กฐ๊ฑด์ ๋ํด ์ง์ ๋ ์ด๋ฆ์ด๋ค.
WITH READ ONLY ์ด VIEW ์์ DML ์ด ์ํ๋  ์ ์๊ฒ ํ๋ค.
```
<br>

### ๐ ์ฌ์ฉ๋ชฉ์ 
1. ๊ฐ๋ฐ์ ํธ๋ฆฌ์ฑ : join, query -> view ์ฌ์ฉ (์ฑ๋ฅ๊ณผ ๋ฌด๊ดํ)
2. query ๋จ์ํ (ํธ๋ฆฌ์ฑ) : ๋ณต์กํ ์ฟผ๋ฆฌ๋ฅผ ๋ฏธ๋ฆฌ ๋ง๋ค์ด ๋๊ณ  ์ฌ์ฉ
3. ๋ณด์์ฑ (ํน์ ์ปฌ๋ผ๋ง๋ธ์ถ)
<br>

### ์์ 
```sql
-- 30๋ฒ ๋ถ์ ์ฌ์๋ค์  ์ง์ข, ์ด๋ฆ, ์๊ธ์ ๋ด๋ VIEW๋ฅผ ๋ง๋๋๋ฐ,
-- ๊ฐ๊ฐ์ ์ปฌ๋ผ๋ช์ ์ง์ข, ์ฌ์์ด๋ฆ, ์๊ธ์ผ๋ก ALIAS๋ฅผ ์ฃผ๊ณ  ์๊ธ์ด
-- 300๋ณด๋ค ๋ง์ ์ฌ์๋ค๋ง ์ถ์ถํ๋๋ก ํ๋ผ.
create or replace view view101(์ง์ข,์ฌ์์ด๋ฆ,์๊ธ)
as
   select job , ename , sal
   from emp
   where deptno=30 and sal > 300;

select * from view101;

```
- ๋ณด์์ฑ์ ์ํด ๊ธฐ์กด์ ์๋ ํ์ด๋ธ์์ ๋ณด์ฌ์ฃผ๊ณ  ์ถ์ ์ ๋ณด๋ง ๋ด๊ณ  ์๋ ์๋ก์ด ํ์ด๋ธ์ ๋ง๋๋ ๊ฒ์ด view! (๋ด๊ฐ ์ดํดํ ๋ฐ๋ก๋ใ)
<br>

# 3. ์กฐ๋ณ๊ณผ์ 
### ๋ฌธ์  3๊ฐ ๋ง๋ค๊ธฐ
```sql
--Quiz 

--์๋ 3๊ฐ์ ํ์ด๋ธ ์ด์ฉํ์ฌ  ๋ฌธ์  3๊ฐ๋ฅผ ๋ง๋์ธ์ 

--ํ์์ฌํญ) ํจ์ ๋ฐ JOIN ํด๋ฆฌ๋ ๋ฐ๋์ ํ์ .....

--์ข์ ๋ฌธ์ ๊ฐ ๋์จ ์กฐ์๊ฒ ํฌ์ ํ ๊ฒ์ ^^

select * from employees;

select * from departments;

select * from locations;
```
[๋]
```sql
1. Location_ID๊ฐ 1700์ธ DEPARTMENT_ID๋ฅผ ๊ตฌํ๊ณ  ๊ทธ ๋ถ์์ ์ํ๋ฉด์ 
์ด๋ฉ์ผ์ H๊ฐ ๋ค์ด๊ฐ๋ ์ฌ์์ employee_id,  fullname(first name + last name), department_id, email๋ฅผ ์ถ๋ ฅํ์ธ์. (fullname ์์ ์ํ๋ฒณ ์ ์ ๋ ฌ)
```
```sql
select employee_id, 
       concat(first_name, last_name) as full_name,
       e.department_id,
       email
from employees e join departments d
on d.department_id = e.department_id
where d.location_id = 1700 or email like '%H%' 
order by full_name;
```
<br>

[์กฐ์1]  
```sql
2. ๋์ ๋ณ ์ฌ์ฉ ์ด๋ฉ์ผ ์ถ๋ ฅํ  ๊ฒ.
   ๋์๋ณ๋ก ์ค๋ฆ์ฐจ์์ผ๋ก ์ ๋ ฌ ํ  ๊ฒ.
```
```sql
create or replace view email_list
       as select e.email, e.department_id, d.location_id
          from employees e join departments d on e.department_id = d.department_id;
       
       select l.city, e.email
       from email_list e join locations l on e.location_id = l.location_id
       order by l.city;
```
<br>

[์กฐ์2]  
```sql
3. ํ๊ท  ์ฐ๋ด์ด ๋์ ์์ผ๋ก ๋ถ์๋ช๊ณผ ํ๊ท ์ฐ๋ด์ ์ถ๋ ฅํ๋, ํ๊ท  ์ฐ๋ด์ ์ ์๋ก ์ถ๋ ฅํ์ธ์.
```
```sql
select d.department_name as ๋ถ์๋ช, round(A.avgsal, 0) as ํ๊ท ์ฐ๋ด
from departments d join (select department_id as di, avg(salary) as avgsal
                         from employees
                         group by department_id) A
on d.department_id = A.di
order by ํ๊ท ์ฐ๋ด desc;
```

