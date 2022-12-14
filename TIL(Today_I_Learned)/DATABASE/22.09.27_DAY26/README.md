# 2022.09.27.TUE π
----------------
<br>

## 1. μ°μ°μ β
<br>

### π λΉκ΅μ°μ°μ
- < , > , <= , =>
- = : κ°λ€ (μλ°μ == μ²λΌ)

### π λΌλ¦¬μ°μ°μ
- AND , OR , NOT

```sql
select empno, ename, sal
from emp
where sal >= 2000;
```
![image](https://user-images.githubusercontent.com/111114507/192404248-14a88322-56ac-4522-a030-368391467d69.png)
<br>

#### Q) μ¬λ²μ΄ 7788λ²μΈ μ¬μμ μ¬λ², μ΄λ¦, μ§μ’, μμ¬μΌμ μΆλ ₯νμΈμ.
```sql
select empno, enmae, jpb, hiredate
from empno
where empno == 7788
```
μΆλ ₯κ° :  
![image](https://user-images.githubusercontent.com/111114507/192404435-3b0ce141-761c-465e-afc4-dd1661b362ef.png)
<br>

#### Q) μ¬μμ μ΄λ¦μ΄ kingμΈ μ¬μμ μ¬λ², μ΄λ¦, κΈμ¬ μ λ³΄λ₯Ό μΆλ ₯νμΈμ.
```sql
select empno, ename, sal 
from emp
where ename = 'KING';
```
<br>

#### Q) κΈμ¬κ° 2000λ¬λ¬ μ΄μμ΄λ©΄μ μ§μ’μ΄ managerμΈ μ¬μμ λͺ¨λ  μ λ³΄λ₯Ό μΆλ ₯νμΈμ.
```sql
select * from emp
where sal >= 2000 and job = 'MANAGER';
```

## 2. λ μ§ β
- sysdate μ¬μ©
- DB μλ²μ λ μ§
<br>

```sql
select sysdate from dual; --22/09/27
```
```sql
select * from nls_session_parameters;
```
![image](https://user-images.githubusercontent.com/111114507/192406201-a4c13acd-bf72-4367-abd5-0a119fbf864a.png)
βΆνμ¬ μ μν μ¬μ©μ(session)κ° κ°μ§λ νκ²½μ λ³΄  
<br>

```sql
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual; --2022-09-27 09:53:19
```
- λ³κ²½μ λ³΄λ νμ¬ μ€λΌν΄ μλ²μ μ μν μ¬μ©μμ μμ νκ²½ μ€μ 
- κ·Έλμ μ μμ λμλ€κ° λ€μ μ°κ²°νλ©΄ μλ μνλ‘ λ³΅μ(RR-MM-DD)
<br>

```sql
select hiredate from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192407512-2b73f318-b55f-45eb-8151-ad53b1861b70.png)
<br>

```sql
select *
from emp
where hiredate = '1980-12-17';
```
βΆ λ μ§λ ' ' μΌλ‘ κ°μΈκΈ°
<br>

```sql
select *
from emp
where hiredate = '1980/12/17'; --μΈμ 

select *
from emp
where hiredate = '1980.12.17'; --μΈμ 
```
```sql
select *
from emp
where hiredate = '80.12.17'; --μΈμ  X
```
<br>

### Q) μ¬μμ κΈμ¬κ° 2000 μ΄μμ΄κ³  4000 μ΄νμΈ λͺ¨λ  μ¬μμ μ λ³΄λ₯Ό μΆλ ₯νμΈμ.
```sql
select * 
from emp
where sal >= 2000 and sal <= 4000;
```
βΆ μ€λ³΅μ½λ  
<br>

```sql
select *
from emp
where sal between 2000 and 4000;
```
βΆ betweenμ μ΄μ, μ΄ν -> μ΄κ³Ό, λ―Έλ§μ μ‘°κ±΄μΌ λλ μ¬μ© λΆκ° 
<br>

#### Q) λΆμλ²νΈκ° 10λ² λλ 20λ² λλ 30λ²μΈ μ¬μμ μ¬λ², μ΄λ¦, κΈμ¬, λΆμλ²νΈλ₯Ό μΆλ ₯νμΈμ.
```sql
select *
from emp
where depno = 10 or depno = 20 or depno = 30;
```
βΆ μ€λ³΅μ½λ  
<br>

```sql
select * 
from emp
where deptno in (10, 20, 30);
```
<br>

### Q) λΆμλ²νΈκ° 10λ² λλ 20λ²μ΄ μλ μ¬μμ μ¬λ², μ΄λ¦, κΈμ¬, λΆμλ²νΈλ₯Ό μΆλ ₯νμΈμ.
```sql
select *
from emp
where deptno != 10 and deptno != 20; --λκ°μ§ μ‘°κ±΄ λͺ¨λ λ§μ‘±

select *
from emp
where deptno where(10,20);
-- not in >> != .. and
```

## 3. creat table ... β
```sql
create table member(
 userid varchar2(20) not null, --nullμ νμ©νμ§ μκ² λ€ (νμμλ ₯)
 name varchar2(20) not null, -- μ΄λ¦μ νμμλ ₯ λ°κ² λ€. (νμμλ ₯)
 hobby varchar2(50) -- default null νμ© : μ νμ  μλ ₯μ¬ν­
);
```

-DML(λ°μ΄ν° μ‘°μμ΄) : insert, update, delete  
-μ€λΌν΄ μ€μ  λ°μμ μν΄μ κ°λ°μμκ² : commit, rollback κ°μ   
-Ms-sql, Mysql default commit >> begin λͺμ DML μμ ...   

```sql
commit; --λͺλ Ή(insert, update, delete) μ€μ  λ°μ
```
<br>

#### Q) μλΉ(comm)μ λ°μ§ μλ λͺ¨λ  μ¬μμ μ λ³΄λ₯Ό μΆλ ₯νμΈμ.
```sql
select comm from emp where comm = null; -- μ‘΄μ¬νμ§ μλ λ¬Έλ²

--null λΉκ΅λ (is null, is not null) 
select comm from emp where comm is null;

select * from emp where comm is not null; -- μλΉμ λ°λ μ¬λλ€
```
<br>

#### Q) μ¬μνμ΄λΈμμ μ¬λ², μ΄λ¦, κΈμ¬, μλΉ, μ΄κΈμ¬(κΈμ¬+μλΉ)λ₯Ό μΆλ ₯νμΈμ.
```sql
select empno, ename, sal, comm, sal + comm as"μ΄κΈμ¬"
from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192415122-1d9b3ec4-f83c-4f01-ab89-298604c3445a.png)
<br>

### π null
- nullκ³Όμ λͺ¨λ  μ°μ°μ κ²°κ³Όλ null ex) 100 + null = null
- μ λ¬Έμ λ₯Ό ν΄κ²°νκΈ° μν΄μ ν¨μ : nvl(), nvl2()  / ex) nvl(μ»¬λΌλͺ, λμ²΄κ°) > μΉν
```sql
select 1000 + nvl(null,0) from dual;
select comm, nvl(comm, 111111) from emp;
select nvl(null, 'hello world') from dual
```

