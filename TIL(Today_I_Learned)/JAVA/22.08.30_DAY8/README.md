# 2022.08.30.Tue ๐
<br>

## 1. ๋ฐฐ์ด Array โ
--------------
```java
 * ๋ฐฐ์ด์ ๊ฐ์ฒด๋ค(Array)
 1. new๋ฅผ ํตํด์ ์์ฑ
 2. heap ๋ฉ๋ชจ๋ฆฌ ์์ฑ(๊ด๋ฆฌ์์)
 3. ๊ณ ์ ๋ฐฐ์ด(์ ์ ๋ฐฐ์ด) : ๋ฐฐ์ด์ ํ๋ฒ ์ ์ธํ๋ฉด (ํฌ๊ธฐ๊ฐ ์ ํด์ง๋ฉด) ๋ณ๊ฒฝ ๋ถ๊ฐ <-> collection(๋์ )
 4. ์๋ฃ๊ตฌ์กฐ (์๊ณ ๋ฆฌ์ฆ) ๊ธฐ์ด์ ์ธ ํ์ต
 ```

 ```java
 //๋ฐฐ์ด ์์ฑ 3๊ฐ์ง
int[] arr = new int[5]; //๊ธฐ๋ณธ
int[] arr2 = new int[] {100, 200, 300}; //์ด๊ธฐ๊ฐ์ ํตํด์ ๋ฐฐ์ด ๊ฐ์๋ฅผ ์ ์ํ๊ณ  ๊ฐ์ ํ ๋น
int[] arr3 = {11, 22, 33}; //์ปดํ์ผ๋ฌ์๊ฒ ์๋์ผ๋ก new ๋ถ๋ถ ๋ถํ (0)
```

