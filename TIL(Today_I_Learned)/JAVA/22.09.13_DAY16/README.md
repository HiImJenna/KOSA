# 2022.09.13.Tue ๐
<br>

## 1. ArrayList โ
-----------------------------
<br>

### <ArrayList์ ๋จ์ > 
#### 1.  ํฌ๊ธฐ๋ฅผ ๋ณ๊ฒฝํ  ์ ์๋ค 
- ํฌ๊ธฐ๋ฅผ ๋ณ๊ฒฝํด์ผํ๋ ๊ฒฝ์ฐ ์๋ก์ด ๋ฐฐ์ด์ ์์ฑํ๊ณ  ๋ฐ์ดํฐ๋ฅผ ๋ณต์ฌํด์ผํ๋ค. (๋น์ฉ์ด ํฐ ์์)
- ํฌ๊ธฐ ๋ณ๊ฒฝ์ ํผํ๊ธฐ ์ํด ์ถฉ๋ถํ ํฐ ๋ฐฐ์ด์ ์์ฑํ๋ฉด ๋ฉ๋ชจ๋ฆฌ ๋ญ๋น๊ฐ ์ฌํด์ง๋ค

#### 2. ๋น์์ฐจ์ ์ธ ๋ฐ์ดํฐ์ ์ถ๊ฐ, ์ญ์ ์ ์๊ฐ์ด ๋ง์ด ๊ฑธ๋ฆฐ๋ค.
- ๋ฐ์ดํฐ๋ฅผ ์ถ๊ฐํ๊ฑฐ๋ ์ญ์ ํ๊ธฐ ์ํด ๋ง์ ๋ฐ์ดํฐ๋ฅผ ์ฎ๊ฒจ์ผํ๋ค.
- ๊ทธ๋ฌ๋ ์์ฐจ์ ์ธ ๋ฐ์ดํฐ ์ถ๊ฐ(๋ง์ง๋ง์ ์ถ๊ฐ)์ ์์ฐจ์ ์ผ๋ก ๋ฐ์ดํฐ๋ฅผ ์ญ์ ํ๋ ๊ฒ(๋ง์ง๋ง๋ถํฐ ์ญ์ )์ ๋น ๋ฅด๋ค
<br>

### <LinkdList :  ๋ฐฐ์ด์ ๋จ์ ์ ๋ณด์>
- linked list :  
![image](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbygm8v%2Fbtq5lxMb2f7%2FUookpU9dnl1uKNZs6i4Bu0%2Fimg.png)
<br>

- double linked list :  
![image](https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2014/03/DLL1.png)
<br>

- ๋ฐฐ์ด๊ณผ ๋ฌ๋ฆฌ ๋ถ์ฐ์์ ์ผ๋ก ์กด์ฌํ๋ ๋ฐ์ดํฐ๋ฅผ ์ฐ๊ฒฐ(link)
- ๋ฐ์ดํฐ์ ์ญ์  : ๋จ ํ๋ฒ์ ์ฐธ์กฐ ๋ณ๊ฒฝ๋ง์ผ๋ก ๊ฐ๋ฅ
- ๋ฐ์ดํฐ์ ์ถ๊ฐ : ํ๋์ Node ๊ฐ์ฒด ์์ฑ๊ณผ ํ๋ฒ์ ์ฐธ์กฐ ๋ณ๊ฒฝ๋ง์ผ๋ก ๊ฐ๋ฅ
<br>

### <ArrayList์ LinkedList์ ์ฐจ์ด์ >
![image](https://www.nextree.co.kr/content/images/2021/01/jdchoi_20140225_arrayvslinkedlist11.png)  
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fi.stack.imgur.com%2FskN72.png%22&type=cafe_wa740)  

โถ linkedlist์ arraylist์ ๊ฐ์ฅํฐ ์ฐจ์ด๋ inkedlist ๋ ๊ฐ ์์๋ง๋ค ์,๋ค ์์์ ์์น๊ฐ์ ๊ฐ์ง๊ณ  ์๊ณ ,arraylist ๋ index๊ฐ ์๋ค.  
<br>

#### ๐ ์กฐํ(get) 

- ์กฐํ์์ arraylist๋ index๊ฐ ์๊ธฐ ๋๋ฌธ์, ์กฐํ๊ฐ ํ๋ฒ์ ๊ฐ๋ฅํ๋ค,

```java
elementData[index] = element;
```

