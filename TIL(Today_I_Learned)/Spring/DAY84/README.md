# 2022.12.16.THU π
----------------
<br>

# 1.PlSql -  Procedure(νλ‘μμ ) β
- μ§κΈκΉμ§ λ§λ€μλ μμμ΄ μμμ μΌλ‘ μ μ₯ λμ§ μμλ€
crerate table , create view
λ΄κ° μμμ λ§λ  [μ»€μ]λ₯Ό μμμ μΌλ‘ μ μ₯ (κ°μ²΄)
κ°μ²΄ ννλ‘ μ μ₯ ν΄λμΌλ©΄ κ·Έ λ€μλ²μ μ½λ©νμ§ μκ³  [λΆλ¬ μ¬μ©]
- νμ¬ ν BY ν μλ°μμ ν΄κ²°νλμ§ sqlλ‘ ν΄κ²°νλ λ°©ν₯μ€ μ΄κ±΄
sqlλ‘ ν΄κ²°νλ λ°©λ²μ΄λ€
- Oracle : subprogram(procedure)
Ms-sql : procedure

```java
μμ£Ό μ¬μ©λλ μΏΌλ¦¬λ₯Ό λͺ¨λν μμΌμ κ°μ²΄λ‘ μ μ₯νκ³ 
νμν μμ μ λΆλ¬(νΈμΆ) ν΄μ μ¬μ©νκ² λ€
```
<br>

### π‘ μ₯μ 

κΈ°μ‘΄ : APP(emp.java > select .... κ΅¬λ¬Έ) ->λ€νΈμν¬ > DBμ°κ²° > selet... > DBμ
μ§κΈ : APP(emp.java > usp_emplist κ΅¬λ¬Έ) ->λ€νΈμν¬ > DBμ°κ²° > usp_emplist > DBμ

1. μ₯μ  : λ€νΈμν¬ νΈλν½ κ°μ(μκ° λ¨μΆ)
2. μ₯μ  : λ³΄μ (λ€νΈμν¬ μμμ ...λ³΄μ μμ)ν΄κ²°

## κ²°κ΅­ νλ‘μμ λ SQL λ©μ΄λ¦¬λ₯Ό λ»νλ€

### procedure λ parameter μ’λ₯ 2κ°μ§

1.  input paramter : μ¬μ©μ λ°λμ μλ ₯ (IN : μλ΅νλ default)
2.  output parmater : μ¬μ©μ μλ ₯κ°μ λ°μ§ μμμ (OUT)

```sql
create or replace procedure app_get_emplist
(
  vempno IN emp.empno%TYPE,
  vename OUT emp.ename%TYPE,
  vsal   OUT emp.sal%TYPE
)
is
  BEGIN
    select ename, sal
      into vename , vsal
    from emp
    where empno=vempno;
  END;
```

```sql
--μ€λΌν΄ μ€ν νμ€νΈ
DECLARE
  out_ename emp.ename%TYPE;
  out_sal   emp.sal%TYPE;
BEGIN
   app_get_emplist(7902,out_ename,out_sal);
   DBMS_OUTPUT.put_line('μΆλ ₯κ° : ' || out_ename || '-' || out_sal);
END;
```

μμ)

```sql
CREATE OR REPLACE PROCEDURE usp_EmpList
(
  p_sal IN number,
  p_cursor OUT SYS_REFCURSOR --APP μ¬μ©νκΈ° μν νμ (νκ±΄μ΄μμ λ°μ΄ν° select λ΄λΆμ μΌλ‘ cursor μ¬μ©
)
IS
 BEGIN
     OPEN p_cursor
     FOR  SELECT empno, ename, sal FROM EMP WHERE sal > p_sal;
  END;

create table usp_emp
as
    select * from emp;

alter table usp_emp
add constraint pk_usp_emp_empno primary key(empno);

select * from SYS.USER_CONSTRAINTS where table_name='USP_EMP';
```

```sql
CREATE OR REPLACE PROCEDURE usp_insert_emp
(
 vempno IN emp.empno%TYPE,
 vename IN emp.ename%TYPE,
 vjob   IN emp.job%TYPE,
 p_outmsg OUT VARCHAR2
 )
 IS
   BEGIN
      INSERT INTO USP_EMP(empno , ename, job) VALUES(vempno ,vename , vjob);
      COMMIT;
        p_outmsg := 'success';
        EXCEPTION WHEN OTHERS THEN
        p_outmsg := SQLERRM;
        ROLLBACK;
    END;

DECLARE
  out_msg varchar2(200);
BEGIN
   usp_insert_emp(9998,'νκΈΈλ','IT',out_msg);
   DBMS_OUTPUT.put_line('μΆλ ₯κ° : ' || out_msg);
END;
```
<br>

