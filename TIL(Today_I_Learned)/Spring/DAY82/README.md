# 2022.12.14.WED π
----------------
<br>

# 1. μ€μ½ν Scope β
### π‘ SqlSessionFactoryBuilder
```
μ΄ ν΄λμ€λ μΈμ€ν΄μ€νλμ΄ μ¬μ©λκ³  λμ Έμ§ μ μλ€. SqlSessionFactory λ₯Ό μμ±ν ν μ μ§ν  νμλ μλ€. κ·Έλ¬λ―λ‘ SqlSessionFactoryBuilder μΈμ€ν΄μ€μ κ°μ₯ μ’μ μ€μ½νλ λ©μλ μ€μ½ν(μλ₯Όλ€λ©΄ λ©μλ μ§μ­λ³μ)μ΄λ€. μ¬λ¬κ°μ SqlSessionFactory μΈμ€ν΄μ€λ₯Ό λΉλνκΈ° μν΄ SqlSessionFactoryBuilderλ₯Ό μ¬μ¬μ©ν  μλ μμ§λ§ μ μ§νμ§ μλ κ²μ΄ κ°μ₯ μ’λ€.
```
### π‘ SqlSessionFactory
```
νλ² λ§λ λ€ SqlSessionFactoryλ μ νλ¦¬μΌμ΄μμ μ€ννλ λμ μ‘΄μ¬ν΄μΌλ§ νλ€. κ·Έλμ μ­μ νκ±°λ μ¬μμ±ν  νμκ° μλ€. μ νλ¦¬μΌμ΄μμ΄ μ€νλλ λμ μ¬λ¬ μ°¨λ‘ SqlSessionFactory λ₯Ό λ€μ λΉλνμ§ μλ κ²μ΄ κ°μ₯ μ’μ ννμ΄λ€. μ¬λΉλνλ ννλ κ²°κ³Όμ μΌλ‘ βλμλμβ κ° λλλ‘ νλ€. κ·Έλ¬λ―λ‘ SqlSessionFactory μ κ°μ₯ μ’μ μ€μ½νλ μ νλ¦¬μΌμ΄μ μ€μ½νμ΄λ€. μ νλ¦¬μΌμ΄μ μ€μ½νλ‘ μ μ§νκΈ° μν λ€μν λ°©λ²μ΄ μ‘΄μ¬νλ€. κ°μ₯ κ°λ¨ν λ°©λ²μ μ±κΈν΄ ν¨ν΄μ΄λ static μ±κΈν΄ ν¨ν΄μ μ¬μ©νλ κ²μ΄λ€. λλ κ΅¬κΈ μ₯¬μ€λ μ€νλ§κ³Ό κ°μ μμ‘΄μ± μ½μ μ»¨νμ΄λλ₯Ό μ νΈν  μλ μλ€. μ΄λ¬ν νλ μμν¬λ SqlSessionFactoryμ μλͺμ£ΌκΈ°λ₯Ό μ±κΈν΄μΌλ‘ κ΄λ¦¬ν  κ²μ΄λ€.
```

### π‘ SqlSession
```κ°κ°μ μ°λ λλ μμ²΄μ μΌλ‘ SqlSessionμΈμ€ν΄μ€λ₯Ό κ°μ ΈμΌ νλ€. SqlSessionμΈμ€ν΄μ€λ κ³΅μ λμ§ μκ³  μ°λ λμ μμ νμ§λ μλ€. κ·Έλ¬λ―λ‘ κ°μ₯ μ’μ μ€μ½νλ μμ²­ λλ λ©μλ μ€μ½νμ΄λ€. SqlSession μ static νλλ ν΄λμ€μ μΈμ€ν΄μ€ νλλ‘ μ§μ ν΄μλ μλλ€. κ·Έλ¦¬κ³  μλΈλ¦Ώ νλ μμν¬μ HttpSession κ³Ό κ°μ κ΄λ¦¬ μ€μ½νμ λ¬μλ μλλ€. μ΄λ ν μ’λ₯μ μΉ νλ μμν¬λ₯Ό μ¬μ©νλ€λ©΄ HTTP μμ²­κ³Ό μ μ¬ν μ€μ½νμ λλ κ²μΌλ‘ κ³ λ €ν΄μΌ νλ€. λ¬λ¦¬ λ§ν΄μ HTTP μμ²­μ λ°μλλ§λ€ λ§λ€κ³  μλ΅μ λ¦¬ν΄ν λλ§λ€ SqlSession μ λ«μ μ μλ€. SqlSession μ λ«λ κ²μ μ€μνλ€. μΈμ λ finally λΈλ‘μμ λ«μμΌλ§ νλ€. λ€μμ SqlSessionμ λ«λ κ²μ νμΈνλ νμ€μ μΈ ννλ€.
```
#### [λμλμκ° λλ μ½λ]
```JAVA
public class SqlMapClient {
	private static SqlSession session;
	
	static {
		String resource = "SqlMapConfig.xml";
		try {
			  Reader reader =  Resources.getResourceAsReader(resource);
			  SqlSessionFactory factory=  new  SqlSessionFactoryBuilder().build(reader);
			  session = factory.openSession();
		}catch (Exception e) {
			
		}
	}
	public static SqlSession getSqlSession() {
		return session;
    }
}
```
#### [κ°μ μν¨ μ½λ]
```java
public class SqlMapClient {
	private static SqlSessionFactory sqlsessionfactory;
	static {
		String resource = "SqlMapConfig.xml";
		try {
			 Reader reader = Resources.getResourceAsReader(resource);
			 sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
			 
		}catch(Exception e) {
		}
	}
	 public static SqlSessionFactory getSqlSession(){
		  return sqlsessionfactory;
	  }	
}
```

