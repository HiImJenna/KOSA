# 2022.12.07. WED ๐
----------------
<br>

# 1. Annotation

## @Qualifier

- ๋ชฉ์  : @Autowired์ ๋ชฉ์ ์์ ๋์ผ ํ์์ ๋น๊ฐ์ฒด๊ฐ ์กด์ฌ์ ํน์ ๋น์ ์ฝ์ํ  ์ ์๊ฒ ์ค์ ํ๋ค.
- ์ค์ ์์น : @Autowired ์ด๋ธํ์ด์๊ณผ ํจ๊ป ์ฌ์ฉ๋๋ค.
- ์ถ๊ฐ์ค์  : ๋์ผํ์์ ๋น๊ฐ์ฒด ์ค์ ์์ <qualifier value="[alias๋ช]" />๋ฅผ ์ถ๊ฐํ์ฌ ์ค๋ค.
- ์ต์ : name - alias๋ช

## @Resource

๋ชฉ์  : ์ดํ๋ฆฌ์ผ์ด์์์ ํ์๋ก ํ๋ ์์์ ์๋ ์ฐ๊ฒฐ(์์กดํ๋ ๋น ๊ฐ์ฒด ์ ๋ฌ)ํ  ๋ ์ฌ์ฉ

- @Autowired ์ ๊ฐ์ ๊ธฐ๋ฅ์ ํ๋ฉฐ
- @Autowired์ ์ฐจ์ด์ ์
- @Autowired๋ ํ์์ผ๋ก(by type),
- @Resource๋ ์ด๋ฆ์ผ๋ก(by name)์ผ๋ก ์ฐ๊ฒฐ์์ผ์ค๋ค๋ ๊ฒ์ด๋ค.

์ค์ ์์น : ํ๋กํผํฐ, setter๋ฉ์๋
์ถ๊ฐ์ค์  : CommonAnnotationBeanPostProcessor ํด๋์ค๋ฅผ ๋น์ผ๋ก ๋ฑ๋ก์์ผ์ค์ผ ํ๋ค.
ํด๋น ์ค์  ๋์ ์ context:annotation-config ํ๊ทธ๋ฅผ ์ฌ์ฉํด๋ ๋๋ค.
์ต์ : name

## ์ค์!

```java
@Autowired by type
@Resource by name
```

## @Configuration

ํด๋น ํด๋์ค๊ฐ ์คํ๋ง์ ์ค์ ์ผ๋ก ์ฌ์ฉ๋จ์ ์ง์ 

DI_Config.xml๊ณผ ๊ฐ์ ์ญํ ์ ํ๋๋ก ๋ง๋ฌ

```java
***************************************************************************

class MemberRegisterService{
   private MemberDao memberdao;
   public MemberRegisterService(MemberDao memberdao){
      this.memberdao = memberdao;
   }
}

1. xml ์ค์ 

<bean id="memberdao" class="MemberDao" />
<bean id="memberRegSvc" class="MemberRegisterService">
     <constructor-arg  ref="memberdao">
</bean>

 1.1 ์ถ๊ฐ : @Autowired ์ ์ฉ
class MemberRegisterService{
   private MemberDao memberdao;   

   @Autowired
   public MemberRegisterService(MemberDao memberdao){
      this.memberdao = memberdao;
   }
}   

xml ๋ฌธ์

<context:annotation-config />   
<bean id="memberRegSvc" class="MemberRegisterService"></bean>
<bean id="memberdao" class="MemberDao" />   
    

2. @Configuration
   @bean
   ๋๊ฐ์ ์ด๋ธํ์ด์์ ์ด์ฉํด์ (java ์ฝ๋ ๊ธฐ๋ฐ์ ์์)

   @Configuration
   class Configcontext{
         @bean
         public MemberRegisterService memberRegSvc(){
           return new MemberRegisterService(memberdao()); //ํจ์๋ฅผ ํตํ ์ฃผ์
         } 

         @bean
         public MemberDao memberdao(){
          return new MemberDao();
         }
   }

***************************************************************************
```

## @Controller

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