# 2022.10.05. WED π
----------------
<br>

## 1. Transaction β




## 2. MVC ν¨ν΄
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fm1.daumcdn.net%2Fcfile229%2FR400x0%2F1145B54A504C57D90DB1C0%22&type=cafe_wa740)
<br>

#### 1) μ μ²΄μ‘°ν
```java
// select * from dept; >> return multi row
public List <Dept> getDeptAllList(){
		return null;
}
```
<br>

#### 2) μ‘°κ±΄μ‘°ν
```java
//select * from dept where deptno = ? >> return singlerow
public Dept getDeptListByDeptNo(int deptno) {
		return null;
}
```
<br>

#### 3) λ°μ΄ν° μ½μ
```java
//insert into dept(deptno, dname, loc) values(?, ?, ?)
//public int insertDept(int deptno, String dname, String loc)
public int insertDept(Dept dept) {
		return 0;
}
```
<br>

#### 4) λ°μ΄ν° μμ 
```java
//update dept set dname=?, loc=? where deptno=?
public int updateDept(Dept dept) {
		return 0;
}
```
<br>

#### 5) λ°μ΄ν° μ­μ 
```java
//delete from dept where deptno=?
	public int deleteDept(int deptno) {
		return 0;
}
```
<br>

## 3. JDBD μ‘°λ³κ³Όμ  β
```java
EMP νμ΄λΈλν΄μ
μ μ²΄μ‘°ν  
μ‘°κ±΄μ‘°ν  where empno=7788
μ½μ   insert into emp( ....) values(...)
μ­μ    delete from emp where empno=7788
μμ    update emp set ename=? , job=? , sal=? , hiredate=?  where empno=?
Like κ²μ μ΄λ¦ κ²μ
```
[κΈ°λ₯κ΅¬ν]  
```java
public class EMP_Test {

	//μ μ²΄μ‘°ν
	public List<Emp> getEmpAllList() {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Emp> emplist = new ArrayList<Emp>();

		try {
			Connection conn = null;
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno, ename, job, mgr, hiredate, sal, comm, deptno from dept";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Emp emp = new Emp(); // νλμ row λ΄κΈ° μν κ°μ²΄
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
				emp.setSal(rs.getInt("comm"));
				emp.setSal(rs.getInt("deptno"));
				emplist.add(emp);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return emplist;
	}

	
	//μ‘°κ±΄μ‘°ν
	public Emp getEmpListByEmpno(int empno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Emp emp =null;

		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno, sal, comm from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, empno);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				emp = new Emp(); // νλμ row λ΄κΈ° μν κ°μ²΄
				emp.setEmpno(rs.getInt("empno"));
				emp.setSal(rs.getInt("sal"));
				emp.setComm(rs.getInt("comm"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
        }
		return emp;
	}

	//insert
	public int insertEmp(Emp emp) {
		Connection conn = null;
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 //conn = SingletonHelper.getConnection("oracle");
			 String sql="insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?,?,?)";
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setInt(1, emp.getEmpno());
			 pstmt.setString(2, emp.getEname());
			 pstmt.setString(3, emp.getJob());
			 pstmt.setInt(4, emp.getMgr());
			 pstmt.setDate(5, emp.getHiredate());
			 pstmt.setInt(6, emp.getSal());
			 pstmt.setInt(7, emp.getComm());
			 pstmt.setInt(8, emp.getDeptno());
			 
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 return rowcount;
	}

	public int updateEmp(Emp emp) {
		 Connection conn = null;
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 //conn = SingletonHelper.getConnection("oracle");
			 String sql="update emp set sal=?, comm=?, deptno=? where empno=?";
			 pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setInt(1, emp.getSal());
			 pstmt.setInt(2, emp.getComm());
			 pstmt.setInt(3, emp.getDeptno());
			 
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 return rowcount;
	}

	public int deleteEmp(int deptno) {
		 Connection conn = null;
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 conn = SingletonHelper.getConnection("oracle");
			 String sql="delete from dept where empno=?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, deptno);
			 rowcount = pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
			 System.out.println(e.getMessage());
		 } finally {
			 SingletonHelper.close(pstmt);
		 }
		 return rowcount;
	}
	
	public List<Emp> getEmpAllListByEname(String ename){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//POINT
		List<Emp> emplist = new ArrayList<Emp>();

		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + ename + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Emp emp = new Emp(); // νλμ row λ΄κΈ° μν κ°μ²΄
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setMgr(rs.getInt("mgr"));
				emp.setHiredate(rs.getDate("hiredate"));
				emp.setSal(rs.getInt("sal"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return emplist;
	}
}

```
[Get&Set]   
```java
import java.sql.Date;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private int sal;
	private int comm;
	private int deptno;
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getComm() {
		return comm;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
	}
}
```
[Main]  
```java
import java.util.List;

import DAO.DeptDao;
import DTO.Dept;
import DTO.Emp;

public class Emp_main {

	public static void main(String[] args) {
		EMP_Test emp_test = new EMP_Test();

		System.out.println("[μ μ²΄μ‘°ν]");
		List<Emp> emplist = emp_test.getEmpAllList();
		if (emplist != null) {
			empPrint(emplist);
		}

		System.out.println("[μ‘°κ±΄μ‘°ν]");
		Emp emp = emp_test.getEmpListByEmpno(7369);
		if (emp != null) {
			empPrint(emp);
		} else {
		}

		System.out.println("[λ°μ΄ν°μ½μ]");
		// empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?,?,?)";
		Emp insertemp = new Emp();
		insertemp.setEmpno(9000);
		insertemp.setEname("JEONGWON");
		insertemp.setMgr(123456);
		insertemp.setHiredate(000316);
		insertemp.setSal(9000);
		insertemp.setComm(700);
		insertemp.setDeptno(70);

		int row = emp_test.insertEmp(insertemp);
		if (row > 0) {
			System.out.println("insert rowcount : " + row);
		}
		
		System.out.println("[λ°©κΈμ  insert λ°μ΄ν° μ μ²΄μ‘°ν]*******");
		emplist =emp_test.getEmpAllList();
		//νλ©΄κ΅¬μ±
		if(emplist != null) {
			empPrint(emplist);
		}
		
		System.out.println("[λ°©κΈμ  insert λ°μ΄ν° μμ νκΈ°]*******");
		Emp updateemp = new Emp();
		insertemp.setEmpno(9000);
		insertemp.setEname("JEONGWON_UP");
		insertemp.setMgr(123456);
		insertemp.setHiredate(000316);
		insertemp.setSal(9000);
		insertemp.setComm(700);
		insertemp.setDeptno(70);
		
		row = emp_test.updateEmp(updateemp);
		if(row > 0) {
			System.out.println("update rowcount : " + row);
		}
		
		System.out.println("[λ°©κΈμ  update λ°μ΄ν° μ μ²΄μ‘°ν]*******");
		emplist = emp_test.getEmpAllList();
		//νλ©΄κ΅¬μ±
		if(emplist != null) {
			empPrint(emplist);
		}
		
		System.out.println("[λ°©κΈμ  update λ°μ΄ν° μ­μ νκΈ°]*******");
		row = emp_test.deleteEmp(9000);
		if(row > 0) {
			System.out.println("delete rowcount : " + row);
		}
		
		System.out.println("[λ°©κΈμ  delete λ°μ΄ν° μ μ²΄μ‘°ν]*******");
		emplist =emp_test.getEmpAllList();
		//νλ©΄κ΅¬μ±
		if(emplist != null) {
			empPrint(emplist);
		}
	}

	public static void empPrint(Emp emp) {
		System.out.println(emp.toString());
	}

	public static void empPrint(List<Emp> list) {
		for (Emp data : list) {
			System.out.println(data.toString());
		}
	}
}
```
<br>

