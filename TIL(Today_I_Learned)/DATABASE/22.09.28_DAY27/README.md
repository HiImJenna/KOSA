# 2022.09.28.WED ๐
----------------
<br>

## 1. ๋ฌธ์์ด ํ์ โ
### ๐ ๊ณ ์ ๊ธธ์ด ๋ฌธ์์ด
- char(10) >> 10byte >> ํ๊ธ5์, ์๋ฌธ์, ํน์, ๊ณต๋ฐฑ 10์ 
- ๊ณต๊ฐ์ ๋ณํ๊ฐ ์์
- char(10) >> 'abc' >> 3byte >> [a] [b] [c] [] [] [] [] [] ...
- ๋จ,์ฌ / ๋, ์ค, ์ / ์ฃผ๋ฏผ๋ฒํธ --> ์ฑ๋ฅ
<br>

### ๐ ๊ฐ๋ณ๊ธธ์ด ๋ฌธ์์ด
- varchar2(10) >> 10byte >> ํ๊ธ5์, ์๋ฌธ์, ํน์, ๊ณต๋ฐฑ 10์
- ๋ฐ์ดํฐ ํฌ๊ธฐ๋งํผ๋ง ๊ณต๊ฐ ํ๋ณด
- varchar2(10) >> 'abc' >> 3byte >> [a] [b] [c]
- ์ฌ๋์ ์ด๋ฆ, ์ทจ๋ฏธ, ์ฃผ์
<br>

### ๐ unicode (2byte)
- ํ๊ธ, ์๋ฌธ์, ํน์๋ฌธ์, ๊ณต๋ฐฑ -> 2byte ์ทจ๊ธ
- nchar(20) : 20์ -> 2*20 -> ์ด 40byte
- nvarchar2(20) : 20์
<br>

```sql
select * from SYS.NLS_DATABASE_PARAMETERS;
--NLS_CHARACTERSET  : 	AL32UTF8  ํ๊ธ 3byte ์ธ์
```

