# 2022.12.13.TUE ๐
----------------
<br>

# 1. MAVEN โ
- https://mvnrepository.com/
- ์ฟผ๋ฆฌ ๊ธฐ๋ฐ ์น ์ ํ๋ฆฌ์ผ์ด์์ ๊ฐ๋ฐํ  ๋ ๊ฐ์ฅ ๋ง์ด ์ฌ์ฉ๋๋ SQL ๋งคํผ(Mapper) ํ๋ ์์ํฌ.
#### โจ ์ฌ์ด ์ดํด๋ ์๋์์ ์ฝ๋ ๋ณด๋ฉด์!! 
<br>

### [๊ธฐ์กด]
![image](https://user-images.githubusercontent.com/111114507/207293799-0ca96d50-3bcb-493e-9ae7-7fb7faba7acc.png)
- ๋ด๊ฐ ํ๋ํ๋ ์ถ๊ฐํด์คฌ์ด์ผํจ
- ์์กด์ฑ์ผ๋ก ์ธํด์ ๊ด๋ จ๋ ๋ชจ๋ ๊ฒ๋ค์ ์ถ๊ฐํด์ค์ผ ํ๊ธฐ์ ๊ต์ฅํ ๊ท์ฐฎ๊ณ  ๋ถํธํจ
<br>

### [pom.xml]
```xml
	<properties>
		<java-version>1.8</java-version>
		<org.springframework-version>5.3.6</org.springframework-version>
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
	<repositories>
		<repository>
			<id>oracle</id>
			<name>ORACLE JDBC Repository</name>
			<url>http://maven.jahia.org/maven2</url>
		</repository>
	</repositories>
	<dependencies>
		<!-- Spring -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${org.springframework-version}</version>
			<exclusions>
				<!-- Exclude Commons Logging in favor of SLF4j -->
				<exclusion>
					<groupId>commons-logging</groupId>
					<artifactId>commons-logging</artifactId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>

```
![image](https://user-images.githubusercontent.com/111114507/207293162-d0727b04-7938-440d-b5e0-2f2e19d7de60.png)
- Maven์ ์ฌ์ฉํ๋ฉด ์์์ ์์กด์ฑ์ ๊ฐ์ง ์น๊ตฌ๋ค๊น์ง ์ถ๊ฐํด์ฃผ๊ธฐ ๋๋ฌธ์ (์ฌ์ง์ฒ๋ผ) ํธ๋ฆฌํจ!
<br>

# 2. MyBatis โ
- ํ์ต์ฌ์ดํธ : https://mybatis.org/mybatis-3/ko/index.html
- ๋ง์ด๋ฐํฐ์ค๋ ๊ฐ๋ฐ์๊ฐ ์ง์ ํ SQL, ์ ์ฅํ๋ก์์  ๊ทธ๋ฆฌ๊ณ  ๋ช๊ฐ์ง ๊ณ ๊ธ ๋งคํ์ ์ง์ํ๋ ํผ์์คํด์ค ํ๋ ์์ํฌ
- ๋ง์ด๋ฐํฐ์ค๋ JDBC๋ก ์ฒ๋ฆฌํ๋ ์๋น๋ถ๋ถ์ ์ฝ๋์ ํ๋ผ๋ฏธํฐ ์ค์ ๋ฐ ๊ฒฐ๊ณผ ๋งคํ์ ๋์ ํด์ค๋ค.
- ๋ง์ด๋ฐํฐ์ค๋ ๋ฐ์ดํฐ๋ฒ ์ด์ค ๋ ์ฝ๋์ ์์ํ์๊ณผ Map ์ธํฐํ์ด์ค ๊ทธ๋ฆฌ๊ณ  ์๋ฐ POJO ๋ฅผ ์ค์ ํด์ ๋งคํํ๊ธฐ ์ํด XML๊ณผ ์ ๋ธํ์ด์์ ์ฌ์ฉํ  ์ ์๋ค.
#### ๋ด์ผ ์ง๋ ๋๊ฐ์~!
<br>

# 3. IBatis โ
## 1) ๋ฐฉ๋ฒ 1 : ํ xml ์์์ ๋ค ์ฒ๋ฆฌํ๊ธฐ
### [SqlMapConfig.xml]
- ์ ์ผ๋จผ์  ์คํ...
```xml
<sqlMapConfig>
	<transactionManager type="JDBC" commitRequired="true">
		<dataSource type="SIMPLE">
			<property name="JDBC.Driver" value="oracle.jdbc.driver.OracleDriver"/>
			<property name="JDBC.ConnectionURL" value="jdbc:oracle:thin:@localhost:1521:XE"/>
			<property name="JDBC.Username" value="bituser"/>
			<property name="JDBC.Password" value="1004"/>
		</dataSource>	
	</transactionManager>
	<sqlMap resource="Config/member.xml" />
</sqlMapConfig>
```
- DB์์ ์ฐ๊ฒฐ
<br>

## 2) ๋ฐฉ๋ฒ 2 : ๋ xml์ผ๋ก ๋๋๊ธฐ
### [SqlMapConfig.xml]
```xml
<sqlMapConfig>
	<properties resource="kosta/ibatis/sqlmap/SqlMapConnection.properties" />
	
	<transactionManager type="JDBC">
		<dataSource type="SIMPLE">
			<property name="JDBC.Driver" value="${driver}"/>		
			<property name="JDBC.ConnectionURL" value="${url}"/>
			<property name="JDBC.Username" value="${username}" />
			<property name="JDBC.Password" value="${password}"/>
		</dataSource>
	</transactionManager>
	<sqlMap resource="kosta/ibatis/sqlmap/User.xml" />
	
</sqlMapConfig>
```
- value๊ฐ์ parameter๋ก ๋ฐ์์ค๊ธฐ
<br>

### [SqlMapConnection.properties]
```xml
driver=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@localhost:1521:XE
username=springuser
password=1004
```
- parameter ๊ฐ ์ ๊ณตํจ
#### ๊ตณ์ด ์ด๋ ๊ฒ ํ๋ ์ด์ ๋โ
๋ณด์์์ ์ด์ ๋ก ์ฌ์ฉ์์๊ฒ ์จ๊ธฐ๊ณ  ์ถ์ ์ ๋ณด์ด๊ธฐ ๋๋ฌธ! ๊น์ ์ฌ๋ฆด ๋๋ git ignore๋ก ์ฒ๋ฆฌ ๊ฐ๋ฅ<br>

### [์ฟผ๋ฆฌ๋ฌธ๋ด๋.xml]
```xml
<!-- ORM ๊ฐ์ฒด ๋งคํ  Framework
     input  parameter > java bean  void insert(Board board){}
     output parameter > java bean  Board select(){}
       ๊ธฐ์กด์ SQL ๊ตฌ๋ฌธ์ Map ํ์ผ ๊ตฌํ

  select ์คํ ->    Ibatis.dto.Emp  -> Emp ๊ฐ์ฒด ์์ฑ -> setter (์๋ ์ฃผ์) -> Emp ๊ฐ์ฒด ์ฃผ์ ๋ฆฌํด   
 -->
 <sqlMap>
  	<select id="selectEmp" parameterClass="java.lang.String" resultClass="Ibatis.dto.Emp">
 		select empno,ename,job,sal 
 		from emp
 		where ename=#ename# 
 	</select>
 	<insert id="insertEmp" parameterClass="Ibatis.dto.Emp">
 		insert into emp(empno,ename,job,sal)
 		values(#empno#,#ename#,#job#,#sal#)  
 	</insert>
 </sqlMap>
```
- id : DAO์์ ๋ถ๋ฌ์ฌ ๋ฉ์๋์์ ์ง์ ํด์ค ๊ฐ๊ณผ ๊ฐ์์ผํจ
- parameterClass="java.lang.String" : ๋ฌธ์์ดํ, ์ธํธํ (java.lang.int)
- resultClass="Ibatis.dto.Emp" : ๋ถ๋ฌ์ฌ DTO์ ๊ฒฝ๋ก
- '#' : Ibatis๋ฅผ ์ฌ์ฉํ๊ฒ ์, '' ๋ถ์ฌ์ฃผ๊ฒ ์
```xml
<!-- ๊ฐ๋ช์นญ์ ๋ถ์ฌํด์ ๊ฐ์ฒด์ ๋ณ์นญ์ ๋ถ์ฌ  -->
<typeAlias alias="user" type="kosta.ibatis.dto.UserDto"/>
```
- ๋ง์ฝ DTO ์ด๋ฆ์ด ๋๋ฌด ๊ธธ ๋๋ ์ ์ฝ๋์ฒ๋ผ ๊ฒน์น๋ ๋ถ๋ถ์ ๋นผ์ alias= " "์ผ๋ก ์ ์ฅํด ์๋ ์น๊ตฌ๋ค์ resultClass๋ฅผ ๊ฐ๋จํ๊ฒ ์ ์ด์ค ์ ์์ (๊ฐ๋ฐ์๋ ๊ท์ฐฎ๋ค)
```xml
*** KEY POINT ***
    select * from guest where name like '%hong%'
  1) # [ํ์]์ ๋ํ ์ฒ๋ฆฌ : where name=#name# > name='๊น์ ์ ' (DB ์ฟผ๋ฆฌ๊ฐ ์คํ์ 'name')
     >>ibatis >> #name#
     >>Mybatis >> #{name}

    # [ํ์]์ ๋ํ ์ฒ๋ฆฌ : where age=#age# > age=100

  2) $ ์๋ ๊ทธ๋๋ก ์ถ๋ ฅ : where name=$name$ > name=๊น์ ์  
    >>Mybatis >> ${name}  >> #{name}

    parameterClass="String" > #name# > ํ๊ธธ๋ > ๊ฒฐ๊ณผ : 'ํ๊ธธ๋'
    >where ename like '%#name#%' > '%'ํ๊ธธ๋'%'  (x)
    
    parameterClass="String" > $name$ > ํ๊ธธ๋ > ๊ฒฐ๊ณผ : ํ๊ธธ๋
    >where ename like '%$name$%' > '%ํ๊ธธ๋%'
    
    >> int >> #a# >> 100
    >> String >> #a# >> '100'
    
    >> input 100
    >> int >> $a$ >> 100
    >> String >> $a$ >> 100

    ์ปฌ๋ผ๋ช , ํ์ด๋ธ๋ช > $์ปฌ๋ผ๋ช$
    
    select #{ename}  >> select 'ename'
    
    select ${ename}  >>  select ename ...
    
      <select id="getGuestSearch" resultMap="guestResult">
	  	select * from guest where name like '%$value$%' 
	  </select>
```
- query๋ฌธ์์ like ์ธ ๋ ์ฃผ์ํ๊ธฐ โ
<br>

### [DAO.java]
```java
public void insertEmp(Emp e) throws SQLException {
    //values(?,?,?,?)
    //pstmt.setInt(e.getEmpno())
    //pstmt.setString(e.getEname()) ...
        sqlMap.insert("insertEmp",e);
}
public Emp SelectEmp(String ename) throws SQLException {
    
    return (Emp)sqlMap.queryForObject("selectEmp",ename);
    
    //Emp e = new Emp();
    //e.setEmpno(rs.getInt(1));
    //.....
}
```
- ์๋๋ DAO์์ query๋ฌธ์ ์ ์ด์ฃผ๊ณ  ํ๋ค๋ฉด, ์ด์ ๋ query๋ฌธ์ '์ฟผ๋ฆฌ๋ฌธ์๋ด๋.xml'์ ๋ฐ๋ก ๋นผ์ ๊ด๋ฆฌํ๋ค๊ณ  ์๊ฐํ๋ฉด ๋  ๋ฏ
- ๋์  id ๊ฐ๊ณผ column ๋ช์ ์ผ์น์์ผ์ฃผ๋ ๊ฒ์ด ์ค์ํจ