# 2022.09.29. THU ๐
----------------
<br>

## 1. subquery โ
----------------------
<br>

#### Q) ์ฌ์ํ์ด๋ธ์์ ์ฌ์๋ค์ ํ๊ท  ์๊ธ๋ณด๋ค ๋ ๋ง์ ์๊ธ์ ๋ฐ๋ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ๊ธ์ฌ
```sql
select empno, ename, sal
from emp
where sal > avg(Sal);
```
โถ ์คํ ์๋จ -> where sal > avg(Sal) ๋ถ๋ถ ๋ฌธ์ ..   
<br>

[ํด๊ฒฐ1] : avg(sal)๋์  2073    
```sql
select empno, ename, sal
from emp
where sal > 2073;
```
<br>  

[ํด๊ฒฐ2] : 2๊ฐ์ ์ฟผ๋ฆฌ๋ฅผ ํ๋๋ก ํตํฉ   
```sql
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp);
```
<br>

### ๐ single row subquery  
- ์คํ๊ฒฐ๊ณผ๊ฐ ๋จ์ผ row + ๋จ์ผ colum์ผ ๊ฒฝ์ฐ (ํ๊ฐ์ ๋ฐํ)
- ex) select avg(sal) from emp
- ์ฐ์ฐ์ : ( = != < >)
<BR>

### ๐ multi row subquery
- ์คํ๊ฒฐ๊ณผ๊ฐ ๋จ์ผ column + row ์ฌ๋ฌ๊ฐ์ธ ๊ฒฝ์ฐ
- ex) select sal from emp
- ์ฐ์ฐ์ : IN NOT IN ANY ALL
- ALL : SAL > 1000 AND SAL > 4000 AND ...
- ANY : SAL > 1000 OR SAL > 4000 OR ... 

### ๐ < ๋ฌธ๋ฒ >
1. ๊ดํธ ์์ ์์ด์ผํ๋ค -> (SELECT MAX(SAL) FROM EMP)
2. ๋จ์ผ ์ปฌ๋ผ์ผ๋ก ๊ตฌ์ฑ >> SELECT MAX(SAL), SUM(SAL) FROM EMP(X)
3. ๋จ๋์ผ๋ก ์คํ ๊ฐ๋ฅ
<br>

#### Q) ์ฌ์ํ์ด๋ธ์์ jones์ ๊ธ์ฌ๋ณด๋ค ๋ ๋ง์ ๊ธ์ฌ๋ฅผ ๋ฐ๋ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ์ธ์.
[single row subquery]
```sql
select sal from emp where ename = 'JONES'; --2975

select *
from emp
where sal > (select sal from emp where ename = 'JONES') ;
```
<br>

[multi row subquery]
```sql
select *
from emp
where sal in (select sal from emp where deptno = 30);
```
โถ = ๋์  in ์ฌ์ฉ
<br>

#### Q) ๋ถํ์ง์์ด ์๋ ์ฌ์์ ์ฌ๋ฒ๊ณผ ์ด๋ฆ์ ์ถ๋ ฅํ์ธ์
```sql
select mgr from emp; --multi
select *
from emp
where empno in (select mgr from emp);
```
โถ where empno = 7902 or empno = 7788 or empno = null (or์ฐ์ฐ์์ null์ด ๋ฌธ์  X)
<br>

#### Q) ๋ถํ์ง์์ด ์๋ ์ฌ์์ ์ฌ๋ฒ๊ณผ ์ด๋ฆ์ ์ถ๋ ฅํ์ธ์
```sql
select mgr from emp;
select *
from emp
where empno not in (select mgr from emp);
```

โถ not in์ ์ฌ์ฉํ์ง๋ง ์คํ๋์ง ์์ 
-  not in์ ๋ถ์ ์ and

[ํด๊ฒฐ] :   
```sql
select mgr from emp;
select *
from emp
where empno not in (select nvl(mgr,0) from emp);
```
<br>

#### Q) king ์๊ฒ ๋ณด๊ณ ํ๋ ์ฆ ์ง์์๊ด์ด king์ธ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ์ง์ข, ๊ด๋ฆฌ์์ฌ๋ฒ์ ์ถ๋ ฅํ์ธ์
```sql
select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename='KING');
```
<br>

#### Q) 20๋ฒ ๋ถ์์ ์ฌ์ธ์ค์์ ๊ฐ์ฅ ๋ง์ ๊ธ์ฌ๋ฅผ ๋ฐ๋ ์ฌ์๋ณด๋ค ๋ ๋ง์ ๊ธ์ฌ๋ฅผ ๋ฐ๋ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ๊ธ์ฌ, ๋ถ์๋ฒํธ๋ฅผ ์ถ๋ ฅํ์ธ์.
```sql
select max(sal)
from emp
where deptno = 20;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20);
```
<br>