# 2. Mybatis

## ****μ€μ½ν(Scope) μ μλͺμ£ΌκΈ°(Lifecycle)****

[MyBatis - λ§μ΄λ°ν°μ€ 3 | μμνκΈ°](https://mybatis.org/mybatis-3/ko/getting-started.html)

### **SqlSessionFactoryBuilder**

- μ΄ ν΄λμ€λ μΈμ€ν΄μ€νλμ΄ μ¬μ©λκ³  λμ Έμ§ μ μλ€. SqlSessionFactory λ₯Ό μμ±ν ν μ μ§ν  νμλ μλ€. κ·Έλ¬λ―λ‘ SqlSessionFactoryBuilder μΈμ€ν΄μ€μ κ°μ₯ μ’μ μ€μ½νλ λ©μλ μ€μ½ν(μλ₯Όλ€λ©΄ λ©μλ μ§μ­λ³μ)μ΄λ€. μ¬λ¬κ°μ SqlSessionFactory μΈμ€ν΄μ€λ₯Ό λΉλνκΈ° μν΄ SqlSessionFactoryBuilderλ₯Ό μ¬μ¬μ©ν  μλ μμ§λ§ μ μ§νμ§ μλ κ²μ΄ κ°μ₯ μ’λ€.

### **SqlSessionFactory**

- νλ² λ§λ λ€ SqlSessionFactoryλ μ νλ¦¬μΌμ΄μμ μ€ννλ λμ μ‘΄μ¬ν΄μΌλ§ νλ€. κ·Έλμ μ­μ νκ±°λ μ¬μμ±ν  νμκ° μλ€. μ νλ¦¬μΌμ΄μμ΄ μ€νλλ λμ μ¬λ¬ μ°¨λ‘ SqlSessionFactory λ₯Ό λ€μ λΉλνμ§ μλ κ²μ΄ κ°μ₯ μ’μ ννμ΄λ€. μ¬λΉλνλ ννλ κ²°κ³Όμ μΌλ‘ βλμλμβ κ° λλλ‘ νλ€. κ·Έλ¬λ―λ‘ SqlSessionFactory μ κ°μ₯ μ’μ μ€μ½νλ μ νλ¦¬μΌμ΄μ μ€μ½νμ΄λ€. μ νλ¦¬μΌμ΄μ μ€μ½νλ‘ μ μ§νκΈ° μν λ€μν λ°©λ²μ΄ μ‘΄μ¬νλ€. κ°μ₯ κ°λ¨ν λ°©λ²μ μ±κΈν΄ ν¨ν΄μ΄λ static μ±κΈν΄ ν¨ν΄μ μ¬μ©νλ κ²μ΄λ€. λλ κ΅¬κΈ μ₯¬μ€λ μ€νλ§κ³Ό κ°μ μμ‘΄μ± μ½μ μ»¨νμ΄λλ₯Ό μ νΈν  μλ μλ€. μ΄λ¬ν νλ μμν¬λ SqlSessionFactoryμ μλͺμ£ΌκΈ°λ₯Ό μ±κΈν΄μΌλ‘ κ΄λ¦¬ν  κ²μ΄λ€.

### **SqlSession**

- κ°κ°μ μ°λ λλ μμ²΄μ μΌλ‘ SqlSessionμΈμ€ν΄μ€λ₯Ό κ°μ ΈμΌ νλ€. SqlSessionμΈμ€ν΄μ€λ κ³΅μ λμ§ μκ³  μ°λ λμ μμ νμ§λ μλ€. κ·Έλ¬λ―λ‘ κ°μ₯ μ’μ μ€μ½νλ μμ²­ λλ λ©μλ μ€μ½νμ΄λ€. SqlSession μ static νλλ ν΄λμ€μ μΈμ€ν΄μ€ νλλ‘ μ§μ ν΄μλ μλλ€. κ·Έλ¦¬κ³  μλΈλ¦Ώ νλ μμν¬μ HttpSession κ³Ό κ°μ κ΄λ¦¬ μ€μ½νμ λ¬μλ μλλ€. μ΄λ ν μ’λ₯μ μΉ νλ μμν¬λ₯Ό μ¬μ©νλ€λ©΄ HTTP μμ²­κ³Ό μ μ¬ν μ€μ½νμ λλ κ²μΌλ‘ κ³ λ €ν΄μΌ νλ€. λ¬λ¦¬ λ§ν΄μ HTTP μμ²­μ λ°μλλ§λ€ λ§λ€κ³  μλ΅μ λ¦¬ν΄ν λλ§λ€ SqlSession μ λ«μ μ μλ€. SqlSession μ λ«λ κ²μ μ€μνλ€. μΈμ λ finally λΈλ‘μμ λ«μμΌλ§ νλ€. λ€μμ SqlSessionμ λ«λ κ²μ νμΈνλ νμ€μ μΈ ννλ€.

λμλμκ° λλ μ½λ)