# 2.PlSql - μ¬μ©μ μ μν¨μ β
κ° μ§μ  νμν ν¨μλ₯Ό λ§λ€μ΄ μ¬μ©κ°λ₯
- μ¬μ©λ°©λ²μ λ€λ₯Έ ν¨μμ¬μ©λ²κ³Ό λμΌ
- μ¬μ©μ μ μ ν¨μ paramter μ μ , return κ°

μμ)

```sql
create or replace function f_max_sal
(s_deptno emp.deptno%TYPE)
return number   -- public int f_max_sal(int deptno) {  return 10}
is
  max_sal emp.sal%TYPE;
BEGIN
      select max(sal)
          into max_sal
      from emp
      where deptno = s_deptno;
      return max_sal;
END;
```

μμ) μ΄λ¦ λ€μ ~~λ λΆνκΈ°

```sql
create or replace function f_callname
(vempno emp.empno%TYPE)
return varchar2 -- public String f_callname() {  String  v_name; return "νκΈΈλ"}
is
  v_name emp.ename%TYPE;
BEGIN
    select ename || 'λ'
      into v_name
    from emp
    where empno=vempno;
    return v_name;
END;
```

```sql
select empno, ename , f_callname(empno) , sal
from emp
where empno=7788;
```

μμ)  parmater μ¬λ²μ μλ ₯λ°μμ μ¬λ²μ ν΄λΉλλ λΆμμ΄λ¦μ λ¦¬ν΄νλ ν¨μ

```sql
create or replace function f_get_dname
(vempno emp.empno%TYPE)
return varchar2
is
    v_dname dept.dname%TYPE;
  BEGIN
    select dname
      into v_dname
    from dept
    where deptno = (select deptno from emp where empno=vempno);
    return v_dname;
  END;
```

```sql
select empno , ename ,deptno, f_get_dname(empno)
from emp 
where empno=7788;
```

![https://user-images.githubusercontent.com/92353613/208003321-7e921791-8c8a-4d21-8bbd-a63a7c7ab15d.png](https://user-images.githubusercontent.com/92353613/208003321-7e921791-8c8a-4d21-8bbd-a63a7c7ab15d.png)
<br>

# 3. PlSql - νΈλ¦¬κ±° (Trigger) β
 [μ¬κ³ ] [μΆκ³ ]       β κ°μ₯ νΈλ¦¬κ±° λ§μ΄ λ§λλ μμ

- μκ³  INSERT (λ΄λΆμ μΌλ‘ [νΈλμ­μ]μ΄ λμ)
- μ¬κ³  INSERT
- μνλΆλ΄ : lock

- PL/SQLμμμ νΈλ¦¬κ±° μ­μ λ°©μμ κ° λΉκ²¨μ§λ©΄ μλμΌλ‘ μ΄μμ΄ λ°μ¬λλ―μ΄
- μ΄λ ν μ΄λ²€νΈκ° λ°μνλ©΄ κ·Έμ λ°λΌ λ€λ₯Έ μμμ΄ μλμΌλ‘ μ²λ¦¬λλ κ²μ μλ―Ένλ€.

```sql
νΈλ¦¬κ±°λ νΉμ  νμ΄λΈμ λ°μ΄ν°μ λ³κ²½μ΄ κ°ν΄μ‘μ λ μλμΌλ‘ μνλλ
[μ μ₯ νλ‘μμ ]λΌκ³  ν  μ μλ€.
μμ λ°°μ΄ μ μ₯ νλ‘μμ λ νμν  λλ§λ€ μ¬μ©μκ° μ§μ 
 EXECUTE λͺλ Ήμ΄λ‘ νΈμΆν΄μΌ νλ€.
νμ§λ§ νΈλ¦¬κ±°λ μ΄μ λ¬λ¦¬ νμ΄λΈμ
λ°μ΄ν°κ° INSERT, UPDATE, DELETE λ¬Έμ μν΄ λ³κ²½λμ΄μ§ λ
[ μλμΌλ‘ μνλλ―λ‘ μ΄ κΈ°λ₯μ μ΄μ©νλ©° μ¬λ¬ κ°μ§ μμ ] μ ν  μ μλ€.
μ΄λ° μ΄μ λ‘ νΈλ¦¬κ±°λ₯Ό μ¬μ©μκ° μ§μ  μ€νμν¬ μλ μλ€.
 
 --μλ(insert, update ,delete)μ΄λ²€νΈκ° λ°μνλ©΄  μλμΌλ‘  μ€νλλ procedure ...
```

- BEFORE : νμ΄λΈμμ DML μ€νλκΈ° μ μ νΈλ¦¬κ±°κ° λμ
μ£Όλ‘ κ²μ¬ν λ λ§μ΄ μ°μ
- AFTER : νμ΄λΈμμ DML μ€ννμ νΈλ¦¬κ±° λμ
[μκ³ ] [μ¬κ³ ] [μΆκ³ ] μ κ°μ΄ μ΄μ΄μ§λ λμμ λ§μ΄ μ°μ

### FOR EACH ROW

- ν λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ triggering λ¬Έμ₯μ μν΄ μν₯λ°μ νμ λν΄ κ°κ° νλ²μ© μ€ννκ³  μ¬μ©νμ§ μμΌλ©΄ λ¬Έμ₯ λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ DML λ¬Έμ₯ λΉ νλ²λ§ μ€νλλ€.

μμ) insert νΈλ¦¬κ±°

