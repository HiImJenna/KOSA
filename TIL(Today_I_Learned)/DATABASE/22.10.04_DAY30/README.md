# 2022.10.04. TUE π
----------------
<br>

## 1. MAX β
```sql
insert into board(boardid, title)
values((select nvl(max(boardid, 0) + 1 from board), '1');

insert into board(boardid, title)
values((select nvl(max(boardid, 0) + 1 from board), '2');

insert into board(boardid, title)
values((select nvl(max(boardid, 0) + 1 from board), '3');
```
<br>

## 2. Sequence β
- κΈ λ²νΈ κ³ λ―Ό (μλ²)
- μ€λ³΅κ°μ΄ μκ³  μμ°¨μ μΈ κ°μ μ κ³΅νλ κ°μ²΄
![image](https://user-images.githubusercontent.com/111114507/193710038-b43e75d6-dcac-48d5-9250-fcb5ba965959.png)
<br>

```sql
select board_num.nextval from dual;
```
[μΆλ ₯κ°]   
![image](https://user-images.githubusercontent.com/111114507/193710318-7fcae75c-0975-4655-bfc2-94152eb4bd9b.png)
<br>

```sql
create sequence kboard_num;

insert into kboard(num, title) 
values(kboard_num.nextval, 'μ²μ');

insert into kboard(num, title) 
values(kboard_num.nextval, 'λ');

insert into kboard(num, title) 
values(kboard_num.nextval, 'μ');

select * from kboard;
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193710691-f5031be0-780e-43e8-a42b-63208563712e.png)
<br>

```sql
delete from kboard where num = 1;

insert into kboard(num, title) 
values(kboard_num.nextval, 'λ·');
```
[μΆλ ₯κ°]   
![image](https://user-images.githubusercontent.com/111114507/193710891-d0ad3b75-20f0-4427-a2e6-71836b8298e4.png)
βΆ λ°μ΄ν° μ­μ  νμλ μ€λ₯ λ°μνμ§ μμ!  
<br>

### π κ²μνμ λ§λ€λ!
#### 1) κ²μνμ κ΅¬λΆνμ§ μκ³  κ²μκΈ μλ²μ νμνκ³  μΆλ€λ©΄
- sequence νλ μμ±ν΄μ μ¬λ¬ κ²μνμμ μ¬μ© κ°λ₯
- sequence κ°μ²΄λ κ³΅μ κ°μ²΄-> νμ΄λΈμ μ’μλμ§ μλλ€
- νλμ sequenceλ μ¬λ¬κ³³μμ μμ λ‘­κ² μ¬μ©κ°λ₯
<br>

#### 2) κ²μνμ κ΅¬λΆνμ¬ κ²μκΈ μλ²μ νμνκ³  μΆλ€λ©΄
- 10κ°μ sequenceλ₯Ό λ§λ€μ΄μ κ°κ° μ¬μ©νλ©΄ λ¨

#### π TIP
- MS-SQL : create table board(boardnum int identity(1,1)....
- insert into (title) values('λ°©κ°'); μλμΌλ‘ (1,2,3 ...)
- mysql : create table board(boardnum int auto_increment, ... title)
- insert into board (title) values('λ°©κ°');-> μλ(1,2,3,4,,,)
- mysql λ§λ  μ¬λλ€μ΄ open source >> mariadb

## 3. rownum & Top-n query β
### < rownum >
- μ€μ  λ¬Όλ¦¬μ μΌλ‘ μ‘΄μ¬νλ μ»¬λΌμ΄ μλκ³  λΌλ¦¬μ μΈ μ‘΄μ¬
- μ€μ λ‘ νμ΄λΈμ μ»¬λΌμΌλ‘ μ‘΄μ¬νμ§ μμ§λ§ λ΄λΆμ μΌλ‘ ν λ²νΈλ₯Ό λΆμ¬νλ μ»¬λΌ
![image](https://user-images.githubusercontent.com/111114507/193716087-798cf77b-59fa-46af-9c4a-62704ca091a0.png)
<br>

#### π μμ 1
#### 1λ¨κ³ (salμ΄ λμ μμΌλ‘ μ λ ¬)
```sql
select *
from (
        select * 
        from emp
        order by sal desc
      ) e;
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193716974-865e059b-810a-42cf-9bb3-1a4099d74176.png)
<br>

#### 2λ¨κ³ (rownum)
```sql
select rownum as num, e.*
from (
        select * 
        from emp
        order by sal desc
      ) e;
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193717055-6e0f3aac-8047-4bc6-99b1-23e3e849137f.png)
<br>

#### 3λ¨κ³ (κΈμ¬λ₯Ό λ§μ΄ λ°λ μ¬μ 5λͺ)
```sql
select * 
from (
    select rownum as num, e.*
    from (
            select * 
            from emp
            order by sal desc
          ) e
) n where num <= 5;     
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193717168-6c498efb-0e5b-4b00-a42f-e6f4d47f715a.png)
<br>

