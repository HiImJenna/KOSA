# 2022.12.06. TUE ๐
----------------
<br>

## 1. Spring ์ฌ์ฉ๋ฒ โ

### ์คํ๋ง ์ฌ์ฉ๋ฒ!

์คํ๋ง์ ํ์ํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ ํ์

- beans
- core
- context
- expression

---

1. ๋ด๊ฐ ํ์ํ ํด๋์ค๋ฅผ ์ค๊ณํ๋ค
2. ์คํ๋ง์ํ์ํ ๊ฐ์ฒด๋ค์ด ํ์ํ ์ค์ 
    - xml ํ์ผ ์ค์  (DIConfig.xml)
    - annotation ์ค์ 
3. xml ํ์ผ์ bean ๋ง๋ค๊ณ  ํ์ํ๊ณณ์์ getBean์ผ๋ก ๊ฐ์ ธ์ค๊ธฐ

---

## ๊ฒฐ๋ก ) ๊ฐ๋ฐ์๊ฐ NEW๋ฅผ ํ์ง ์๊ณ  ์์ฑ์๊ฐ ๊บผ๋ด์ ์ฐ๋ ๋ฐฉ์!

```
๊ธฐ์กด)
์ด๋ค ๊ฐ์ฒด๊ฐ ํ์ํ๋ฉด ์ง์ 
Emp emp = enw Emp() ์ฌ์ฉ

์คํ๋ง)
xml ๋๋ annotation์ ํตํด์ ๋ฏธ๋ฆฌ ๊ฐ์ฒด๋ฅผ ์์ฑํด ๋๊ณ  ์ฌ์ฉํ๊ธฐ

>> ๋ฏธ๋ฆฌ ๋ชจ๋  ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ์กฐ๋ฆฝ๋ง ํด๋ผ ๊ทธ๋ฆฌ๊ณ  ์ฌ์ฉํด๋ผ (์คํ๋ง)
```
<br>

### ๐ก Implement - MessageBean.java
```java
public interface MessageBean {
	void sayHello(String name);
}
``` 
<br>

### ๐ก MessageBean_kr.java
```java
public class MessageBean_kr implements MessageBean {

	@Override
	public void sayHello(String name) {
		System.out.println("์๋ " + name + " !");
	}

}
```
<br>

### ๐ก MessageBean_en.java
```java
public class MessageBean_en implements MessageBean {

	@Override
	public void sayHello(String name) {
		System.out.println("Hello " + name + " !");
	}

}
```
<br>


### ๐ก xml
```xml
<bean id="messagebean" class="DI_03_Spring.MessageBean_en"></bean>	
```
- class์ MessageBean_en์ ๋ฃ์ด์คฌ์
<br>

### ๐ก HelloApp.java
```java
public class HelloApp {

	public static void main(String[] args) {
		/*
		//์๋ฌธ
		//MessageBean_en messagebean_en = new MessageBean_en();
		//messagebean_en.sayHello("hong");

		//ํ๊ธ
		//MessageBean_kr messagebean_kr = new MessageBean_kr();
		//messagebean_kr.sayHello("hong");
		
		//์ธํฐํ์ด์ค ์ฌ์ฉ (๋คํ์ฑ)
		MessageBean messagebean = new MessageBean_kr(); // new MessageBean_en();
		messagebean.sayHello("hong");
		*/
		
		//Spring ํตํด์ ๊ฐ์ฒด๋ฅผ ์์ฑํ๊ณ  ์กฐ๋ฆฝํ๋ ์์
		//1. ์ปจํ์ด๋ ์์ฑ (๋ฉ๋ชจ๋ฆฌ)
		//2. ์ปจํ์ด๋ ์์์ ์์ฑ๋  ๊ฐ์ฒด ๋ง๋ค๊ณ  ์ฃผ์ํ๋ ์์ (xml) >> DI_03.xml
		
		// new ClassPathXmlApplicationContext("DIConfig.xml");
		ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_03_Spring/DI_03.xml");
		MessageBean message = context.getBean("messagebean",MessageBean.class);
		message.sayHello("hong");
	}
}
```
- xml์์ class์ MessageBean_en์ ๋ฃ์ด์คฌ๊ธฐ์ 'message.sayHello("hong");'๊ฐ ์์ด๋ก ์ถ๋ ฅ๋จ
- ํ๊ตญ์ด๋ก ๋ฐ๊พธ๊ณ  ์ถ๋ค๋ฉด ๊ฑฐ๊ธฐ๋ง kr๋ก ๋ฐ๊ฟ์ฃผ๋ฉด ๋จ!  (implementํ๋ ์ฅ์ )
- ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_03_Spring/DI_03.xml") : xml์ context์ ๋ฃ์ด์ฃผ๊ณ 
- MessageBean message = context.getBean("messagebean",MessageBean.class) : bean์ id ๊ฐ์ ๊ฐ์ ธ์ message์ ๋ฃ์ด์ค

