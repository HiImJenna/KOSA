# 2022.12.08. THU ๐
----------------
<br>

# 1. Annotation โ

### @Controller

๊ธฐ์กด ๋ฐฉ์)

```java
์ด๋ ๊ฒ ์ฒ๋ฆฌํ๋ฉด ์์ฒญ ํ๋๋น controller ํ๋ ํ์
public class HelloController implements Controller
๋ฐฉ์์
๋จ์ : ์๋น์ค ์์ฒญ ๊ฐ์๋งํผ controller ์์ฑ
๊ฒ์ํ: ๋ชฉ๋ก๋ณด๊ธฐ >> ListController
		๊ธ์ฐ๊ธฐ>> WriteController
		์์ ํ๊ธฐ>> EditController
	
	
public class HelloController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
```

### BUT!! controller๋ฅผ ์ด์ฉํ๋ฉด

```java
@Controller
public class HelloController

method ๋จ์๋ก ๋งคํ
ํ๋์ controller ์์ ์ฌ๋ฌ๊ฐ์ ํจ์๋ฅผ ์์ฑ

๊ฒ์ํ: ๋ชฉ๋ก๋ณด๊ธฐ >> public void list()
		๊ธ์ฐ๊ธฐ>> public void write()
		์์ ํ๊ธฐ>> public void edit()
```

 ํจ์ฌ ๊ฐ๋จํด์ง.

### @RequestMapping

```java
@RequestMapping("/hello.do") //<a href="hello.do"></a> ์์ฒญ์ด ์คใใด ํจ์ ์คํ
	public ModelAndView hello() {
		System.out.println("[hello.do method call]");
		ModelAndView mv = new ModelAndView();
		mv.addObject("greeting",getGreeting());
		mv.setViewName("Hello");
		return mv;
	}

addObject๋ก ๊ฐ์ ๋ฃ์ด์ฃผ๊ณ  greeting์ผ๋ก ์ ์ธํด์ค๋ค
setviewname.jsp ํ์ผ๋ก ๋ณด๋ธ๋ค.
```

---

```java
Model์์
public class NewArticleCommand {
	private int parentId;
	private String title;
	private String content;
}

์ด๋ฐ์์ผ๋ก ์ ์ธํ์ผ๋ฉด ์๋์ ๊ฐ์ ๋ฐฉ์์ผ๋ก view name๋ ํต์ผ์์ผ์ผ ํธํ๋ค

<h3>*form ํ๊ทธ์ action ์ฃผ์๊ฐ </h3>
	<form action="post">
		<input type="hidden" name="parentId" value="0">
		์ ๋ชฉ:<input type="text" name="title"><br>
		๋ด์ฉ:<input type="text" name="content"><br>
		<input type="submit" value="์ ์ก">
	</form>
```

```java
@Controller
@RequestMapping("/article/newArticle.do")
public class NewArticleController {

	//@RequestMapping(method = RequestMethod.GET)  //ํ๋ฉด๋ณด์ฌ์ฃผ์ธ์
//์๋์ requestmapping ํด์ผํ์ง๋ง 5.x๋ฒ์ ๋ถํด getmapping์ผ๋ก ๋ ํธํ๊ฒ ์ฌ์ฉ๊ฐ๋ฅ
	@GetMapping
	public String form() { 
		//****** spring ํจ์์ return ํ์์ด String view์ ์ฃผ์๋ฅผ ์๋ฏธ ......
		System.out.println("GET");
		return "article/newArticleForm";
		//   /WEB-INF/views/  + article/newArticleForm + .jsp
	}
	
	//1. ๋ฐ์ดํฐ ๋ฐ๋ ๊ฐ์ฅ ์ ํต์ ์ธ ๋ฐฉ๋ฒ >> HttpServletRequest request >> ์ฝ๋๋ ์ฆ๊ฐ >> spring ์...
	//@RequestMapping(method = RequestMethod.POST) //์ฒ๋ฆฌํด ์ฃผ์ธ์
//์์ ๋ง์ฐฌ๊ฐ์ง๋ก Postmapping์ผ๋ก ๋ ํธํ๊ฒ ์ธ์์์
	@PostMapping
	public ModelAndView submit(HttpServletRequest request) {
		System.out.println("POST");
		return null;
	}
}
```

## com.controller

์ง์ง ๊ตฌ์๋ฐฉ์)

