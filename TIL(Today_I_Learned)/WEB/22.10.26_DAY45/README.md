# 2022.10.26. WED ๐
----------------
<br>

## 1. EL ์ถ๋ ฅ์ โ
- JSP ํ์ด์ง์์ ์ฌ์ฉ๋๋ ์ ์ฉ ์คํฌ๋ฆฝํธ ์ธ์ด(ํ๋ฉด์ ์ถ๋ ฅ) > ์๋ฒ์์ ํด์๋๋ ์คํฌ๋ฆฝํธ
- ์ด์  : ์คํ๊ฒํฐ ์ฝ๋ (% ์์ญ๊ณผ UI์์ญ ํผ์ฌ) > ์ ์ง๋ณด์์ด๋ ค์ > ์ฝ๋์ ๊ฐ๋์ฑ ๋จ์ด์ง
- ๋ฌธ์ ํด๊ฒฐ : html ๊ณผ๋ ์ ๋๊ณ  ์๋ฒ์์๋ ์ ์ถ๋ ฅํ๊ณ script >> EL >> JSP ํ์ด์ง์์๋ง ์ฌ์ฉ ๊ฐ๋ฅ
- tomcat ์๋ฒ๊ฐ ๋ด์ฅํ๊ณ  ์๋ ์์ >> ๋ณ๋์ ์ฐธ์กฐ ์์ด ์ฌ์ฉ ๊ฐ๋ฅ

#### ๐ < EL ๊ฐ์ง๊ณ  ์๋ ๊ฐ์ฒด> 
- param
- paramValues
- requestScope
- sessionScope
- applicationScope
<br>

