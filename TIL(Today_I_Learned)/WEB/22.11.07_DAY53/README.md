# 2022.11.07. MON ๐
----------------
<br>

## 1. Model2 MVC ํจํด ์์ โ

- Model
    1. DTO ์์ฑ > Db ํ์ด๋ธ๊ณผ ๊ฐ์ ๊ตฌ์กฐ ํด๋์ค ์์ฑ > getter, setter ๊ตฌํ
    2. DB ์ฐ๊ฒฐ(POOL) > DAO > CRUD > ์ ์ฒด์กฐํ, ์กฐ๊ฑด์กฐํ, ์ฝ์, ์ญ์ , ์์  + ์ํ(LIKE)
    3. Servic๋จ..์ถํ
    
- View
    1. html or jsp > ๊ตฌ๋ถ์ ์? : UI ๋ฐ์ดํฐ ์ถ๋ ฅ ์ ๋ฌด > Boot > include > ๋ชจ๋ ํ์ด์ง > JSP
    2. EL & JSTL > server์์ ๋ฐ์ดํฐ ๋ด์์ (request) > forward > ๊ทธ request ๊ฐ์ฒด ...
    ex) ${requestScope.list) or ${[sessionScope.id](http://sessionscope.id/)} >> ์ถ๋ ฅ(JSTL)
    3. JSP ๋ณด์์  ์ฒ๋ฆฌ > WEB-INF > view > member or admin or board > jsp ๊ด๋ฆฌ
    4. ๋น๋๊ธฐ์ฒ๋ฆฌ(ajax) > xmlHttpRequest
    
- Controller
    1. ์์ฒญ๋ง๋ค Controller ์์ฑํ๊ธฐ (servlet ์์ฑ)
    1-1. write > /write > ServletWrite
    1-2. list > /list > ServletList
    
    2. ์์ฒญ๋ง๋ค Controller ์์ฑํ์ง ๋ง๊ณ  1๊ฐ (servlet ์์ฑ)
    2-1. FrontController >> servet 1๊ฐ (๋ชจ๋ ์์ฒญํ๋จ) > ํ๋จ๊ทผ๊ฑฐ
    
    1)ํ๋จ์ ๊ทผ๊ฑฐ
    - command ๋ฐฉ์ : ๊ธ์ฐ๊ธฐ([servlet.do?cmd=write](http://servlet.do/?cmd=write)), ๊ธ๋ชฉ๋ก๋ณด๊ธฐ([servlet.do?cmd=list](http://servlet.do/?cmd=list))
    if{cmd.equals("write")(๊ธ์ฐ๊ธฐ ์์ ์ํ)}
    - url ๋ฐฉ์     : ๊ธ์ฐ๊ธฐ([wrtie.do?id=hihi&pwd=1004](http://wrtie.do/?id=hihi&pwd=1004)), ๊ธ๋ชฉ๋ก๋ณด๊ธฐ([list.do](http://list.do/)) >> url ์ฃผ์๋ก ์์ฒญ์ ํ๋จ
    ์ฃผ์) urlํจํด >> * do

![https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fm1.daumcdn.net%2Fcfile234%2FR400x0%2F13705949504C57EB0E1B72%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fm1.daumcdn.net%2Fcfile234%2FR400x0%2F13705949504C57EB0E1B72%22&type=cafe_wa740)

MVCํจํด์ ์ฅ์ )

- ์๋ก์ ๊ด์ฌ์ ๋์ง ์๋๋ค. (DB๋ DB๋งโฆ Front๋ Front๋งโฆ)
- ๊ฐ์ ์ํ๋๊ฒ๋ง ํด!

### ๐ ์ ์ผ ๊ธฐ๋ณธ์ ์ธ MVC ํจํด ํด๋

![https://user-images.githubusercontent.com/92353613/200305250-2d8781dd-d107-40f1-ada1-892e769f6d27.png](https://user-images.githubusercontent.com/92353613/200305250-2d8781dd-d107-40f1-ada1-892e769f6d27.png)

## 2. Action โ

๊ธฐ์กด dao ๋ค์ controller๋ก ์ด๋ฃจ์ด์ง๋ ํจํด์ controller์ ๋ง์ ๊ณผ๋ถํ๊ฐ ๊ฑธ๋ฆฌ๊ธฐ ์ฝ์์ด๋ค.

๊ทธ๋ ๊ธฐ ๋๋ฌธ์ Actionํํธ๋ฅผ ๋ง๋ค์ด์ฃผ์ด  service์์ ๊ธฐ๋ฅ์ ๊ตฌํํด controller์์ ๋ถ๋ฌ์ค๊ธฐ๋ง ํ๋ฉด ๋๋ ๋ฐฉ์์ด๋ค.

## ๐ ๊ธฐ๋ณธ Action ํ์ผ๋ค

### [Action.java]

```jsx
package kr.or.kosa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//์์ฑํ๋ ๋ชจ๋  ์๋น์ค๋ Action ์ธํฐํ์ด์ค๋ฅผ ๊ตฌํํ์ผ๋ฉด ์ข๊ฒ ๋ค.

public interface Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);
	
}
```

### [ActionForward.java]

```jsx
package kr.or.kosa.action;

/*
 servlet(front) ์์ฒญ ๋ฐ์
 1. ํ๋ฉด ์ถ๋ ฅ
 2. ๋ก์ง ์ฒ๋ฆฌ
 
 ํ๋ฉด์๋๋ฉด ๋ก์ง
 
 */

public class ActionForward {
	private boolean isRedirect = false; //view ์ ํ ์ฌ๋ถ .. redirect or forward
	private String path = null; //์ด๋ ๊ฒฝ๋ก (๋ทฐ์ ์ฃผ์)
	
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
	
}
```

## 2.2 ์ ์ฉ๋ฐฉ๋ฒ

### [Controller์ Action ์ ์ฉ๋ฐฉ๋ฒ]

```jsx
Action action = null;
    	ActionForward forward=null;
    	
    	if(urlcommand.equals("/register.do")) {
    		//UI ์ ๊ณต (์๋น์ค ๊ฐ์ฒด๊ฐ ํ์์๋ค)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/register.jsp");
// ๊ธฐ๋ณธ view๋จ ๊ณต์
    		
    	}else if(urlcommand.equals("/registerok.do")) {
    		//UI ์ ๊ณต + ์๋น์ค ํ์
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, request); //request ํด๋ผ์ด์ธํธ๊ฐ ์์ฒญํ ํ์ด์ง๋น 1๊ฐ์ฉ ๋ง๋ค์ด์ง๋ request ๊ฐ์ฒด
    	}
// ๊ธฐ๋ฅ์ด ์์๊ฒฝ์ฐ ์ด๋ฐ์์ผ๋ก
```

 

## 3. Filter โ

filter๋ http์ ์์ฒญ๊ณผ ์๋ต์ ๋ณ๊ฒฝํ  ์ ์๋ ์ฌ์ฌ์ฉ ๊ฐ๋ฅํ ๊ฐ์ฒด์ด๋ค. ํด๋ผ์ด์ธํธ์ ํน์ or ๊ณตํต์ ์์ฒญ ์ ๋ณด๋ฅผ ์ ๊ฒํ๊ฑฐ๋ ์๋ง๊ฒ ๋ณ๊ฒฝํ๋๋ฑ ๋ค์๊ณผ ๊ฐ์ ๊ฒ๋ค์ ํ  ์ ์๋ค.

- ์ธ์ฆ
- ๋ก๊น
- ์์ฒญurl์ฒ๋ฆฌ
- ๋ฐ์ดํฐ ๋ณํ
- ์ํธํ
- ์ฒดํฌ

ํํฐ๋ ์๋ธ๋ฆฟ์ด service()๋ฉ์๋๋ฅผ ์ด์ฉํด์ ์์ฒญ์ ์ฒ๋ฆฌํ๋ฏ ํํฐ๋ doFilter()๋ฉ์๋๋ฅผ ์ด์ฉํ์ฌ ์์ฒญ์ ํํฐ๋งํ๋ค.

1. **public void init(FilterConfig filterConfig)**
    
    ํํฐ๋ฅผ ์น ์ฝํ์ด๋๋ด์ ์์ฑํ ํ ์ด๊ธฐํํ  ๋ ํธ์ถํ๋ค.
    
2.  **public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)**
    
    ์ฒด์ธ์ ๋ฐ๋ผ ๋ค์์ ์กด์ฌํ๋ ํํฐ๋ก ์ด๋ํ๋ค. ์ฒด์ธ์ ๊ฐ์ฅ ๋ง์ง๋ง์๋ ํด๋ผ์ด์ธํธ๊ฐ ์์ฒญํ ์ต์ข ์์์ด ์์นํ๋ค.
    
3. **public void destroy()**
    
    ํํฐ๊ฐ ์น ์ฝํ์ด๋์์ ์ญ์ ๋  ๋ ํธ์ถ๋๋ค.
    

![https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fdthumb-phinf.pstatic.net%252F%253Fsrc%253D%252522http%25253A%25252F%25252Fcafeptthumb3.phinf.naver.net%25252F20130909_298%25252Fzeroday7_1378703968186yiYWO_GIF%25252Ffilter.gif%25253Ftype%25253Dw740%252522%2526amp%253Btype%253Dcafe_wa740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdthumb-phinf.pstatic.net%2F%3Fsrc%3D%2522https%253A%252F%252Fdthumb-phinf.pstatic.net%252F%253Fsrc%253D%252522http%25253A%25252F%25252Fcafeptthumb3.phinf.naver.net%25252F20130909_298%25252Fzeroday7_1378703968186yiYWO_GIF%25252Ffilter.gif%25253Ftype%25253Dw740%252522%2526amp%253Btype%253Dcafe_wa740%2522%26amp%3Btype%3Dcafe_wa740%22&type=cafe_wa800)

### ๐ Filter ์ ์ฉ๋ฐฉ๋ฒ

### [Filter ์ ์ฉ์ฝ๋]

```jsx
@WebFilter(
        description = "์ด๋ธํ์ด์ ํ์ฉํด ํํฐ ์ ์ฉ",
        urlPatterns = {"/*"},
        initParams = {@WebInitParam(name="encoding", value="UTF-8")}
        )
public class Encoding extends HttpFilter implements Filter {
       
	//member field ์์ฑ
	private String encoding;
 
    public Encoding() {
        super();
    }
    
	public void init(FilterConfig fConfig) throws ServletException {
		//์ต์กฐ์์ฒญ ์ ์ปดํ์ผ๋๊ณ  ํ๋ฒ๋ง ์คํ
		//web.xml ์ค์ ๋์ด ์๋ ์ด๊ธฐ๊ฐ์ readํด์ ์ฌ์ฉ FilterConfig ํตํด์
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("filter init ํจ์ ์คํ : " + this.encoding);
	}

	public void destroy() {
		
	}

	//ํจ์๋ฅผ ํตํด ์์ฒญ&์๋ต ์ ํํฐ๋ง ์ ์ด
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//request ์์ฒญ์ ๋ํ ํํฐ ์คํ ์ฝ๋ ์์ญ
		if(request.getCharacterEncoding() == null) {
			System.out.println("before : " + request.getCharacterEncoding());
			//ํจ์ค ์ฝ๋ (๊ณตํต๊ด์ฌ, ๋ณด์กฐ๊ด์ฌ AOP)
			request.setCharacterEncoding(this.encoding);
			System.out.println("after : " + request.getCharacterEncoding());
		}
		
		chain.doFilter(request, response);
	
		//response ์๋ต์ ๋ํ ํํฐ ์คํ ์ฝ๋ ์์ญ
		System.out.println("์๋ต์ฒ๋ฆฌ ์คํ");
	}
	
}
```

- ์์ผ๋ก ์ ๋ฐฉ์์ ๊ฐ์ ธ๋ค ์ฐ์ธ์ฉ