## 4. Database λͺ¨λΈλ§ β
#### DB λͺ¨λΈλ§μ΄λ?
- νμ€ μΈκ³μ μλ¬΄μ μΈ νλ‘μΈμλ₯Ό λ¬Όλ¦¬μ μΌλ‘ λ°μ΄ν°λ² μ΄μ€ν νκΈ° μν κ³Όμ 
<br>

#### DB λͺ¨λΈλ§ κ³Όμ   
![image](https://t1.daumcdn.net/cfile/tistory/993267335A212E010B)
<br>

### π 3κ°μ§ λͺ¨λΈλ§
- κ°λμ  λͺ¨λΈλ§: κ°μ²΄μ κ°μ²΄λ€ κ°μ κ΄κ³μμ ERλ€μ΄μ΄κ·Έλ¨μ λ§λλ κ³Όμ 
- λΌλ¦¬μ  λͺ¨λΈλ§: ERλ€μ΄μ΄κ·Έλ¨μ μ¬μ©νμ¬ κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λ§λλ κ³Όμ 
- λ¬Όλ¦¬μ  λͺ¨λΈλ§: κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λ¬Όλ¦¬μ  κ΅¬μ‘°λ₯Ό μ μνκ³  κ΅¬ννλ κ³Όμ 

<br>

### π κ°λμ  λͺ¨λΈλ§  
- κ°μ²΄(Entity)λ₯Ό μΆμΆνκ³  κ°μ²΄λ€ κ°μ κ΄κ³λ₯Ό μ μνμ¬ ERλ€μ΄μ΄κ·Έλ¨μ λ§λλ κ³Όμ κΉμ§λ₯Ό λ§νλ€.  
![imgae](https://t1.daumcdn.net/cfile/tistory/997C4B335A21306B2E)
<BR>

### π λΌλ¦¬μ  λͺ¨λΈλ§  
- κ°λμ  λͺ¨λΈλ§μμ λ§λ  ER λ€μ΄μ΄κ·Έλ¨μ μ¬μ©νλ €λ DBMSμ λ§κ² μ¬μ(Mapping)νμ¬ μ€μ  λ°μ΄ν°λ² μ΄μ€λ‘ κ΅¬ννκΈ° μν κ΄κ³ μ€ν€λ§ λͺ¨λΈμ λ§λλ κ³Όμ     
![image](https://t1.daumcdn.net/cfile/tistory/99F6C3335A21306B03)
<BR>

### π λ¬Όλ¦¬μ  λͺ¨λΈλ§  
-  λΌλ¦¬μ  λͺ¨λΈμ μ€μ  μ»΄ν¨ν°μ μ μ₯ μ₯μΉμ μ μ₯νκΈ° μν λ¬Όλ¦¬μ  κ΅¬μ‘°λ₯Ό μ μνκ³  κ΅¬ννλ κ³Όμ   
![image](https://t1.daumcdn.net/cfile/tistory/99BE04335A21306C27)
<BR>

μΆμ²: https://mangkyu.tistory.com/27 [MangKyu's Diary:ν°μ€ν λ¦¬]