```sql
create table tri_emp
as
  select empno , ename from emp where 1=2;

select * from tri_emp;
```

```sql
create or replace trigger tri_01
after insert on tri_emp
BEGIN -- μλ λμν  λ΄μ©
    DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μμ¬');
END;

insert into tri_emp(empno,ename) values(100,'νκΈΈλ');
select * from tri_emp;
```

μμ) update νΈλ¦¬κ±°

```sql
create or replace trigger tri_02
after update on tri_emp
BEGIN
  DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μμ ');
END;

select * from user_jobs;

--νμ΄λΈμ trigger μ λ³΄
select * from user_triggers where table_name='TRI_EMP';

insert into tri_emp values(100,'κΉμ μ ');

update tri_emp
set ename='μν'
where empno=100;
```

μμ delete νΈλ¦¬κ±°

```sql
--delete νΈλ¦¬κ±° : tri_emp
--μ¬μνμ΄λΈ μ­μ  (νλ©΄ μΆλ ₯)
create or replace trigger tri_03
after delete on tri_emp
BEGIN
  DBMS_OUTPUT.PUT_LINE('μ μμ¬μ μ­μ ');
END;

insert into tri_emp values(200,'νκΈΈλ');
update tri_emp set ename='λ³κ²½' where empno= 200;
delete from tri_emp where empno=200;
```

### νΈλ¦¬κ±° μμ  1) νΈλ¦¬κ±°λ₯Ό μ΄μ©ν λ‘κ·Έ μΆμ  μμ λ§λ€κΈ°

- νμ΄λΈμ INSERT, UPDATE, DELETE λ₯Ό ν  λ user, κ΅¬λΆ(I,U,D), sysdate λ₯Ό κΈ°λ‘νλ
- νμ΄λΈ(emp_audit)μ λ΄μ©μ μ μ₯νλ€.
- FOR EACH ROW μ΄ μ΅μμ μ¬μ©νλ©΄
- ν λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ triggering λ¬Έμ₯
- μ μν΄ μν₯λ°μ νμ λν΄ κ°κ° νλ²μ© μ€ννκ³  μ¬μ©νμ§
- μμΌλ©΄ λ¬Έμ₯ λ λ²¨ νΈλ¦¬κ±°κ° λμ΄ DML λ¬Έμ₯ λΉ νλ²λ§ μ€νλλ€.

μ΄κΈ°μμ)

```sql
drop sequence emp_audit_tr;
drop table emp_audit;

create sequence emp_audit_tr
 increment by 1
 start with 1
 maxvalue 999999
 minvalue 1
 nocycle
 nocache;

create table emp_audit(
 e_id number(6) constraint emp_audit_pk primary key,
 e_name varchar2(30),
 e_gubun varchar2(10),
 e_date date);

drop table emp2;
create table emp2
as
    select * from emp;
```

νΈλ¦¬κ±° μ€μ )

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 --for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;
```

μ€ν)

```sql
-- for each row μ μΈ μνμ λ (λͺλ Ήμ΄ ν λ²μ λνμ¬ ν κ±΄μΌλ‘ κΈ°λ‘λλ€.)
select * from emp2;