```sql
insert into test2(name) values('a');
insert into test2(name) values('aa');
insert into test2(name) values('๊ฐ'); --ํ๊ธ 1์ 3byte ์ธ์ง
--> uvarchar ์ฐ๊ธฐ!
```
[์ค๋ฅ] :    
![image](https://user-images.githubusercontent.com/111114507/192663329-b4a95961-8fc3-49e9-9b30-34f882bd4fe4.png)
<br>

## 2. ์ผ๋ฐํจ์ โ
- ํ๋ก๊ทธ๋จ ์ฑ๊ฒฉ์ด ๊ฐํ ํจ์
- nvl(), nvl2() : null ์ฒ๋ฆฌ ํจ์
- decode() : java if๋ฌธ๊ณผ ๋น์ท
- case() : java switch๋ฌธ

### ๐ decode()
[create table] :  
```sql
insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MGR');
insert into t_emp(id, job) values(400);
insert into t_emp(id, job) values(500, 'MGR');
COMMIT;

select * from t_emp;
```
[์์] :   
```sql
select id, decode(id, 100, '์์ดํฐ', 
                      200, '์์๋ถ', 
                      300, '๊ด๋ฆฌํ', 
                           '๊ธฐํ๋ถ์') as ๋ถ์์ด๋ฆ
from t_emp;
```
<br>

```sql
select empno, ename, deptno, decode(deptno, 10, '์ธ์ฌ๋ถ',
                                            20, '๊ด๋ฆฌ๋ถ',
                                            30, 'ํ๊ณ๋ถ',
                                            40, '๋ถ์',
                                                'ETC') as ๋ถ์์ด๋ฆ
from emp;
```
โถ id๊ฐ 100์ด๋ผ๋ฉด '์์๋ถ', ๊ทธ ์๋๋ else if, else ์ฒ๋ผ 
<br>

#### Q) t_emp2 ํ์ด๋ธ์์ id, jumin ๋ฐ์ดํฐ๋ฅผ ์ถ๋ ฅํ๋ jumin ์ปฌ๋ผ์ ์์๋ฆฌ๊ฐ 1์ด๋ฉด '๋จ์ฑ' ์ถ๋ ฅ,  2์ด๋ฉด '์ฌ์ฑ' 3์ด๋ฉด '์ค์ฑ' ๊ทธ์ธ๋  '๊ธฐํ' ๋ผ๊ณ  ์ถ๋ ฅํ์ธ์. (์ปฌ๋ผ๋ช์ '์ฑ๋ณ')
```sql
select id, jumin, decode(substr(jumin, 1, 1), 1, '๋จ์ฑ',
                                              2, '์ฌ์ฑ',
                                              3, '์ค์ฑ',
                                                 '๊ธฐํ') as ์ฑ๋ณ
from t_emp2;
```
<br>

#### Q) ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ค์์ SMITH ๋ผ๋ ์ด๋ฆ์ ๊ฐ์ง ์ฌ์์ด๋ผ๋ฉด HELLO ๋ฌธ์ ์ถ๋ ฅํ๊ณ , ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ค์์ SMITH ๋ผ๋ ์ด๋ฆ์ ๊ฐ์ง ์ฌ์์ด ์๋๋ผ๋ฉด WORLD ๋ฌธ์ ์ถ๋ ฅํ๊ณ , ๋ถ์๋ฒํธ๊ฐ 20๋ฒ์ธ ์ฌ์์ด ์๋๋ผ๋ฉด ETC ๋ผ๋ ๋ฌธ์๋ฅผ ์ถ๋ ฅํ์ธ์.
```sql
select empno, deptno, decode(deptno, 20, decode(ename, 'SMITH', 'HELLO', 'WORLD'), 'ETC')
from emp;
```
[์ถ๋ ฅ๊ฐ] : 
![image](https://user-images.githubusercontent.com/111114507/192667877-b8cb77e4-3254-4357-980c-80972ac225a0.png)
<br>

### ๐ case()
```sql
case์กฐ๊ฑด์ when ๊ฒฐ๊ณผ1 then ์ถ๋ ฅ1
          when ๊ฒฐ๊ณผ2 then ์ถ๋ ฅ2
          when ๊ฒฐ๊ณผ3 then ์ถ๋ ฅ3
          else ์ถ๋ ฅ4
end "์ปฌ๋ผ๋ช"
```
[create table] :  
```sql
create table t_zip
(
    zipcode number(10)
);

select * from t_zip;

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;

```
```sql
select '0' || to_char(zipcode), case zipcode when 2 then '์์ธ'
                                             when 31 then '๊ฒฝ๊ธฐ'
                                             when 41 then '์ ์ฃผ'
                                             else '๊ธฐํ์ง์ญ'
                                 end "์ง์ญ์ด๋ฆ"
from t_zip;
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192668836-b153258d-7a50-4878-a573-d3488c547b31.png)
<br>

[์์] : 
```sql
์ฌ์ํ์ด๋ธ์์ ์ฌ์๊ธ์ฌ๊ฐ 1000๋ฌ๋ฌ ์ดํ๋ฉด 4๊ธ
1001๋ฌ๋ฌ 2000๋ฌ๋ฌ ์ดํ๋ฉด 3๊ธ
2001๋ฌ๋ฌ 3000๋ฌ๋ฌ ์ดํ๋ฉด 2๊ธ
3001๋ฌ๋ฌ 4000๋ฌ๋ฌ ์ดํ๋ฉด 1๊ธ
4001๋ฌ๋ฌ ์ด์์ด๋ฉด 'ํน๊ธ'์ด๋ผ๋ ๋ฐ์ดํฐ๋ฅผ ์ถ๋ ฅํ์ธ์.
```
```sql
select case when sal <= 1000 then '4๊ธ'
            when sal between 1001 and 2000 then '3๊ธ'
            when sal between 2001 and 3000 then '2๊ธ'
            when sal between 3001 and 4000 then '1๊ธ'
            else 'ํน๊ธ'
       end "๊ธ์"
from emp;
```
<br>

## 3. ์ง๊ณํจ์ โ
- count(*) : row์, count (์ปฌ๋ผ๋ช) -> ๋ฐ์ดํฐ๊ฑด์ (null์ ํฌํจ x)
- sum()
- avg()
- max()
- min()
<br>

### ๐ count()
```sql
select count(*) from emp; --14๊ฐ์ row

select count(empno) from emp; --14

select count(comm) from emp; --6

select comm from emp;
```
[select comm from emp;]:  
![image](https://user-images.githubusercontent.com/111114507/192671144-3829006b-4b40-4205-b16a-26888967a535.png)
โถ null ๊ฐ์ ์ธ์ง ์๋๋ค.
<br>

[ํด๊ฒฐ] :  nvl() ์ฌ์ฉ!  
```sql
select count(nvl(comm,0)) from emp; --14
```
<br>

### ๐ sum()
```sql
select sum(comm) from emp;
```
<br>

### ๐ avg()
```sql
select avg(comm) from emp; --721 (null๊ฐ ๋ฌด์)
select trunc(avg(nvl(comm,0))) from emp; --309๋ฌ๋ฌ
```
โถ ๋๋ค ์ ๋ต -> ํ์ฌ์ ๊ท์ ์ ๋ฐ๋ผ ๋ฌ๋ผ์ง (์ ์ฒด์ฌ์๊ธฐ์ค / ๋ฐ๋์ฌ์๊ธฐ์ค)
<br>

### ๐ group by ..
```sql
--๋ถ์๋ณ ํ๊ท  ๊ธ์ฌ๋ฅผ ๊ตฌํ์ธ์
select deptno, avg(sal)
from emp
group by deptno;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192675995-68fc919f-2321-46cf-8937-5fd5f5263b02.png)
<br>

```sql
--์ง์ข๋ณ ํ๊ท  ๊ธ์ฌ๋ฅผ ๊ตฌํ์ธ์
select job, trunc(avg(sal))
from emp
group by job;
```
[์ถ๋ ฅ๊ฐ] :    
![image](https://user-images.githubusercontent.com/111114507/192675965-ac15389f-3610-47f3-ba2e-c0118b497af2.png)
<br>

```sql
-- ์ง์ข๋ณ ํ๊ท ๊ธ์ฌ, ๊ธ์ฌํฉ, ์ต๋๊ธ์ฌ, ์ต์๊ธ์ฌ, ๊ฑด์๋ฅผ ์ถ๋ ฅํ์ธ์
select * from emp;
select job, avg(sal), sum(sal), max(sal), min(sal), count(sal) as ์ต์๊ธ์ฌ, count(*) as ์ธ์์
from emp
group by job;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192676419-3caf7688-e337-4434-a42f-71bfb358266f.png)
<br>

```sql
--๋ถ์๋ณ, ์ง์ข๋ณ ๊ธ์ฌ์ ํฉ์ ๊ตฌํ์ธ์
select deptno, job, sum(sal)
from emp
group by deptno, job;
```
<br>

[์คํ์์]     
```sql
select์              4
from์                1
where์               2
group by์            3
order by์            5
```
<br>

```sql
-- ์ง์ข๋ณ ํ๊ท ๊ธ์ฌ๊ฐ 3000๋ฌ๋ฌ ์ด์์ธ ์ฌ์์ ์ง์ข๊ณผ ํ๊ท  ๊ธ์ฌ๋ฅผ ์ถ๋ ฅํ์ธ์.
select job, avg(sal) as avgsal
from emp

--where ์กฐ๊ฑด --์ง๊ณ๋ ๊ฒฐ๊ณผ๋ฅผ ์กฐ๊ฑด์ ๋ชปํจ
group by job
having avg(sal) >= 3000; --group by ์กฐ๊ฑด์ 
```
<br>

[์คํ์์]   
```sql
select             5
from               1
where              2
group by           3
having             4
order by           6
```
<br>

### Q) ์ฌ์ํ์ด๋ธ์์ ์ง์ข๋ณ ๊ธ์ฌํฉ์ ์ถ๋ ฅํ๋ ์๋์ ์ง๊ธ๋ฐ๊ณ  ๊ธ์ฌ์ ํฉ์ด 5000 ์ด์์ธ ์ฌ์๋ค์ ๋ชฉ๋ก ๊ธ์ฌ์ ํฉ์ด ๋ฎ์ ์์ผ๋ก ์ถ๋ ฅ
```sql
select job, sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sumsal asc;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192692208-d65e50bb-f3ac-4f2a-8951-1b73a92cfe7b.png)
<br>

### Q) ์ฌ์ํ์ด๋ธ์์ ๋ถ์ ์ธ์์ด 4๋ช๋ณด๋ค ๋ง์ ๋ถ์์ ๋ถ์๋ฒํธ, ์ธ์์, ๊ธ์ฌ์ ํฉ์ ์ถ๋ ฅ
```sql
select deptno, count(*), sum(sal)
from emp
group by deptno
having count(*)>=4;
```
[์ถ๋ ฅ๊ฐ] :     

![image](https://user-images.githubusercontent.com/111114507/192692441-60ad8a22-5423-4507-86c1-b740f993779b.png)
<br>

### Q) ์ฌ์ํ์ด๋ธ์์ ์ง์ข๋ณ ๊ธ์ฌ์ ํฉ์ด 5000์ ์ด๊ณผํ๋ ์ง์ข๊ณผ ๊ธ์ฌ์ ํฉ์ ์ถ๋ ฅ. ๋จ ํ๋งค์ง์ข salesman ์ ์ธํ๊ณ  ๊ธ์ฌํฉ์ผ๋ก ๋ด๋ฆผ์ฐจ์ ์ ๋ ฌ
```sql
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192692631-de45832c-76a9-429f-901b-d756a082bacf.png)
<br>

#### ๐ having & where
1. having
- ๊ทธ๋ฃน์ ๋ํ๋ด๋ ๊ฒฐ๊ณผ ์งํฉ์ ํ์๋ง ์ ์ฉ
- ๊ทธ๋ฃน์ ํํฐ๋ง
- having ์ ์ Group By ์  ๋ค์ ์ฌ์ฉ

2. where
- ๊ฐ๋ณ ํ์ ์ ์ฉ
- ํ์ ํํฐ๋ง ํ๋๋ฐ ์ฌ์ฉ
- Group By ์  ์์ ์ฌ์ฉ

```sql
<์์ฝ>
Having์ ๊ทธ๋ฃนํ ๋๋ ์ง๊ณ๊ฐ ๋ฐ์ํ ํ ๋ ์ฝ๋๋ฅผ ํํฐ๋งํ๋๋ฐ ์ฌ์ฉ๋๋ค.
Where์ ๊ทธ๋ฃนํ ๋๋ ์ง๊ณ๊ฐ ๋ฐ์ํ๊ธฐ ์ ์ ๋ ์ฝ๋๋ฅผ ํํฐ๋งํ๋๋ฐ ์ฌ์ฉ๋๋ค.
```
<br>

## 4. JOIN โ
- Cartesian Product ๋ชจ๋  ๊ฐ๋ฅํ ํ๋ค์ Join
- Equijoin Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ๋ ๊ฒฝ์ฐ ์ฌ์ฉ(์ผ๋ฐ์ ์ผ๋ก PK ์ FK ์ฌ์ฉ)
- Non-Equijoin Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ์ง ์๋ ๊ฒฝ์ฐ์ ์ฌ์ฉ(๋ฑ๊ธ,ํ์ )
- Outer Join Join ์กฐ๊ฑด์ด ์ ํํ ์ผ์นํ์ง ์๋ ๊ฒฝ์ฐ์๋ ๋ชจ๋  ํ๋ค์ ์ถ๋ ฅ
- Self Join ํ๋์ ํ์ด๋ธ์์ ํ๋ค์ Join ํ๊ณ ์ ํ  ๊ฒฝ์ฐ์ ์ฌ์ฉ
- Set Operators ์ฌ๋ฌ ๊ฐ์ SELECT ๋ฌธ์ฅ์ ์ฐ๊ฒฐํ์ฌ ์์ฑํ๋ค
- union์ ์ ์๋๋ก ๊ฒฐํฉ, join์ ์์ผ๋ก ๊ฒฐํฉ
<br>


```sql
select *
from m join s --๊ตฌ๋ฌธ
on m.ml = s.sl; --on ์กฐ์ธ์ ์กฐ๊ฑด์ 
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192698056-7cc9e23b-9b6a-4aba-a643-0c246117805c.png)
<br>

```sql
--์ฌ์๋ฒํธ, ์ฌ์์ด๋ฆ, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ์ธ์
select *
from emp join dept
on emp.deptno = dept.deptno;
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192698144-dff0d0ed-578e-4ac5-96d0-e7ea7cb9e65f.png)
<br>
 
 ```sql
 --SQL JOIN
select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
```
```sql
--ANSI ๋ฌธ๋ฒ
select *
from m join s on m.m1 = s.s1
       join x on s.sl = x.x1;
```
<br>

#### Q) ์ฌ๋ฒ, ์ด๋ฆ(last_name), ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅ(ANSI)
```sql
select cound(*) from employees; -107

select e.employee_id,
       e.last_name,
       e.department_id,
       d.department_name
from employees e join departments d
on e.department_id = d.department_id;
```
[์ถ๋ ฅ๊ฐ] :    
![image](https://user-images.githubusercontent.com/111114507/192704093-9a0a128f-6ee6-4a8c-9f75-c0bb40b8701f.png)
โถ ์ฌ์์๋ 107๋ช์ธ๋ฐ ํ๋ช ๋๋ฝ๋จ  
<br>

```sql
select * from employees where department_id is null;
```
![image](https://user-images.githubusercontent.com/111114507/192704456-8aed53e4-2d53-4347-b794-c99fc67d7671.png)
โถ department_id๊ฐ null์ด๋ผ์ ๋๋ฝ๋จ
<br>

#### Q) ์ฌ๋ฒ, ์ด๋ฆ(last_name), ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ, ์ง์ญ์ฝ๋, ๋์๋ช
```sql
select employee_id, 
       last_name, 
       department_id, 
       department_name, 
       postal_code, 
       city

from employees e join department d
on e.department_id = d.department_id
                 join locations l
on d.location_id = l.location_id;
```
<br>

### ๐ ๋น๋ฑ๊ฐ์กฐ์ธ(non-equl join)
- 1:1 ๋ก ๋น๊ตํ  ์ปฌ๋ผ์ด ์๋ค 
- ์๋ฏธ๋ง ์กด์ฌ >> ๋ฑ๊ฐ์กฐ์ธ์ ๋ฌธ๋ฒ์ ๊ทธ๋๋ก ์ฌ์ฉ
- 1:1๋งคํ on emp.deptno = dept.deptno
```sql
select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;
```
<br>

### ๐ outer join
- equi join ๋จผ์  ์ ํํ๊ณ  ๋์ ๋จ์์๋ ๋ฐ์ดํฐ ๊ฐ์ ธ์ค๋ฉด ๋จ
- ์ฃผ์ข๊ด๊ณ ํ์
- ์ฃผ์ธ์ด ๋๋ ํ์ด๋ธ์ ๋จ์ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ ธ์ฌ ์ ์๋ค
<br>

#### < ๋ฌธ๋ฒ >
- left outer join(์ผ์ชฝ)
- right outer join(์ค๋ฅธ์ชฝ)
- full outer join(left, right >> union)
<br>

```sql
select *
from m left join s
on m.m1 = s.s1;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192708656-df6a33e7-70b6-4615-b975-c9d53d7c7daf.png)
<br>