#### Q) ์๊ธฐ ๋ถ์์ ํ๊ท  ์๊ธ๋ณด๋ค ๋ ๋ง์ ์๊ธ์ ๋ฐ๋ ์ฌ์์ ์ฌ๋ฒ, ์ด๋ฆ, ๋ถ์๋ฒํธ, ๋ถ์๋ณ ํ๊ท  ์๊ธ์ ๊ตฌํ์ธ์.
```sql
select e.empno, e.ename, e.deptno, e.sal, s.svgsal
from emp e join (select deptno, round(avg(sal), 0) as avgsl from emp group by deptno)
on e.deptno = s.deptno
where e.sal > s.avgsal;
```
<br>

### ๐ ๋ฌธ์ ํ์ด

#### Q1) 'SMITH'๋ณด๋ค ์๊ธ์ ๋ง์ด ๋ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ๊ณผ ์๊ธ์ ์ถ๋ ฅํ๋ผ.
```sql
select sal from emp where ename = 'SMITH';

select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');

```
<br>

#### Q2) 10๋ฒ ๋ถ์์ ์ฌ์๋ค๊ณผ ๊ฐ์ ์๊ธ์ ๋ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ, ์๊ธ, ๋ถ์๋ฒํธ๋ฅผ ์ถ๋ ฅํ๋ผ.
```sql
select sal from emp where deptno = 10;

select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);
```
<br>


#### Q3) 'BLAKE'์ ๊ฐ์ ๋ถ์์ ์๋ ์ฌ์๋ค์ ์ด๋ฆ๊ณผ ๊ณ ์ฉ์ผ์ ๋ฝ๋๋ฐ 'BLAKE'๋ ๋นผ๊ณ  ์ถ๋ ฅํ๋ผ.
```sql
select deptno from emp where ename = 'BLAKE';

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename != 'BLAKE';
```
<br>


#### Q4) ํ๊ท ๊ธ์ฌ๋ณด๋ค ๋ง์ ๊ธ์ฌ๋ฅผ ๋ฐ๋ ์ฌ์๋ค์ ์ฌ์๋ฒํธ, ์ด๋ฆ, ์๊ธ์ ์ถ๋ ฅํ๋, ์๊ธ์ด ๋์ ์ฌ๋ ์์ผ๋ก ์ถ๋ ฅํ๋ผ.
```sql
select avg(sal) from emp;

select empno, ename, sal
from emp
where sal > (select avg(sal) from emp)
order by sal desc;
```
<br>


#### Q5) ์ด๋ฆ์ 'T'๋ฅผ ํฌํจํ๊ณ  ์๋ ์ฌ์๋ค๊ณผ ๊ฐ์ ๋ถ์์์ ๊ทผ๋ฌดํ๊ณ  ์๋ ์ฌ์์ ์ฌ์๋ฒํธ์ ์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.
```sql
select deptno from emp where ename like '%T%';

select empno, ename
from emp
where deptno in (select deptno from emp where ename like '%T%');
```
<br>


#### Q6) 30๋ฒ ๋ถ์์ ์๋ ์ฌ์๋ค ์ค์์ ๊ฐ์ฅ ๋ง์ ์๊ธ์ ๋ฐ๋ ์ฌ์๋ณด๋ค ๋ง์ ์๊ธ์ ๋ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ, ๋ถ์๋ฒํธ, ์๊ธ์ ์ถ๋ ฅํ๋ผ. (๋จ, ALL(and) ๋๋ ANY(or) ์ฐ์ฐ์๋ฅผ ์ฌ์ฉํ  ๊ฒ)
```sql
select max(sal) from emp where deptno = 30;

select ename, deptno, sal
from emp
where โsal > (select max(sal) from emp where deptno = 30);
```
<br>


#### Q7) 'DALLAS'์์ ๊ทผ๋ฌดํ๊ณ  ์๋ ์ฌ์๊ณผ ๊ฐ์ ๋ถ์์์ ์ผํ๋ ์ฌ์์ ์ด๋ฆ, ๋ถ์๋ฒํธ, ์ง์์ ์ถ๋ ฅํ๋ผ.
```sql
select deptno from dept where loc = 'DALLAS';

select e.ename, e.deptno, e.job
from emp e join dept d
on e.deptno = (select deptno from dept d where loc = 'DALLAS');
```
<br>