update emp2 
set deptno = 20
where deptno = 10;

select * from emp_audit;

delete from emp2 where deptno = 20;

select * from emp_audit;
```

![https://user-images.githubusercontent.com/92353613/208007798-f52ef3a4-d8ff-40cc-962c-365eb35c6517.png](https://user-images.githubusercontent.com/92353613/208007798-f52ef3a4-d8ff-40cc-962c-365eb35c6517.png)

---

for each row μ μΈ νμ λ(λͺλ Ήμ΄ ν λ²μ λ³κ²½λ νλ§νΌ κΈ°λ‘λλ€.)

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate);
 elsif updating then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'updating', sysdate);
 elsif deleting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'deleting', sysdate);
 end if;
end;

select * from emp2;
update emp2 set deptno = 20 where deptno = 10;

select * from emp_audit;
```

![https://user-images.githubusercontent.com/92353613/208008016-700221c0-38ca-4cb0-ba4d-d323151ac35e.png](https://user-images.githubusercontent.com/92353613/208008016-700221c0-38ca-4cb0-ba4d-d323151ac35e.png)

---

### νΈλ¦¬κ±° μμ  2)
INSERT, UPDATE, DELETEλ‘ λ³κ²½λλ λ΄μ©μ λνμ¬ μ /ν λ°μ΄ν°λ₯Ό κΈ°λ‘νλ€.

μ΄κΈ°μ€μ )

```sql
create table emp_audit (
 id number(6) constraint emp_audit_pk primary key,
 name varchar2(30),
 gubun varchar2(10),
 wdate date,
 etc1 varchar2(20),  -- old
 etc2 varchar2(20)   -- new
);
```

νΈλ¦¬κ±° μ€μ )

```sql
create or replace trigger emp_audit_tr
 after insert or update or delete on emp2
 for each row
begin
 if inserting then
      insert into emp_audit
      values(emp_audit_tr.nextval, user, 'inserting', sysdate, :old.deptno, :new.deptno);
 elsif updating then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'updating', sysdate, :old.deptno, :new.deptno);
 elsif deleting then
    insert into emp_audit
    values(emp_audit_tr.nextval, user, 'deleting', sysdate, :old.deptno, :new.deptno);
 end if;
end;
```

μΆλ ₯)

```sql
--insert
insert into emp2(empno,ename,deptno) values (9999,'νκΈΈλ',100);
select * from emp_audit;

--update
update emp2 set deptno=200
where empno=9999;
select * from emp_audit;

--delete
delete from emp2 where empno=9999;
select * from emp_audit;
```

---

### νΈλ¦¬κ±° μμ  3) μκ°μ λ°λ₯Έ νΈλ¦¬κ±° μλ

μ΄κΈ°μ€μ )

```sql
create table tri_order
(
  no number,
  ord_code varchar2(10),
  ord_date date
);
```

μ€ν)

```sql
--before νΈλ¦¬κ±°μ λμμμ μ΄ μ€μ  tri_order νμ΄λΈ insert λκΈ° μ μ
--νΈλ¦¬κ±° λ¨Όμ  λμ κ·Έ μ΄ν insert μμ
create or replace trigger trigger_order
before insert on tri_order
BEGIN
  IF(to_char(sysdate,'HH24:MM') not between '11:00' and '16:00') THEN
     RAISE_APPLICATION_ERROR(-20002, 'νμ©μκ° μ€λ₯ μ¬μΈμ');
  END IF;
END;

insert into tri_order values(2,'notebook',sysdate);
select * from tri_order;
commit;
rollback;
--νΈλ¦¬κ±° μ­μ 
drop trigger trigger_order;
```

---

### νΈλ¦¬κ±° μμ  4) μ½λ λͺ»λ£κ² νκΈ°

- POINT
- PL_SQL λκ°μ κ°μλ°μ΄ν°(νμ΄λΈ) μ κ³΅
- :OLD > νΈλ¦¬κ±°κ° μ²λ¦¬ν λ μ½λμ μλ κ°μ μ μ₯ (ms-sql (deleted)
- :NEW > μκ°μ ν¬ν¨ (ms-sql (inserted)

μ΄κΈ°μ€μ )

```sql
create or replace trigger tri_order2
before insert on tri_order
for each row
BEGIN
  IF(:NEW.ord_code) not in('desktop') THEN
     RAISE_APPLICATION_ERROR(-20002, 'μ νμ½λ μ€λ₯');
  END IF;
END;
```

μ€ν)

