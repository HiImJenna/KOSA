# 2022.08.26.Fri ๐
<br>

## 1. Airplane ์ค๊ณ โ
--------------

    
 ### ๐์๊ตฌ์ฌํญ
 * ๋นํ๊ธฐ๋ฅผ ์์ฐํ๊ณ  ๋นํ๊ธฐ์ ์ด๋ฆ๊ณผ ๋ฒํธ๋ฅผ ๋ถ์ฌํด์ํจ
 * ๋นํ๊ธฐ๊ฐ ์์ฐ๋๋ฉด ๋นํ๊ธฐ์ ์ด๋ฆ๊ณผ ๋ฒํธ๊ฐ ๋ง๊ฒ ๋ถ์ฌ๋์๋์ง ํ์ธํ๋ ์์์ด ํ์ํจ(์ถ๋ ฅ)
 * ๊ณต์ฅ์ฅ์ ํ์ฌ๊น์ง ๋ง๋ค์ด์ง ๋นํ๊ธฐ์ ์ด ๋์ ๋์๋ฅผ ํ์ธํ  ์ ์๋ค.

 <br>

 > class ์์ฑ
```java
public class AirPane {
	
	private int airnum;
	private String airname;
	private static int airtotalcount; //๋ชจ๋  ๊ฐ์ฒด๊ฐ ๊ณต์ ํ๋ ์์
	
	public void makeAirPlane(int num, String name) {
		airnum = num;
		airname = name;
		//airtotalcount ๋์ ๋์
		airtotalcount++;
		
		AirDisplay();
	}
	
	private void AirDisplay() {
		System.out.printf("๋ฒํธ[%d], ์ด๋ฆ[%s] \n", airnum, airname);
	}
	
	public void airPlaneTotalCount() {
		System.out.printf("์ด ๋นํ๊ธฐ ์ ์ ๋์ : [%d] \n", airtotalcount );
	}
}
    ```


> main
``` java
public class Ex07_Static_AirPlane {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//๋นํ๊ธฐ 3๋๋ฅผ ๋ง๋์๊ณ  ํ์ธํ์ธ์
		AirPane air1 = new AirPane();
		air1.makeAirPlane(101, "๋ํํญ๊ณต");
		air1.airPlaneTotalCount();
		air1.airPlaneTotalCount();
		
		AirPane air2 = new AirPane();
		air2.makeAirPlane(707, "๋ํํญ๊ณต");
		air2.airPlaneTotalCount();
		air2.airPlaneTotalCount();
		
		AirPane air3 = new AirPane();
		air3.makeAirPlane(707, "๋ํํญ๊ณต");
		air3.airPlaneTotalCount();
		air3.airPlaneTotalCount();
	}

}
```
๐ฅ์ค๊ณ๋๋ฅผ ๋ฉ๋ชจ๋ฆฌ ๊ตฌ์กฐ๋ก ๊ทธ๋ ค๋ณด๊ธฐ
![image](https://user-images.githubusercontent.com/111114507/186837680-fd67bc77-82ea-4e82-8ffc-1adfadad0212.png)
<br>

 ## 2.Card ์ค๊ณโ
 -----------------

 ### ๐์๊ตฌ์ฌํญ
 * ๋ง๋๋ ์นด๋์ ๋ฒํธ, ๋ชจ์์ ๊ฐ์ง๊ณ  ์๋ค.
 * ์นด๋๋ ํฌ๊ธฐ๋ฅผ ๊ฐ์ง๊ณ  ์๋ค. ์ปค๊ธฐ๋ ๋์ด์ ๋๋น๋ฅผ ๊ฐ์ง๊ณ  ์๋ค.
 * ์นด๋์ ํฌ๊ธฐ๋ h = 50, w = 20
 * ๊ทธ๋ฆฌ๊ณ  ์ ์๋๋ ์นด๋์ ๋์ด์ ๋๋น๋ ๋์ผํ๋ค.
 * ์ ์ํด์ ๊ณ ๊ฐ์๊ฒ ์ ์ํ์ผ๋ ํฌ๊ธฐ๊ฐ ๋๋ฌด ์ปค์ ๋ค์ ๋ง๋ค์ด์ผ ํจ
 * ์ค๊ณ๋๋ฅผ ๋ณ๊ฒฝํ์ง ์๊ณ  53์ฅ ์นด๋์ ๋์ด์ ๋๋น๋ฅผ ๋ณ๊ฒฝํ  ์ ์๋๋ก ์ค๊ณ๋ ๊ตฌ์ฑ
 * hint)ํ์ฅ์ ์นด๋๋ฅผ ๋์ด์ ๋๋น๋ฅผ ๋ณ๊ฒฝํด์ ๋ชจ๋  ์นด๋๋ ๊ฐ์ด ๋ณ๊ฒฝ๋๋ค

 <br>

 > class ์์ฑ

 ```java
 public class Card {
	
	private int number;
	private String kind;
	
	public static int h = 50;
	public static int w = 20; //๋ชจ๋  ๊ฐ์ฒด๊ฐ ๊ณต์ ํ๋ ์์
	
	public void makeCard (int num, String name) {
		number = num;
		kind = name;
	 }
	
	public void cardDisplay() {
		System.out.printf("๋ฒํธ %d, ์นด๋๋ชจ์ %s, h : %d, w : %d \n", number, kind, h, w);
	}
 }
 ```
