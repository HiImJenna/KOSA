# 2022.09.05.Mon 📅
<br>

## 1. 다형성 Polymorphism ✔
-----------------------------
```java

다형성 (상속관계에서 존재)
다형성 : 여러가지 성질 ( 형태 ) 를 가질 수 있는 능력

c# : 다형성(overloading, override)

JAVA : [상속관계]에서 [하나의 참조변수]가 여러개의 타입을 가질 수 있다
> [하나의 참조변수] >> [부모타입]
> [여러개의 타입] >> 부모를 상속받은 자식타입

다형성 : 현실 >> 부모는 자식에게 모든것을 ...
프로그램 >> 자식이 부모에게 조건 없이 드린다.

```

#### - 상속관계에서 [부모타입]은 [자식타입]의 주소를 가질 수 있다.
#### - 단 부모는 [ 자신의 자원만 접근 ] 가능하다.
#### - 단 재정의는 제외

<br>

![image](https://user-images.githubusercontent.com/111114507/188424957-f6dc33d0-eebe-4bb0-b107-13dac3a45326.png)
![image](https://user-images.githubusercontent.com/111114507/188425073-0154b578-0ca2-4c03-8c39-1a295a1011b8.png)



<br>

### Q1)
```java
시나리오(요구사항)
저희는 가전제품 매장 솔루션을 개발하는 사업팀입니다
A라 전자제품 매장이 오픈되면

[클라이언트 요구사항]
가전제품은 제품의 가격 , 제품의 포인트 정보를 모든 제품이 가지고 있습니다
각각의 가전제품은 제품별 고유한 이름정보를 가지고 있다
ex)
각각의 전자제품은 이름을 가지고 있다 (ex) Tv , Audio , Computer
각각의 전자제품은 다른 가격정보를 가지고 있다( Tv:5000 , Audio : 6000)
제품의 포인트는 가격의 10%적용한다

시뮬레이션 시나리오
구매자: 제품을 구매하기 위한 금액정보 , 포인트 정보를 가지고 있다
ex) 10만원 , 포인트 0
구매자는 제품을 구매할 수 있다 , 구매행위를 하게 되면 가지고 있는 돈은 감소하고 (가격) 포인트는 증가한다
구매자는 처음 초기 금액을 가질 수 있다

1차 오픈 ....

공식 오픈
매장에 제품 1000개 다른 제품이 추가 (마우스 , 토스트기 ) 제품 등록 POS (자동 등록)
매장에 1000개의 제품 전시 (Product 상속하는 제품)
1. 매장에서 3개 제품만 구매 ... 997제품 구매 기능
>> PC 방  >> 국내 전상망 >> 개발 서버 접속 >> 997구매 함수 추가 ...

>>변화에 대응하는 코드  (다형성)

>>방법 제시 (제품이 10000개 추가되더라)
1. 함수의 paramter 를 부모 (Product)  

```
```java
class Product{
	int price;
	int bonuspoint;
	//Product(){}
	Product(int price){
		this.price = price;
		this.bonuspoint = (int)(this.price/10.0);
	}
}

class KtTv extends Product{
	KtTv(){
		super(500);
	}
	//KtTv(int price){
	//	super(price);
	//}
	
	//이름
	@Override
	public String toString() {
		return "KtTv";
	}
}

class Audio extends Product{
	Audio(){
		super(100);
	}
	
	@Override
	public String toString() {
		return "Audio";
	}
}


class NoteBook extends Product{
	NoteBook(){
		super(150);
	}
	//이름
	@Override
	public String toString() {
		return "NoteBook";
	}
}

//구매자
class Buyer{
	int money = 5000;
	int bonuspoint;

void kttvBuy(KtTv n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
	void AudioBuy(Audio n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
	
	void NoteBookBuy(NoteBook n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
```
![image](https://user-images.githubusercontent.com/111114507/188432627-518e7a09-e61b-4511-9860-33bb24281469.png)
![image](https://user-images.githubusercontent.com/111114507/188432701-f3574217-bf56-4eb1-87d6-d625bd76a495.png)
### ▶ 새로운 제품이 추가될 시 문제 발생, 하나씩 다시 추가!
<br>

### 🔔 1차 개선 : Overloading 사용

```java
    //하나의 이름으로 여러가지 기능(method overloading)

	void Buy(KtTv n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
	void Buy(Audio n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
	
	void Buy(NoteBook n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
    
```

<br>

### 🔔 2차 개선 : Overloading 사용
#### - 제품이 추가 되더라도 구매행위는 계속 되어야 한다
#### - 하나의 이름 , 중복되는 코드 (중복코드 제거)
#### - 모든 제품은 Product상속 >> 부모타입의 참조변수는 자식객체의 주소를 받을 수 있다.

```java
void Buy(Product n) { //함수의 parameter 제품객체의 주소를 받아서 ..(가격,포인트)
		if(this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^! " + this.money);
			return; //kttvBuy 함수 종료
		}
		//실 구매행위
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("구매한 물건은 : " + n.toString());
	}
```
![image](https://user-images.githubusercontent.com/111114507/188432777-1118ed26-6187-4049-87a6-cfea44348fc0.png)
![image](https://user-images.githubusercontent.com/111114507/188432837-77af0cd1-e5bd-4d21-95e3-441e53888db6.png)
<br>

![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb2.phinf.naver.net%2F20160726_294%2Fi7027_1469495777487LaI6p_PNG%2F%25BA%25AF%25C8%25AF.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
![image](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2FMjAxNzAyMTVfMTQ2%2FMDAxNDg3MTQyMTg3MzI4.XqSLR5LiAFizQobeS4K88mhYwZ9F0AhX1v7QKd5n8kgg.0xliiei7AfnmMsoNFP3L1fpRx54icE_9wXbbJkRZBYQg.PNG.i7027%2Finstanceof.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
<br>

## 2. 디자인패턴 (Singleton) ✔
----------------------
```java
singleton ... (객체 하나를 만들어서 공유)
의도 : 하나의 객체를 공유하는 보장 코드 ... 
```

> ### 소프트웨어 디자인 패턴에서 싱글턴 패턴(Singleton pattern)을 따르는 클래스는, 생성자가 여러 차례 호출되더라도 실제로 생성되는 객체는 하나이고 
> ### 최초 생성 이후에 호출된 생성자는 최초의 생성자가 생성한 객체를 리턴한다. 
> ### 이와 같은 디자인 유형을 싱글턴 패턴이라고 한다. 
> ### 주로 공통된 객체를 여러개 생성해서 사용하는 DBCP(DataBase Connection Pool)와 같은 상황에서 많이 사용된다.

<br>

```java
public class Singleton {
	private static Singleton p; // p라는 변수가 주소를 가지게 ... new

	private Singleton() {
		// 생성자ㅔ서 접근자 private >> 생성자 함수 호출 못하니 객체 생성 불가 (new) ...

	}

	public static Singleton getInstance() {
		if (p == null) {
			p = new Singleton(); // 같은 클래스 내부에서는 public, private 보여요
		}
		return p;
	}
}
```
## 3. 추상 클래스 (abstract class) ✔
----------------------

```java
 미완성 클래스(설계도)
 1. 완성된 코드 + 미완성된 코드
 2. 완성(함수) 실행블럭이 있는 함수 + 미완성(함수) 실행블럭이 없는 함수 >> public void run;
 	원래 함수는 public void run() { 실행블럭 };
 3. 완성된 클래스 (new 가능) - 미완성클래스 (스스로 객체 생성 불가) 
  
 설계자 입장에서 
  >> 의도 >> 반드시 재정의 해라 >> 강제적 구현을 목적으로 (믿지 못하니까)
 ```

