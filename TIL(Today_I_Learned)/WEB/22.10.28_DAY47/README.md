# 2022.10.27. THU ๐
----------------
<br>

## 1. EMP ๊ณผ์   โ
### [๋ฌธ์ ]  
```
ajax : Ex06_Emp_Search๋ฅผ ํตํด์ ์ฌ๋ฒ์ ์ ๊ณตํด์ ๋น๋๊ธฐ UI ๋์์ธ๋ ํ์ด์ง๋ฅผ ๋ฐ์์ ํ๋ฉด์ ์ถ๋ ฅ

1. EmpSearch.jsp(๋น๋๊ธฐ๋ก ์์ฒญ ๋ณด๋) -> servlet -> forward(ui.jsp) -> ๋น๋๊ธฐ responseText -> EmpSea
```
### [๊ฒฐ๊ณผ]  
- ์กฐํ ์ !
![image](https://user-images.githubusercontent.com/111114507/198520206-6d49d4ab-90a2-4d9a-a249-9d1c4aa70d49.png)
<br>

- ์กฐํ ํ!
![image](https://user-images.githubusercontent.com/111114507/198528319-6fd15d6e-a236-4629-a6e9-2f8aa0d844b8.png)
<br>

## 2. EMP ๊ณผ์  refactoring โ
### ๐ 1. DAO, DTO, ๊ธฐ์กด ๋ถํธ์คํธ๋ฉ ์๋ฃ ๋ฑ๋ฑ์ ์๋ก์ด Dynamic Web Project์ ์ธํํด์ค
![image](https://user-images.githubusercontent.com/111114507/198530203-31f8b0e2-f675-4164-bb36-0925bb5a2bfe.png)
<br>

<br>

<hr>

### ๐ 2. Main ํ์ผ ์์
<details>
<summary>Main code</summary>

```jsp
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Team Enjo2!!</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/style.css" rel="stylesheet" />
        
        <script type="text/javascript">

            window.onload = function(){
                    document.getElementById("submit").addEventListener("click",function(){
                        let data = document.getElementById("submit").value;
                        sendData(data);
                    });
            }

            let httpReq=null;
            
            function getInstance(){
                    if(window.XMLHttpRequest){
                        httpReq = new XMLHttpRequest();
                    }else if(window.ActiveXObject){
                        httpReq = new ActiveXObject("Msxml2.XMLHTTP");
                    }else{
                        throw new Error("AJAX ์ง์ํ์ง ์์ต๋๋ค"); 
                    }
                return httpReq;  
            }
            
            
            function handlerStateChange(){
                    if(httpReq.readyState == 4){
                        if(httpReq.status >= 200 && httpReq.status < 300){
                            document.getElementById("EMP").innerHTML = httpReq.responseText;
                        }
                    }
            }
            
            
            function sendData(data){
                httpReq = getInstance();
                httpReq.onreadystatechange = handlerStateChange;  // x >> ()
                httpReq.open("POST","Servlet?EMP=" + data); //<form ํ๊ทธ ๊ตฌ์ฑ method=  action=
                httpReq.send(); // form submit ๋ฒํผ ํด๋ฆญ
            }
            
        </script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- ********* Sidebar *********-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Menu</div>
                <jsp:include page="/Team2_Module/left.jsp"></jsp:include>
            </div>
            
            <!-- ****************** Page content wrapper ******************-->
            <div id="page-content-wrapper">
            
                <!-- ********* Top navigation *********-->
	             <jsp:include page="/Team2_Module/top.jsp"></jsp:include>
	             <jsp:include page="/Team2_Module/main.jsp"></jsp:include>  
	             <p id="EMP"></p>
	             
	             <!--********* EMP ์ ์ฒด์กฐํํ๊ธฐ *********-->
	             <div style="background-color: white;">
	             <input type = "submit" id= "submit" value="Click me!">
	             
                </div>
            </div>
        </div>
```
</details>

- ์ฒ์์๋ EMP ๋ชฉ๋ก์ top์ ์์ฑํด์ ํด๋ฆญ์ ๋น๋๊ธฐ๋ก ๋ฐ์ดํฐ๋ฅผ ๋ถ๋ฌ์ค๋ ค ํ์ง๋ง ๋ฒ๊ฑฐ๋ก์ด ๊ฒ ๊ฐ์, bootstrap ๋ฉ์ธ ์์ค์ ๋ฐ๋ก ๋น๋๊ธฐ ์์ค๋ฅผ ๊ฐ์ ธ์์ ๊ฐ๊ณตํ์!
<br>

### < window.onload = function() >
[before]  
```javascript
window.onload = function(){
    document.getElementById("submit").addEventListener("click",function(){
        let data = document.getElementById("submit").value;
        sendData(data);
    });
}
```
โถdata๋ฅผ ๋ฐ์์ค๋๊ฒ ์์, ์ ์ฒด์กฐํ์ด๊ธฐ ๋๋ฌธ์ click ์ก์์ด ์ ๋ถ
<br>

[after]
```javascript
window.onload = function(){
    document.getElementById("submit").addEventListener("click",function(){
    sendData();
    });
}
```
- input ํ๊ทธ์์ id = "submit"์ผ๋ก ์ง์ ํ๊ธฐ์, ๊ทธ input ํ๊ทธ๊ฐ "click" ๋์์ ๋ sendData() ์คํ
- data ๋ฐ์์ค๋ ์ก์์ด ์์ ๋(๊ฒ์, ์ต์ ์ ํ ๋ฑ๋ฑ)์๋ [before]์ฒ๋ผ .value, data ๋ฐ๊ธฐ๋ฅผ ํด์ฃผ๋ ์ฝ๋๊ฐ ํ์ํจ
<br>

### < function handlerStateChange() >
```javascript
function handlerStateChange(){
    if(httpReq.readyState == 4){
        if(httpReq.status >= 200 && httpReq.status < 300){
            document.getElementById("EMP").innerHTML = httpReq.responseText;
        }
    }
}
```
```javascript
<!-- ********* Top navigation *********-->
    <jsp:include page="/Team2_Module/top.jsp"></jsp:include>
    <jsp:include page="/Team2_Module/main.jsp"></jsp:include>  
    <p id="EMP"></p>
```
- document.getElementById("EMP").innerHTML = httpReq.responseText;
- httpReq.responseText : ํ๋ฉด์ ์ถ๋ ฅ๋๋ ๋ชจ๋  ํ์คํธ (${})๋ฅผ ๋์์ฑ์ ์ฌ๊ธฐ์ ์ ์ฅ.
- ๊ทธ ์ ์ฅํ ํ์คํธ๋ค์ "EMP"์ ์ ์ฅํ๊ณ , ๊ทธ๊ฒ์ innerHTML ์์ฑ๊ฐ์ httpReq.responseText ๊ฐ์ผ๋ก ๋ฎ์ด์์
- ๊ทธ๋์ p ํ๊ทธ์ ์์ด๋๊ฐ์ผ๋ก EMP ๋ฌถ์ด์ค์ ์ถ๋ ฅํ  ์ ์๊ฒ -> p ๋ฟ์ด ์๋๋ผ ๋ค๋ฅธ๊ฒ๋ ์ ์ฉ ๊ฐ๋ฅ!!
<br>

### < function sendData(data) >
[before]  
```javascript
httpReq = getInstance();
httpReq.onreadystatechange = handlerStateChange;  // x >> ()
httpReq.open("POST","Servlet?EMP=" + data); //<form ํ๊ทธ ๊ตฌ์ฑ method=  action=
httpReq.send(); // form submit ๋ฒํผ ํด๋ฆญ
```
โถ < ๋น๋๊ธฐ - window.onload = function() >์์์ ๊ฐ์ ์ด์ ๋ก ๋ฐ์์ค๋ data๊ฐ ์๋ค๋์  ํ์
<br>

[after]
```javascript
function sendData(){
    httpReq = getInstance();
    httpReq.onreadystatechange = handlerStateChange;  // x >> ()
    httpReq.open("POST","Servlet"); //<form ํ๊ทธ ๊ตฌ์ฑ method=  action=
    httpReq.send(); // form submit ๋ฒํผ ํด๋ฆญ
}
```
- parameter ์์ ์ฃผ๊ธฐ
- "Servlet?EMP=" + data => ๋ง์ฐฌ๊ฐ์ง์ธ ์ด์ ๋ก ์ ์ฒด์กฐํ์ด๊ธฐ์ ํ์ ์์
<br>

<br>

<hr>


### ๐ 3. Servlet ํ์ผ ์์
<details>
<summary>Servlet code</summary>

```java
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EmpDAO;
import DTO.Emp;
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Servlet() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
    	//1. ํ๊ธ์ฒ๋ฆฌ
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8"); // ํด๋ผ์ธํธ์๊ฒ ์ ๋ฌํ ํ์ด์ง์ ์ ๋ณด ๊ตฌ์ฑ
        PrintWriter out = response.getWriter();
        
    	//2. ์์ฒญ๋ฐ๊ธฐ (๋ฐ์ดํฐ) request
    	String data = request.getParameter("EMP");
    	System.out.println(data);
    	
    	//->์ฌ๊ธฐ ํ์ ์์ด์ง
    	
    	//3. ์์ฒญํ๋จ
		 String msg="";

		 //java ํ์ผ ์ฉ์ด (DAO , DTO)
		 EmpDAO edao = new EmpDAO();
		 Emp emp = new Emp();
		 
		 
		 List<Emp> list = edao.getEmpAllList();
		 System.out.println(list);

		//4. ๋ฐ์ดํฐ ์ ์ฅ
		 request.setAttribute("emplist", list);
		 
		//5. view ํ์ด์ง ์ค์ 
		//๋ทฐ ์ง์ ํ๊ธฐ (Dispatcher)
		RequestDispatcher dis = request.getRequestDispatcher("/Team2_Main_EMP.jsp");
		 
		 
		//6. view ๋ฐ์ดํฐ ์ ๋ฌ(forward)
		 dis.forward(request, response);

		 }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
```
</details>
<br>

### < doProcess(...) >
[before]
```java
//2. ์์ฒญ๋ฐ๊ธฐ (๋ฐ์ดํฐ) request
String data = request.getParameter("EMP");
System.out.println(data);
 ```

 [after]
 ```java
 ์์ ํ์๊ฐ ์์ด์ง!
 ```
- ๋น๋๊ธฐ์ function sendData(data)์์ 'httpReq.open("POST","Servlet?EMP=" + data);'์ 'httpReq.open("POST","Servlet");'์ผ๋ก ์์ ํ๋ฉฐ 'EMP'๋ฅผ ๋บ๊ธฐ์ ์์ฒญ๋ฐ์ ๋ฐ์ดํฐ๊ฐ ์ฌ๋ผ์ง
<br>


```java
//3. ์์ฒญํ๋จ
    String msg="";
    //java ํ์ผ ์ฉ์ด (DAO , DTO)
    EmpDAO edao = new EmpDAO();
    Emp emp = new Emp();
    
    List<Emp> list = edao.getEmpAllList();
    System.out.println(list);

//4. ๋ฐ์ดํฐ ์ ์ฅ
    request.setAttribute("emplist", list);
```
- 3๋ฒ์์ DAO, DTO๋ฅผ ์์ฑํด์ SQL์ ์๋ EMP ํ์ด๋ธ ๋ถ๋ฌ์ด
- ๊ทธ ๋ค์ DAO์ ์๋ getEmpAllList()๋ฅผ ํตํด ์ ์ฒด ๋ฆฌ์คํธ ๋ฐ์ดํฐ๋ฅผ 'list'์ ์ ์ฅ
- 3๋ฒ์์ ์์ฑ๋ 'list'๋ฅผ setAttribute๋ก "emplist"์ ์ ์ฅ์์ผ์ค
<br>

```java
//5. view ํ์ด์ง ์ค์ 
//๋ทฐ ์ง์ ํ๊ธฐ (Dispatcher)
RequestDispatcher dis = request.getRequestDispatcher("/Team2_Main_EMP.jsp");
```
- ํ๋ฉด์ ๋์์ค ํ์ผ 'Team2_Main_EMP.jsp' ์ ์์ฑํ๊ณ  Dispatcher์ผ๋ก ์ฐ๊ฒฐํด์ค
<br>

<br>

<hr>

### ๐ 4. Team_Main_EMP ํ์ผ ์์
<details>
<summary>Team_Main_EMP</summary>

```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table">
  <thead>
    <tr>
      <th scope="col">empno</th>
      <th scope="col">ename</th>
      <th scope="col">job</th>
      <th scope="col">mgr</th>
      <th scope="col">hiredate</th>
      <th scope="col">sal</th>
      <th scope="col">comm</th>
      <th scope="col">deptno</th>
    </tr>
  </thead>
  
  <tbody>
  <c:forEach var="emplist" items="${emplist}" varStatus="status">
    <tr>
        <td>${emplist.empno }</td>
        <td>${emplist.ename }</td>
        <td>${emplist.job }</td>
        <td>${emplist.mgr }</td>
        <td>${emplist.hiredate }</td>
        <td>${emplist.sal }</td>
        <td>${emplist.comm }</td>
        <td>${emplist.deptno }</td>
    </tr>

  </c:forEach>
  </tbody>
</table>
```
</details>
- <c:forEach>๋ก ๋ฐฐ์ด์ ๋๋ฉด์ ์ถ๋ ฅํ๋๋ก!