#### π μμ 2
#### 1λ¨κ³ (κΈ°μ€ λ°μ΄ν° λ§λ€κΈ°-μ¬λ²μ΄ λ?μ μμΌλ‘ μ λ ¬)
```sql
select * from employees order by employee_id asc;
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193718446-e355f4e7-2a37-4cd8-b850-d04deb39d21a.png)
<br>

#### 2λ¨κ³(κΈ°μ€λ°μ΄ν°μ μλ² λΆμ¬
```sql
select rownum as num, e.*
from (
    select * from employees order by employee_id asc
    ) e
where rownum <= 50; --μ λ ¬λ λ°μ΄ν°μ λ΄λΆμ μΌλ‘ μμ±λ rownum
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193718488-7e53afa2-ce3d-429c-a9d7-ac0ee2e20a58.png)
<br>

#### 3λ¨κ³\
```sql
select *
    from(
        select rownum as num, e.*
        from (
            select * from employees order by employee_id asc
            ) e
        where rownum <= 50
        ) n where num >= 41;
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193718754-f22baa7e-a113-4aac-ab52-228f65e11213.png)
<br>

## 4. JDBC β
<JDBC κΈ°λ³Έκ΅¬μ‘°> 

![image](https://user-images.githubusercontent.com/92353613/193723288-3f5460fe-41af-4c51-b9cd-72c35cba7969.png)

#### JDBCλ?
- μλ°μμ λ°μ΄ν°λ² μ΄μ€μ μ μν  μ μλλ‘ νλ μλ° API
- Java μΈμ΄(APP)λ₯Ό ν΅ν΄μ Oracle(μννΈμ¨μ΄) μ°κ²°ν΄μ CRUDμμ
- Java App : Oracle , My-sql , MS-sql λ±λ± μ°κ²°νκ³  μμ(CRUD)
 -> κ°κ°μ μ νμ λ§λ λλΌμ΄λ²λ₯Ό κ°μ§κ³  μμ΄μΌ νλ€.
- μμμμ :  DBμ°κ²° -> λͺλ Ήμμ± -> λͺλ Ήμ€ν -> μ²λ¦¬ -> μμν΄μ 
- λͺλ Ή : DDL (create , alter , drop), CRUD (insert , select , update , delete)
 - μ€ν : μΏΌλ¦¬λ¬Έμ  DBμλ²μκ² μ λ¬ 
 - μ²λ¦¬ : κ²°κ³Όλ₯Ό λ°μμ νλ©΄ μΆλ ₯ , λλ λ€λ₯Έ νλ‘κ·Έλ¨μ μ λ¬ λ±λ±
 - μμν΄μ  : μ°κ²°ν΄μ  
 <br>


### π PreparedStatement
- λ―Έλ¦¬ SQLλ¬Έμ΄ μνλ Statement κ° DBκ° μ μ‘λμ΄μ Έμ μ»΄νμΌλμ΄μ§κ³ , SQLλ¬Έμ ?λ§ λμ€μ μΆκ° μνν΄μ μ€νμ΄ λμ΄μ§λ μ€λΉλ Statement 
<br>

#### 1. μ₯μ 
- Statement μ λΉν΄μ λ°λ³΅μ μΈ SQLλ¬Έμ μ¬μ©ν  κ²½μ°μ λ λΉ λ₯΄λ€. (νΉν, κ²μλ¬Έ)
- DBμ»¬λΌνμκ³Ό μκ΄μμ΄ ?νλλ‘ νμνλ©΄ λλ―λ‘ κ°λ°μκ° ν·κ°λ¦¬μ§ μκ³  μ½λ€. (νΉν, INSERTλ¬Έ)
- -> μ΄μ  : ?λ₯Ό μ μΈν SQLλ¬Έμ΄ DBμμ λ―Έλ¦¬ μ»΄νμΌλμ΄μ Έμ λκΈ°
<br>

#### 2. λ¨μ 
- SQLλ¬Έλ§λ€ PreparedStatement κ°μ²΄λ₯Ό κ°κ° μμ±ν΄μΌ νλ―λ‘ μ¬μ¬μ©λΆκ°
<br>

#### Connection
```java
public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = SingletonHelper.getConnection(("oracle"));
			String sql = "select empno, ename from emp where deptno = ?";
			//where id =? and name =? and job =?
			// ? parameter
			pstmt = conn.prepareStatement(sql); //λ―Έλ¦¬ μ»΄νμΌ (μΏΌλ¦¬λ₯Ό DBκ° κ°μ§κ³  μμ΄μ)
			
			//μ΄νμλ parameter μ€μ ν΄μ DB λ³΄λ΄λ©΄ λ¨
			pstmt.setInt(1, 30); //where deptno = 30
			
			//ResultSet rs = stmt.executeQuery(sql);
			rs = pstmt.executeQuery();
			
			//κ³΅μκ°μ λ‘μ§
			//λ°μ΄ν° 1κ±΄ or 1κ±΄ μ΄μ or μλ κ²½μ°
			if (rs.next()) { //μ΅μ 1κ±΄
				do {
					System.out.println(rs.getInt(1) + " / " + rs.getString(2));
				} while (rs.next());
			}else { System.out.println("μ‘°νλ λ°μ΄ν°κ° μμ΅λλ€."); }

		} catch (Exception e) {
		
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
			//singletonμ close νμ§ μμ (Appμ΄ μ‘΄μνλ ν)
		}

	}
