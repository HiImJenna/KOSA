# 2022.09.05.Mon ๐
<br>

## 1. ๋คํ์ฑ Polymorphism โ
-----------------------------
```java

๋คํ์ฑ (์์๊ด๊ณ์์ ์กด์ฌ)
๋คํ์ฑ : ์ฌ๋ฌ๊ฐ์ง ์ฑ์ง ( ํํ ) ๋ฅผ ๊ฐ์ง ์ ์๋ ๋ฅ๋ ฅ

c# : ๋คํ์ฑ(overloading, override)

JAVA : [์์๊ด๊ณ]์์ [ํ๋์ ์ฐธ์กฐ๋ณ์]๊ฐ ์ฌ๋ฌ๊ฐ์ ํ์์ ๊ฐ์ง ์ ์๋ค
> [ํ๋์ ์ฐธ์กฐ๋ณ์] >> [๋ถ๋ชจํ์]
> [์ฌ๋ฌ๊ฐ์ ํ์] >> ๋ถ๋ชจ๋ฅผ ์์๋ฐ์ ์์ํ์

๋คํ์ฑ : ํ์ค >> ๋ถ๋ชจ๋ ์์์๊ฒ ๋ชจ๋ ๊ฒ์ ...
ํ๋ก๊ทธ๋จ >> ์์์ด ๋ถ๋ชจ์๊ฒ ์กฐ๊ฑด ์์ด ๋๋ฆฐ๋ค.

```

#### - ์์๊ด๊ณ์์ [๋ถ๋ชจํ์]์ [์์ํ์]์ ์ฃผ์๋ฅผ ๊ฐ์ง ์ ์๋ค.
#### - ๋จ ๋ถ๋ชจ๋ [ ์์ ์ ์์๋ง ์ ๊ทผ ] ๊ฐ๋ฅํ๋ค.
#### - ๋จ ์ฌ์ ์๋ ์ ์ธ

<br>