#### Q8) SALES ๋ถ์์์ ์ผํ๋ ์ฌ์๋ค์ ๋ถ์๋ฒํธ, ์ด๋ฆ, ์ง์์ ์ถ๋ ฅํ๋ผ.
```sql
select deptno from dept where dname = 'SALES';
โ
select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = (select deptno from dept d where dname = 'SALES');
```
<br>


#### Q9) 'KING'์๊ฒ ๋ณด๊ณ ํ๋ ๋ชจ๋  ์ฌ์์ ์ด๋ฆ๊ณผ ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ๋ผ. king ์ด ์ฌ์์ธ ์ฌ๋ (mgr ๋ฐ์ดํฐ๊ฐ king ์ฌ๋ฒ)
```sql
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
```
<br>



#### Q10) ์์ ์ ๊ธ์ฌ๊ฐ ํ๊ท  ๊ธ์ฌ๋ณด๋ค ๋ง๊ณ , ์ด๋ฆ์ 'S'๊ฐ ๋ค์ด๊ฐ๋ ์ฌ์๊ณผ ๋์ผํ ๋ถ์์์ ๊ทผ๋ฌดํ๋ ๋ชจ๋  ์ฌ์์ ์ฌ์๋ฒํธ, ์ด๋ฆ, ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ๋ผ.
```sql
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
```
<br>


#### Q11) ์ปค๋ฏธ์์ ๋ฐ๋ ์ฌ์๊ณผ ๋ถ์๋ฒํธ, ์๊ธ์ด ๊ฐ์ ์ฌ์์ ์ด๋ฆ, ์๊ธ, ๋ถ์๋ฒํธ๋ฅผ ์ถ๋ ฅํ๋ผ.
```sql
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
```
<br>


#### Q12) 30๋ฒ ๋ถ์ ์ฌ์๋ค๊ณผ ์๊ธ๊ณผ ์ปค๋ฏธ์์ด ๊ฐ์ง ์์ ์ฌ์๋ค์ ์ด๋ฆ, ์๊ธ, ์ปค๋ฏธ์์ ์ถ๋ ฅํ๋ผ.
```sql
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                        FROM EMP
                        WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                         FROM EMP
                         WHERE DEPTNO=30 and comm is not null);
 
```
<br>

## 2. DML โ
----------------------
<br>

### ๐ INSERT
#### [1] ๊ฐ์ฅ ์ผ๋ฐ์ ์ธ insert
```sql
insert into temp(id,name)
values(100, 'ํ๊ธธ๋');

select * from temp;

commit;
```
<br>

#### [2] ์ปฌ๋ผ ๋ชฉ๋ก ์๋ต
```sql
insert into temp
values (200,'๊น์ ์ ')

select * from temp;
rollback;
```
โถ ๊ฐ๋์ฑ์ด ๋จ์ด์ง๊ณ  ์ ์ง๋ณด์๊ฐ ํ๋ฆ  
<br>

#### [3] ๋ฌธ์ 
```sql
insert into temp (name)
values('์๋ฌด๊ฐ');          --id pk ์ ์ฝ (null x)

insert into temp(id, name)
values(100, '๊ฐ๋ฅ์ด');
```
<br>

### ๐ ๋๋๋ฐ์ดํฐ ์ฝ์
- insert into ํ์ด๋ธ๋ช(์ปฌ๋ผ๋ฆฌ์คํธ) values
- insert into ํ์ด๋ธ๋ช(์ปฌ๋ฆผ๋ฆฌ์คํธ) select ์ 
```sql
insert into temp5(num)
select id from temp4;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192946866-502e9aab-cd08-4823-821d-ee56907c8ba5.png)
<br>

### ๐ ๋๋ insert
- ๋ด์ ํ์ด๋ธ์ด ์๋ ๊ฒฝ์ฐ >> ํ์ด๋ธ ๋ณต์ (๊ตฌ์กฐ:์คํค๋ง + ๋ฐ์ดํฐ์ฝ์)
- ๋จ ์ ์ฝ์ ๋ณด๋ ๋ณต์ ํ์ง ์์ (PK, FK)
- ์์ํ ๋ฐ์ดํฐ ๊ตฌ์กฐ ๋ณต์  + ๋ฐ์ดํฐ ๋ณต์ฌ
```sql
create table copyemp
as
    select * from emp;
```
```sql
create table copyemp2 
as
    select empno, ename, sal
    from emp 
    where deptno = 30;