<br>

```java
ApplicationContext context = new GenericXmlApplicationContext("classpath:DI_05_Spring/DI_05.xml");
MyBean m = context.getBean("mybean", MyBean.class);
MyBean m2 = context.getBean("mybean", MyBean.class);
MyBean m3 = context.getBean("mybean", MyBean.class);
```
- ์์ getbean๋ค์ ๋ชจ๋ ๊ฐ์ ์ฃผ์๊ฐ์ ๊ฐ์ ธ์ด
- <h3> getbean() </h3>
    - ์ปจํ์ด๋ ์์ ์๋ ๊ฐ์ฒด๋ฅผ ๋ฆฌํด (new๊ฐ ์๋) <br>
    - return type Object (ํ์์ ๋ง๋ casting) <br>
    - ์คํ๋ง ์ปจํ์ด๋ ์์ ๊ฐ์ฒด๋ค์ default๋ก singleton ๊ฐ์ง <br>
    - ์์ธ์ ์ผ๋ก getbean() ์ด new๋ผ๋ ์์์ ํ  ์๋ ์์ (๊ฑฐ์ ์ฌ์ฉํ์ง ์์) <br>

## 2. IOC/DI โ

### IOC)

IOC ์ปจํ์ด๋ (์ ์ด์ ์ญ์ )
๋ด๊ฐ ์ฃผ๋ํ๋ ์ฝ๋์์ Spring ์ด ์ฃผ์ฒด .....

- ์์ ๋จ์์ ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ๊ทธ ๊ฒ์ ์กฐ๋ฆฝํ๋ ํ์ (๋ ๊ณ ๋ธ๋ญ)

### DI)

[DI๊ฐ๋]_1 : ์์กด์ฑ ์ฃผ์ (์์กด ๊ฐ์ฒด ์ฃผ์)

xml ์ค์ ์์ ํ์์ ๋ช์ํ์ง ์์ ๊ฐ์: ๋ฌธ์์ด

```java
๊ธฐ์กด)
์ด๋ค ๊ฐ์ฒด๊ฐ ํ์ํ๋ฉด ์ง์ 
Emp emp = enw Emp() ์ฌ์ฉ

์คํ๋ง)
xml ๋๋ annotation์ ํตํด์ ๋ฏธ๋ฆฌ ๊ฐ์ฒด๋ฅผ ์์ฑํด ๋๊ณ  ์ฌ์ฉํ๊ธฐ

>> ๋ฏธ๋ฆฌ ๋ชจ๋  ๋ถํ์ ๋ง๋ค๊ณ  ๋๊ณ  ์กฐ๋ฆฝ๋ง ํด๋ผ ๊ทธ๋ฆฌ๊ณ  ์ฌ์ฉํด๋ผ (์คํ๋ง)
```

## 3. Lombok
```
@getter/setter ๋ฑ์ ์๋ ฅํ๊ณ  ์ปจํธ๋กค + ์คํ์ด์ค๋ฐ๋ฅผ ๋๋ฌ ์ ์ฉํ๋ค.

@Data๋ฅผ ์ฐ๋ฉด getter/setter toString ๋ฑ๋ฑ ๋ค ์ค์ ์ ํด์ค๋ค.
```
<br>

