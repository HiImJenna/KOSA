# 2022.09.01.Thu ๐
<br>

## 1. ์์ Inherit & ํฌํจ Composition โ
-----------------------------
```java
์ค๋ฌด(ํ์) ํ๊ฒฝ
ํ๊ฐ์ ํด๋์ค๋ง ์ค๊ณ ์ฌ์ฉ๊ฒฝ์ฐ (x)

์ค๊ณ๋ 1์ฅ ๋ชจ๋  ์๋ฌด๋ฅผ ๊ตฌํ ํ์ค์ ์ผ๋ก ๋ถ๊ฐ๋ฅ 
์ค๊ณ๋ ์ฌ๋ฌ๊ฐ์ ๋๋๋ค ... ๋ฌธ์ ๋ฐ์ ...(๊ธฐ์ค , ๊ด๊ณ)

****๊ธฐ์ค*****
์ฌ๋ฌ๊ฐ์ ์ค๊ณ๋๋ฅผ ๊ด๊ณ ..์ด์ด์ฃผ๋ ๊ธฐ์ค

```

>>### ๐์์ Inherit 
>>* (is ~ a : ์์) ์(๋) ~์ด๋ค (๋ถ๋ชจ๋ฅผ ๋ค์)
>>* ์์ ๋ํ์ด๋ค โถ ์ extends ๋ํ
>>* ์ผ๊ฐํ์ ๋ํ์ด๋ค โถ ์ผ๊ฐํ extends ๋ํ

<br>

>>### ๐ํฌํจ Composition
>>* (has ~ a : ํฌํจ) ์(๋) ~์ ๊ฐ์ง๊ณ  ์๋ค - ๋ถํ์ ๋ณด
>>* ์๊ณผ ์  ๊ด๊ณ โถ ์์ ์ ์ด๋ค (x) / ์์ ์ ์ ๊ฐ์ง๊ณ  ์๋ค (0) = class ์ {์ ์ด๋ผ๋ ๋ถํ์ด member field}
>>* ๊ฒฝ์ฐฐ ๊ถ์ด ๊ด๊ณ โถ ๊ฒฝ์ฐฐ์ ๊ถ์ด์ด๋ค (x) / ๊ฒฝ์ฐฐ์ ๊ถ์ด์ ๊ฐ์ง๊ณ  ์๋ค (0) = class ๊ถ์ด {} , class ๊ฒฝ์ฐฐ {๊ถ์ด member field}

<br>

![image](http://www.tcpschool.com/lectures/img_java_inheritance_diagram.png)
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb2.phinf.naver.net%2F20160722_256%2Fi7027_1469158489785sypBV_PNG%2F3.PNG%3Ftype%3Dw740%22&type=cafe_wa740)

<br>



```java
public class Ex03_Inherit {
	public static void main(String[] args) {
		TvVcr tv = new TvVcr();
		tv.t.power();
		tv.v.power();
		
		System.out.println(tv.t.power);
		//////////////////////////////
		TvVcr2 tv2 = new TvVcr2();
		tv2.power();
		System.out.println("Tv์ ์ : "+ tv2.power);
		tv2.chUp();
		
		tv2.vcr.power();
		System.out.println("๋น๋์ค ์ ์ : " + tv2.vcr.power);
		tv2.vcr.play();
	}

}
```
```java
class TvVcr2 extends Tv{
	Vcr vcr;
	
	public TvVcr2(){
		vcr = new Vcr();		
	}
}
```
```java
class Tv{
	boolean power; //default = false
	int ch;
	
	void power() {
		
		this.power = !this.power;
	}
	
	void chUp() {
		this.ch++;
		
	}
	
	void chDown() {
		this.ch--;
	}
}
```
 ### โถ ํด๋น ๋ถ๋ถ ๋ฉ๋ชจ๋ฆฌ ๊ตฌ์กฐ๋ก ๊ทธ๋ ค๋ณด๊ธฐ
```java 
TvVcr2 tv2 = new TvVcr2(); 
```