```
<br>

#### ํ(๊ตฌ์กฐ)๋ง ๋ณต์ ํ๊ณ  ๋ฐ์ดํฐ๋ ๋ณต์ฌํ๊ณ  ์ถ์ง ์๋ค๋ฉด
```sql
create table copytable3
as
    select * from emp where 1=2;
```
โถ where 1=2; : false์ด๊ธฐ ๋๋ฌธ์
<br>

### ๐ UPDATE
<br>

[ํ์] :  
``sql
update ํ์ด๋ธ๋ช
set ์ปฌ๋ผ๋ช = ๊ฐ, ์ปฌ๋ผ๋ช2 = ๊ฐ2 ...
where ์กฐ๊ฑด์ 
```

[ํ์] : 
```sql
update ํ์ด๋ธ๋ช
set ์ปฌ๋ผ = (subquery)
where ์ปฌ๋ผ๋ช = (subquery)
```
<br>

### ๐ delete
```sql
delete from copyemp;
```
```sql
delete from copyemp where deptno = 10;
```
<br>

## 3. DDB โ
----------------------
<br>

```sql
create table vtable(
no1 number,
no2 number,
no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

select * from col where lower(tname) = 'vtable';
insert into vtable(no1, no2) values(100,50);

```
โถ no1, no2๋ง ๋ฃ์ผ๋ฉด no3๊ฐ ์๋์ผ๋ก ์์ฑ๋๊ฒ!
<br>