```java
//1. ๋ฐ์ดํฐ ๋ฐ๋ ๊ฐ์ฅ ์ ํต์ ์ธ ๋ฐฉ๋ฒ >> HttpServletRequest request >> ์ฝ๋๋ ์ฆ๊ฐ >> spring ์...
	   //@RequestMapping(method = RequestMethod.POST) //์ฒ๋ฆฌํด ์ฃผ์ธ์
	   @PostMapping
	   public ModelAndView submit(HttpServletRequest request) {
	      System.out.println("POST");
	      
	      NewArticleCommand article = new NewArticleCommand();
	      article.setParentId( Integer.parseInt(request.getParameter("parentId")));
	      article.setTitle(request.getParameter("title"));
	      article.setContent(request.getParameter("content"));
	      
	      //NewArticleController ๊ฐ service ํ์ํด 
	      this.articleservice.writeArticle(article);
	      //์ฒ๋ฆฌ์๋ฃ
	      
	      ModelAndView mv = new  ModelAndView();
	      mv.addObject("newArticleCommand", article);
	      mv.setViewName("article/newArticleSubmitted");
	      
	      return mv;
   }
```

์๋ ๋ฐฉ์)

```java
@PostMapping
	   public ModelAndView submit(NewArticleCommand command) {
		 //1. ์๋ DTO ๊ฐ์ฒด ์์ฑ NewArticleCommand command = new NewArticleCommand()
		 //2. ๋์ด์จ parameter ๊ฐ์ DTO ์ setter ํจ์๋ฅผ ์ฌ์ฉํด์ ์๋ ์ฃผ์
		 //3. NewArticleCommand command ๊ฐ์ฒด IOC ์ปจํ์ด๋ ์์ ์๋ ์์ฑ id="newArticleCommand"
		 
		 this.articleservice.writeArticle(command);
		 //์ฒ๋ฆฌ์๋ฃ
		 
		 ModelAndView mv = new  ModelAndView();
	 	 mv.addObject("newArticleCommand", command);
	 	 mv.setViewName("article/newArticleSubmitted");
	 	 
	 	 return mv;
	 }
```

์ต์ ๋ฐฉ์)

```java
public String submit(@ModelAttribute("Articledata") NewArticleCommand command) {
		 this.articleservice.writeArticle(command);
		  /*
	        ModelAndView mv = new  ModelAndView();
	         mv.addObject("newArticleCommand", command);
	         
	         >>> @ModelAttribute("Articledata") ๋์ฒด๋จ
	         
	         mv.setViewName("article/newArticleSubmitted");
	         >>> String submit  >>> return "article/newArticleSubmitted"
	         
	         view ๊น์ง ์๋ forward
	       */
		 return "article/newArticleSubmitted";
	 }
```

# Parameter ๋ฐ๋๋ฐฉ๋ฒ

### 1. ์ ํต์ ์ธ ๋ฐฉ๋ฒ

```java
public ModelAndView searchExternal(HttpServletRequest request) {
		String id = request.getParameter("id")
	}
```

### 2. DTO ๊ฐ์ฒด๋ฅผ ํตํ ์ ๋ฌ ๋ฐฉ๋ฒ(๊ฒ์ํ, ํ์๊ฐ์ ๋ฐ์ดํฐ)

```java
public ModelAndView searchExternal(MemberDto member){
		/search/external.do?id=hong&name=๊น์ ์ &age=100
		 
	 2.1 DTO ์๋ member field ์ด๋ฆ์ด >>
	 	private String id;
	 	private String name;
	 	private int age;
	}
```

### 3. ๊ฐ์ฅ ๋ง๋งํ ๋ฐฉ๋ฒ

```java
public ModelAndView searchExternal(String id, String name, int age){
		/search/external.do?id=hong&name=๊น์ ์ &age=100
		**๊ฐ๊ฐ์ parameter์ ์๋๋งคํ
	}
```

### 4. @RequestParam	annotation ์ฌ์ฉํ๊ธฐ

4.1 ์ ํจ์ฑ ์ฒ๋ฆฌ๊ฐ๋ฅ
4.2 ๊ธฐ๋ณธ๊ฐ ์ฒ๋ฆฌ

```java
@RequestMapping("/search/external.do")
	public ModelAndView searchExternal( @RequestParam (value="query", defaultValue="kosa") String query ,
										@RequestParam (value="p", defaultValue="10") int p) {
		
		System.out.println("param query: " + query);
		System.out.println("param p:" + p);
		
		return new ModelAndView("search/external"); // public String searchExternal()	view์ฃผ์
	}
```