```sql
select *
from m right join s
on m.m1 = s.s1;
```
[์ถ๋ ฅ๊ฐ] :    
![image](https://user-images.githubusercontent.com/111114507/192708781-c261922a-a7bd-4f0c-a531-61a52d9f4078.png)
<br>

### ๐ self join
- ์๊ธฐ์ฐธ์กฐ
- ๋ฌธ๋ฒ X, ์๋ฏธ๋ง ์กด์ฌ -> ๋ฑ๊ฐ์กฐ์ธ๋ฌธ๋ฒ
- ํ๋์ ํ์ด๋ธ์ ์๋ ์ปฌ๋ผ์ด ์์ ์ ํ์ด๋ธ์ ์๋ ๋ค๋ฅธ ์ปฌ๋ผ์ ์ฐธ์กฐํ๋ ๊ฒฝ์ฐ
```sql
select e.empmo, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno; --13๋ช

select * from emp where ename = 'KING';

```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192711623-68d81239-cd44-40a7-b244-e8c916b83be8.png)
<br>

## 5. ๋ฌธ์ ํ์ด โ
### Q1) ์ฌ์๋ค์ ์ด๋ฆ, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.
```sql
select ename, e.deptno, dname
from emp e join dept d
on e.deptno = d.deptno;
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192769747-706a82cf-1503-46a7-bc20-3616ad61530a.png)
<br>

### Q2) DALLAS์์ ๊ทผ๋ฌดํ๋ ์ฌ์์ ์ด๋ฆ, ์ง์ข, ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.
```sql
select ename, job, e.deptno, dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192770294-03f9b8f6-5bfa-4aab-b640-d772ec7621cc.png)
<br>

