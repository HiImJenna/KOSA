# 2022.10.25. TUE ๐
----------------
<br>

## 1. Tomcat์ ๊ณต(WAS) โ
### ๐ ๊ธฐ๋ณธ์ ์ธ ๋ด์ฅ ๊ฐ์ฒด
- request (์์ฒญ: ํด๋ผ์ด์ธํธ ์ ๋ณด)
- response (์๋ต: ํน์  ํ์ด์ง ์ด๋ , ์ ๋ณด ์ถ๋ ฅ , ์ฟ ํค ์ฐ๊ธฐ)
- application(์ ์ญ๊ฐ์ฒด: web.xml ์์ ์ ๊ทผ read , ์ ์ญ๋ณ์)
- session(๊ณ ์ ๊ฐ์ฒด(์ ์ํ ์ฌ์ฉ์์๊ฒ ๋ถ์ฌ๋๋): ๊ณ ์ ํ ๋ณ์)
- out (์ถ๋ ฅ)
<br>

### ๐ session๊ฐ์ฒด
- ๋ด๋ถ์ session๋ณ์ ์์ฑ
- scope : a.jsp(session.setAtt.."member" ๋ณ์ ์์ฑ) b.jsp(session.getAtt.. "member" ์ฌ์ฉ๊ฐ๋ฅ)
- session ๋ณ์๋ (ํ์ฌ Webapp ํด๋ ์์ ์๋ ๋ชจ๋  ํ์ด์ง์์ ์ฌ์ฉ ๊ฐ๋ฅ)
- Life-cycle : session๋ณ์๋ session๊ฐ์ฒด์ ๋์ผ / session ์๋ฉธ : ์๋ฒ ๋ฆฌ๋ถํ , Tomcat ์ฌ์คํ , session.invaildate()
<br>

### ๐ application ๊ฐ์ฒด
- ๋ด๋ถ์ application๋ณ์ ์์ฑ
- ์ ์ญ๋ณ์ >>๋ชจ๋  session (์ ์ํ ๋ชจ๋  ์ฌ์ฉ์) ๊ณต์  scope : (ํ์ฌ Webapp ํด๋ ์์ ์๋ ๋ชจ๋  ํ์ด์ง์์ ์ฌ์ฉ ๊ฐ๋ฅ) 
- java >> static Life-cycle : ์๋ฉธ (์๋ฒ ๋ฆฌ๋ถํ) , Tomcat ์ฌ์คํ
<br>