๊ทธ๋ฌ๋ linkedlist์ ๊ฒฝ์ฐ ์ฒ์๋ถํฐ ํ๋์ฉ ๋ค ํ๊ณ ๋ค์ด๊ฐ์ผ ๋๊ธฐ๋๋ฌธ์ ๋ค์์๋ ๋์ ์ฐพ์ ์๋ก ์ค๋๊ฑธ๋ฆฐ๋ค.
<br>

#### ๐ ์ฝ์(add)

- arraylist๋ ๋ง์ง๋ง์ ์ถ๊ฐํ ๊ฒฝ์ฐ ์์ฒด์ ์ผ๋ก ํ์ฅ์ ํ๋ฉด๋๊ณ  
```java
elementData[size++] = e;
```

- ์ค๊ฐ์ ์ฝ์์ด ๋๋ ๊ฒฝ์ฐ๋ ํด๋น ์์น๋ฅผ ๊ธฐ์ค์ผ๋ก arraycopy๋ฅผ ์งํํ๋ค.
```java
System.arraycopy(elementData, index, elementData, index + 1, size - index);elementData[index] = element;
```
<br>

#### ๐ ์ญ์ (remove) 

- arraylist ๊ฐ์๊ฒฝ์ฐ์๋ ๋ด๋ถ์ ์ผ๋ก remove ํด์ผ๋๋ item์ ์ ์ธํ๊ณ  ์ฝ์์ฒ๋ผ arraycopy๋ฅผ ์๋ํ๋ค. ๋ฐ๋ฉด linkedlist๋ ์ฝ์๊ณผ ๋ง์ฐฌ๊ฐ์ง๋ก ํด๋น item์ ์ฐพ์ ์ ๊ฑฐํ๊ณ , ์๋ค ์์์ ์์น๊ฐ๋ง ์กฐ์ ํด์ฃผ๋ฉด ๋๋ค.
<br>

#### <ํด๋น ํจ์๋ค์ ์ค์  ์ํ์๊ฐ>  
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fwww.programcreek.com%2Fwp-content%2Fuploads%2F2013%2F03%2Farraylist-vs-linkedlist1.png%22&type=cafe_wa740)

์กฐํ์์๋ arraylist๊ฐ ์ฐ์์ง๋ง, ์ฝ์/์ญ์  ์์๋ linkedlist๊ฐ ๋ฐ์ด๋ ์ฑ๋ฅ์ ๋ณด์ฌ์ค๋ค.  
์ฆ ๋๋์ ์ฝ์์ญ์ ๊ฐ ๋น๋ฒํ๊ฒ ๋ฐ์ํ๋ ๊ณณ์์๋ linkedlist๋ฅผ db์์ ๋จ์ํ ์กฐํ๋ง ํ  ๊ฒฝ์ฐ์๋ arraylist๋ฅผ ์ฌ์ฉํ๋ฉด ๋๋ค.

์ถ์ฒ : https://cafe.naver.com/kosait
<br>

## 2. Stack & Queue โ
-----------------------------
<br>

