# 2022.12.12.MON ๐
----------------
<br>

# 1. Container โ
- ์๋ฐ ๊ฐ์ฒด(Bean)๋ฅผ ๊ด๋ฆฌํด์ฃผ๋ ์ญํ 
- Bean์ ์์ฑ๋ถํฐ ์๋ฉธ๊น์ง๋ฅผ ๊ฐ๋ฐ์ ๋์  ๊ด๋ฆฌํด์ฃผ๋ ๊ณณ
- BeanFactory์ ApplicationContextfh ๋ ์ข๋ฅ
![image](https://user-images.githubusercontent.com/111114507/206942031-23ffb802-9537-490a-bcff-31774e513d3c.png)<br>
![image](https://user-images.githubusercontent.com/111114507/206942051-862e991a-3d88-47c9-ae06-f0742a91d420.png)<br>
![image](https://user-images.githubusercontent.com/111114507/206942069-945db992-64e9-4d6a-a79e-667fde4cc7b5.png)<br>
```
ContextLoaderListener ์ DispatcherServlet ์ ๊ฐ๊ฐ webapplicationcontext ๋ฅผ ์์ฑํ๋๋ฐ
ContextLoaderListener ๊ฐ ์์ฑํ ์ปจํ์คํธ๊ฐ root ์ปจํ์คํธ๊ฐ ๋๊ณ  DispatcherServlet ์ด ์์ฑํ ์ธ์คํด์ค๋ root ์ปจํ์คํธ๋ฅผ ๋ถ๋ชจ๋ก ํ๋ ์์ ์ปจํ์คํธ๊ฐ ๋๋ค.
```
```
์์ ์ปจํ์คํธ๋ค์ root ์ปจํ์คํธ์ [์ค์  ๋น]์ ์ฌ์ฉ ํ  ์ ์๋ค.
๊ทธ๋ฌ๊ธฐ์ ContextLoaderListener ์ ์ด์ฉ ๊ณตํต๋น ์ค์  ๊ฐ๋ฅ. (DB์์ , ๊ณตํต์ฌํญ)
```
<br>

### ๐ ์์ ์ปจํ์ด๋
#### [web.xml]
```xml
  <listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <context-param>
  	<param-name>contextConfigLoacation</param-name>
  	<param-value>/WEB-INF/applicationContext.xml</param-value>
  </context-param>
```
- listenr : root Container ์์ฑ
- ContextLoaderListener ์์ฑํ๊ณ  /WEB-INF/applicationContext.xmlfh ํ์ผ ์ง์  ํด์ฃผ๋ฉด ๊ทธ ํ์ผ์ด root container๋ฅผ ๋ด๋ ๊ณณ์ด ๋จ
<br>

### ๐ ์์ ์ปจํ์ด๋
```xml
  <servlet>
  	 <servlet-name>dispatcher</servlet-name>
  	 <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
 	 <!-- <init-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
     		classpath:/WEB-INF/servlet.xml
     		classpath:/WEB-INF/base2.xml
    	</param-value>
   	 </init-param> -->
  </servlet>
  <servlet-mapping>
  	<servlet-name>dispatcher</servlet-name>
  	<url-pattern>*.do</url-pattern>
  </servlet-mapping>
```
- ํ์ Container ์์ฑ
<br>

### ๐ ํ์์ปจํ์ด๋์์ ํ๊ธํํฐ ์์ฑ
```xml
  	<filter-name>Encoding Filter</filter-name>
  	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
  	<init-param>
  		<param-name>encoding</param-name>
  		<param-value>UTF-8</param-value>
  	</init-param>
  </filter>
```
- ๋ชจ๋  ์์ฒญ์ ๊ฑฐ์ณ๊ฐ๊ฒ ํด์ ... ํ๊ธ ์ ์ฉ!
<br>

### ๐ ์์ ์ปจํ์ด๋ applicationContext.xml
```xml
<!-- ๊ณตํต DB์์  -->
  <bean id = "DriverManagerDataSource" class = "org.springframework.jdbc.datasource.DriverManagerDataSource">
  	<property name = "driverClassName" value = "oracle.jdbc.driver.OrWWWacleDriver"></property>
	<property name = "url" value = "jdbc:oracle:thin:@localhost:1521:xe"></property>
	<property name = "username" value = "springuser"></property>
	<property name = "password" value = "1004"></property>
  </bean>
```
```xml
<!-- JDBC Template -->
  <bean id ="" class = "org.springframework.jdbc.core.JdbcTemplate">
  	<property name = "dataSource" ref = "driverManagerDataSource"/>
  </bean>
```
<br>

# 2. JDBC API โ
```
๊ธฐ์กด : Model2 ๊ธฐ๋ฐ์ MVC ํจํด : JDBC API ์ฌ์ฉ (Connection , Statement , PrepareStatement ,ResultSet..)
ํจ์ ์ฌ์ฉ ์คํ : ResultSet rs = st.executeQuery();
ํจ์ ์ฌ์ฉ ์คํ : int result = st.executeUpdate();
select a, b, c, d, e, f, g from data;
dto ๋ด์๋ผ ...
class data {private int a, b, c, d, e, f, .....}
while(rs.next()){ data d = new data(); d.setA(rs.getInt("a"))}
๋จ์ํ ์์์ ์ํ์ผ๋ฉด ์ข๊ฒ ์ด์.....
- Spring ์ ๊ณตํ๋ > JDBCTemplate(ํ) > [์ฝ๋๋ ๊ฐ์] , [์ผ์ํ๋ ์ฝ๋ ์์ ๊ฐ๋ฅ] (์ ์ง๋ณด์)
๋ฌธ์ ์ ) ์ธํฐํ์ด์ค ๊ธฐ๋ฐ (์ค๊ณ) > ์ต๋ชํด๋์ค > ์ฝ๋ ์๋ต > ์ถ์ํ > ๊ฐ๋ฐ์ ์์ฅ์์ ๊ฐ๋์ฑ
```
```java
public class MemberDAOImpl implements MemberDAO{

   /*
   JdbcTemplate template = new JdbcTemplate();
   public void m() { template.execute("select...");}
   IOC ์ปจํ์ด๋ ์์ Bean ์ผ๋ก ์์ฑ ๋์ด ์์ด์
   
   
   MemberDAOImpl ๊ฐ์ฒด JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๋ค
   */
   private JdbcTemplate jdbctemplate;
   
   @Autowired //by type
   public void setJdbctemplate(JdbcTemplate jdbctemplate) {
      this.jdbctemplate = jdbctemplate;
   }
```
- MemberDAOImpl ๊ฐ์ฒด๋ JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๊ธฐ๋๋ฌธ์ @Autowired ํน์ @Resource๋ก ์ฃผ์์ ํด์ค์ผํจ

<br>


# 3. JDBC Template โ
![image](https://user-images.githubusercontent.com/111114507/207038949-214e1458-3f48-43bf-b819-83c039b4e3ab.png)<br>


#### [web.xml]
```xml
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
  </welcome-file-list>
  
  <!--  
  	Root Container(ApplicationContext)
  	listener ๋ฅผ ํตํด์ web.xml ์คํ์ ๊ฐ์ฅ ๋จผ์  ์คํ
  	applicationContext.xml > IOC DI ๊ตฌ์ฑ ํ์ผ๋ก (๊ณตํต๋น : ๋ค๋ฅธ IOC ์ปจํ์ด๋ ์ฐธ์กฐํ๋ Bean ๊ตฌ์ฑ)
  	org.springframework.web.context.ContextLoaderListener
  -->
  
  <listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <context-param>
  	<param-name>contextConfigLocation</param-name>
  	<param-value>/WEB-INF/applicationContext.xml</param-value>
  </context-param>
  
  
  <servlet>
  	 <servlet-name>dispatcher</servlet-name>
  	 <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
 	<!--  <init-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
     		classpath:/WEB-INF/servlet.xml
     		classpath:/WEB-INF/base2.xml
    	</param-value>
   	 </init-param> -->
  </servlet>
  <servlet-mapping>
  	<servlet-name>dispatcher</servlet-name>
  	<url-pattern>*.do</url-pattern>
  </servlet-mapping>
  <!-- DI ๊ตฌ์ฑํ๋ xml ํ์ผ : [servlet์ด๋ฆ]-servlet.xml  -->
  
  <!-- Filter ์ฌ์ฉํ ํ๊ธ ์ฒ๋ฆฌ 
  org.springframework.web.filter.CharacterEncodingFilter
  -->
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
- ์คํ ์์ : web.xml -> index.html -> applicationContext.xml(์์์ปจํ์ด๋) -> *.do ์ฐพ์์..
<br>

#### [index]
```html
<fieldset style="width:250px">
    <legend>MAIN SITE</legend>
    <a href="login.do">๋ก๊ทธ์ธ ํ๊ธฐ</a>
    <hr>
    <a href="join.do">ํ์๊ฐ์ํ๊ธฐ</a>
    <hr>
    <a href="check.do">ํ์์ ๋ฌดํ๋จ</a>
</fieldset>
```
<br>

#### [applicationContext.xml]
```xml
<!-- ๊ณตํต DB์์  -->
  <bean id="driverManagerDataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  	<property name="driverClassName" 	value="oracle.jdbc.driver.OracleDriver"></property> <!-- ojdbc6.jar ํ์ผ ๋ถ๋ฌ์ค๋๊ฑฐ -->
  	<property name="url" 				value="jdbc:oracle:thin:@Localhost:1521:xe"></property>
  	<property name="username" 			value="springuser"></property>
  	<property name="password"			value="1004"></property>
  </bean>
 
 <!-- JDBC Template -->
 <bean id="" class="org.springframework.jdbc.core.JdbcTemplate">
 	<property name="dataSource" ref="driverManagerDataSource"/>
 </bean>
 
 
 <!-- ๊ณตํต UI  -->
 <bean id="internalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
 		<property name="prefix">
 			<value>/WEB-INF/view/</value>
 		</property>
 		<property name="suffix">
 			<value>.jsp</value>
 		</property>
 </bean>	
```
<br>

#### [dispatcher-servlet]
```xml
<bean id="" class="com.controller.JoinController"></bean>
<bean id="" class="com.controller.LoginController"></bean>
<bean id="" class="com.controller.LogoutController"></bean>
<bean id="" class="com.controller.MemberSearchController"></bean>
```
- bean์ผ๋ก controller ์์ฑ. ํ์ง๋ง ์ด ๋ง์ ๋ ์ํ ๊ฑฐ์!!

#### ํธํ ๋ฐฉ์โจ
```xml
<!-- ๋ชจ๋  ์ปจํธ๋กค๋ฌ๊ฐ ๊ณตํต ์ฌ์ฉ DAO ๋น ๊ฐ์ฒด  ์ฐธ์กฐ-->
<context:annotation-config />
<context:component-scan base-package="ncontroller"  />
<context:component-scan base-package="dao"  />
```
- ncontroller ํจํค์ง ์์ ์๋ ๋ชจ๋  Controller๋ฅผ ์ฝ๊ฒ ๋ค! ํ๋ํ๋ ์์ฑํด์ค ํ์ ์์
<br>

```java
@Controller
@RequestMapping("/login.do")
public class LoginController {
   
	@Autowired   //memberfield ์ฃผ์ ๊ฐ๋ฅ >> ๊ทธ๋ฐ๋ฐ ์ผ๋ฐ์ ์ผ๋ก setter ์ฃผ์์ ์ ํธ ํฉ๋๋ค.
	private MemberDAO memberdao;

	//@RequestMapping(method=RequestMethod.GET)
	@GetMapping
	public String form() {
		return "loginForm";
	}
	
	//@RequestMapping(method=RequestMethod.POST)
	@PostMapping
	public String submit(
			              @RequestParam(value="id") String id,
			              @RequestParam(value="pwd") String pwd,
			              HttpSession session	//HttpSession ๊ฐ์ฒด ์ป์ด์ค๊ธฐ
			             ) throws SQLException 
	{
		String view = null;
		boolean isMember = memberdao.memberCheck(id, pwd);
		if(isMember) {
			session.setAttribute("USERID",id); //
			view = "loginSuccess";
		}else {
			view = "loginForm";
		}
		return view;
	}
}
```
- @Controller : ์ปจํธ๋กค๋ฌ๋ก ์ฌ์ฉํ๊ฒ ๋ค๊ณ  ๋ช๋ช
- @RequestMapping("/login.do") : login.do ๋ชจ๋ ๋ฐ๊ฒ ๋ค
- @Autowired : memberfield ์ฃผ์ ๊ฐ๋ฅ 
- ์ด ๋ถ๋ถ์ ๋ค ์ฝ์ผ๋ฉด ๋ค์ IOC๋ก ๋์๊ฐ์ Controller ์ฐพ๊ณ  ...!
<br>

#### [LogoutController.java]
```java
@Controller
public class JoinController {

	//DB์์
	//DAO ...
	//member field 
	//์ธํฐํ์ด์ค ํ์ : ๊ฐ์ฒด์ ์์ฑ๊ณผ ์กฐ๋ฆฝ (์ด๋ ํ ๋ถํ๋ ... ํ์คํ ... ๋คํ์ฑ ... interface

	private MemberDAO memberdao;

	@Autowired  //by type
	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}
	@GetMapping("/join.do")
	public String form() {
		return "joinForm";
	}
	@PostMapping("/join.do")
	public String sumbit(@RequestParam(value="id", required = true) String id,
						 @RequestParam(value="name") String name,
						 @RequestParam(value="pwd")  String pwd,
						 @RequestParam(value="email" ,defaultValue = "1@1") String email,
						 @RequestParam(value="age" , defaultValue = "1") Integer age) {

	
		System.out.println(id + "." + name + "." + pwd + "." + email + "." + age);
		String view = null;
		boolean joinresult = memberdao.memberInsert(id, name, pwd, email, age);
		
		if(joinresult) {
			view = "joinSuccess";
		}else {
			view = "joinForm";
		}
		
		return view;
	}
}
```
- @RequestParam : RequestParam(๊ฐ์ ธ์ฌ ๋ณ์์ ์ด๋ฆ) ๋ฐ์ดํฐ ํ์, ๊ฐ์ ธ์จ ๋ฐ์ดํฐ๋ฅผ ๋ด์ ๋ณ์
```java	
    private MemberDAO memberdao;

	@Autowired  //by type
	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}
```
- ์ธํธ๋ก ์ฐ์ด๋ฉฐ ์๋ฐ์์์ new์ ๊ฐ๋ค๊ณ  ์ดํดํ๋ฉด ํธํจ
- Implํ๋ DAO๊ฐ ์์๋ interface DAO๋ง ์ ์ด์ค๋ ๋จ -> MemberDAOImpl์ ์ ์ธํด์ค ์ MemberDAO์ Implํ๋ ๋ชจ๋  ํด๋์ค๋ค์ ์ ์ธํด์ค์ผํ๋ ๋ฒ๊ฑฐ๋ก์ ๋ฐ์
<br>

#### [MemberDAOImpl.java]
```java
public class MemberDAOImpl implements MemberDAO{

   /*
   JdbcTemplate template = new JdbcTemplate();
   public void m() { template.execute("select...");}
   IOC ์ปจํ์ด๋ ์์ Bean ์ผ๋ก ์์ฑ ๋์ด ์์ด์
   
   MemberDAOImpl ๊ฐ์ฒด JdbcTemplate ๊ฐ์ฒด์ ์์กดํ๋ค
   */

   private JdbcTemplate jdbctemplate;
   
   @Autowired //by type
   public void setJdbctemplate(JdbcTemplate jdbctemplate) {
      this.jdbctemplate = jdbctemplate;
   }
```
- jdbctemplate ์ด๋ผ๋ ๋ด์ฅ ๊ฐ์ฒด๋ฅผ ๋ถ๋ฌ์์ ์ฌ์ฉํจ
- DB์์ ์ฐ๊ฒฐ์ ๋์์ฃผ๋..?!!
```java
   @Override
   public boolean memberInsert(String id, String name, String pwd, String email, int age) {
      String sql="insert into usermember(id,name,pwd,email,age) values(?,?,?,?,?)";
      boolean result = false;
             
      Object[] params = {id,name,pwd,email,age};
      //[hong][ํ๊ธธ๋][1004][hong@naver.com][100]
      (this.jdbctemplate.update(sql,params) > 0)
      {
         result = true;
      }
      return result;
   }
```
- Object[] params = {id,name,pwd,email,age} : Spring์์๋ Parameter์ ์ ์ ๊ฐ๊ณผ Query๋ฌธ์ ์ ์ ๊ฐ์ด ๊ฐ๋ค๋ฉด ๋ณ๋์ ๊ณผ์  ์์ด ์์์ ์ฝ๊ณ  ์ฒ๋ฆฌํจ

```java
   @Override
   public MemberVO selectMemberById(String id) throws SQLException {
      String sql="select id,name,pwd,email,age from usermember where id=?";
      //Query ๋ฌธ ์คํ -> resultset ๊ฒฐ๊ณผ ๋ด์์ >[ VO ๊ฐ์ฒด ์์ฑ > rs ์์ vo setter ์ฌ์ฉ ๋ฐ์ดํฐ ๋ฃ๊ณ  ]> VO ๊ฐ์ฒด ๋ฆฌํด
      return this.jdbctemplate.queryForObject(sql,
                                           new BeanPropertyRowMapper<MemberVO>(MemberVO.class),
                                           id);
   }
}
```
- new BeanPropertyRowMapper< MemberVO>(MemberVO.class) : ์์ ์์(Object[] params = {id,name,pwd,email,age})์ฒ๋ผ ํ๋์ฉ ์ ์ด์ค๋ ๋์ง๋ง ํ์ด๋ธ์ ํ ์ค์ ํต์ฑ๋ก ๊ฐ์ ธ์ฌ ๊ฒฝ์ฐ์๋ VO๋ฅผ ํต์ฑ๋ก ๊ฐ์ ธ์ค๋ ๊ฒ๋ ๊ฐ๋ฅ!!
<br>