#### Q) μ¬μμ κΈμ¬κ° 1000 μ΄μμ΄κ³  μλΉμ λ°μ§ μλ μ¬μμ μ¬λ², μ΄λ¦, μ§μ’, κΈμ¬, μλΉμ μΆλ ₯νμΈμ.
```sql
select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;
```
<br>

## 4. λ¬Έμμ΄ κ²μ β
### π Like : λ¬Έμμ΄ ν¨ν΄ κ²μ μ°μ°μ
#### [Aλ₯Ό ν¬ν¨νλ λͺ¨λ  λ°μ΄ν°]
```sql
select *
from emp
where ename like '%A%';
```
<br>

#### [Aλ‘ μμ]
```sql
select *
from emp
where ename like 'A%';
```
<br>

#### [Aλ‘ λ]
```sql
select *
from emp
where ename like '%A';
```
<br>

#### [AA ν¬ν¨]
```sql
select *
from emp
where ename like '%AA%';
```
<br>

#### [A λ¨μ΄μ§λ  λΆλ  λκ°]
```sql
select *
from emp
where ename like '%A%A%';
```
<br>

#### [Aκ° λλ²μ§Έ]
```sql
select *
from emp
where ename like '%_A%';
```
<br>

## 5. μ λ ¬ β
- order by μ»¬λΌλͺ : λ¬Έμ, μ«μ, λ μ§ μ λ ¬  
- μ€λ¦μ°¨μ : asc -> λ?μμ : default  
- λ΄λ¦Όμ°¨μ : desc -> λμμ  
- λΉμ©cost : λ§μ΄ λλ μμ  
<br>