### Q3) ์ด๋ฆ์ 'A'๊ฐ ๋ค์ด๊ฐ๋ ์ฌ์๋ค์ ์ด๋ฆ๊ณผ ๋ถ์์ด๋ฆ์ ์ถ๋ ฅํ๋ผ.
```sql
select ename, dname
from emp e join dept d
on e.deptno = d.deptno
where ename like '%A%';
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192770444-30dc9645-8278-42a0-95b1-c66afd915b81.png)
<br>

### Q4) ์ฌ์์ด๋ฆ๊ณผ ๊ทธ ์ฌ์์ด ์ํ ๋ถ์์ ๋ถ์๋ช, ๊ทธ๋ฆฌ๊ณ  ์๊ธ์ ์ถ๋ ฅํ๋๋ฐ ์๊ธ์ด 3000์ด์์ธ ์ฌ์์ ์ถ๋ ฅํ๋ผ.
```sql
select ename, dname, sal
from emp e join dept d 
on e.deptno = d.deptno
where e.sal >= 3000;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192770603-ace46647-bf2e-464b-893c-377f2a8e654d.png)
<br>

### Q5) ์ฌ์์ด๋ฆ๊ณผ ๊ทธ ์ฌ์์ด ์ํ ๋ถ์์ ๋ถ์๋ช, ๊ทธ๋ฆฌ๊ณ  ์๊ธ์ ์ถ๋ ฅํ๋๋ฐ ์๊ธ์ด 3000์ด์์ธ ์ฌ์์ ์ถ๋ ฅํ๋ผ.
```sql
select e.job, e.ename,d.dname
from emp e join dept d
on e.deptno = d.deptno
where job = 'SALESMAN';
```
[์ถ๋ ฅ๊ฐ] :  
![image](https://user-images.githubusercontent.com/111114507/192770755-8e8023a7-e73f-4423-a3a9-a1c6209c60a9.png)
<br>

### Q6) '์ปค๋ฏธ์์ด ์ฑ์ ๋' ์ฌ์๋ค์ ์ฌ์๋ฒํธ, ์ด๋ฆ, ์ฐ๋ด, ์ฐ๋ด+์ปค๋ฏธ์, ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋, ๊ฐ๊ฐ์ ์ปฌ๋ผ๋ช์ '์ฌ์๋ฒํธ', '์ฌ์์ด๋ฆ', '์ฐ๋ด','์ค๊ธ์ฌ', '๊ธ์ฌ๋ฑ๊ธ'์ผ๋ก ํ์ฌ ์ถ๋ ฅํ๋ผ.
```sql
select e.ename as ์ฌ์๋ฒํธ, 
       e.empno as ์ฌ์์ด๋ฆ, 
       e.sal as ์ฐ๋ด, 
       e.sal + e.comm as ๊ธ์ฌ๋ฑ๊ธ
from emp e join dept d
on e.deptno = d.deptno
where e.comm is not null;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192770945-6a5923a9-72c2-4b8d-bb54-fa5163a079e1.png)
<br>

#### Q7) ๋ถ์๋ฒํธ๊ฐ 10๋ฒ์ธ ์ฌ์๋ค์ ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ, ์ฌ์์ด๋ฆ, ์๊ธ, ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋ผ.
```sql
select d.deptno, d.dname, e.ename, e.sal, e.sal + e.comm
from emp e join dept d
on e.deptno = d.deptno
where d.deptno = 10;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192771166-ad10c873-0b8e-400d-a8db-2de018e49658.png)
<br>