#### ๐ JSTL
- EL ๋์์ ๋ณ์, ์ ์ด๊ตฌ์กฐ ์ถ๋ ฅ ๋์์ค 
```jsp
EL: ${e }<br> <!-- ์ถ๋ ฅ์๋จ -->
EL: ${e.getEmpno() }<br> <!-- ์ถ๋ ฅ์๋จ -->
```
- EL์ ์๋ฐ ๊ฐ์ฒด๋ฅผ ๋ฐ๋ก ๋ฐ์์ ์ถ๋ ฅํ  ์ ์์! ๊ทธ๋ ๊ธฐ์ JSTL์ ์ฌ์ฉํด์ผํจ
```jsp
1. request ๊ฐ์ฒด ๋๋ session ๊ฐ์ฒด์ ๋ด๋๋ค <br>
EL : ${requestScope.emp}<br>
2. JSTL ์ฌ์ฉํด์ ์ฒ๋ฆฌ <br>

<h3>JSTL(core) : ๋ณ์์์ฑ, ์ ์ด๋ฌธ(์๋ฐ์ฝ๋ ๋์ ์์ด : ์๋ฒ์์ ํด์ ์คํ)</h3>
<c:set var="m" value="<%=e %>"/>
JSTL ์ฌ์ฉํด์ ๋ณ์ m์ ์์ฑ (EL ์ฌ์ฉํด์ ์ ๊ทผ ๊ฐ๋ฅ) : ${m}<br>
getter ํจ์(๊ถ์ฅ ๋ฐฉ๋ฒ์ ์๋ : ${m.getEmpno() }<br>

EL ์ถ๋ ฅ (m.memberfield๋ช : ์๋์ผ๋ก getter ํธ์ถ) : ${m.empno}<br>
EL ์ถ๋ ฅ (m.memberfield๋ช : ์๋์ผ๋ก getter ํธ์ถ) : ${m.ename}<br>

<c:set var="username" value="${m.ename }]"></c:set>
๋ณ์๊ฐ ์ถ๋ ฅ: ${username }<br>

<hr>
<h3>JSTL ๋ณ์ ๋ง๋ค๊ณ  Scope์ ์ํ๊ธฐ</h3>
<c:set var="job" value="๋๊ตฌ์ ์" scope="request" />
๋น์ ์ ์ง์์: ${job }<br>
๋ง์ฝ์ ๋น์ ์ด include, forward ํตํด์ ํ์ด์ง๋ฅผ ์ ์ดํ๋ฉด ๊ทธ ํ์ด์ง์์ EL ํตํด์ job๋ณ์ ์ถ๋ ฅ

<hr>
<c:set var="job2" value="์ผ๊ตฌ์ ์"/>
๊ฐ์ถ๋ ฅ: ${job2 }<br>

๋ง๋  ๋ณ์๋ฅผ ์ญ์  ๊ธฐ๋ฅ(์์ฐ์ง ์์์)<br>
<c:remove var="job2"/>
๊ฐ์ถ๋ ฅ(์ญ์ : ๊ฒฐ๊ณผ ์๋์ฌ๋ฟ ์์ธ ์๋์) :${job2}<br>

<hr>
์๋ฐ API๊ฐ ์ ๊ณตํ๋ ๊ฐ์ฒด(์ง์ ) : ${hp}<br>
1. request or session ๋ด๋๋ค -> ๊ถ์ฅ์ฌํญ<br>
2. JSTL ์ฌ์ฉ<br>

<c:set var="vhp" value="<%=hp %>"/>
hp ๊ฐ์ฒด : ${vhp}<br>
hp ๊ฐ์ฒด : ${vhp.data}<br>\
<hr>
๊ฐ์ write (hp.put("color","red")) : ๊ทธ๋ฅ ๊ตฌ๊ฒฝ๋ง ... 
<c:set target="${vhp}" property = "color" value="red"></c:set>
hp ๊ฐ์ฒด : ${vhp}<br>
```
### ๐ <c:if
```jsp
<c:if test="${param.ID == 'hong'}"> <!--    if(id.equals("hong")){      -->
    ${param.ID}<img src="images/1.jpg" style="width: 100px; height: 100px">
</c:if>
```
```jsp
<c:if test="${!empty userpwd}"><!-- ๋น๋ฒ์ด ์กด์ฌํ๋ค๋ฉด -->
    <h3>not empty userpwd</h3>
    <c:if test="${userpwd == '1004'}">
        <h3>welcome admin page</h3>
    </c:if>
</c:if>
```
### ๐ <c:forEach
#### <๊ตฌ๊ตฌ๋จ 5๋จ ์ถ๋ ฅ>
```jsp
<c:forEach var="i" begin="1" end="9">
    <li>5*${i}=${5*i}</li>
</c:forEach>
```
#### <EL & JSTL ๊ตฌ๊ตฌ๋จ ์ถ๋ ฅํ๊ธฐ (์ค์ฒฉ forEach)>
```jsp
    <table border="1">
    <c:forEach var="i" begin="2" end="9">
        <c:forEach var="j" begin="0" end="9">
            <c:choose>
                <c:when test="${j == 0}">
                    <tr bgcolor="gold"><th>${i}๋จ</th></tr>
                </c:when>
                <c:otherwise>
                    <tr><td>${i}*${j}=${i*j}</td></tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:forEach>
    </table>
```
#### <JSTL forEach ์ฌ์ฉํ๊ธฐ>
```jsp
<%
int[] arr = new int[]{10,20,30,40,50};
for(int i : arr){
out.print("์ถ๋ ฅ๊ฐ : <b><i>" + i + "</i></b><br>");
}
%>
```
#### <forEach  ์์ฑ ํ์ฉํ๊ธฐ(์ต์)>
```jsp
<c:forEach var="i" items="${intarr}" varStatus="status">
    index: ${status.index}&nbsp;&nbsp;&nbsp;
    count: ${status.count}&nbsp;&nbsp;&nbsp;
    value: ${i}<br>
</c:forEach>
```
- value : ๊ฐ
- index : ์์น
- count : forEach๋ฌธ์ด ๋์๊ฐ ํ์
<br>

### ๐ Today's Point
<details>
<summary>์ฝ๋</summary>
<div>