### ๐ request ๊ฐ์ฒด
- [๋ด๋ถ์ ๋ณ์ ์์ฑ] : request.setAttribute("type","A");
- scope: ์์ฒญ ํ์ด์ง(login.jsp >> ์์ฒญ๋น request ์์ฑ >> scope >> page
- ์์ธ์ ์ผ๋ก login.jsp >> ok.jsp(include or forward) request ๊ฐ์ฒด๋ ok.jsp ๊ณต์ ๋๋ค
- ์๋ฐ ์น์ ๋ค๋ฃจ๋ ๊ธฐ์  424p 12.6 ์์  ์ฐ์ตํ๋ฉด ์ข์
```java
Emp emp = new Emp();
emp.setEmpno(2000);
emp.setEname("ํ๊ธธ๋");

session.setAttribute("empobj", emp);
//(String name, Object value) -> ๋จ์  downcasting ํ์

//session (์๋ฅผ ๋ค์ด ๋ค๋ฅธ ํ์ด์ง๋ผ๊ณ  ๊ฐ์ )
Emp e = (Emp)session.getAttribute("empobj");
out.print(e.getEmpno() + "<br>");
out.print(e.getEname() + "<br>");

//request
request.setAttribute("who", "king");
//Scope (ํ์ฌ ํ์ด์ง)

String who = (String)request.getAttribute("who");
out.print(who);

/*
์์ธ์ ์ผ๋ก
<jsp:include page="b.jsp"></jsp:include>
1. b.jsp ์์ session๋ณ์ >> empobj >> ์ฌ์ฉ(O) >> session์ด๋ include์ ์๊ด์์ด.
2. b.jsp ์์ request๋ณ์ >> who >> ์ฌ์ฉ(O) >> include ํ์ผ๋๊น
+

EL & JSTL
```
<br>

## 2. Servlet โ
### < JSP MVC model >
### ๐ ํ๋ฆ !! (๋งค์ฐ์ค์)
- #### 1. ํ๊ธ์ฒ๋ฆฌ
```java
    request.setCharacterEncoding("UTF-8");
```
<br>

- #### 2. ๋ฐ์ดํฐ ๋ฐ๊ธฐ
```java
    String type = request.getParameter("type");
```
<br>

- #### 3. ํ๋จํ๊ธฐ(์์ฒญ) (๋ก์ง์ฒ๋ฆฌ)
```java
    Object resultobj = null;
        if(type == null || type.equals("greeting")) {
                resultobj = "hello world";
        }else if(type.equals("date")) {
                resultobj = new Date();
        }else {
                resultobj = "invalid String type";
        }
```
<br>

- #### 4. ๋ฐ์ดํฐ ์ ์ฅ
```java
    //MVC ํจํด   >> JSP(ํ๋ฉด) >> ์๋ธ๋ฆฟ ์์ฒญ ํ์ ์ฒ๋ฆฌ >> View์ ๋ฌ (JSP)
    //๊ฒฐ๊ณผ๋ฅผ ์ ์ฅ : application , session , request (include , forward)
    //๋ด๊ฐ ๋ง๋  ์์์ด ๋ชจ๋  ํ์ด์ง์ด ํ์ํ์ง ์๋ค๋ฉด .... application , session ํ๋ฝ
    //๋ต์)  request
    request.setAttribute("result", resultobj);
```
<br>

- #### 5. view ํ์ด์ง ์ค์ 
```java
    //forward ๋ฐฉ์์ผ๋ก  JSP ๊น์ง
    //์์ฒญํ ์ฃผ์๋ ๋ณํ์ง ์๊ณ  ๋ค๋ฅธ ํ์ด์ง ๋ด์ฉ์ ์๋น์ค ๊ฐ๋ฅ
    
    //getRequestDispatcher >> VIEW ํ์ด์ง ์ฃผ์ ์ง์ 
    RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp");
```
<br>

- #### 6. view ๋ฐ์ดํฐ ์ ๋ฌ(forward)
```java
    dis.forward(request, response); //request ๊ฐ์ฒด ์ฃผ์๋ฅผ ๊ฐ์ด ...parameter๋ก
    //servlet ๊ฐ์ง๊ณ  ์๋ request ๊ฐ์ฒด์ ์ฃผ์ ์ response  ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ์ ๋ฌ
```
<br>

### < CMD ๋ฐฉ์ >
```java
    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
		//GET ์์ฒญ์ด๋ POST ์์ฒญ์ doProcess ํจ์๊ฐ ์ฒ๋ฆฌ
    	//method  parameter  ์์ฒญ ๋ฐฉ์ ํ์
    	System.out.println("ํด๋ผ์ด์ธํธ ์์ฒญ ๋ฐฉ์ : " + method);
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String cmd = request.getParameter("cmd");
    	
    	String viewpage=null;
    	if(cmd == null) {
    		viewpage = "/error/Error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";

    	}else if(cmd.equals("boardwrite")) {
    		
    		viewpage = "/board/boardwrite.jsp";
    		
    	}else if(cmd.equals("boarddelete")) {
    		
    		viewpage = "/board/boarddelete.jsp";
    		
    	}else if(cmd.equals("login")) {
    		viewpage = "/WEB-INF/views/login/login.jsp"; //์ค๋ฌด์ ์ธ ์ฝ๋
    	}else {
    		
    		viewpage = "/error/error.jsp";
    	}
    	
    	//๊ฒฐ๊ณผ์ ์ฅ
    	//List<board> boardlist = dao.selectBoardList();
    	//request.setAttribute("list",boardlist);
    	
    	//view์ง์ 
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//view์๊ฒ ๋ฐ์ดํฐ ์ ๋ฌ (forward)
    	dis.forward(request, response);//request๊ฐ์ฒด๋ฅผ view ์๊ฒ ํต์ผ๋ก ์ ๋ฌ
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//๊ฐ์ ๋ก์ง
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//๊ฐ์ ๋ก์ง
		doProcess(request, response, "POST");
	}

```
- -> ์์๊ฐ์ด cmd = ~~~ ํ๋ ๊ฐ์ ๋ฐ์์ ๊ฐ๊ฐ์ jsp๋ฅผ ๋ถ๋ฅํด์ฃผ๋ ๋ฐฉ์์ด๋ค