> main
``` java
public class Ex08_Static_Card {

	public static void main(String[] args) {
		
		//์นด๋ 53์ฅ ์ ์
		//๋ฉ๋ชจ๋ฆฌ(heap)
		
		Card c = new Card();
		c.makeCard(1, "heart");
		c.h = 40;
		c.w = 10;
		c.cardDisplay();
		
		Card c2 = new Card();
		c.makeCard(2, "heart");
		c.cardDisplay();
		
		Card c3 = new Card();
		c.makeCard(3, "heart");
		c.cardDisplay();
	}

}
```

## 3. instance ๋ณ์ โ
---------------

![image](https://user-images.githubusercontent.com/111114507/186840274-a05f6012-4271-4e95-9e73-3409d85eb4a2.png)
![image](https://user-images.githubusercontent.com/111114507/186840845-1d5b9a6c-60bb-4b71-b312-56c9a953c296.png)
<br>

## 4. static ํจ์์ ์ผ๋ฐ ํจ์ โ
---------------------
<br>

* static ํจ์๊ฐ ํญ์ ์ฐ์  โถ ํ์ ์ผ๋ฐ ํจ์ ์์ฑ
* ๊ทธ๋ ๊ธฐ์ ์ผ๋ฐ ํจ์๋ static ํจ์ ์ ์ด ๊ฐ๋ฅ, static ํจ์๋ ์ผ๋ฐ ํจ์ ์ ์ด ๋ถ๊ฐ๋ฅ

<br>

```java
class StaticClass{
	int iv;
	
	static int cv;
	
	void m() {
		//์ผ๋ฐํจ์
		//new heap > ์ฌ์ฉ
		//1. iv ์ ์ด ๊ฐ๋ฅ
		cv = 100;
		//why: ์์ฑ ์์ (static ์์์ ๊ฐ์ฒด ์์ฑ ์ด์ ์ ๋ฉ๋ชจ๋ฆฌ์ ๋ก๋๋๋ค)
	}
	
	
	static void print() {
		//static ํจ์
		//1. cv ์ ์ด ๊ฐ๋ฅ
		//2. ์ผ๋ฐ๋ณ์ iv๋ฅผ ์ ์ด ๊ฐ๋ฅํ ๊น ์๋ ๊น -> static์ด ํญ์ ์ฐ์ ์ด๊ธฐ์ iv๊ฐ ์์ฑ๋๊ธฐ ์ ์ static์ด ์์ฑ๋์ด์์. static ์คํ ์์ ์ iv๊ฐ ์๋๊ฑฐ๋๊น ์ ์ด ๋ถ๊ฐ๋ฅ(static์์์ ์ผ๋ฐ ์์๋ณด๋ค ์ฐ์ )
		
		//๊ฒฐ๊ณผ : ์ผ๋ฐํจ์๋ static ์ ์ด๊ฐ๋ฅ, staticํจ์๋ static ํจ์๋ผ๋ฆฌ๋ง ์ ์ด ๊ฐ๋ฅ
		cv = 100000;
		
		
	}
	
	
}
public class Ex10_Static_Method {

	public static void main(String[] args) {
		StaticClass.print(); //new ์์ด ํจ์ ์ฌ์ฉ
		System.out.println(StaticClass.cv);
		
		//์ผ๋ฐ ์์์ ๊ฐ์ง๊ณ  ๋๊ธฐ ์ํด์  ๊ฐ์ฒด ์์ฑ ํ์
		StaticClass sc = new StaticClass();
		sc.print();

	}

}
```