![image](https://user-images.githubusercontent.com/111114507/187879739-9dae329c-70d3-41ba-9b8f-b7aac7e8f136.png)

<br>

## 2. super( ) โ
---------------

```java
this: ๊ฐ์ฒด ์์ ์ ๊ฐ๋ฅดํค๋ this(this.empno, this.ename)
this: ์์ฑ์๋ฅผ ํธ์ถํ๋ this ( this(100,"red"))

์์๊ด๊ณ
๋ถ๋ชจ,์์

super(ํ์ฌ ์์์ด ๋ถ๋ชจ์ ์ ๊ทผ ์ฃผ์๊ฐ) : ์์๊ด๊ณ์์์ ๋ถ๋ชจ์ ์ ๊ทผ(super ๋ถ๋ชจ๊ฐ์ฒด์ ์ฃผ์๊ฐ)

1. super >> ์์๊ด๊ณ์์ ๋ถ๋ชจ์์์ ์ ๊ทผ
2. super >> ์์๊ด๊ณ์์ ๋ถ๋ชจ์ ์์ฑ์๋ฅผ ํธ์ถ(๋ช์์ ์ผ๋ก)

## ์ฌ์ ์ ์ํ์์ ๋ถ๋ชจ ์์์ ๋ถ๋ฅผ ์ ์๋ ์ ์ผํ ๋ฐฉ๋ฒ = super ##

Tip)
C# : base()
Java : super()

super๋ ๋ฐ๋ก ํ๋จ๊ณ ์๊น์ง๋ง ๊ฐ๋๊ฑฐ์ด๋ค.

ex) ์์๊ฐ ํ ์๋ฒ์ง์๊ฒ ๊ฐ๋ ค๋ฉด
    ์์์์ super(); ์๋น  super(); ํด์ผ์ง ๊ฐ์์๋ค
```


## 3. Override โ
------------------
```java
 <Today's Point>
 [์์๊ด๊ณ]์์ override : ์์๊ด๊ณ์์ ์์์ด ๋ถ๋ชจ์ ํจ์๋ฅผ [์ฌ์ ์]
 [์์๊ด๊ณ]์์ [์์ํด๋์ค]๊ฐ [๋ถ๋ชจํด๋์ค]์ ๋ฉ์๋(ํจ์)๋ฅผ ์ฌ์ ์(๋ด์ฉ์ ๋ฐ๊ฟ)
 ์ฌ์ ์ : ํ์ ๋ณํ๊ฐ ์๊ณ  (ํจ์์ ์ด๋ฆ, ํ์) ์๋๊ณ , ๋ด์ฉ๋ง ๋ณํ { ์ค๊ดํธ ์์ ๊ฒ }
 
 * ๋ฌธ๋ฒ)
 1. ๋ถ๋ชจ ํจ์ ์ด๋ฆ ๋์ผ
 2. ๋ถ๋ชจ ํจ์์ parameter ๋์ผ
 3. ๋ถ๋ชจ ํจ์ return type ๋์ผ 
 4. ๋ถ๋ชจ ํจ์ return type ๋์ผ
 5. ๊ฒฐ๊ตญ { ์์ ์คํ๋ธ๋ญ ์์ ์ฝ๋๋ง ๋ณ๊ฒฝ ๊ฐ๋ฅ }
```

```java
<์ค๋ฒ๋ก๋ vs ์ค๋ฒ๋ผ์ด๋>
* ์ค๋ฒ๋ก๋ : ํ๋์ ๋ฉ์๋๊ฐ ์ฌ๋ฌ๊ฐ์ง ์ผ์ ํ  ์์๋๊ฒ

* ์ค๋ฒ๋ผ์ด๋ : ๋ถ๋ชจ์ ํจ์๋ฅผ ์ฌ์ ์ ํ๋๊ฒ
```
![image](https://1.bp.blogspot.com/-mcytVS6SIqE/VJU6HxvD7iI/AAAAAAAACOc/nG02KqkDOoc/w1200-h630-p-k-no-nu/Difference%2Bbetween%2Bmethod%2Boverloading%2Band%2Boverriding%2Bin%2BJava.gif)

<br>

## 4. Annotation โ
-----------------
๐ Annotation์ Java code๋ง์ผ๋ก ์ ๋ฌํ  ์ ์๋ ๋ถ๊ฐ์ ์ธ ์ ๋ณด๋ฅผ ์ปดํ์ผ๋ฌ๋ ๊ฐ๋ฐํด๋ก ์ ๋ฌํ  ์ ์๋ค.  
๐ @Override :  method์์ ์ ์ Override๊ฐ ์ ๋๋ก ๋์๋์ง ์ฒดํฌ
```java
//*์ฌ์ ์(๊ฒ์ฆ)
	@Override
	void print() {
		System.out.println("์์์ด ๋ถ๋ชจ์ ํจ์๋ฅผ ์ฌ์ ์");	
	}
```

<br>

## 5. toString() โ
-----------------
```java
Emp emp = new Emp(1000, "ํ๊ธธ๋");
System.out.println(emp);
System.out.println(emp.toString());

// emp ์ถ๋ ฅํ๋ฉด ์ฌ์ค์ emp.toString() ๋์ผํ ํจ๊ณผ
// toString()์ Object์ ์์ ... ์ฃผ์๊ฐ return

// toString() ์ฌ์ ์ ํ๋ค๋ฉด ๊ฒฐ๊ณผ๋ ์ฌ์ ์ ๋ ๋ด์ฉ์ผ๋ก ์ถ๋ ฅ๋จ 
// Emp [empno=1000, ename = "ํ๊ธธ๋"]
// Emp [empno=1000, ename = "ํ๊ธธ๋"]
```
<br>

## 6. Final โ
----------------

<br>

```java
๋ณ์ <-> ์์
 ์์ : ํ๋ฒ ๊ฐ์ด [์ด๊ธฐํ]๋๋ฉด ๋ณ๊ฒฝ ๋ถ๊ฐ
 ์์์์ : ๊ณ ์ ๊ฐ(์ฃผ๋ฏผ๋ฒํธ)์ํ : PI = 3.12159..., ์์คํ ๋ฒํธ (๋ฒ์ ๋ฒํธ)
 ์์๋ ๊ด์ฉ์ ์ผ๋ก [๋๋ฌธ์]
  
 java : final int NUM = 10;
 c# : const integer NUM = 10;
  
 <final ํค์๋>
 1.  final class Car { } > ํด๋์ค final > ์์ ๊ธ์ง >
 public final class Math
 extends Object
 
 2. public final void print() {} > ํจ์ final > ์์ ๊ด๊ณ์์ ์ฌ์ ์ ๊ธ์ง(override) ๊ธ์ง

```

![image](https://dotnettutorials.net/wp-content/uploads/2020/08/What-is-Java-Final-Keyword.png)


## 7. fianlly / throw โ
-----------------------------
### * finally
```java
try{

}catch(Exception e){

}finally{
๊ฐ์ ์ ์ผ๋ก ์คํ๋๋ ๋ธ๋ญ
}
```
```java
๋๋ ์์ธ๊ฐ ๋ฐ์ํ๋ , ์์ธ๊ฐ ๋ฐ์ํ์ง ์๋ [๊ฐ์ ์ ์ผ๋ก ์คํ๋์ผ ํ๋ ๊ตฌ๋ฌธ]์ ๊ฐ์ง๊ณ  ์๋ค

>>๊ฒ์CD ์ค์น PC
>>1. ์ค์นํ์ผ >> C:\Temp >> ๋ณต์ฌ
>>2. ๋ณต์ฌํ ํ์ผ >> ํ๋ก๊ทธ๋จ ์ค์น
>>3. ์ ์ ์ค์น  >> C:\Temp ๋ณต์ฌํ ํ์ผ ์ญ์ 
>>4. ๋น์ ์ ์ค์น >> ๊ฐ์  ์ข๋ฃ >> ๋ณต์ฌํ ํ์ผ ์ญ์ 
```
```java
 try{
>> ๋ฌธ์ ๊ฐ ์์ฌ๋๋ ์ฝ๋ ์คํ
>> ๋ฌธ์ ๊ฐ ๋ฐ์(exception)
} catch(Exception e) {
 	  >> ๋ฌธ์ ๊ฐ ๋ฐ์ํ ์์ธ ๋ถ๋ถ์ ํ์ ..
 	  >> ์ฒ๋ฆฌ (์ฝ๋๋ฅผ ์์ ํ๋ ๊ฒ์ด ์๋, ๋ณด๊ณ ํ๋ ๊ฒ)
 		1) ๊ด๋ฆฌ์์๊ฒ ์ด๋ฉ์ผ
 		2) ๋ก๊ทธ ํ์ผ์ ๊ธฐ๋ก
 		3) ๊ฐ์  ํ๋ก๊ทธ๋จ ์ข๋ฃ ๋ง์(์ผ๋จ์)
 			>> ๊ฒฐ๊ตญ ๊ฐ๋ฐ์๊ฐ ์์ ํ๋ ๊ฒ์ด ๋ต .. 
 } finally {
 	>> ๋ฌธ์ ๊ฐ ๋ฐ์ํ๋, ๋ฐํํ์ง ์๋ ๊ฐ์ ์ ์ผ๋ก ์คํํด์ผ ํ  ์ฝ๋
   >> DB์์ ๋ฌธ์  (ํน์  ์์์ ์ข๋ฃ) ๊ฐ์ 
 }
```
<br>

### * throw & throws

>> throw : ์๋ฌ๋ฅผ ๊ณ ์๋ก ๋ฐ์์ํฌ ๋ ์ฌ์ฉํฉ๋๋ค.  

>> throws : ์์ ์ ํธ์ถํ ์์ ๋ฉ์๋๋ก ์๋ฌ๋ฅผ ๋์ง๋ ์ญํ ์ ํฉ๋๋ค.