![image](https://user-images.githubusercontent.com/111114507/188424957-f6dc33d0-eebe-4bb0-b107-13dac3a45326.png)
![image](https://user-images.githubusercontent.com/111114507/188425073-0154b578-0ca2-4c03-8c39-1a295a1011b8.png)



<br>

### Q1)
```java
์๋๋ฆฌ์ค(์๊ตฌ์ฌํญ)
์ ํฌ๋ ๊ฐ์ ์ ํ ๋งค์ฅ ์๋ฃจ์์ ๊ฐ๋ฐํ๋ ์ฌ์ํ์๋๋ค
A๋ผ ์ ์์ ํ ๋งค์ฅ์ด ์คํ๋๋ฉด

[ํด๋ผ์ด์ธํธ ์๊ตฌ์ฌํญ]
๊ฐ์ ์ ํ์ ์ ํ์ ๊ฐ๊ฒฉ , ์ ํ์ ํฌ์ธํธ ์ ๋ณด๋ฅผ ๋ชจ๋  ์ ํ์ด ๊ฐ์ง๊ณ  ์์ต๋๋ค
๊ฐ๊ฐ์ ๊ฐ์ ์ ํ์ ์ ํ๋ณ ๊ณ ์ ํ ์ด๋ฆ์ ๋ณด๋ฅผ ๊ฐ์ง๊ณ  ์๋ค
ex)
๊ฐ๊ฐ์ ์ ์์ ํ์ ์ด๋ฆ์ ๊ฐ์ง๊ณ  ์๋ค (ex) Tv , Audio , Computer
๊ฐ๊ฐ์ ์ ์์ ํ์ ๋ค๋ฅธ ๊ฐ๊ฒฉ์ ๋ณด๋ฅผ ๊ฐ์ง๊ณ  ์๋ค( Tv:5000 , Audio : 6000)
์ ํ์ ํฌ์ธํธ๋ ๊ฐ๊ฒฉ์ 10%์ ์ฉํ๋ค

์๋ฎฌ๋ ์ด์ ์๋๋ฆฌ์ค
๊ตฌ๋งค์: ์ ํ์ ๊ตฌ๋งคํ๊ธฐ ์ํ ๊ธ์ก์ ๋ณด , ํฌ์ธํธ ์ ๋ณด๋ฅผ ๊ฐ์ง๊ณ  ์๋ค
ex) 10๋ง์ , ํฌ์ธํธ 0
๊ตฌ๋งค์๋ ์ ํ์ ๊ตฌ๋งคํ  ์ ์๋ค , ๊ตฌ๋งคํ์๋ฅผ ํ๊ฒ ๋๋ฉด ๊ฐ์ง๊ณ  ์๋ ๋์ ๊ฐ์ํ๊ณ  (๊ฐ๊ฒฉ) ํฌ์ธํธ๋ ์ฆ๊ฐํ๋ค
๊ตฌ๋งค์๋ ์ฒ์ ์ด๊ธฐ ๊ธ์ก์ ๊ฐ์ง ์ ์๋ค

1์ฐจ ์คํ ....

๊ณต์ ์คํ
๋งค์ฅ์ ์ ํ 1000๊ฐ ๋ค๋ฅธ ์ ํ์ด ์ถ๊ฐ (๋ง์ฐ์ค , ํ ์คํธ๊ธฐ ) ์ ํ ๋ฑ๋ก POS (์๋ ๋ฑ๋ก)
๋งค์ฅ์ 1000๊ฐ์ ์ ํ ์ ์ (Product ์์ํ๋ ์ ํ)
1. ๋งค์ฅ์์ 3๊ฐ ์ ํ๋ง ๊ตฌ๋งค ... 997์ ํ ๊ตฌ๋งค ๊ธฐ๋ฅ
>> PC ๋ฐฉ  >> ๊ตญ๋ด ์ ์๋ง >> ๊ฐ๋ฐ ์๋ฒ ์ ์ >> 997๊ตฌ๋งค ํจ์ ์ถ๊ฐ ...

>>๋ณํ์ ๋์ํ๋ ์ฝ๋  (๋คํ์ฑ)

>>๋ฐฉ๋ฒ ์ ์ (์ ํ์ด 10000๊ฐ ์ถ๊ฐ๋๋๋ผ)
1. ํจ์์ paramter ๋ฅผ ๋ถ๋ชจ (Product)  

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
	
	//์ด๋ฆ
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
	//์ด๋ฆ
	@Override
	public String toString() {
		return "NoteBook";
	}
}

//๊ตฌ๋งค์
class Buyer{
	int money = 5000;
	int bonuspoint;

void kttvBuy(KtTv n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
	void AudioBuy(Audio n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
	
	void NoteBookBuy(NoteBook n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
```
![image](https://user-images.githubusercontent.com/111114507/188432627-518e7a09-e61b-4511-9860-33bb24281469.png)
![image](https://user-images.githubusercontent.com/111114507/188432701-f3574217-bf56-4eb1-87d6-d625bd76a495.png)
### โถ ์๋ก์ด ์ ํ์ด ์ถ๊ฐ๋  ์ ๋ฌธ์  ๋ฐ์, ํ๋์ฉ ๋ค์ ์ถ๊ฐ!
<br>

### ๐ 1์ฐจ ๊ฐ์  : Overloading ์ฌ์ฉ

```java
    //ํ๋์ ์ด๋ฆ์ผ๋ก ์ฌ๋ฌ๊ฐ์ง ๊ธฐ๋ฅ(method overloading)

	void Buy(KtTv n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
	void Buy(Audio n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
	
	void Buy(NoteBook n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
    
```

<br>

### ๐ 2์ฐจ ๊ฐ์  : Overloading ์ฌ์ฉ
#### - ์ ํ์ด ์ถ๊ฐ ๋๋๋ผ๋ ๊ตฌ๋งคํ์๋ ๊ณ์ ๋์ด์ผ ํ๋ค
#### - ํ๋์ ์ด๋ฆ , ์ค๋ณต๋๋ ์ฝ๋ (์ค๋ณต์ฝ๋ ์ ๊ฑฐ)
#### - ๋ชจ๋  ์ ํ์ Product์์ >> ๋ถ๋ชจํ์์ ์ฐธ์กฐ๋ณ์๋ ์์๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์ ์ ์๋ค.

```java
void Buy(Product n) { //ํจ์์ parameter ์ ํ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ์์ ..(๊ฐ๊ฒฉ,ํฌ์ธํธ)
		if(this.money < n.price) {
			System.out.println("๊ณ ๊ฐ๋ ์์ก์ด ๋ถ์กฑํฉ๋๋ค^^! " + this.money);
			return; //kttvBuy ํจ์ ์ข๋ฃ
		}
		//์ค ๊ตฌ๋งคํ์
		this.money -= n.price;
		this.bonuspoint += n.bonuspoint;
		System.out.println("๊ตฌ๋งคํ ๋ฌผ๊ฑด์ : " + n.toString());
	}
```
![image](https://user-images.githubusercontent.com/111114507/188432777-1118ed26-6187-4049-87a6-cfea44348fc0.png)
![image](https://user-images.githubusercontent.com/111114507/188432837-77af0cd1-e5bd-4d21-95e3-441e53888db6.png)
<br>

![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcafeptthumb2.phinf.naver.net%2F20160726_294%2Fi7027_1469495777487LaI6p_PNG%2F%25BA%25AF%25C8%25AF.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
![image](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2FMjAxNzAyMTVfMTQ2%2FMDAxNDg3MTQyMTg3MzI4.XqSLR5LiAFizQobeS4K88mhYwZ9F0AhX1v7QKd5n8kgg.0xliiei7AfnmMsoNFP3L1fpRx54icE_9wXbbJkRZBYQg.PNG.i7027%2Finstanceof.PNG%3Ftype%3Dw740%22&type=cafe_wa740)
<br>

## 2. ๋์์ธํจํด (Singleton) โ
----------------------
```java
singleton ... (๊ฐ์ฒด ํ๋๋ฅผ ๋ง๋ค์ด์ ๊ณต์ )
์๋ : ํ๋์ ๊ฐ์ฒด๋ฅผ ๊ณต์ ํ๋ ๋ณด์ฅ ์ฝ๋ ... 
```

> ### ์ํํธ์จ์ด ๋์์ธ ํจํด์์ ์ฑ๊ธํด ํจํด(Singleton pattern)์ ๋ฐ๋ฅด๋ ํด๋์ค๋, ์์ฑ์๊ฐ ์ฌ๋ฌ ์ฐจ๋ก ํธ์ถ๋๋๋ผ๋ ์ค์ ๋ก ์์ฑ๋๋ ๊ฐ์ฒด๋ ํ๋์ด๊ณ  
> ### ์ต์ด ์์ฑ ์ดํ์ ํธ์ถ๋ ์์ฑ์๋ ์ต์ด์ ์์ฑ์๊ฐ ์์ฑํ ๊ฐ์ฒด๋ฅผ ๋ฆฌํดํ๋ค. 
> ### ์ด์ ๊ฐ์ ๋์์ธ ์ ํ์ ์ฑ๊ธํด ํจํด์ด๋ผ๊ณ  ํ๋ค. 
> ### ์ฃผ๋ก ๊ณตํต๋ ๊ฐ์ฒด๋ฅผ ์ฌ๋ฌ๊ฐ ์์ฑํด์ ์ฌ์ฉํ๋ DBCP(DataBase Connection Pool)์ ๊ฐ์ ์ํฉ์์ ๋ง์ด ์ฌ์ฉ๋๋ค.

<br>

```java
public class Singleton {
	private static Singleton p; // p๋ผ๋ ๋ณ์๊ฐ ์ฃผ์๋ฅผ ๊ฐ์ง๊ฒ ... new

	private Singleton() {
		// ์์ฑ์ใ์ ์ ๊ทผ์ private >> ์์ฑ์ ํจ์ ํธ์ถ ๋ชปํ๋ ๊ฐ์ฒด ์์ฑ ๋ถ๊ฐ (new) ...

	}

	public static Singleton getInstance() {
		if (p == null) {
			p = new Singleton(); // ๊ฐ์ ํด๋์ค ๋ด๋ถ์์๋ public, private ๋ณด์ฌ์
		}
		return p;
	}
}
```
## 3. ์ถ์ ํด๋์ค (abstract class) โ
----------------------

```java
 ๋ฏธ์์ฑ ํด๋์ค(์ค๊ณ๋)
 1. ์์ฑ๋ ์ฝ๋ + ๋ฏธ์์ฑ๋ ์ฝ๋
 2. ์์ฑ(ํจ์) ์คํ๋ธ๋ญ์ด ์๋ ํจ์ + ๋ฏธ์์ฑ(ํจ์) ์คํ๋ธ๋ญ์ด ์๋ ํจ์ >> public void run;
 	์๋ ํจ์๋ public void run() { ์คํ๋ธ๋ญ };
 3. ์์ฑ๋ ํด๋์ค (new ๊ฐ๋ฅ) - ๋ฏธ์์ฑํด๋์ค (์ค์ค๋ก ๊ฐ์ฒด ์์ฑ ๋ถ๊ฐ) 
  
 ์ค๊ณ์ ์์ฅ์์ 
  >> ์๋ >> ๋ฐ๋์ ์ฌ์ ์ ํด๋ผ >> ๊ฐ์ ์  ๊ตฌํ์ ๋ชฉ์ ์ผ๋ก (๋ฏฟ์ง ๋ชปํ๋๊น)
 ```