```
- String sql : μΏΌλ¦¬λ¬ΈμΌλ‘μ¨, μ μ λλ‘ sqldeveloperμ λ€μ΄κ°λ€κ³  μκ°νλ©΄ λλ€!
- pstmt.setInt(1, 30); : '1'λ²μ§Έ ?μ '30'μ λ£κ² λ€.
- rs : κ°μ μ½μ΄μ€κ² μ. 
- rs = pstmt.executeQuery(); : execute(μ€ννλ€) -> queryλ₯Ό μ€ννκΈ° μν΄!
- rs.getInt(1) / rs.getString(2) : data typeμ λ§κ² int, string... μ κ³  ( )μ κ°μ λͺλ²μ§Έ index μΈμ§
<br>

### π PreparedStatementλ‘ λ°μ΄ν° μ€μ΅
![image](https://user-images.githubusercontent.com/111114507/193801736-cad497fd-f424-41d6-94f6-8dc28931a516.png)

#### (1) μ μ²΄μ‘°ννκΈ°
```java
public static void totalSearch() throws SQLException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		 try {
	        conn = SingletonHelper.getConnection("oracle");
	        String sql="select * from sdept";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	         
	        if (rs.next()) {
				do {
					System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
				} while (rs.next());
			}else { System.out.println("μ‘°νλ λ°μ΄ν°κ° μμ΅λλ€."); }

	      } catch (Exception e) {
	         
	      }finally {
	         SingletonHelper.close(rs);
	         SingletonHelper.close(pstmt);
	      }
	   }
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193802083-2e1444fc-6cbf-4ceb-a19d-7c622f0c20e5.png)
<br>