## 4. Annotation โ
- ํด๋์ค , ํ๋ , ๋ฉ์๋ ๊ณผ ๊ฐ์ ํ๋ก๊ทธ๋จ ์์์ ๋ค์ํ ์ข๋ฅ์ ์ ๋ณด๋ฅผ ์ฃผ๋ ๋ฐฉ๋ฒ
- ์ฅ์  : ์ฝ๋๋ ๊ฐ์ 
- ๋จ์  : ๊ฐ๋์ฑ 
<br>

### ๐ก @Autowired 
- Type ๊ธฐ๋ฐ
- ๋ชฉ์  : ์์กด๊ด๊ณ๋ฅผ ์๋์ค์ ํ  ๋ ์ฌ์ฉํ๋ฉฐ [ํ์์ ์ด์ฉ]ํ์ฌ ์์กดํ๋ ๊ฐ์ฒด๋ฅผ ์ฝ์ํด ์ค๋ค. 
- ๊ทธ๋ฌ๋ฏ๋ก (IOC Container) ํด๋น ํ์์ ๋น๊ฐ์ฒด๊ฐ ์กด์ฌํ์ง ์๊ฑฐ๋ ๋๋ 2๊ฐ ์ด์ ์กด์ฌํ  ๊ฒฝ์ฐ ์คํ๋ง์ ์์ธ๋ฅผ ๋ฐ์์ํค๊ฒ ๋๋ค.
- ์ต์ : required - @Autowired์ด๋ธํ์ด์์ ์ ์ฉํ ํ๋กํผํฐ์ ๋ํด ๊ตณ์ด ์ค์ ํ  ํ์๊ฐ ์๋ ๊ฒฝ์ฐ์ false๊ฐ์ ์ฃผ๋ฉฐ ์ด๋ ํด๋น ํ๋กํผํฐ๊ฐ ์กด์ฌํ์ง ์๋๋ผ๋ ์คํ๋ง์ ์์ธ๋ฅผ ๋ฐ์์ํค์ง ์๋๋ค. (๋ํดํธ๊ฐ์ true)
- ์ถ๊ฐ์ค์  : AutowiredAnnotationBeanPostProcessor ํด๋์ค๋ฅผ ๋น์ผ๋ก ๋ฑ๋ก์์ผ์ค์ผ ํ๋ค. 
- ํด๋น ์ค์  ๋์ ์ <context:annotation-config> ํ๊ทธ๋ฅผ ์ฌ์ฉํด๋ ๋๋ค.
 ```java
<context:annotation-config>
```
- Annotation ์ฌ์ฉ์ ํ์ํ ๋ชจ๋  ํด๋์ค๋ฅผ ํ๋ฐฉ์ ๊ฐ์ฒด๋ก ๋ง๋ค์ด์ ์ปจํ์ด๋์ ์ฌ๋ ค ์ฃผ๋ ์ญํ 
- ์ฅ์  : ๊ฐ๊ฐ์ Annotation ์ฌ์ฉ์ ๋ณ๋์ ๋น๊ฐ์ฒด ์ค๋ช ํ  ํ์ ์๋ค.
- ๋จ์  : ์ฌ์ฉํ์ง ์๋ bean ์๋ ์์ฑ ๋๋ค
 ```java
    @Autowired ์ ์ ๋์ ๋์ง ์๋ ๊ฒฝ์ฐ
 ```
1. injection ๋๋ ํ์ ๊ฐ์ฒด๊ฐ (bean) IOC ์ปจํ์ด๋ ์์ ์๋ ๊ฒฝ์ฐ
2. IOC ์ปจํ์ด๋ ์์ ๊ฐ์ ํ์์ ๊ฐ์ฒด ์ฌ๋ฌ๊ฐ ์กด์ฌํ๋ ๊ฒฝ์ฐ
3. IOC ์ปจํ์ด๋ ์์ ๊ฐ์ ํ์์ ๊ฐ์ฒด ์ฌ๋ฌ๊ฐ ์กด์ฌ ํ๋๋ผ๋ bean ๊ฐ์ฒด์ id ๊ฐ์ด setter ํจ์์ parameter ๋ช๊ณผ ๋์ผํ๋ฉด ์๋ ์ฃผ์ ์ฑ๊ณต
4. ๋ฐ๋ : @Resource (by name)

<br>



