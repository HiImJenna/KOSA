# 2022.12.15.THU π
----------------
<br>

# 1. Connection Pool β
![image](https://user-images.githubusercontent.com/111114507/207746306-1ad0d049-28e9-477a-a7b4-6a5db26d9cfd.png)
- μΌμ λμ Connection κ°μ²΄(DB μ°κ²° κ°μ²΄)λ₯Ό λ―Έλ¦¬ λ§λ€μ΄μ poolμ μ μ₯ν΄λκ³ , μμ²­μ΄ μμ λ κ°μ²΄λ₯Ό μ¬μ©ν  μ μλλ‘ λΉλ €μ€¬λ€κ°, μΌμ΄ λλλ©΄ λ€μ λλ €λ°μ poolμ μ μ₯νλ κΈ°λ²
```
μΌλ°μ μΈ λ°μ΄ν° μ°λκ³Όμ μ μΉ μ΄νλ¦¬μΌμ΄μμ΄ νμν  λλ§λ€ λ°μ΄ν°λ² μ΄μ€μ μ°κ²°νμ¬ μμνλ λ°©μμλλ€.
νμ§λ§ μ΄λ° μμΌλ‘ νμν  λλ§λ€ μ°λν΄μ μμν  κ²½μ° λ°μ΄ν°λ² μ΄μ€ μ°κ²°μ μκ°μ΄ λ§μ΄ κ±Έλ¦¬λ λ¬Έμ κ° λ°μν©λλ€.
μλ₯Όλ€μ΄ κ±°λμμ κ²½μ°, λμμ λͺμ²λͺμ΄ λμμ κ±°λ λ° μ‘°ν κΈ°λ₯μ μ¬μ©νλλ° λ§€λ² λ°μ΄ν°λ² μ΄μ€μ μ»€λ₯μμ λ§Ίκ³  νΈλ μμμ νλ€λ©΄ κ΅μ₯ν λΉν¨μ¨μ μΌ κ²μλλ€.
μ΄ λ¬Έμ λ₯Ό ν΄κ²°νκΈ° μν΄ νμ¬λ μΉ μ΄νλ¦¬μΌμ΄μμ΄ μ€νλ¨κ³Ό λμμ μ°λν  λ°μ΄ν°λ² μ΄μ€μμ μ°κ²°μ λ―Έλ¦¬ μ€μ ν΄ λ‘λλ€.
κ·Έλ¦¬κ³  νμν  λλ§λ€ λ―Έλ¦¬ μ°κ²°ν΄ λμ μνλ₯Ό μ΄μ©ν΄ λΉ λ₯΄κ² λ°μ΄ν°λ² μ΄μ€μ μ°λνμ¬ μμμ ν©λλ€.
μ΄λ κ² λ―Έλ¦¬ λ°μ΄ν°λ² μ΄μ€μ μ°κ²°μν¨ μνλ₯Ό μ μ§νλ κΈ°μ μ μ»€λ₯μ ν (Connection Pool, CP)μ΄λΌκ³  ν©λλ€.
```
<br>

### π‘ μ₯μ 
- λ³΄ν΅ DB μ κ·Όμ κ²½μ° κ°μ²΄λ₯Ό μμ± ν μ¬μ©νκ³  νλμ© λ€μ μ­μ λ₯Ό ν΄μ€μΌ νλλ°, μ»€λ₯μ νμ μ¬μ©ν  κ²½μ° κ°μ²΄λ₯Ό λ―Έλ¦¬ λ§λ€μ΄λκ³  μ¬μ©νκΈ° λλ¬Έμ λΆνμν μμ±κ³Ό μ­μ μ λλ λ©λͺ¨λ¦¬ μ°¨μ§λ₯Ό μ€μΌ μ μλ€.
- -> λΆνμν μμμ λ°λ³΅ (μ»€λ₯μ μμ±, μ­μ  λ°λ³΅)μ΄ μ¬λΌμ§κΈ° λλ¬Έμ μ±λ₯κ³Ό μλ ν₯μμ κΈ°λν  μ μλ€ <br>

### π‘ μ£Όμν  μ 
#### μ»€λ₯μμ μ μ λλ§ μ μ₯ν΄ λκ³  μ¬μ©νκΈ°
- μ»€λ₯μμ λ§μ΄ μμ± : μ»€λ₯μ λν κ°μ²΄μ΄κΈ° λλ¬Έμ λ§μ λ©λͺ¨λ¦¬λ₯Ό μ°¨μ§ν  μ λ°μ μλ€. λ°λΌμ μΈλ°μμ΄ λ§μ μ»€λ₯μμ νλ‘κ·Έλ¨μ μ±λ₯μ μ νμν€λ μμΈμ΄ λ  μ μλ€
- μ»€λ₯μμ μ κ² μμ± : νμ λ μ»€λ₯μ λ΄μμ μ¬μ©ν΄μΌ νκΈ° λλ¬Έμ λλ¬΄ λ§μ DBκ° μ κ·Όμ μ¬μ©μ€μΈ μ»€λ₯μμ΄ λ°λ©λ  λ κΉμ§ κΈ°λ€λ €μΌ νλ€. <br>

### π‘Pool Log μ€μ νκΈ°
#### [1. pom.xml]
```
<!-- SQL LOG  -->
    <dependency>
        <groupId>org.bgee.log4jdbc-log4j2</groupId>
        <artifactId>log4jdbc-log4j2-jdbc4</artifactId>
        <version>1.16</version>
    </dependency>
μΆκ°νκΈ°
```
![image](https://user-images.githubusercontent.com/111114507/207746853-b0513016-91cf-4f49-a5ed-157f1046437a.png) <br>

#### [2. DBμ°κ²° μ€μ μμ DriverSpy μ μ©νκΈ° (root-content.xml)]
```
<!-- <property name="driverClassName" value="oracle.jdbc.driver.OracleDriver" /> -->
 	 <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
 	 <property name="url" value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE" />
```
![image](https://user-images.githubusercontent.com/111114507/207747122-a138465e-41bc-4d8e-87f3-9032ec0c29ab.png) <br>

#### [3.μ€μ νμΌ (log4j.xmlκ³Ό κ°μ κ²½λ‘μ)]
```
log4jdbc.log4j2.properties νμΌ μμ±
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator

xml μΆκ° (log4j.xml)
<!-- SQL Logger -->

	<logger name="jdbc.sqltiming" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>


	<logger name="jdbc.sqlonly" additivity="false"> 
		<level value="info"/> 
		<appender-ref ref="console"/> 
	</logger>


	<logger name="jdbc.audit" additivity="false"> 
		<level value="warn"/>  
		<appender-ref ref="console"/> 
	</logger> 

 	<logger name="jdbc.resultset" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>


	<logger name="jdbc.resultsettable" additivity="false"> 
		<level value="info"/>  
		<appender-ref ref="console"/> 
	</logger> 
```
![image](https://user-images.githubusercontent.com/111114507/207746761-bf6beb99-0fcb-4922-bfe2-80a0f6554363.png) <br>

<br>

# 2. Hikari Pool β
- κ°λ²Όμ΄ μ©λκ³Ό λΉ λ₯Έ μλλ₯Ό κ°μ§λ JDBCμ μ»€λ₯μ ν νλ μμν¬
### π‘ μ€μ νκΈ°
#### [1. POOL]
```
<dependency>
    <groupId>com.zaxxer</groupId>
    <artifactId>HikariCP</artifactId>
    <version>3.4.5</version>
</dependency>

<!-- SQL LOG  -->
<dependency>
    <groupId>org.bgee.log4jdbc-log4j2</groupId>
    <artifactId>log4jdbc-log4j2-jdbc4</artifactId>
    <version>1.16</version>
</dependency> 
``` 
<br>

#### [2. DBμ°κ²° μ€μ μμ DriverSpy μ μ©νκΈ° (root-content.xml)]
```
<bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
 	<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
 	<property name="jdbcUrl"         value="jdbc:log4jdbc:oracle:thin:@localhost:1521:XE"></property>
 	<property name="username"        value="springuser"></property>
 	<property name="password"        value="1004"></property>
 </bean> 
 <bean id="driverManagerDataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
		<constructor-arg ref="hikariConfig"></constructor-arg>
 </bean>
<bean id="sqlSessionFactoryBean"  class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="driverManagerDataSource"></property>
    <property name="mapperLocations" value="classpath*:mapper/*xml" />
</bean>
```

#### [3.μ€μ νμΌ (log4j.xmlκ³Ό κ°μ κ²½λ‘μ)]
```
log4j.xml κ°μ κ²½λ‘μ
log4jdbc.log4j2.properties νμΌ μμ±

log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator


xml μΆκ°
<!-- SQL Logger -->

	<logger name="jdbc.sqltiming" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>

	<logger name="jdbc.sqlonly" additivity="false"> 
		<level value="info"/> 
		<appender-ref ref="console"/> 
	</logger>

	<logger name="jdbc.audit" additivity="false"> 
		<level value="warn"/>  
		<appender-ref ref="console"/> 
	</logger> 

	<logger name="jdbc.resultset" additivity="false">
		<level value="warn" />
		<appender-ref ref="console"/> 
	</logger>

	<logger name="jdbc.resultsettable" additivity="false"> 
		<level value="info"/>  
		<appender-ref ref="console"/> 
	</logger> 
```
<br>

# 3. Transaction β