![image](https://user-images.githubusercontent.com/111114507/187435080-a84c56ee-8036-43a5-aee3-83f55faabf78.png)

 ### * ๋ฌธ์  ํ์ด
 ### Q1) 
``` java
์ด๋ ํ์์ ๊ธฐ๋ง๊ณ ์ฌ ์ํ ์ ์ (5๊ณผ๋ชฉ)
1. ์ด ๊ณผ๋ชฉ์ ์
2. ๊ณผ๋ชฉ์ ํฉ
3. ๊ณผ๋ชฉ์ ํ๊ท 
๋จ, 2 & 3๋ฒ ๋ฌธ์ ๋ ํ๋์ for๋ฌธ์ผ๋ก ํด๊ฒฐ
sum์ ํ ๋๋ง๋ค ํ๊ท ์ ๊ตฌํ  ํ์๋ ์๋ค
```

```java
int[] mark = {100, 55, 90, 60, 78};
int sum = 0;
float avg = 0f;

System.out.println("๊ณผ๋ชฉ ์ : " + mark.length);

for (int i = 0; i < mark.length; i++) {
    sum = sum + mark[i];
    avg = sum / (float)mark.length;
    //if ( i == mark.length-1) { //๋ง์ง๋ง ๋ฐฉ์ด๋ผ๋ฉด 
    //avg = sum / (float)mark.length;
    //}
    
System.out.println("์ด ํฉ : " + sum);
System.out.println("๊ณผ๋ชฉ ํ๊ท  : " + avg);
}
```
<br>

### Q2)
```java
1. 1 ~ 45๊น์ง์ ๋์๋ฅผ ๋ฐ์ ์์ผ์ 6๊ฐ์ ์ ์๊ฐ์ ๋ฐฐ์ด์ ๋ด์ผ์ธ์.
2. ๋ฐฐ์ด์ ๋ด๊ธด 6๊ฐ์ ๋ฐฐ์ด๊ฐ์ ์ค๋ณต๊ฐ์ด ๋์ค๋ฉด ์๋ฉ๋๋ค. (์ค๋ณต๊ฐ์ ๋ํ ๊ฒ์ฆ ์ฝ๋๊ฐ ํ์)
3. ๋ฐฐ์ด์ ์๋ 6๊ฐ์ ๊ฐ์ ๋ฎ์ ์์ผ๋ก ์ ๋ ฌ ์ํค์ธ์. >> sort (์ ๋ ฌ : ์๋ฆฌ๋ฐ๊ฟ : swap)
4. ์ ๊ฒฐ๊ณผ๋ฅผ ๋ด๊ณ ์๋ ๋ฐฐ์ด์ ์ถ๋ ฅํ์ธ์.
5. main ์์์ ๋ชจ๋ ์์ฑํด๋ ok, static ํจ์ ์ฌ์ฉ๋ ok, ํด๋์ค๋ก ๋ง๋ค์ง x


public class Ex03_Array_Lotto_Main {
	static int[] arr = new int[6]; //6์๋ฆฌ ๋ฐฐ์ด ์ง์ 
	
	public static void main(String[] args) {
	
		for (int i = 0; i < arr.length; i++) {
			int random = (int)(Math.random()*45 + 1); //๋์ 6๊ฐ ์์ฑํด์ ๋ฐฐ์ด๋ก ์ง์ 
			boolean result = check(random);
			
			if(result == true) { //์ค๋ณต๊ฐ์ด ์๋์ง ํ์ธ
				i--;			 // 
				continue; //์ค๋ณต๊ฐ์ด ์๋ค๋ฉด ๋ฐ๋ณต๋ฌธ ๋งจ ์๋ถํฐ ๋ค์ ์คํ (๋์ ๋ค์ ๋ฝ๊ธฐ)
			}
			arr[i] = random;	
		} 
		Arrays.sort(arr); //์์ ์ ๋ถํฐ ์ ๋ ฌ (bubble sort๋ ๋ชปํ๊ฒ ์..)
		String resultArray = Arrays.toString(arr);
		System.out.println(resultArray); //์ถ๋ ฅ
	}
	
	public static boolean check (int random) { //์ค๋ณต๊ฐ ํ์ธ ํจ์ (์ค๋ณต๊ฐ์ด ์๋ค๋ฉด true๋ฅผ ์๋ค๋ฉด false๋ฅผ return)
		for (int i = 0; i < arr.length; i++) {
			if (random == arr[i]) {
				return true;
			}
		}
			return false;
	}
}
```

 ![image](https://user-images.githubusercontent.com/111114507/187410453-e81b7c95-2101-4680-8d99-c1404e9f4e78.png)
<br>

 ### * ๊ฐ์ ๋ for๋ฌธ
 ```java
for๋ฌธ >> ํฅ์๋ for๋ฌธ, ๊ฐ์ ๋ for๋ฌธ
JAVA	: for(Type ๋ณ์๋ช : ๋ฐฐ์ด or Collection) (์คํ๋ธ๋ญ)
C#		: for(Type ๋ณ์๋ช in ๋ฐฐ์ด or Collection) (์คํ๋ธ๋ญ)
JS		: for(Type ๋ณ์๋ช in Collection) (์คํ๋ธ๋ญ)
    //์ผ๋ฐ ...
    int[] arr = {5,6,7,8,9};
    
    for (int i = 0; i < arr.length; i++) {
        System.out.println(arr[i]);
    }
    
    //๊ฐ์ ๋ ...
    for(int value : arr) {
        System.out.println(value);
    }
```


 ### * 2์ฐจ์ ๋ฐฐ์ด
 ![image](http://www.tcpschool.com/lectures/img_java_array23.png)
 ![image](https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fcafeptthumb-phinf.pstatic.net%2FMjAxODAyMDFfMTYy%2FMDAxNTE3NDU0MTM2NzUy.pygwzGiOiPPv8ZGhLlkCHJhZp5kIOsEjuEPSwqurOtEg._jw-YEYCqL2x2AtovJIxeLdhPqZtku3igNpBC04zxlsg.PNG.i7027%2F1.PNG%3Ftype%3Dw740%22&type=cafe_wa740)


 