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

<br>

### 🔔 인터페이스와 추상클래스
<br>

### <인터페이스와 추상클래스>
 
 #### 1) 추상클래스와 인터페이스 공통점  
  ● 스스로 객체 생성 불가능( new 연산자 사용 불가 )  
    
 #### 2) 추상클래스와 인터페이스 차이점
 
 	● 추상클래스(완성된 코드 일부) 그러나 인터페이스는 전체가 미완성  
 	● 원칙적으로 클래스는 다중상속(계층적상속)X, but 인터페이스는 다중구현이 가능함 >> 작은 단위로 여러개를 만들고 모아서 큰 약속을 만든다  
 		=> 너무 큰 약속을 만들면 사용성과 재사용성이 떨어진다  

  >> Ia, Ib, Ic
  >> class Test extends Object inplements Ia, Ib, Ic => 다중구현  
  >> Tip) 인터페이스와 인터페이스끼리는 상속이 가능 (extends) >> 약속을 크게 만들 수 있다  
 
  ● 인터페이스는 상수를 제외한 나머지는 미완성 추상(함수)으로  
 
  ● 사용
    - 추상클래스 : extends
    - 인터페이스 : implements
    ex) class Car extends Abclass{}
        class Car implements Ia{}
      => 둘다 추상자원을 가지고 있다 >> extends, implements >> 강제적 구현 목적 (재정의)

<br> 


### <초급개발자의 시선으로>
  ● 인터페이스를 [[[ 다형성 ]]] 입장으로 접근 (인터페이스는 부모 타입) 
  ● 서로 연관성이 없는 클래스를 하나로 묶어주는 기능 (같은 부모를 가지게 함으로써)  
  ● JAVA API 수 많은 (미리 만들어진) interface 제공 (설계하지 않아도 사용할 수 있는 ... )  
  ● 객체간 연결고리 (객체간 소통의 역할) >> [[[ 다형성 ]]]   

<br>

### <interface 정리>
 ● 실제 구현부를 가지고 있지 않다 : 실행블럭이 없다 : 규칙(약속)  
 시스템에서 이동하는 것을 move라는 이름을 사용하고 이동시에는 좌표값을 받아야한다  
  => 합의 >> void move ( int x , int y ); {구현은 클래스가 알아서}  ... >> 재정의 >> 구현  
  => JAVA API 인터페이스 설계하고 구현하는 클래스 다 생성  
  => collection(동적배열) >> Vector, [ArrayList], HashSet, [HashMap]  
 Collection 클래스는 수 많은 인터페이스 구현하고 있는 클래스  
 
 ● 생성방법
  - 상수(final) : [public static final] int VERSION = 1 >> int VERSION = 1;  
  				  [생략하면 컴파일러가 알아서] [public static final] 사용  
  				  
  - 추상함수 (method) : [public abstract void] run () ; >> void run();  
    					[생략하면 컴파일러가 알아서]   
    					
                                interface Aa{  
                                    int VERSION = 1;  
                                    void run();  
                                    String move(int x , int y)  
                                }  

 ● 종류  
  - interface Aable() {} //아무 자원을 가지지 않아도 됨  
  - interface Aable {int NUM = 10;}  
  - interface Aable{void run()};  

    class Test extends Object implements Ia, Ib, Ic {}  
    class Test implements Ia, Ib, Ic  

<br>

### <Ex03_Interface 일부 필기>
![image](https://user-images.githubusercontent.com/111114507/188632068-b1536f00-e971-439e-8c4f-a7b7c790d666.png)

