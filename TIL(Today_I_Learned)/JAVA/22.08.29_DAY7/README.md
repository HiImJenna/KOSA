# 2022.08.29.Mon π
<br>

## 1. 'call by value' _vs_ 'call by ref' β
--------------
 ![image](https://user-images.githubusercontent.com/111114507/187102683-0b9937a6-2466-40c9-b33e-b4e0162ecbf7.png)
 βΆλ©μλμ κ°μ²΄λ₯Ό μ λ¬ν  κ²½μ° λ©μλμμ κ°μ²΄μ κ°μ²΄λ³μ(μμ±) κ°μ λ³κ²½ν  μ μλ€.
 <br>
 <br>

 ![image](https://user-images.githubusercontent.com/111114507/187105490-00839732-7029-49d2-b18d-c5af576782c0.png)


 ## 2. overloading β
 -----------------------
 ### overloading : νλμ μ΄λ¦μΌλ‘ μ¬λ¬κ°μ§ κΈ°λ₯μ νλ ν¨μ
```
  ν¨μ μ΄λ¦μ νκ° ... μ¬μ© λ°©λ²μ μ¬λ¬κ°
  1. μ€λ²λ‘λ©μ μ±λ₯ ν₯μκ³Ό λ¬΄κ΄
  2. νΈνκ² μ¬μ©νλΌκ³  ... 
  3. μ€λ²λ‘λ©μ μ¬μ©νμ§ μμλ λ¬Έμ  λμ§ μλλ€ ...
  ```
 
 <br>

 ### <λ¬Έλ²> : ν¨μ μ΄λ¦μ κ°κ³  parameter [κ°μ]μ [νμ]μ λ€λ₯΄κ²

 ```
 1. ν¨μ μ΄λ¦μ λμΌ
 2. parameter κ°μ λλ νμμ λ¬λΌμΌ νλ€
 3. return νμμ μ€λ²λ‘λ©μ νλ¨ λμμ΄ μλλ€
 4. parameterμ μμκ° λ€λ¦μ μΈμ (μ£Όμ)
 ```
 <br>

 ![image](https://user-images.githubusercontent.com/111114507/187106351-a75af047-9a7a-4a54-8a51-145eb31d3f2d.png)
 ![image](https://4.bp.blogspot.com/-T_rzdCAe3p4/W8ni6-U1_1I/AAAAAAAAA2I/F5zh_qSmSgotYJoH2oH-lxeHAPW42J89QCLcBGAs/s640/Method%2BOverloading.png)
 <br>

```java
class Human2 {
	String name;
	int age;
}

class Test2{
	Human2 add(Human2 h) {
		h.name = "μλ¬΄κ°";
		h.age = 200;
		return h;
//		return null; //human2λ μ£Όμλ₯Ό κ°μ§κ³  μμ§ μμμ
		
	}
	
	Human2 add(Human2 h, Human2 h2) {
		
		h2.name = h.name;
		h2.age = h.age;
		
		return h2;
	}
}

public class Ex14_Method_Overloading {

	public static void main(String[] args) {

		Test2 t = new Test2();
		
		Human2 man = new Human2 (); //man 0x123 μ£Όμ
		Human2 man2 = t.add(man); //man2 0x123μ£Όμ
		
		System.out.println(man == man2); //true
	}
}
```
![image](https://user-images.githubusercontent.com/111114507/187110975-3f19ba9c-52ba-4d14-93fe-cf62292c559f.png)

## 3. μμ±μν¨μ (constructor) β
---------------------
```
  1. ν¨μ (νΉμν λͺ©μ )
  2. λͺ©μ (member field μ΄κΈ°ν)>> static {}, {μ΄κΈ°μ λΈλ­}
  3. μΌλ°ν¨μμ λ€λ₯Έμ 
   1) ν¨μμ μ΄λ¦μ΄ κ³ μ (class μ΄λ¦κ³Ό λμΌνκ²)
   2) return νμμ΄ μμ (κ°μ²΄ μμ±κ³Ό λμμ νΈμΆ) (returnμ λ°μ λμμ΄ μλ€)
   3) μ€ν μμ  >> newκ°μ²΄ μμ± >> heap κ³΅κ° μμ± >> member field μλ¦¬ >> μλμΌλ‘ μμ±μ ν¨μ νΈμΆ
   4) return type(x) >> void >> public void(μλ΅) ν΄λμ€ μ΄λ¦() {}
  4. why : μμ±λλ κ°μ²΄λ§λ€ κ°μ μ μΌλ‘ member field κ°μ [μ΄κΈ°ν] ν  μ μλ€
  5. μμ±μ ν¨μ (overloadingκΈ°λ² μ μ© κ°λ₯)
  6. μμ±μ μ€λ²λ‘λ©μ ν΅ν΄μ λ€μν κ°μ μ¬ν­κ΅¬ν
   
   *** μμ±μλ₯Ό μ°λ κ°μ₯ μ€μν λͺ©μ μ κ°μ μ  μ΄κΈ°ν (member field) ***
  ```

  ### λ¬Έμ  νμ΄
  ### Q1)
  
  ![image](https://user-images.githubusercontent.com/92353613/187064414-f667b7cc-a35a-463e-8490-a9a9d41dcdd9.png)
   μΆκ° -> λμ  λμ (count) νμνλλ‘
  ```java
  public class Main {
    public static void main(String[] args) {
        
        TV myTV = new TV("SS", 2017, 32);
        myTV.show();
        TV myTV1 = new TV("SS", 2017, 32);
        myTV1.show();
        TV myTV2 = new TV("SS", 2015, 50);
        myTV2.show();
    }
  }
  ```

  ``` java
	class TV {
    String brand;
    int year;
    int inch;
    static int count;

    public TV(String a, int b, int c) {
        this.brand = a;
        this.year = b;
        this.inch = c;
        count++;  //count = count + 1
    }


    public void show() {
        System.out.println(brand + " " + year + " " + inch + " " + count);
    }
   }


```

### Q2)

```
<μκ΅¬μ¬ν­>
1. μ±μ μ± μ΄λ¦κ³Ό κ°κ²© μ λ³΄λ₯Ό κ°μ§κ³  μλ€.
2. μ±μ΄ μΆνλλ©΄ λ°λμ μ± μ΄λ¦κ³Ό μ±μ κ°κ²© μ λ³΄λ₯Ό κ°μ§κ³  μμ΄μΌνλ€. >> default constructor
3. μ±μ μ΄λ¦κ³Ό κ°κ²© μ λ³΄λ νΉμ  κΈ°λ₯μ ν΅ν΄μλ§ λ³Ό μ μκ³ , μΆνλ μ΄νμλ μμ ν  μ μλ€.(μ±μ κ°κ²©, μ΄λ¦) >> private
4. μ± μ΄λ¦κ³Ό κ°κ²© μ λ³΄λ κ°κ° νμΈν  μ μλ€. >> getter μ¬μ©

```

```java
public class Book {
	
	private String name;
	private int price;
	
	//public Book() {} μκ΅¬μ¬ν­ (x)
	public Book (String a, int b) {
		name = a;
		price = b;
	}

	public void BookInfo() {
		System.out.printf("μ± μ΄λ¦μ [%d], μ± κ°κ²©μ [%s]μλλ€", name, price);
	}
	
	public String getname() {
		return name;
	}
	
	public int getprice() {
		return price;
	}
}	
```

## 4. Exception β
-------------
```java 
try {
    ...
} catch(μμΈ1) {
    ...
} catch(μμΈ2) {
    ...
...
}
```

```
try λ¬Έμμ μνν  λ¬Έμ₯λ€μμ μμΈκ° λ°μνμ§ μλλ€λ©΄ catchλ¬Έ λ€μμ λ¬Έμ₯λ€μ μνμ΄ λμ§ μλλ€.  

νμ§λ§ try λ¬Έμμ λ¬Έμ₯μ μννλ λμ€μ μμΈκ° λ°μνλ©΄ μμΈμ ν΄λΉλλ catchλ¬Έμ΄ μνλλ€.
```

## 5. do-while β
--------------------
* μΌλ°μ μΌλ‘ whileλ¬Έμ μ‘°κ±΄μμ΄ μ°ΈμΌ λ μ½λκ° μ€νλλ λ°λ©΄, do while λ°λ³΅λ¬Έμ λ¬΄μ‘°κ±΄ νλ² μ΄μ μ€ν

```java
do {
	λ°λ³΅ μ€ν ν  λ¬Έμ₯;
} while (μ‘°κ±΄μ) // μ‘°κ±΄μμ΄ trueμΌ κ²½μ° μ€ν, false μΌ κ²½μ° μ’λ£ (λ―Έμ€ν)
```
βΆ doλ¬Έμ λ¬΄μ‘°κ±΄ νλ² μ€ν ν ν μ‘°κ±΄μ κ²μ¬νμ¬ λ°λ³΅μ κ²°μ νλ€.  



## 6. this β
---------------------
* this : μμ±μμ λ§€κ°λ³μλ‘ μ μΈλ λ³μμ μ΄λ¦μ΄ μΈμ€ν΄μ€ λ³μμ κ°μ λ μΈμ€ν΄μ€ λ³μμ μ§μ­λ³μλ₯Ό κ΅¬λΆνκΈ° μν΄μ μ¬μ©νλ€.
* this() :  κ°μ ν΄λμ€μ λ€λ₯Έ μμ±μλ₯Ό νΈμΆν  λ μ¬μ©νλ€.

```java

class Zcar2 {
		String colour;
		String geartype;
		int door;
		
		Zcar2(){ //κΈ°λ³Έμ΅μ(red, 1, auto)
			this("red", 1);
			System.out.println("default");
		} 
		
		Zcar2 (String colour, int door) {//μ΅μ1 : colour, door λ³κ²½ (default auto)
			this(colour, door, "auto");
			System.out.println("overloading param 2κ°");
		} 
		
		Zcar2 (String colour, int door, String geartype) { //μ΅μ2 : colour, door, geartype
			this.colour = colour;
			this.geartype = geartype;
			this.door = door;
			System.out.println("overloading param 3κ°");
		} 
		
		void print() {
			System.out.println(this.colour + " , " + this.geartype + " , " + this.door);
		}
	}

<μ½λ λΆμ - μλλ¦¬μ€>
κΈ°λ³Έμ΅μ : colour = red / door = 1 / geartype = auto(default)
μ΅μ 1 : colour, door λ³κ²½ κ°λ₯, geartype = auto(default)
μ΅μ 2 : colour, door, geartype λͺ¨λ λ³κ²½ κ°λ₯

```