```jsp
	 <%
	 //์ฐ๋ฆฌ๊ฐ ๋ค๋ฃจ๋ ๋ฐ์ดํฐ๋ 1๊ฑด ์ด์
	 //select ... ์ฌ๋ฌ๊ฑด
	 //public List<Emp> getEmpList(){ .... }
	 //JSP ์ถ๋ ฅ ๋ชฉ์  (๊ฒ์ํ ์ฒ๋ฆฌ)
	 List<Emp> emplist = new ArrayList<>();
	 emplist.add(new Emp(100,"A"));
	 emplist.add(new Emp(200,"B"));
	 emplist.add(new Emp(300,"C"));
	 //3๊ฑด์ ๋ฐ์ดํฐ๊ฐ ArrayList์์ .... ์ถ๋ ฅ ๋ชฉ์ 
	 
	 
	 
	 //์๋ฐ๋ผ๋ฉด
	 for(Emp e : emplist){
		 out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
	 }
	 
	 //UI JSP (EL ํ๊ณ  JSTL)
	 //1. request ๋ด๋๋ค ... servlet ํ  ๊ฑฐ์์
	 request.setAttribute("list",emplist);
	 
	 //forward ๊ฐ์ ํ๊ณ  
	 //jsp ํ์ด์ง์์
	 %>
	 <h3>ํ์๋ฐ์ดํฐ ์ถ๋ ฅํ๊ธฐ(EL&JSTL)**********************</h3>
	 <c:set var="elist" value="<%=emplist%>" />
	 <!-- ์ด๋ฏธ ์์์ request.set ์ฒ๋ฆฌํ๋ค๋ฉด ์ ์ฝ๋๋ ์ํด๋ ๋์ -->
	 
	 <table border="1">
	 	<tr><td>์ฌ๋ฒ**</td><td>์ด๋ฆ**</td></tr>
	 	<c:forEach var="emp" items="${requestScope.list}">
	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
	 	</c:forEach>
	 </table>
	 <hr>
	  <table border="1">
	 	<tr><td>์ฌ๋ฒ</td><td>์ด๋ฆ</td></tr>
	 	<c:forEach var="emp" items="<%=emplist%>">
	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
	 	</c:forEach>
	 </table>
	 
	 <h3>JAVA Map ๊ฐ์ฒด EL & JSTL ์ฌ์ฉํด์ ์ถ๋ ฅ</h3>
	 <%
	 	Map<String,Object> hm = new HashMap<>();
	 	hm.put("name", "hong");
	 	hm.put("pwd","1004");
	 	hm.put("date",new Date());
	 	
	 	//view
	 	request.setAttribute("hmobj", hm);
	 %>
	 <c:set var="hm" value="<%=hm%>" />
	 <c:forEach var="obj" items="${hm}">
	 	 ${obj.key} -> ${obj.value}<br>
	 </c:forEach>
	 
	 key:name > ${hm.name}<br>
	 key:pwd > ${hm.pwd}<br>
	 key:date > ${hm.date}<br>
	 <hr>
	 
	 <h3>๊ธฐํ ์ต์</h3>
	 <h3>JSTL ๊ตฌ๋ถ์ ๊ธฐ์ค ์ฒ๋ฆฌ</h3>
	 <c:forTokens var="token"  items="A.B.C.D" delims=".">
	 	${token}<br>
	 </c:forTokens>
	 
	 
	 <h3>JSTL ๋ณตํฉ๊ตฌ๋ถ์ ๊ธฐ์ค ์ฒ๋ฆฌ</h3>
	 <c:forTokens var="token"  items="A.B/C-D" delims="./-">
	 	${token}<br>
	 </c:forTokens>
	 
	 <!--
	 	forEach step = -1
	 	ํธ๋ฒ
	 	๊ธฐํ
	   -->
	   <c:set var="nownum" value="10" />
	   <c:forEach var="i" begin="0"  end="${nownum}" step="1">
	   		${nownum - i}<br>
	   </c:forEach>
</body>
</html>

```
</div>
</details>

