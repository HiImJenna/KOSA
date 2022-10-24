# 2022.10.24. MON 📅
----------------
<br>

## 1.  JSP 기본 개체와 영역✔
![image](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2F20160902_28%2Fi7027_1472798865059QEztp_PNG%2F%25C5%25AC%25B6%25F3%25C0%25CC%25BE%25F0%25C6%25AE%25BC%25AD%25B9%25F6_1.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb4.phinf.naver.net%2F20150930_15%2Fi7027_1443569926164haD3C_PNG%2F%25BF%25B5%25BF%25AA.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
<br>

## 2.  Cookie ✔
### 🔔 Cookie Basic
```jsp
   정보(자료)데이터 > 저장 > 장소(where)
   
   [웹이라는 관점]에 데이터 어느 장소에 저장
   
   클라이언트(개인 Local PC)   : 서버(웹서버 or DB서버)
   
   어디에 저장(보관)
   고민 (기준점): 보안요소(데이터 중요성), 소멸(일시적, 영속적)
   
   보안: 클라이언트냐 서버냐
   소멸: 메모리와 DB or 파일
   
   Client (Local PC : 웹브라우저)
   1. Cookie (메모리 쿠키 & 파일 쿠키(local 디스크에 txt 저장 > 암호화 )) >> 소멸시기
   	  단점) 크기 제약적(4096byte), 보안(사용자 삭제..암호화 해독 해커가...)
   2. Local Storage(key, value) 형태
  	  장점) 크기, value(객체 사용 가능 : JSON)
  	  
   Server (웹서버(WAS)(메모리) + DB서버)
   1. server memory : session 객체 (사이트 접속하는 사용자마다 고유하게 부여하는 메모리(객체)) > 서버 리부팅, 개발코드 변경 > 소멸 > 생성
   2. server memory : application 객체
   3. server 영속적 : 파일.txt(관리가 힘들어요)
   4. DB server : 보안, 영속적인 데이터 관리 >> 비용은 추가 >> 클라우드 사용
```
```jsp
 <%
	 Cookie mycookie = new Cookie("cname", "1004");
	 //서버 쿠키 객체 생성
	 //내 웹 서버에 접속한 브라우저(client)에게 cookie 전달(write) >> response
 	
 	response.addCookie(mycookie); //한줄로 ...
 %>
 <a href = "Ex16_Cookie_read.jsp">Cookie read</a>
```
<br>

### 🔔 Cookie Read
```jsp
<%
	Cookie[] cs = request.getCookies();
	//웹브라우저가 가지는 모든 쿠키들을 다 가지고 와서
	if(cs != null || cs.length > 0) {
		//개발자 마음
		for(Cookie c : cs) {
			out.print("c.getName : " + c.getName() + "<br>");
			out.print("c.getValue : " + c.getValue() + "<br>");
			out.print("c.getMaxAge : " + c.getMaxAge() + "<br>"); //-1 (소멸시간이 없)
			out.print("c.getDomain : " + c.getDomain() + "<br>");
			out.print("<hr>");
		}
	}
%>

```
<br>

### 🔔 Cookie File
- 메모리 쿠키 (브라우저) : client 강제로 지우지 않는 한 ... 브라우저가 닫기 전까지 유효
- -> 소멸타입 : getMaxAge() >> -1
- 파일 쿠키 (소멸시간을 가지고 있음) : client가 강제로 지우지 않는 한 정해진 시간까지 유효(2050년 12월 12일)
- -> setMaxAge(60) >> 60초 뒤에 소멸

30일  
(30*24*60*60)일 * 시간 * 분 * 초  
setMaxAge(30*24*60*60)  
```jsp
<%
Cookie co = new Cookie("kosa", "hong");
co.setMaxAge(30*24*60*60); //30일
response.addCookie(co);
%>
```
<br>

## 3.  Session ✔
#### < Server (웹서버(WAS)(메모리) + DB서버) > 
- server memory : session 객체 (사이트 접속하는 사용자마다 고유하게 부여하는 메모리(객체)) > 서버 리부팅, 개발코드 변경 > 소멸 > 생성
- server memory : application 객체
```
session 객체 : 서버(web)애 접속한 사용자마다 고유하게 부여되는 객체 
고유성 보장(key값) >> 각각의 session 객체마다 이름표 > key값 > 클라이언트에도 전달 
활용) 클라이언트마다 고유하게 부여 (session 객체)
>> 로그인 여부, 장바구니, 사용자의 정보(각각 다른 정보), 사용자마다 접속한 시간, 마지막 접속 시간
```
- http://localhost:8090/WebJSP/Ex18_Session.jsp 서버에 요청 보내기
- session ID (key값) 생성됨 -> session -> sessionID response 해요(cookie)
- -> JSESSIONID : 36EE35EDAF566BEA0C46F6E266E6C8E0
- 동기화 (너랑 나랑 친구다)
- ex) 접속자 1000명이 Web Server에는 key 1000개 만들어지고 key 이름표로 달고있는 session 객체도 1000개 생성
- ex) Client 로그아웃 버튼 클릭 >> 서버는 어떠한 작업을 수행 할까요? >> 로그아웃 판단 >> key 가지고 와서 key(이름표) > 객체를 찾아서 abandon >> invalidate
```
 1. session 객체(사용자마다 부여되는 고유한 객체)
    >> 접속하는 브라우저마다 (sessionID)을 가지고 객체 관리
    >> 접속한 사용자 마다 고유한 변수 만들기 .....
    >> session.setAttribute("id",request.getParameter("userid")); 
    
    접속자 3명
    
    김유신 : 서버객체 생성(session) : 식별값 : A1 : 생성된 session 객체(변수, 값)
    -session객체 (id,kim)
    
    이순신 : 식별값 : A2
    -session 객체 (id,Lee)
    
    .. 등등 .....

```
<br>