### Q) μμ¬μΌμ΄ κ°μ₯ λμ μμΌλ‘ μ λ ¬ν΄μ μ¬λ², μ΄λ¦, κΈμ¬, μμ¬μΌμ μΆλ ₯νμΈμ.
```sql
select empno, ename, sal, hiredate
from emp
order by hiredate desc;
```
[μΆλ ₯κ°] :  
![image](https://user-images.githubusercontent.com/111114507/192424154-b9d11705-e419-47fb-9c28-3f6d8eba9ccf.png)
<br>

```sql
select empno, ename
from emp
order by ename asc;
```
[μΆλ ₯κ°] :   
![image](https://user-images.githubusercontent.com/111114507/192424271-9082f4ba-27e6-40b7-be57-1924892c28b2.png)
<br>

[μ€νμμ]
```sql
select μ    3
from μ      1
where μ     2
order by μ  4 (select ν κ²°κ³Όλ₯Ό μ λ ¬)
```
<br>

```sql
select job, deptno
from emp
order by job asc, deptno desc;
-- Order by μ»¬λΌλͺ asc, μ»¬λΌλͺ asc ... 
```
[μΆλ ₯κ°] :  
![image](https://user-images.githubusercontent.com/111114507/192437035-c6d6e0b7-19eb-49a9-9cbd-41ccb67450fd.png)
<br>

## 6. ν©μ§ν© β

### π union & union all
#### union : νμ΄λΈκ³Ό νμ΄λΈμ λ°μ΄ν°λ₯Ό ν©μΉλ κ²(μ€λ³΅κ° λ°°μ )
- λμλλ μ»¬λΌμ νμμ΄ λμΌ
```sql
select empno, ename from emp
union
select job, deptno from dept; --λ¬Έμμ΄, μ«μ

select empno, ename from emp
union
select deptno, ename from dept;
```
- λμλλ μ»¬λΌμ κ°μκ° λμΌ
```sql
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null from dept;
```



- union all : μ€λ³΅κ° νμ©

## 7. ν¨μ β
1) λ¬Έμν ν¨μ : λ¬Έμλ₯Ό μλ ₯ λ°κ³  λ¬Έμμ μ«μ κ° λͺ¨λλ₯Ό RETURN ν  μ μλ€.  
2) μ«μν ν¨μ : μ«μλ₯Ό μλ ₯ λ°κ³  μ«μλ₯Ό RETURN νλ€.  
3) λ μ§ν ν¨μ : λ μ§νμ λν΄ μννκ³  μ«μλ₯Ό RETURN νλ MONTHS_BETWEEN ν¨μλ₯Ό   μ μΈνκ³  λͺ¨λ λ μ§ λ°μ΄ν°νμ κ°μ RETURN νλ€.  
4) λ³νν ν¨μ : μ΄λ€ λ°μ΄ν°νμ κ°μ λ€λ₯Έ λ°μ΄ν°νμΌλ‘ λ³ννλ€.  
5) μΌλ°μ μΈ ν¨μ : NVL, DECODE  
<br>

### π λ¬Έμμ΄ ν¨μ
#### [initcap]
```sql
--initcap
select initcap('the super man') from dual; --The Super Man
```
#### [lower&upper]
```sql
select lower('AAA'), upper('aaa') from dual;
select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename) = 'king';
```
#### [length]
```sql
select length('abcd') from dual; --λ¬Έμμ΄μ κ°μ 4
select length('νκΈΈλ') from dual; --3κ°
select length('       νκΈΈλa') from dual; --κ³΅λ°±λ λ¬Έμ
```
#### [concat]
```sql
select concat('a', 'b') from dual; --concat : parameter 2κ°
--select concat('a', 'b', 'c') from dual;
select 'a'||'b'||'c' from dual;
select ename || '         ' || job from emp; --μ μ°ν ννκΈ°λ₯
select concat(ename, job) from emp;
```
#### [substr]  
```sql
select substr('ABCDE', 2, 3) from dual; --BCD
select substr('ABCDE', 1, 1) from dual; --A
select substr('ABCDE', 3, 1) from dual; --C
```
### Q) μ¬μνμ΄λΈμμ ename μΉΌλΌμ λ°μ΄ν°μ λν΄μ μ²« κΈμλ μλ¬Έμλ‘ λλ¨Έμ§ κΈμλ λλ¬Έμλ‘ μΆλ ₯νλ νλμ μ»¬λΌμΌλ‘ λ§λ€μ΄ μΆλ ₯νμκ³  μ»¬λΌμ λ³μΉ­μ fullname, μ²« κΈμμ λλ¨Έμ§ λ¬Έμ μ¬μ΄μλ κ³΅λ°± νλ λ£μΌμΈμ. ex) SMITH >> s MITH
```sql
select lower(substr(ename, 1, 1)) || ' ' || substr(ename, 2) as fullname
from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192447703-3e513ab9-a7c0-418a-b928-b467763b11d4.png)
<br>

### Q) μ¬μ©μμ λΉλ² : hong1007 >> ho******
```sql
select rpad(substr('hong1007',1, 2), length('hong1007'), '*') from dual;
```
<br>

### Q) emp νμ΄λΈμμ ename μ»¬λΌμ λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ²«κΈμλ§ μΆλ ₯νκ³  λλ¨Έμ§λ '*'λ‘ μΆλ ₯
```sql
select rpad(substr(ename,1, 1), length(ename), '*') 
from emp;
```
![image](https://user-images.githubusercontent.com/111114507/192451762-f5f8f6af-f33e-4ee8-9f48-8d281486f164.png)
<br>

### Q) μΆλ ₯κ²°κ³Ό : 100 : 123456-*******
[λ¬Έμ ] :  
```sql
create table member2(
id number, 
jumin variable2(14)
);