# 3. ์กฐ๋ณ ๊ณผ์  โ

### ๐ [๋ฌธ์ 1]  
```jsp
String name = request.getParameter("name");
if(name.equals("kglim")){
    out.print("<b>" + name + "</b>");
}else if(name.equals("hong")){
    out.print("<i>" + name + "</i>");
}else{
    out.print("<h3>" + name + "</h3>");
}
out.print("<hr>");

์ ์ฝ๋๋ฅผ EL ๊ณผ JSTL ๋ณํ ํ์ธ์
```
[๋ด ํ์ด]    
```jsp
<c:choose>
	<c:when test = ${param.name} == "kglim">
	<b>${param.name}</b>
	</c:when>
	
	<c:when test = ${param.name} == "hong">
	<i>${param.name}</i>
	</c:when>
	
	<c:otherwise>
		<h3>${param.name}</h3>
	</c:otherwise>

</c:choose>
```
<br>

### ๐ [๋ฌธ์ 2]  
```jsp
subject ๋ค์ค๊ฐ์ ๋ฐ์์ choose ๊ตฌ๋ฌธ์ ์ฌ์ฉํ์ฌ ๊ฐ์ด ํ๋๋ ์ ํ๋์ง ์์๋ค๋ฉด
"์ ํ์ ํ์ธ์" ๋ผ๋ ๋ฌธ์๋ฅผ ์ถ๋ ฅํ๊ณ  
๊ฐ์ด ํ๋๋ผ๋ ๋์ด ์๋ค๋ฉด ... <ul><li>java-0-1</li><li>jsp-1-2</li></ul> ๊ณผ ๊ฐ์ ํ์์ผ๋ก
์ถ๋ ฅํ๋๋ก  forEach ๋ฅผ ์์ฑํ์ธ์
์ถ๊ฐ์ฌํญ) ์ถ๋ ฅ์  ๊ฐ-index-count ํ์์ผ๋ก ๋์ค๊ฒ ์ถ๋ ฅํ์ธ์
```
```jsp
<form action="Ex08_EL_JSTL_QUIZ.jsp" method="post">
    JAVA:  <input type="checkbox" name="subject" value="java"><br>
    JSP:   <input type="checkbox" name="subject" value="jsp"><br>
    ORACLE:<input type="checkbox" name="subject" value="oracle"><br>
    MYSQL: <input type="checkbox" name="subject" value="mysql"><br>
    <input type="submit" value="์ ์กํ๊ธฐ">
</form>

```
[๋ด ํ์ด]  
```jsp
	 <c:set var="subject" value="${paramValues.subject}"/>
  	 
   	 <c:choose>
	  <c:when test="${subject != null}">
	    <ul>
		  <c:forEach var="i" items="${subject}" varStatus="status">
		     <li>${i}-${status.index}-${status.count}</li>
		  </c:forEach>
	 	</ul>
	  </c:when>
	  <c:otherwise> <p>์ ํ ํ์ธ์</p> </c:otherwise>
	 </c:choose>
```
<br>

### ๐ [๋ฌธ์ 3]
```jsp
EMP ํ์ด๋ธ์์ ์ฌ์์ ์ฒด ๋ฐ์ดํฐ๋ฅผ ์ถ๋ ฅํ๋ DTO , DAO ๋ฅผ ์์ฑํ์ธ์ (JDBC ์ฐธ๊ณ )
๊ทธ๋ฆฌ๊ณ  ๊ทธ ๋ฐ์ดํฐ 14๊ฑด์ 
EL & JSTL ์ ์ฌ์ฉํด์ ์ถ๋ ฅํ์ธ์
๋จ)๋ถํธํํ๋ฆฟ ์ฌ์ฉํ์ธ์]
```
[๋ด ํ์ด]    
```jsp
<c:set var="e" value="${requestScope.e}"></c:set>
<c:forEach var="emp" items="${emplist} ">
    ${e}
</c:forEach>
```