### 5. REST ๋ฐฉ์ (๋น๋๊ธฐ ์ฒ๋ฆฌ) method= GET, POST, PUT, DELETE

```java
@PathVariable	>>	/member/{memberid} >> /member/100
	
	100 ์ถ์ถํด์ parameter ์ฌ์ฉ
```

### <context:component-scan base-package="ํจํค์ง๋ช" />

- ํจํค์ง์์ ํ์ํ bean์ xml์์ ๋ฏธ๋ฆฌ ์ ์ธํด ์๋์ผ๋ก ์ฃผ์ํด์ค

## ์ฟ ํค(Cookie)

```java
@Controller
public class CookieController {
	
	@RequestMapping("/cookie/make.do")
	public String make(HttpServletResponse response) {
		response.addCookie(new Cookie("auth","1004")); //servlet ๋์ผ
		return "cookie/CookieMake";
	}
	
	@RequestMapping("/cookie/view.do")
	public String view(@CookieValue(value="auth", defaultValue = "1007") String auth) {
		
		System.out.println("ํด๋ผ์ด์ธํธ์์ readํ ์ฟ ํค ๊ฐ: " + auth);
		return "cookie/CookieView";
	}
}
```

## ์ด๋ฏธ์งํ์ผ(image)

```java
@Controller
@RequestMapping("/image/upload.do")
public class ImageController {

	@GetMapping
	public String form() {
		return "image/image"; //๋ทฐ๋ฅผ ๋ณด์ฌ์ฃผ์
	}
	
	@PostMapping
	public String submit(Photo photo , HttpServletRequest request) {
		/*
		1. Photo DTO ํ์์ผ๋ก ๋ฐ์ดํฐ ๋ฐ๊ธฐ
		1.1 ์๋ํ : name ์์ฑ๊ฐ์ด Photo ํ์ํด๋์ค์ member field ๋ช๊ณผ ๋์ผ
		2. public String submit(Photo photo) ๋ด๋ถ์ ์ผ๋ก ...  
		   >> Photo photo = new Photo();
		   >> photo.setName("ํ๊ธธ๋");
		   >> photo.setAge(20);
		   >> photo.setImage() >> ์๋ ์ฃผ์ ์๋์ >> ์๋์ผ๋ก >> ๊ฐ๊ณต CommonsMultipartFile ์ถ์ถ(์ด๋ฆ)
		   >> photo.setFile(CommonsMultipartFile file) ํ์ผ ์๋์ผ๋ก ๋ค์ด์์
		   
		 */
		System.out.println(photo.toString());
		
		CommonsMultipartFile imagefile = photo.getFile(); //์๋ก๋ํ ํ์ผ ์ ๋ณด
		System.out.println("imagefile name : " + imagefile.getName());
		System.out.println("imagefile getContentType : " + imagefile.getContentType());
		System.out.println("imagefile getOriginalFilename : " + imagefile.getOriginalFilename());
		System.out.println("imagefile getBytes : " + imagefile.getBytes().length);
		
		
		//POINT DB ์ ๋ค์ด๊ฐ ํ์ผ ๋ช ์ถ์ถ
		photo.setImage(imagefile.getName());
		
		//cos.jar ์๋ ํ์ผ ์๋ก๋ 
		//์ค์  ํ์ผ ์๋ก๋ ๊ตฌํ (upload ์๋ก๋)
		
				String filename = imagefile.getOriginalFilename();
				String path = request.getServletContext().getRealPath("/upload"); //๋ฐฐํฌ๋ ์๋ฒ ๊ฒฝ๋ก 
				String fpath = path + "\\" + filename;
				System.out.println(fpath);
				
				FileOutputStream fs =null;
				try {
					     fs = new FileOutputStream(fpath);
					     fs.write(imagefile.getBytes());
					     
				} catch (Exception e) {
					
					e.printStackTrace();
				}finally {
					 try {
						fs.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				//DB์์ .... ํ์ผ ์๋ก๋ ์๋ฃ
				return "image/image";
		
	}
	
}
```

- ์์ธํ๊ฑด SpringMVC_Basic03_Annotation์ ImageController๋ฅผ ์ฐธ์กฐํ์ธ์