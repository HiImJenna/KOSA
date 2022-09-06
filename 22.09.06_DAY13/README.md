# 2022.09.06.Tue 📅
<br>

## 1. 추상 클래스 abstract class ✔
-----------------------------
## 🔔 *instance 연산자*
#### - 어떤 객체가 어느 클래스의 인스턴스인지 확인
#### - 메소드 내 강제 타입 변환 필요한경우
<br>

## 🔔 *추상클래스 용도*
#### - 실체 클래스에는 공통된 내용은 빠르게 물려받고, 다른점만 선언하면 되므로 시간 절약
#### - 실체 클래스에 반드시 존재해야할 필드, 메소드 선언
<br>



## 2. 인터페이스 Interface ✔
-------------------------------
### 🔔 인터페이스란?
![imagae](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbrgAeM%2FbtqN2VpqaBi%2FkanTFm2nCAyOjYIQL95Bik%2Fimg.png)


### 🔔 인터페이스와 추상클래스
```java
<인터페이스와 추상클래스>
 
 [1]추상클래스와 인터페이스 공통점
    1. 스스로 객체 생성 불가능( new 연산자 사용 불가 )
     1) 차이점 : 추상클래스(완성 + 미완성), 인터페이스(모든것이 미완성)
  
 [2]추상클래스와 인터페이스 차이점
 	1. 추상클래스(완성된 코드 일부) 그러나 인터페이스는 전체가 미완성
 	2. 원칙적으로 클래스는 다중상속(계층적상속)X, but 인터페이스는 다중구현이 가능함 >> 작은 단위로 여러개를 만들고 모아서 큰 약속을 만든다
 		>> 너무 큰 약속을 만들면 사용성과 재사용성이 떨어진다
 Ia, Ib, Ic
 class Test extends Object inplements Ia, Ib, Ic => 다중구현
 Tip) 인터페이스와 인터페이스끼리는 상속이 가능 (extends) >> 약속을 크게 만들 수 있다
 
 	3. 인터페이스는 상수를 제외한 나머지는 미완성 추상(함수)으로
 
    4. 사용
     1) 추상클래스 : extends
     2) 인터페이스 : implements
     ex) class Car extends Abclass{}
  	     class Car implements Ia{}
  	   >> 둘다 추상자원을 가지고 있다 >> extends, implements >> 강제적 구현 목적 (재정의)
```