#### (2) λΆλΆμ‘°ννκΈ°
```java
public static void partSearch() {
        Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		 try {
	        conn = SingletonHelper.getConnection("oracle");
	        String sql="select * from sdept where deptno = ?";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, 10);
	        
	        rs = pstmt.executeQuery();
	        
	        
	        if (rs.next()) { //μ΅μ 1κ±΄
				do {
					System.out.println(rs.getInt(1) + " / " + rs.getString(2) + " / " + rs.getString(3));
				} while (rs.next());
			}else { System.out.println("μ‘°νλ λ°μ΄ν°κ° μμ΅λλ€."); }

	      } catch (Exception e) {
	         
	      } finally {
	         SingletonHelper.close(conn);
	      }
}	   
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193802251-4c1fadaf-92e7-4d9c-8ae4-e16dea068982.png)
<br>

#### (3) insert
```java
public static void insert() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		 try {
	        conn = SingletonHelper.getConnection("oracle");
	        String sql="insert into sdept(deptno,dname,loc) values(?,?,?)";
	        
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, 5000);
	        pstmt.setString(2, "Education");
	        pstmt.setString(3, "Vietnam");
	        
	        int row = pstmt.executeUpdate();
	        
	        if(row>0) {
	            System.out.println("update row count : " + row);
	         }
	 
	      } catch (Exception e) {
	         System.out.println("μ€λ₯");
	         System.out.println(e.getMessage());
	         
	      } finally {
		      SingletonHelper.close(pstmt);
	      }
	}
```
[μΆλ ₯κ°]  
![image](https://user-images.githubusercontent.com/111114507/193802703-dd5b2b07-b45a-46b6-b545-5df8f4cbffee.png)
<br>

#### (4) delete
```java
public static void delete() {
        Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		 try {
	        conn = SingletonHelper.getConnection("oracle");
	        String sql="delete from sdept where deptno = ?";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, 12345);
	        
	        int row = pstmt.executeUpdate();
	        
	        if(row>0) {
	            System.out.println("update row count : " + row);
	         }
	 
	      } catch (Exception e) {
	         System.out.println("μ€λ₯");
	         
	      } finally {
		      SingletonHelper.close(pstmt);
	      }
}
```
[μΆλ ₯κ°]   
![image](https://user-images.githubusercontent.com/111114507/193803153-2beccbc1-5f03-4356-b09c-6a6876e380d2.png)
<br>

#### (5) update
```java
public static void update() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		 try {
	        conn = SingletonHelper.getConnection("oracle");
	        String sql="update sdept set deptno=?, dname=?, loc=? where deptno = ?";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, 40);
	        pstmt.setString(2, "MANAGER");
	        pstmt.setString(3, "NEW YORK");
	        pstmt.setInt(4, 5000);
	        
	        int row = pstmt.executeUpdate();
	        
	        if(row>0) {
	            System.out.println("update row count : " + row);
	         }
	 
	      } catch (Exception e) {
	         System.out.println("μ€λ₯");
	         
	      } finally {
	    	  SingletonHelper.close(rs);
		      SingletonHelper.close(pstmt);
	      }
}
```
[μΆλ ₯κ°]   
![image](https://user-images.githubusercontent.com/111114507/193803542-4332496d-a689-4d47-ab80-bdd37017ec85.png)

#### π₯  
DML μμμ νκ³  Commit μ νμ§ μμ κ²½μ° 
νλμ DB μλ²λ₯Ό μ¬μ©ν  κ²½μ°
νλͺμ μ¬μ©μκ° DML μμμ ν κ²½μ° λ°λμ   Commit , rollback  μ ν΅ν΄μ μμμ μλ£νμ
κ·Έλ μ§ μμΌλ©΄ λ€λ₯Έ μ¬μ©μλ  DML μμ λΆκ° ....