```sql
insert into vtable(no1, no2, no3) values(100,50, 10);
```
![image](https://user-images.githubusercontent.com/111114507/192957567-83678626-b8a1-47c4-a1a0-06f22ee048f5.png)
โถ no3์ ์ง์ ํด์ค๋ค๋ฉด ์๊ธฐ๋ ์ค๋ฅ   
<BR>

### ๐ [์์ ] :   

- ์ ํ์ ๋ณด(์๊ณ ) : ๋ถ๊ธฐ๋ณ ๋ฐ์ดํฐ ์ถ์ถ(4๋ถ๊ธฐ)
- ์๊ณ ์ผ(2022-09-10)
```sql
create table vtable2(
    no number, --์๋ฒ
    p_code char(4), --์ ํ์ฝ๋(A001, B002)
    p_date char(8), --์๊ณ ์ผ(20220922)
    p_qty number, --์๋
    p_bungi number(1)  GENERATED ALWAYS as (
                         CASE WHEN substr(p_date,5,2) in ('01', '02', '03') THEN 1
                              WHEN substr(p_date,5,2) in ('04', '05', '06') THEN 2
                              WHEN substr(p_date,5,2) in ('07', '08', '09') THEN 3
                              ELSE 4
                         END ) VIRTUAL
)
```
```sql
insert into vtable2(p_date) values('20190101');
insert into vtable2(p_date) values('20190501');
insert into vtable2(p_date) values('20190601');
insert into vtable2(p_date) values('20191101');
insert into vtable2(p_date) values('20191201');
commit;
```
```sql
select* from vtable2;
```
[์ถ๋ ฅ๊ฐ] :    
![image](https://user-images.githubusercontent.com/111114507/192960046-d80a4651-8e2b-4c94-9bc8-a1dcfbfaba05.png)
<br>

```sql
select * from vtable2 where p_bungi = 1;
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192960173-1b55d944-2513-4c4c-bc3f-0f02fa886538.png)
<br>

### ๐ DDL  ํ์ด๋ธ ๋ง๋ค๊ณ  ์์ , ์ญ์ 
#### 1. ํ์ด๋ธ ์์ฑ
```sql
create table temp6(id number);
desc temp6;
```
<br>

#### 2. ํ์ด๋ธ ์์ฑ ํ์ ์ปฌ๋ผ ์ถ๊ฐํ๊ธฐ
```sql
alter table temp6
add ename varchar2(20);

desc temp6;
```
<br>

#### 3. ๊ธฐ์กด ํ์ด๋ธ์ ์๋ ์ปค๋ผ ์ด๋ฆ ์๋ชป ํ๊ธฐ(ename -> username)
```sql
alter table temp6
rename column ename to username;

desc temp6;

```
<br>

#### 4. ๊ธฐ์กด ํ์ด๋ธ์ ์๋ ๊ธฐ์กด ์ปฌ๋ผ์ ํ์ ํฌ๊ธฐ ์์  (๊ธฐ์ต) : modify
```sql
alter table temp6
modify (username varchar2(2000));
```
<br>

#### 5, ๊ธฐ์กด ํ์ด๋ธ์ ์๋ ๊ธฐ์กด ์ปฌ๋ผ ์ญ์ 
```sql
alter table temp6
drop column username;

desc temp6;
```
<br>

#### 6. ํ์ด๋ธ ์ ์ฒด๊ฐ ํ์ ์์
- 1) delete : ๋ฐ์ดํฐ๋ง ์ญ์ 
- ํ์ด๋ธ ์ฒ์ ๋ง๋ค๋ฉด ์ฒ์ ํฌ๊ธฐ -> ๋ฐ์ดํฐ ๋ฃ์ผ๋ฉด ๋ฐ์ดํฐ์ ํฌ๊ธฐ๋งํผ ํ์ด๋ธ ํฌ๊ธฐ ์ฆ๊ฐ
- ex) ์ฒ์ 1M >> ๋ฐ์ดํฐ 10๋ง๊ฑด >> 100M >> delete 10๋ง๊ฑด ์ญ์  >> ํ์ด๋ธ ํฌ๊ธฐ 100M
<br>

- 2) truncate : ๋ฐ์ดํฐ์ ๊ณต๊ฐ ์ญ์ 
- ๋จ์  : where ์ฌ์ฉ ๋ถ๊ฐ
- ex) ์ฒ์ 1M >> ๋ฐ์ดํฐ 10๋ง๊ฑด >> 100M >> delete 10๋ง๊ฑด ์ญ์  >> ํ์ด๋ธ ํฌ๊ธฐ 1M
<br>

- 3) ํ์ด๋ธ์ญ์ 
```sql
drop table temp6;
```
<br>

### ๐ insert ์ ์ฝ
### PRIMARY KEY(PK) : ์ ์ผํ๊ฒ ํ์ด๋ธ์ ๊ฐํ์ ์๋ณ(NOT NULL ๊ณผ UNIQUE ์กฐ๊ฑด์ ๋ง์กฑ)
- ์ ์ฝ์ ๋ง๋๋ ๋ฐฉ๋ฒ (create table ์์์ ์์ฑ)
- ํ์ด๋ธ์ด ์์ฑ๋ ๋ค์ ์ถ๊ฐ (alter table add constraint ....) ๋ง์ด ์ฌ์ฉ >> ํด..
```sql
--TIP)
--์ ์ฝ ์ ๋ณด ํ์ธ
select * from user_constraints where table_name='EMP';

create table temp7(
    --id number primary key --๊ถ์ฅํ์ง ์์์(์ ์ฝ์ด๋ฆ ์๋์์ฑ>>SYS_C006997
                          --์ ์ฝ ์ญ์ ์ ์์ ์ ์ฐพ๊ธฐ ์ด๋ ค์
    id number constraint pk_temp7_id primary key, --pk_temp7_id ๊ด์ฉ์ 
    name varchar2(20) not null, -- constraint ํํ ์ฐ์ง ๋ง์ธใ
    addr varchar2(50)
);
select * from user_constraints where table_name='TEMP7';

--PK(not null ํ๊ณ  unique ์ ์ฝ)
--PK ํ์ด๋ธ ๋น 1๊ฐ๋ง ์ฌ์ฉ (์ปฌ๋ผ1๊ฐ, ์ฌ๋ฌ๊ฐ์ ์ปฌ๋ผ์ ๋ฌถ์ด์ 1๊ฐ : ๋ณตํฉํค)

insert into temp7(name, addr) values('ํ๊ธธ๋', '์์ธ์ ๊ฐ๋จ๊ตฌ');
--annot insert NULL into ("KOSA"."TEMP7"."ID")

insert into temp7(id, name, addr) values(10, 'ํ๊ธธ๋', '์์ธ์ ๊ฐ๋จ๊ตฌ');
select * from temp7;

insert into temp7(id, name, addr) values(10, '์๋ฌด๊ฐ', '์์ธ์ ๊ฐ๋จ๊ตฌ');
--unique constraint (KOSA.PK_TEMP7_ID) violated
```
<br>

### UNIQUE key(UK) : ํ์ด๋ธ์ ๋ชจ๋  ํ์ ์ ์ผํ๊ฒ ํ๋ ๊ฐ์ ๊ฐ์ง ์ด(NULL์ ํ์ฉ)
- ์ปฌ๋ผ ์๋งํผ ์์ฑ ๊ฐ๋ฅ
- nullํ์ฉ
- not null, unique

```sql
create table temp8(
    id number constraint pk_temp8_id primary key,
    name nvarchar2(20) not null,
    jumin nchar(6) constraint uk_temp8_jumin unique --nullํ์ฉ
    addr nvarchar2(100)
);
select * from user_constraints where lower(table_name) = 'temp8';
```