![image](https://user-images.githubusercontent.com/111114507/189794365-dbdcc147-dda7-4f3f-92a4-ff5a0329dde7.png)
<br>

### <Stack์ ์ค์ํ ์ ์>
- ์์๋์ ๋ฌผ๊ฑด์ ์๋์๋ถํฐ ๋บ์์๋ค.  
- ์ธํฐ๋ท์ ํ๋ค๊ฐ ๋ค๋ก๊ฐ๊ธฐ๋ฅผ ๋๋ฅด๋ฉด ๋ฐฉ๋ฌธํ ์์๋๋ก ๋ค๋ก ๊ฐ๋ค.  
- ํ๊ธ๋ฌธ์๋ฅผ ์์ฑํ๋ค๊ฐ ๋๋๋ฆฌ๊ธฐ๋ฅผ ๋๋ฅด๋ฉด ๋ฐฉ๊ธ์ ์ ์ํํ ๋์์ ์๋๋๋ก ๋๋๋ฆฐ๋ค.  
<br>

### <Queue์ ์ค์ํ ์ ์>
- ๋ฒ์ค์ ๋ฅ์ฅ์์ ์ฌ๋๋ค์ด ์ค์ ์ ๋๋ก ๋ฒ์ค์ ํ๋ค.  
- ์์์ ์์ ์ฃผ๋ฌธํ ์์๋๋ก ์์์ ๋ฐ๋๋ค.  
<br>

์ถ์ฒ : https://github.com/Bamjong
<br>

### ๐push(), pop(), boolean empty(), boolean full() ๊ตฌํํ๊ธฐ

```java
public boolean empty() {
		return(top == -1); //true
	}
	
	public boolean full() {	
		return (top == maxsize-1); //5๊ฐ ๋ฐฉ [0] [1] [2] [3] [4]
	}
	
	public void push(Object i) {
		if(full()) {
			System.out.println("stack full ... ");
		} else {
			//POINT
			stackarr[++top] = i; //์ฒ์ top = -1 >> [0]
		}
		
	}
	
	public Object pop() {
		Object value = null;
		if(empty()) {
			System.out.println("stack empty ... ");
		} else {
			value = stackarr[top];
			top--;
		}
		return value;
	}
```
<br>


## 3. Generic โ
-----------------------------
<br>

```java
<Generic ์ฌ์ฉ ์ด์ >
Collection ํ์์ ํด๋์ค >> ๋ฐ์ดํฐ์ ๊ธฐ๋ณธ ์ ์ฅ ๊ณต๊ฐ ํ์ : Object
 ์ฅ์  : Object ์ด๋ค ๊ฐ์ ๋ฃ์ด๋ ์ํ(String, Emp, int)
 ๋จ์  : ํฐ ํ์์ ๋ํ ๋ฌธ์ , ์ํ๋ ๋ฐ์ดํฐ ํ์์ผ๋ก ๋ณ๊ฒฝ(๋ค์ด์บ์คํ) ... ๋ถํธ
 
 1. ํ์์ ์ฒ์๋ถํฐ ๊ฐ์  ... 
 2. ํ์์ ์์ ์ฑ ํ๋ณด (ํ์ ๊ฐ์ )
 3. ๊ฐ์  ํ๋ฒํ ํ์ ์๋ค : (Car)Object (ํ์ ์๋ค)
 
 ์ ๋๋ฆญ ์ ์ฉ์ ์ํด์๋ ์ค๊ณ๋๋ถํฐ ์ ์ฉ ... 
 ```

 ```java
 //Generic ํ์ ๊ฐ์  : ๋ค ๋จน์ง๋ ๋ชปํ์ง๋ง (ํ ์ข๋ฅ๋ง) >> 
ArrayList<Person> plist = new ArrayList<Person>();
plist.add(new Person());
plist.add(new Person());

for(Person p : plist) { //์ฅ์  : ํ์์ ๋ชํํ ์๊ณ  ์์(๊ฐ์ )
	System.out.println(p.age);
}

ArrayList<String> slist = new ArrayList<String>();
slist.add("๋ฌธ์์ด");
```
### ๐ Generic Quiz)
```java
		//1. Array ์ฌ์ฉํด์ tv, audio, notebook์ ๋ด์ ์ ์๋ cart ๋ฐฐ์ด์ ์์ฑํ๊ณ  ์ ํ์ ๋ด์ผ์ธ์.
		Product[] cart = new Product[3];
		cart[0] = new KtTv();
		cart[1] = new Audio();
		cart[2] = new NoteBook();
		//2. ArrayList Generic์ ์ฌ์ฉํด์ cart ๋ฐฐ์ด์ ๋ง๋ค๊ณ  ์ ํ์ ๋ด์ผ์ธ์
		//ArrayList<Product> pcart = new ArrayList<Product>();
		List<Product> pcart = new ArrayList<Product>();
		pcart.add(new KtTv());
		pcart.add(new KtTv());
		pcart.add(new KtTv());
		pcart.add(new NoteBook());
		
		for(Product product : pcart) {
			System.out.println(product);
		}
		
		//3. Emp ํด๋์ค (kr.or.kosa) - ArrayList Generic ์ฌ์ฉํด์ ์ฌ์ 3๋ช์ ๋ง๋์ธ์.
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		emplist.add(new Emp(1000, "๊น์จ", "IT"));
		emplist.add(new Emp(1000, "๊ณ ์จ", "IT"));
		emplist.add(new Emp(1000, "์์จ", "IT"));
		// 3-1. ์ฌ์์ ์ ๋ถ๋ฅผ toSTring() ์ฌ์ฉํ์ง ๋ง๊ณ  ์ฌ๋ฒ, ์ด๋ฆ, ์ง์ข์ธ ์ถ๋ ฅํ์ธ์ (๊ฐ์ ๋ for๋ฌธ)
		for(Emp emp : emplist) {
			System.out.println(emp.getEmpno() + " / " + emp.getEname() + " / " + emplist);
		}
		//3-2. ์์ ๋์ผํ๋ฐ ๊ฐ์ ๋ for๋ฌธ์ด ์๋๊ณ  ์ผ๋ฐ for๋ฌธ ์ฌ์ฉํด์ ์ฌ๋ฒ, ์ด๋ฆ, ์ง์ข์ธ ์ถ๋ ฅํ์ธ์
		for (int i = 0; i < emplist.size(); i++) {
			System.out.println(emplist.get(i).getEmpno() + " / " + emplist);
		}
		List<CopyEmp> clist = new ArrayList<CopyEmp>();
		clist.add(new CopyEmp(100, "๊น์จ", 1000));
		clist.add(new CopyEmp(200, "๊ณ ์จ", 2000));
		clist.add(new CopyEmp(300, "ํ์จ", 5000));
		
		//1. 200๋ฒ ์ฌ์์ ๊ธ์ฌ๋ฅผ 6000์ผ๋ก ์์ ํ์ธ์(์ผ๋ฐ for๋ฌธ์ ํตํด์) getter, setter
		for (int i = 0; i < clist.size(); i++) {
			if(clist.get(i).getEmpno() == 200) {
				clist.get(i).setSal(6000);
				System.out.println(clist.get(i).toString());
			}
		}
		
		//2. 300๋ฒ ์ฌ์์ ์ด๋ฆ์ ๋ฐ์จ์์ "๊ถ๊ธํด์จ"๋ก ์์ ํด์ ๊ทธ ๊ฒฐ๊ณผ๋ฅผ ์ถ๋ ฅํ์ธ์(๊ฐ์ ๋ for)
		for (CopyEmp emp : clist) {
			if(emp.getEmpno() == 300) {
				emp.setEname("๊ถ๊ธํด์จ");
				System.out.println(emp.toString());
			}
		}
```
<br>

## 4. Interator โ
-----------------------------
<br>

```java
Collection FrameWork
 (์ ๋ง์ ์ธํฐํ์ด์ค์ ๊ทธ ๊ฒ์ ๊ตฌํํ๊ณ  ์๋ ์ ๋ง์ ํด๋์ค๊ฐ ์์ด์)
 
 Interator ์ธํฐํ์ด์ค
 (๋ฐ๋ณต์)
 [๋์ด๋ ์์์ ๋ํด ์์ฐจ์ ์ผ๋ก ์ ๊ทผํด์ ๊ฐ์ ๋ฆฌํดํ๋ **ํ์ค**์ ์ ์]
 ์ถ์ํจ์๋ก ์ ์ํ๊ณ  ์๋ค >> ArrayList๋ ์ถ์ํจ์๋ฅผ ๊ตฌํ(ํ์คํ๋)
 
  Interator ์ธํฐํ์ด์ค๊ฐ ๊ฐ์ง๊ณ  ์๋ ์ถ์ ํจ์
  >> hasNext(), Next(), remove() ์ถ์
  >> ArrayList implements Interator{ hasNext()๋ฅผ ์ฌ์ ์ ๊ตฌํํ๊ณ  ์์ }
```

## 5. HashSet โ
-----------------------------
<br>

```java
 Set  ์ธํฐํ์ด์ค (์ ์์ ๋ค์ด๊ฐ์ธ์) : ์์ ๋ณด์ฅx >> ์ค๋ณต ํ๋ฝ x
 ์์๊ฐ ์๊ณ  ์ค๋ณต์ ํ๋ฝํ์ง ์๋ ๋ฐ์ดํฐ ์งํฉ
 ๊ตฌํํ๋ ํด๋์ค
 HashSet, TreeSet(์๋ฃ๊ตฌ์กฐ)
 ```

```java
//Quiz
//HashSet์ ์ฌ์ฉํด 1~45๊น์ง์ ๋์ 6๊ฐ๋ฅผ ๋ฃ์ผ์ธ์
/* ์์  lotto class ํ์ฉ
    int[] lotto
    lotto[i] = (int)(Math.random()*45 + 1);
    
for(int j = 0; j<i; j++) {
    if(lotto[i] == lotto[j]) {
    i--;
    break;
    }
}
```
## (1)
```java
HashSet<Integer> lotto = new HashSet<Integer>();
for (int j = 0; lotto.size()<6; j++) {
    int num = (int)(Math.random()*45 + 1);
    lotto.add(num);
    System.out.println("i : " + j + " / num : " + num);
}

System.out.println(lotto.toString());
```
## (2)
```java
Set set2 = new HashSet();
		int index = 0;
		while(set2.size() < 6) {
			int num = (int)(Math.random()*45 + 1);
			set2.add(num); // add ์ถ์ ํจ์๋ฅผ HashSetํด๋์ค๊ฐ ์ฌ์ ์ 
		}
		System.out.println(set2.toString());
```

## 6. TreeSet โ
-----------------------------
<br>

![imgae](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fczb0Rs%2FbtqEt6tVogn%2FKpmfrL9PfiNK9ioz0WkRq1%2Fimg.png)

```java
*Set : ์์(x), ์ค๋ณต(x)
      
<TreeSet>
์์(x), ์ค๋ณต(x), ์ ๋ ฌ๊ธฐ๋ฅ(o)
๊ฒ์ํ๊ฑฐ๋ ์ ๋ ฌ ํ์๋ก ํ๋ ์๋ฃ๊ตฌ์กฐ(๋ฐ์ดํฐ ์งํฉ)
๋ก๋
์ค๋ณต ๋ฐ์ดํฐ .... ์ถ๋ ฅ ์ ๋ ฌ(๋ฎ์ ๊ฐ๋ถํฐ)

<ํน์ง>
1. ์ด์ง ํธ๋ฆฌ ๊ตฌ์กฐ (๋๋ฌด ๊ฑฐ๊พธ๋ก ๋ค๊ณ  ๋ณด์ธ์) : root > leaf
2. ๋ฐ์ดํฐ ์ ์ฅ์ ์ ๋ ฌ๊ธฐ๋ฅ์ด ์ ๊ณต
```
<br>

## 7. Map โ
-----------------------------
<br>

```java
Map์ธํฐํ์ด์ค
 
 (key, value) ์์ ๊ตฌ์กฐ๋ฅผ ๊ฐ๋ ๋ฐฐ์ด
 ex) ์ง์ญ๋ฒํธ(02, ์์ธ) (031, ๊ฒฝ๊ธฐ)
 
 ์กฐ๊ฑด)
 key ์ค๋ณต(x) >> Set
 value ์ค๋ณต(o) >> List
 
 Generic ์ง์ 
 
 Map ์ธํฐํ์ด์ค ๊ตฌํํ๋ ํด๋์ค
 ๊ตฌ๋ฒ์  : HashTable(๋๊ธฐํ) : lock - ์์๋ณดํธ
 ์ ๋ฒ์  : HashMap (๋๊ธฐํ ๊ฐ์ ํ์ง ์์์) ์ฑ๋ฅ๊ณ ๋ ค (Thread ํ์ต ... ) ******
 ```

 ### ๐ Quiz)
 ```java
*id ์ pwd ๋ฐ์ผ์ธ์
*id๋ ๊ณต๋ฐฑ ์ ๊ฑฐ >> ์๋ฌธ์ ๋ณํ  (String ํจ์)
*pwd ๊ณต๋ฐฑ์ ๊ฑฐ
id(0) , pwd(0) >> ํ์๋ ๋ฐฉ๊ฐ๋ฐฉ๊ฐ  ์ถ๋ ฅํ์ธ์ while ํ์ถ
id(0) , pwd(x) >> ์์ด๋ , ๋น๋ฐ๋ฒํธ ํ์ธํด ์ฃผ์ธ์ ์๋ ฅ ๋ฐ๊ฒ ...

id(x) , pwd(0) >> id ์ฌ์๋ ฅ ํ์ธ์ ์ถ๋ ฅ   ์์ด๋ , ๋น๋ฐ๋ฒํธ ์๋ ฅ
id(x) , pwd(x) >> id ์ฌ์๋ ฅ ํ์ธ์ ์ถ๋ ฅ   ์์ด๋ , ๋น๋ฐ๋ฒํธ ์๋ ฅ
3๊ฐ์ง ๋ผ๋ฆฌ๋ฅผ if๋ฌธ์ ์ ์ด
```
```java
Scanner sc = new Scanner(System.in);

while(true) {
	System.out.println("id, pwd  ์๋ ฅํด ์ฃผ์ธ์");
	
	System.out.println("ID");
	String id = sc.nextLine().trim().toLowerCase();
	
	System.out.println("PWD");
	String pwd = sc.nextLine().trim();
	
	if( !loginmap.containsKey(id)) {
			//id(x)
			System.out.println("id ๋ง์ง ์์ต๋๋ค ... ์ฌ์๋ ฅ ํ์ธ์");
	}else {
			//id(0)
			if(loginmap.get(id).equals(pwd)) {
					System.out.println("ํ์๋ ๋ฐฉ๊ฐ๋ฐฉ๊ฐ ^^");
					break;
			}else {
					System.out.println("๋น๋ฐ๋ฒํธ ํ์ธํ์ธ์");
			}
	}
```