insert into member2(id, jumin) values(100, '123456-1234567');
insert into member2(id, jumin) values(200, '234567-1234567');
commit;

select * from member2;
```
[μ λ΅] :   
```sql
select id || ' : ' || rpad(substr(jumin, 1, 7), length(jumin), '*') as juminnumber;
```

#### [trim]  
- rtrim ν¨μ : μ€λ₯Έμͺ½λ¬Έμ μ§μλΌ
```sql
select rtrim('MILLER','ER') from dual; --MILL
```

- ltrim ν¨μ : μΌμͺ½λ¬Έμμ§μλΌ
```sql
select ltrim('MILLLLLLLLER'), 'MIL') from dual; --ER
```

- κ³΅λ°±μ κ±°
```sql
select '>' || rtrim('MILLER   ', ' ' ) || '<'  from dual;
select '>' || ltrim('     MILLER   ', ' ' ) || '<'  from dual;
```
<br>

### π μ«μν¨μ
#### [round]
```sql
--  -3 -2 -1 0(μ μ) 1 2 3
select round(12.345,0) as r from dual; -- >> 12
select round(12.567,0) as r from dual; -- >> 13

select round(12.345,1) as r from dual; -- >> 12.3
select round(12.567,1) as r from dual; -- >> 12.6

select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-1) as r from dual; -- >> 10
select round(12.345,-2) as r from dual; -- >> 0
```
<br>

#### [trunc]
```sql
select trunc(12.345,0) as t from dual; -- >> 12
select trunc(12.567,0) as t from dual; -- >> 12

select trunc(12.345,1) as t from dual; -- >> 12.3
select trunc(12.567,1) as t from dual; -- >> 12.5

select trunc(12.345,-1) as t from dual; -- >> 10
select trunc(12.345,-1) as t from dual; -- >> 10
select trunc(12.345,-2) as t from dual; -- >> 0
```
<br>

#### [mod]
```sql
select 12 / 10 from dual; --1.2

select mod(12, 10) from dual; --2