```sql
select * from tri_order;

--μ€λ₯ (desktop)
insert into tri_order values(200,'notebook',sysdate);

insert into tri_order values(200,'desktop',sysdate);

select * from tri_order;
commit;
```

---

### νΈλ¦¬κ±° μμ  5) μκ³ , μ¬κ³ 

μ΄κΈ°μ€μ )

```sql
--μκ³  , μ¬κ³ 

create table t_01 --μκ³ 
(
  no number,
  pname varchar2(20)
);

create table t_02 --μ¬κ³ 
(
  no number,
  pname varchar2(20)
);

--μκ³  λ°μ΄ν° λ€μ΄μ€λ©΄ κ°μ λ°μ΄ν°λ₯Ό μ¬κ³  μλ ₯
create or replace trigger insert_t_01
after insert on t_01
for each row
BEGIN
  insert into t_02(no, pname)
  values(:NEW.no ,:NEW.pname);
END;
```

μ€ν)

```sql
--μκ³ 
insert into t_01 values(1,'notebook');

select * from t_01;
select * from t_02;

-- μκ³  μ νμ΄ λ³κ²½ (μ¬κ³  λ³κ²½)
create or replace trigger update_t_01
after update on t_01
for each row
BEGIN
  update t_02
  set pname = :NEW.pname
  where no = :OLD.no;
END;

update t_01
set pname = 'notebook2'
where no = 1;

select * from t_01;

select * from t_02;
```

μ€ν)

```sql
--delete νΈλ¦¬κ±° λ§λ€μ΄ λ³΄μΈμ 
--μκ³  λ°μ΄ν° delete from t_01 where no =1 μ­μ  λλ©΄ μ¬κ³  μ­μ 
create or replace trigger delete_tri_01
after delete on t_01
for each row
BEGIN
  delete from t_02
  where no=:OLD.no;
END;

delete from t_01 where no=1;

select* from t_01;
select* from t_02;
```
<br>