```java
λμ λμκ° λλ μ½λ  
public class SqlMapClient {
	private static SqlSession session;
	
	static {
		String resource = "SqlMapConfig.xml";
		try {
			  Reader reader =  Resources.getResourceAsReader(resource);
			  SqlSessionFactory factory=  new  SqlSessionFactoryBuilder().build(reader);
			  session = factory.openSession();
		}catch (Exception e) {
			
		}
	}
	public static SqlSession getSqlSession() {
		return session;
	}
	
}
```

μ’μλμκ° λλ μ½λ)

```java
public class SqlMapClient {
	private static SqlSessionFactory sqlsessionfactory;
	static {
		String resource = "SqlMapConfig.xml";
		try {
			 Reader reader = Resources.getResourceAsReader(resource);
			 sqlsessionfactory = new SqlSessionFactoryBuilder().build(reader);
			 
		}catch(Exception e) {
		}
	}
	 public static SqlSessionFactory getSqlSession(){
		  return sqlsessionfactory;
	  }	
}
```

---

```java
public int insert(GuestDTO guestobj){
		SqlSession session = null;
		try{
			//factory.openSession(true); autocommit
			//factory.openSession(); app (commit ,rollback)
					
			session = factory.openSession();//μμμ method λ¨μ
			
			int result = session.insert("GUEST.insertGuest",guestobj);
			session.commit();
			return result;
		}catch(Exception e){
			session.rollback();
			return 0;
		}finally{
			if(session != null){session.close();}
		}
		
	}
```

## Dynamic Query

### **foreach**

λμ  SQL μμ κ³΅ν΅μ μΌλ‘ νμν κ²μ collection μ λν΄ λ°λ³΅μ²λ¦¬λ₯Ό νλ κ²μ΄λ€. μ’μ’ IN μ‘°κ±΄μ μ¬μ©νκ² λλ€. μλ₯Όλ€λ©΄

```sql
<select id="selectPostIn" resultType="domain.blog.Post">
  SELECT *
  FROM POST P
  <where>
    <foreach item="item" index="index" collection="list"
        open="ID in (" separator="," close=")" nullable="true">
          #{item}
    </foreach>
  </where>
</select>
```

### μμ) λ€μ€ κ²μ λ§λ€κΈ°

![https://user-images.githubusercontent.com/92353613/207487753-724cbf79-3cc9-4825-bb74-86736dfa94d4.png](https://user-images.githubusercontent.com/92353613/207487753-724cbf79-3cc9-4825-bb74-86736dfa94d4.png)

Dao

```java
<select id="selectSearch" parameterType="hashMap" resultType="guest">
		select * from guest
		<if test="column != null">
			where ${column} like '%' || #{search} || '%' 
		</if>
		<!-- where 'name' like '%νκΈΈλ%' -->
	</select>
```

view

```java
<h3>λ€μ€κ²μνκΈ°</h3>
	κ²μ: where name='kglim' or email='naver' or home='kosta'
	<form action="guest.do?cmd=search2" method="post">
		<input type="checkbox" name="name" value="name" checked>μμ±μ
		<input type="checkbox" name="email" value="email" >λ©μΌ
		<input type="checkbox" name="home" value="home" >ννμ΄μ§
		<br>
		κ²μμ΄:<input type="text" name="keyvalue">
		<input type="submit" value="κ²μ">
	</form>
```

# [key point]

## Mybatis μ¬μ© νλ‘μ νΈ μ§νμ

1. mapper namespace μ΄λ¦ : DAO κ°μ§λ interface μ΄λ¦μ κ·Έλλ‘
2. <select id="" μ΄λ¦μ interface κ°μ§λ ν¨μλͺκ³Ό λμΌ
result : interface μ mapper μμΌλ©΄ μ€ν

```java
int insertBoard(BoardDTO dto);
int updateBoard(BoardDTO dto);
int deleteBoard(BoardDTO dto);

List<BoardDTO> getBoardList(HashMap map);
BoardDTO getBoard(int num);

void updateHit(int num); //μ‘°νμ μ¦κ°
int getBoardCount(); //μ μ²΄ κΈ μ

void insertReply(BoardDTO dto); //λ΅λ³μ²λ¦¬
void updateSort(BoardDTO dto);  //λ΅λ³ μ²λ¦¬(step(sort) κ° λ³κ²½)
```