#### Q8) ๋ถ์๋ฒํธ๊ฐ 10๋ฒ, 20๋ฒ์ธ ์ฌ์๋ค์ ๋ถ์๋ฒํธ, ๋ถ์์ด๋ฆ, ์ฌ์์ด๋ฆ, ์๊ธ, ๊ธ์ฌ๋ฑ๊ธ์ ์ถ๋ ฅํ๋ผ. ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ถ๋ ฅ๋ ๊ฒฐ๊ณผ๋ฌผ์ ๋ถ์๋ฒํธ๊ฐ ๋ฎ์ ์์ผ๋ก, ์๊ธ์ด ๋์ ์์ผ๋ก ์ ๋ ฌํ๋ผ.
```sql
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d      on e.deptno = d.deptno
           join salgrade s on e.sal between s.losal and s.hisal
where e.deptno in (10, 20) --WHERE  E.DEPTNO <= 20
order by e.deptno asc, e.sal desc;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192771348-193b012e-2c2c-4d5f-8fb7-f040f3784ea6.png)
<br>

#### Q9) ์ฌ์๋ฒํธ์ ์ฌ์์ด๋ฆ, ๊ทธ๋ฆฌ๊ณ  ๊ทธ ์ฌ์์ ๊ด๋ฆฌํ๋ ๊ด๋ฆฌ์์ ์ฌ์๋ฒํธ์ ์ฌ์์ด๋ฆ์ ์ถ๋ ฅํ๋  ๊ฐ๊ฐ์ ์ปฌ๋ผ๋ช์ '์ฌ์๋ฒํธ','์ฌ์์ด๋ฆ', '๊ด๋ฆฌ์๋ฒํธ', '๊ด๋ฆฌ์์ด๋ฆ'์ผ๋ก ํ์ฌ ์ถ๋ ฅํ๋ผ.
```sql
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
```
[์ถ๋ ฅ๊ฐ] :   
![image](https://user-images.githubusercontent.com/111114507/192771486-50adc9d1-91e8-4b7e-b3a8-1e28d3041e2d.png)