# 4.MVC & MyBatis κΈ°λ³Έ μ€μ  λ° κ΅¬μ‘° μ΄ν΄νκΈ° β
![image](https://user-images.githubusercontent.com/111114507/208111949-e20b6be2-07ed-43d8-ae27-8d53a64b28a8.png)
by λΈνμ€ 
## 1) xml
### π‘ [web.xml]
```xml
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>/WEB-INF/spring/root-context.xml</param-value>
	</context-param>
	
	<!-- Creates the Spring Container shared by all Servlets and Filters -->
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>
		
	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>*.htm</url-pattern>
	</servlet-mapping>
	
	<filter>
	  	<filter-name>EncodingFilter</filter-name>
	  	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
	  	<init-param>
	  		<param-name>encoding</param-name>
	  		<param-value>UTF-8</param-value>
	  	</init-param>
  	</filter>
  	<filter-mapping>
  		<filter-name>EncodingFilter</filter-name>
  		<url-pattern>/*</url-pattern>
  	</filter-mapping>
```
- κ°μ₯ λ¨Όμ  μ€ννλ©° κ° μ»¨νμ΄λλ°μ€λ₯Ό μμ±ν΄ μ¬μ©ν  μ€λΉλ₯Ό νλ€!
<br>

### π‘ [pom.xml]
- MAVEN λͺ¨λΈ μ¬μ© μ μ§μ  νμΌ μΆκ°νμ§ μκ³  μμ‘΄μ±μ κΈ°λ°ν΄ μλμΌλ‘ μΆκ°λκ² ... 
<br>

### π‘ [log4j.xml]
- λ κ±°μ νλ‘μ νΈ μμ± μ μλμΌλ‘ μμ±λ¨ (src/main/resources)
- κΈ°λ³Έ μΈνμ΄λ κ΅μλκ³Ό ν¨κ» ν μ½λλ‘ λ?μ΄μ°κΈ°
<br>

### π‘ [log4jdbc.log4j2.properties]
- λ κ±°μ νλ‘μ νΈ μμ± μ μλμΌλ‘ μμ± X -> μ§μ  λ§λ€μ΄μ£ΌκΈ°
- src/main/resources
```xml
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator
```
- νΉλ³ν κΈ°λ₯μ νλ κ²μ΄ μλκ³  κ·Έλ₯ DBμμ κ°μ Έμ¨ κ°μ μμκ² μ½μμ°½μ λμμ€
<br>

### π‘ [servlet-context.xml]
```xml
<!-- λͺ¨λ  μ»¨νΈλ‘€λ¬κ° κ³΅ν΅ μ¬μ© DAO λΉ κ°μ²΄  μ°Έμ‘°-->
<context:annotation-config />
<context:component-scan base-package="ncontroller"  />
<context:component-scan base-package="dao"  />
<context:component-scan base-package="service"  />

<!-- νμΌ μλ‘λ λ³΄μ‘°(λ°λμ)  -->
<bean  id="multipartResolver"    class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
		<property name="maxUploadSize"    value="10485760"></property>
		<property name="defaultEncoding"  value="UTF-8"></property>
</bean>	

```
- base-package = "ν¨ν€μ§λͺ" : μ΄ ν¨ν€μ§ μμ μλ νμΌλ€μ μ κ·Όνκ² λ€ -> μ£Όμ!
- κ³΅ν΅λ κΈ°λ₯λ€μ λͺ¨μλλ κ³΅κ°μ΄λΌκ³  μκ°ν©μλΉ 
<br>

### π‘ [root-context.xml]
```xml
 <bean id="driverManagerDataSource"  class="org.springframework.jdbc.datasource.DriverManagerDataSource">
 	<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
 	<property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE" />
 	<property name="username"        value="springuser"></property>
 	<property name="password"        value="1004"></property>
 </bean> 
  
 <!-- JDBC Template -->
 <bean id=""  class="org.springframework.jdbc.core.JdbcTemplate">
 	<property name="dataSource"  ref="driverManagerDataSource" />
 </bean> 

  <!-- κ³΅ν΅ UI  -->
 <!-- λμ€μ μΆκ° νν -->
  <bean id="internalResourceViewResolver"  class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	 		<property name="prefix">
	 			<value>/WEB-INF/views/</value>
	 		</property>
	 		<property name="suffix">
	 			<value>.jsp</value>
	 		</property>
  </bean>

```
- ν μΈνΈλ‘μ DB μ°κ²°μ ν΄μ€ 
- λ beanμ id κ° λ¬΄μ‘°κ±΄ κ°μμΌν¨!!!
```xml
 <!-- MyBatis μ€μ  START  -->
 <bean id="sqlSessionFactoryBean"  class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="driverManagerDataSource"></property>
    <property name="mapperLocations" value="classpath*:mapper/*xml" />
</bean>

 <bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
  	<constructor-arg index="0" ref="sqlSessionFactoryBean"/>
 </bean> 
 <!-- MyBatis μ€μ   END  -->
```
- MyBatisλ₯Ό μ¬μ©νκΈ° μν΄μ
- λ§μ°¬κ°μ§λ‘ λ beanμ id κ° λ¬΄μ‘°κ±΄ κ°μμΌν¨!!!<br>

## 2) μ€ν νλ¦
#### index.htm μ€ν μ, IndexController.java μμ .htmμ μ°Ύμ
### π‘ [IndexController.java]
```java
@Controller
public class IndexController {
	
	@RequestMapping("/index.htm")
	public String index() {
		return "index";
		//return "/WEB-INF/views/index.jsp";
	}
}
```
- returnν indexκ° ... 
```xml
 <!-- κ³΅ν΅ UI  -->
 <!-- λμ€μ μΆκ° νν -->
  <bean id="internalResourceViewResolver"  class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	 		<property name="prefix">
	 			<value>/WEB-INF/views/</value>
	 		</property>
	 		<property name="suffix">
	 			<value>.jsp</value>
	 		</property>
  </bean>
```
- root-context.xmlμ viewλ‘ λμ΄μ index +.jsp = index.jspκ° λΌμ index.jspλ‘ λμ΄κ°μ λ·°λ¨ μ€ν!
- μ΄λ κ² νλ² κΌ¬μμ κ°λ μ΄μ λ λ³΄μμμ μ΄μ μ νλ©΄ ν¬κΈ°μ λ§μΆ°μ μ‘°μ μ΄ λκ² νκΈ° μν΄μ 
<br>

### π‘ [header.jsp]
```jsp
<li>
    <a href="${pageContext.request.contextPath}/customer/notice.htm"><img src="${pageContext.request.contextPath}/images/menuCustomer.png" alt="κ³ κ°μΌν°" /></a>
</li>
```
- notice.htmμ μ°Ύμ CustomerControllerλ‘
<br>

### π‘ [CustomerController.java]
```java
@Controller
@RequestMapping("/customer/")
public class CustomerController {
	
	private CustomerService customerservice;
	
	@Autowired
	public void setCustomerservice(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	@RequestMapping("notice.htm")  
	public String notices(String pg , String f , String q , Model model) {
		
		List<Notice> list = customerservice.notices(pg, f, q);		
		model.addAttribute("list", list);  
		return "customer/notice";
	}
```
- private CustomerService customerservice; : serviceμμ DBμ DAOμμμ ν΄μ£Όκ³  κ°μ λκ²¨μ€ κ²μ΄κΈ° λλ¬Έμ, μ΄λ₯Ό λ°μμ€κΈ° μν΄μλ λ³μλ‘ λ§λ€μ΄μ€μΌ ν¨ 
- serviceμ noticesν¨μλ₯Ό μ€νν΄ λμ¨ κ°λ€μ listμ λ΄κ³ , μ΄λ₯Ό λ€μ listμ Attribute ν΄μ€ 
<br>

### π‘ [CustomerService.java]
```java
@Service
public class CustomerService {

	//Mybatis μμ
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	//κΈλͺ©λ‘λ³΄κΈ° μλΉμ€ (DB)
	public List<Notice> notices(String pg , String f , String q) {
		
		//default κ° μ€μ 
		int page = 1;
		String field="TITLE";
		String query = "%%";
		
		if(pg != null   && ! pg.equals("")) {
			page  = Integer.parseInt(pg);
		}
		
		if(f != null   && ! f.equals("")) {
			field = f;
		}

		if(q != null   && ! q.equals("")) {
			query = q;
		}
		
		//DAO μμ
		List<Notice> list = null;
		try {
				//λκΈ°ν/////////////////////////////////////////////////////
			 	NoticeDao noticedao = sqlsession.getMapper(NoticeDao.class);
				///////////////////////////////////////////////////////////
			 	list = noticedao.getNotices(page, field, query);
		} catch (ClassNotFoundException e) {
					e.printStackTrace();
		} catch (SQLException e) {
					e.printStackTrace();
		}
		return list;
	}

```
- SqlSession : MyBatis μμ
- NoticeDao noticedao = sqlsession.getMapper(NoticeDao.class); : κ³΅μμΌλ‘ μκ°νλ©΄ λ¨, NoticeDao.xmlμ μ°Ύμ κ°
<br>

### π‘ [NoticeDao.xml]
```xml
	<select id="getNotices" resultType="vo.Notice">
		SELECT * FROM
		    ( SELECT ROWNUM NUM, N.* 
              FROM (
                     SELECT * 
                     FROM NOTICES 
                     WHERE ${param2} LIKE '%${param3}%' ORDER BY REGDATE DESC
                    ) N
             ) WHERE NUM BETWEEN 1 + (${param1}-1)*5 AND 5 + (${param1}-1)*5
	</select>
```
- param1 parm2μ κ°μ νν μ¬μ©νμ§ μκΈ°
- parameter κ° κ·Έλλ‘ μ μ΄μ£ΌκΈ° #{page} -> μ΄λ° μμΌλ‘ 
- DAOμ ν¨μμκ² μΏΌλ¦¬λ¬Έμ μ€νν΄μ μ λ¬ν΄μ£Όλ μ­ν 
<br>

### π‘ [NoticeDao.java] - Interface
```java
//CRUD
public interface NoticeDao {
	//κ²μλ¬Ό κ°μ
	int getCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//μ μ²΄ κ²μλ¬Ό
	List<Notice> getNotices(int page, String field, String query) throws ClassNotFoundException, SQLException;
	
	//κ²μλ¬Ό μ­μ 
	int delete(String seq) throws ClassNotFoundException, SQLException;
	
	//κ²μλ¬Ό μμ 
	int update(Notice notice) throws ClassNotFoundException, SQLException;
	
	//κ²μλ¬Ό μμΈ
	Notice getNotice(String seq) throws ClassNotFoundException, SQLException;
	
	//κ²μλ¬Ό μλ ₯
	int insert(Notice n) throws ClassNotFoundException, SQLException;
}
```
- xmlμ selectλ¬Έ id & interfaceμ ν¨μ μ΄λ¦μ΄ κ°μΌλ©΄ μλμΌλ‘ μ°Ύμμ μ€ν 