select mod(0,0) from dual; --0
--0μΌλ‘ λλ μ μμ
```
<br>

### π λ μ§ν¨μ
#### <λ μ§μ°μ°>
- DATE + Number >> DATE
- DATE - Number >> DATE
- DATE - DATE >> Number (μΌμ)
<br>

```sql
select sysdate + 100 from dual; --2023-01-05 16:04:31 
select sysdate + 1000 from dual; --2025-06-23 16:05:27
```
```sql
select months_between('2022.09.27','2020.09.27') from dual; --24
select months_between(sysdate,'2000.03.16') from dual; 
```
<br>

#### [λ³νν¨μ to_date()]
```sql
select to_date('2022-01-01') + 100 from dual; --2022-04-11 00:00:00
```
<br>

#### Q1) μ¬μνμ΄λΈμμ μ¬μλ€μ μμ¬μΌμμ νμ¬λ μ§κΉμ§μ κ·Όμμμλ₯Ό κ΅¬νμΈμ.
- μ¬μμ΄λ¦, μμ¬μΌ, κ·Όμμμ μΆλ ₯
- λ¨, κ·Όμμμλ μ μλΆλΆλ§ μΆλ ₯

```sql
select ename, hiredate, trunc(months_between(sysdate, hiredate)), 0 
from emp;
```
#### Q2) νλ¬μ΄ 31μΌμ΄λΌλ κΈ°μ€μμ κ·Όμμμλ₯Ό κ΅¬νμΈμ
- λ±μ¬λ¦Όx, ν¨μμ¬μ©x >> λ μ§ - λ μ§ >> 150μΌ
```sql
select ename, hiredate, trunc((sysdate, hiredate)/31, 0) as "κ·Όμμμ"
from emp;
```
<br>

### π λ³νν¨μ
- Oracle λ°μ΄ν° : λ¬Έμμ΄, μ«μ, λ μ§
- to_char() : μ«μ -> λ¬Έμ(1000 -> $100,000) >> format μΆλ ₯ νμ μ μ
              λ μ§ -> λ¬Έμ('2022-09-29' -> 2022λ 09μ29μΌ)
- to_date() : λ¬Έμ -> λ μ§ (select to_date('2022-01-01') + 100 from dual)
- to_number() : λ¬Έμ -> μ«μ >> μλνλ³ν
```sql
 select '100' + 100 from dual;
 select to_number('100') + 100 from dual;
```
<br>

```sql
select '1' + 1 from dual; --'1'λ¬Έμ -> μ«μ(νλ³ν)
--μμΉ
select to_number('1') + 1 from dual;
```
```sql
select sysdate, to_char(sysdate, 'YYYY') || 'λ' as "YYYY",
to_char(sysdate, 'YEAR') || 'λ' as "YEAR",
to_char(sysdate, 'MM') ||  as "MM",
to_char(sysdate, 'DD') ||  as "DD",
to_char(sysdate, 'DAY') ||  as "DAY",
to_char(sysdate, 'DY') ||  as "DY",
from dual;
```

#### Q) μμ¬μΌμ΄ 12μμΈ μ¬μμ μ¬λ², μ΄λ¦, μμ¬μΌ, μμ¬λλ, μμ¬μμ μΆλ ₯νμΈμ.
```sql
select empno, ename, hiredate, 
  to_char(hiredate, 'YYYY') as YYYY
, to_char(hiredate,'MM') as MM
from emp
where to_char(hredate, 'MM') = '12';
```
[μΆλ ₯κ°] :  
![image](https://user-images.githubusercontent.com/111114507/192469657-8d40c076-3b30-4f77-b3e4-1902840017a0.png)
<br>

#### Q) μ¬μνμ΄λΈ(employees)μμ μ¬μμ μ΄λ¦μ last_name , first_name ν©μ³μ fullname λ³μΉ­ λΆμ¬ν΄μ μΆλ ₯νκ³ , μμ¬μΌμ  YYYY-MM-DD νμμΌλ‘ μΆλ ₯νκ³ , μ°λ΄(κΈμ¬ *12)μ κ΅¬νκ³  μ°λ΄μ 10%(μ°λ΄ * 1.1)μΈμν κ°μ μΆλ ₯νκ³ , κ·Έ κ²°κ³Όλ 1000λ¨μ μ½€λ§ μ²λ¦¬ν΄μ μΆλ ₯νμΈμ. λ¨ 2005λ μ΄ν μμ¬μλ€λ§ μΆλ ₯νμΈμ κ·Έλ¦¬κ³  μ°λ΄μ΄ λμ μμΌλ‘ μΆλ ₯νμΈμ.
```sql
select 
last_name || first_name as fullname,
hire_date as "μμ¬μΌ",
to_char(salary * 12) as "μ°λ΄", 
to_char((salary * 12) * 1.1, '999,999,999') as "μΈμκΈμ¬"
from employees
where to_char(hire_date, 'YYYY') >= '2005'
order by (salary * 12) desc;
-- = order by μ°λ΄ desc; 
-- -> select λ€μμ μ€ν >> select λ κ²°κ³Ό μ»¬λΌκ°μ μ¬μ© κ°λ₯
```
![image](https://cafeptthumb-phinf.pstatic.net/MjAyMjA5MjdfMjg1/MDAxNjY0MjY3MjU0MDUw.1omRfzeXXTy-uhu0gR85J2-uO3F5G5vGHP0NipR0nGcg.WR8iUB-bz-v4bCROxfPAvzA-PQU0cqIIlqbWtDckZCog.PNG/image.png?type=w1600)

