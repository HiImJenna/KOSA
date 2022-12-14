# 2022.09.01.Thu 📅
<br>

## 1. 상속 Inherit & 포함 Composition ✔
-----------------------------
```java
실무(현업) 환경
한개의 클래스만 설계 사용경우 (x)

설계도 1장 모든 업무를 구현 현실적으로 불가능 
설계도 여러개의 나눈다 ... 문제발생 ...(기준 , 관계)

****기준*****
여러개의 설계도를 관계 ..이어주는 기준

```

>>### 🔔상속 Inherit 
>>* (is ~ a : 상속) 은(는) ~이다 (부모를 뒤에)
>>* 원은 도형이다 ▶ 원 extends 도형
>>* 삼각형은 도형이다 ▶ 삼각형 extends 도형

<br>

>>### 🔔포함 Composition
>>* (has ~ a : 포함) 은(는) ~을 가지고 있다 - 부품정보
>>* 원과 점 관계 ▶ 원은 점이다 (x) / 원은 점을 가지고 있다 (0) = class 원 {점이라는 부품이 member field}
>>* 경찰 권총 관계 ▶ 경찰은 권총이다 (x) / 경찰은 권총을 가지고 있다 (0) = class 권총 {} , class 경찰 {권총 member field}

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
		System.out.println("Tv전원 : "+ tv2.power);
		tv2.chUp();
		
		tv2.vcr.power();
		System.out.println("비디오 전원 : " + tv2.vcr.power);
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
 ### ▶ 해당 부분 메모리 구조로 그려보기
```java 
TvVcr2 tv2 = new TvVcr2(); 
```

![image](https://user-images.githubusercontent.com/111114507/187879739-9dae329c-70d3-41ba-9b8f-b7aac7e8f136.png)

<br>

## 2. super( ) ✔
---------------

```java
this: 객체 자신을 가르키는 this(this.empno, this.ename)
this: 생성자를 호출하는 this ( this(100,"red"))

상속관계
부모,자식

super(현재 자식이 부모의 접근 주소값) : 상속관계에서의 부모에 접근(super 부모객체의 주소값)

1. super >> 상속관계에서 부모자원에 접근
2. super >> 상속관계에서 부모의 생성자를 호출(명시적으로)

## 재정의 상태에서 부모 자원을 부를 수 있는 유일한 방법 = super ##

Tip)
C# : base()
Java : super()

super는 바로 한단계 위까지만 가는거이다.

ex) 손자가 할아버지에게 가려면
    손자에서 super(); 아빠 super(); 해야지 갈수있다
```


## 3. Override ✔
------------------
```java
 <Today's Point>
 [상속관계]에서 override : 상속관계에서 자식이 부모의 함수를 [재정의]
 [상속관계]에서 [자식클래스]가 [부모클래스]의 메서드(함수)를 재정의(내용을 바꿈)
 재정의 : 틀의 변화가 없고 (함수의 이름, 타입) 아니고, 내용만 변화 { 중괄호 안에 것 }
 
 * 문법)
 1. 부모 함수 이름 동일
 2. 부모 함수의 parameter 동일
 3. 부모 함수 return type 동일 
 4. 부모 함수 return type 동일
 5. 결국 { 안에 실행블럭 안의 코드만 변경 가능 }
```

```java
<오버로드 vs 오버라이드>
* 오버로드 : 하나의 메소드가 여러가지 일을 할 수있는것

* 오버라이드 : 부모의 함수를 재정의 하는것
```
![image](https://1.bp.blogspot.com/-mcytVS6SIqE/VJU6HxvD7iI/AAAAAAAACOc/nG02KqkDOoc/w1200-h630-p-k-no-nu/Difference%2Bbetween%2Bmethod%2Boverloading%2Band%2Boverriding%2Bin%2BJava.gif)

<br>

## 4. Annotation ✔
-----------------
🔔 Annotation은 Java code만으로 전달할 수 없는 부가적인 정보를 컴파일러나 개발툴로 전달할 수 있다.  
🔔 @Override :  method위에 정의 Override가 제대로 되었는지 체크
```java
//*재정의(검증)
	@Override
	void print() {
		System.out.println("자식이 부모의 함수를 재정의");	
	}
```

<br>

## 5. toString() ✔
-----------------
```java
Emp emp = new Emp(1000, "홍길동");
System.out.println(emp);
System.out.println(emp.toString());

// emp 출력하면 사실은 emp.toString() 동일한 효과
// toString()은 Object의 자원 ... 주소값 return

// toString() 재정의 했다면 결과는 재정의 된 내용으로 출력됨 
// Emp [empno=1000, ename = "홍길동"]
// Emp [empno=1000, ename = "홍길동"]
```
<br>

## 6. Final ✔
----------------

<br>

```java
변수 <-> 상수
 상수 : 한번 값이 [초기화]되면 변경 불가
 상수자원 : 고유갑(주민번호)수학 : PI = 3.12159..., 시스템 번호 (버전번호)
 상수는 관용적으로 [대문자]
  
 java : final int NUM = 10;
 c# : const integer NUM = 10;
  
 <final 키워드>
 1.  final class Car { } > 클래스 final > 상속 금지 >
 public final class Math
 extends Object
 
 2. public final void print() {} > 함수 final > 상속 관계에서 재정의 금지(override) 금지

```

![image](https://dotnettutorials.net/wp-content/uploads/2020/08/What-is-Java-Final-Keyword.png)


## 7. fianlly / throw ✔
-----------------------------
### * finally
```java
try{

}catch(Exception e){

}finally{
강제적으로 실행되는 블럭
}
```
```java
나는 예외가 발생하던 , 예외가 발생하지 않던 [강제적으로 실행되야 하는 구문]을 가지고 있다

>>게임CD 설치 PC
>>1. 설치파일 >> C:\Temp >> 복사
>>2. 복사한 파일 >> 프로그램 설치
>>3. 정상 설치  >> C:\Temp 복사한 파일 삭제
>>4. 비정상 설치 >> 강제 종료 >> 복사한 파일 삭제
```
```java
 try{
>> 문제가 의심되는 코드 실행
>> 문제가 발생(exception)
} catch(Exception e) {
 	  >> 문제가 발생한 예외 부분을 파악 ..
 	  >> 처리 (코드를 수정하는 것이 아님, 보고하는 것)
 		1) 관리자에게 이메일
 		2) 로그 파일에 기록
 		3) 강제 프로그램 종료 막음(일단은)
 			>> 결국 개발자가 수정하는 것이 답 .. 
 } finally {
 	>> 문제가 발생하던, 발행하지 않던 강제적으로 실행해야 할 코드
   >> DB작업 문제 (특정 자원에 종료) 강제
 }
```
<br>

### * throw & throws

>> throw : 에러를 고의로 발생시킬 때 사용합니다.  

>> throws : 자신을 호출한 상위 메소드로 에러를 던지는 역할을 합니다.


