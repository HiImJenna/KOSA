# 2022.09.02.Fri ๐
<br>

## 1. String class โ
-----------------------------
![image](https://user-images.githubusercontent.com/111114507/188033391-7b9f837f-2c3f-4b23-8351-8cd276a946e5.png)

```java
<String ํด๋์ค (๋ฌธ์์ด)>
 * String ์ ๋ง์ ํจ์ ... ๋ฌธ์์ด ์กฐ์(์๋ฅด๊ณ , ํฉ์น๊ณ  ... )
 * String >> static ํจ์ + ์ผ๋ฐ ํจ์(15~20๊ฐ) 
 ```

## 2. String method โ
-----------------------------
### * str.concat( ) : ๋ฌธ์์ด ๋ถ์ด๊ธฐ
```java
String str = "hello";
String concatstr = str.concat("world");
System.out.println(concatstr);
```

```java
์ถ๋ ฅ๊ฐ : hello world
```

### * str.contains( ) : ๋ฌธ์์ด ํฌํจ ์ฌ๋ถ ํ์ธ
```java
boolean bo = str.contains("ell");
System.out.println(bo);
```

``` java
์ถ๋ ฅ๊ฐ : true
```
### * str.length( ) : ๋ฌธ์์ด ๊ธธ์ด
```java
String str2 = "a b c d"; //[a] [ ] [b] [ ] [c] ...๊ณต๋ฐฑ๋ ๋ฌธ์
System.out.println(str2.length());
```
```
์ถ๋ ฅ๊ฐ : 7
```
### * str.contains( ) : ๋ฌธ์์ด ํฌํจ ์ฌ๋ถ ํ์ธ
```java
boolean bo = str.contains("ell");
System.out.println(bo);
```

### * str.substring( ) : ๋ฌธ์์ด ์๋ฅด๊ธฐ
```java
String result = "superman";
System.out.println(result.substring(0)); //์์ index ~
System.out.println(result.substring(1)); //uperman
System.out.println(result.substring(1, 2)); //u
```
### * str.indexOf( ) : ํน์  ๋ฌธ์ ์ฐพ๊ธฐ
``` java
String filename = "hello java world";
System.out.println(filename.indexOf("h")); //๋ช๋ฒ์งธ์ ์๋์ง
System.out.println(filename.indexOf("java")); //๋จ์ด ์์ ์์น
System.out.println(filename.indexOf("์ผ์")); //-1์ return (์๋ ๊ฐ์ ๋ฐฐ์ด์์ ์ฐพ์ ๋)
```
```
์ถ๋ ฅ๊ฐ : 0 , 6, -1
```

### * Quiz)
```java
//Quiz
String filename2 = "home.jpeg"; //or h.png or aaaa.h.hwp
//์ฌ๊ธฐ์ ํ์ผ๋ช๊ณผ ํ์ฅ์๋ฅผ ๋ถ๋ฆฌํด์ ์ถ๋ ฅ
//ex) ํ์ผ๋ช : home / ํ์ฅ์ : jpeg
//์์์ ๋ฐฐ์ด ํจ์๋ง ์ฌ์ฉํด์ ์ถ๋ ฅ

//System.out.println("ํ์ผ๋ช : " + );
int position = filename2.indexOf(".");
String name = filename2.substring(0, position + 1);
String extention = filename2.substring(position + 1, filename2.length());
```

### * str.replace( ) : ๋์ฒด
```java
String str3 = "ABCDDDDDEFG";
String result3 = str3.replace("DDDDD", "์ค๋์ ๊ธ์์ผ");
System.out.println(result3);

result3 = str.replace("A", "a");
System.out.println(result3);
```

```
์ถ๋ ฅ๊ฐ : ABC์ค๋์ ๊ธ์์ผEFG, aBCDDDDDEFG
```
### * str.equalsIgnoreCase( ) : ๋์๋ฌธ์ ๋ฌด์
### * str.split( ) : parameter๋ฅผ ๊ธฐ์ค์ผ๋ก ๋ถ๋ฆฌ
### * str.trim( ) : ์ ๋ค ๊ณต๋ฐฑ ์ ๊ฑฐ
```java
String str8 = "     ํ๊ธธ๋      ";
System.out.println(">" + str8 + "<");
System.out.println(">" + str8.trim() + "<");
```
<br>

### Quiz)
```java
String jumin="123456-1234567";
//์ ์ฃผ๋ฏผ๋ฒํธ์ ํฉ์ ๊ตฌํ์ธ์_1
int sum2=0;
for(int i = 0 ; i < jumin.length() ; i++) {
String numstr =jumin.substring(i, i+1);
if(numstr.equals("-")) continue;
sum2+= Integer.parseInt(numstr);
} 
System.out.println("์ฃผ๋ฏผ๋ฒํธ ํฉ:" + sum2);

//์ ์ฃผ๋ฏผ๋ฒํธ์ ํฉ์ ๊ตฌํ์ธ์_2
//String jumin="123456-1234567";
String[] numarr2 = jumin.replace("-","").split("");
int sum3=0;
for(String i : numarr2) {
sum3+= Integer.parseInt(i);
}
System.out.println("์ฃผ๋ฏผ๋ฒํธ ํฉ2:" + sum3);

//์ ์ฃผ๋ฏผ๋ฒํธ์ ํฉ์ ๊ตฌํ์ธ์_3
String jumin4 = jumin.replace("-", "");
int sum4=0;
for(int i = 0 ; i < jumin4.length() ;i++) {
sum4+=Integer.parseInt(String.valueOf(jumin4.charAt(i)));
}
System.out.println("์ฃผ๋ฏผ๋ฒํธ ํฉ4:" + sum4);
}
```

## 3. Protected ์ ๊ทผ์ ํ์ โ
-----------------

```java
์์๊ด๊ณ์์ ... ์ ๊ทผ์ : protected

public 
private
default (๊ฐ์ ํด๋)
protected

protected : ์๋ฉด์ฑ(๋ฐ์ฅ) >> default , public 
>>์์์ด ์๋ ํด๋์ค ์์์ protected >> default ๋์ผ 
>>๊ฒฐ๊ตญ ์์๊ด๊ณ์์๋ง ์๋ฏธ๋ฅผ ๊ฐ์ง๋ค >> public ใ
```
* public๊ณผ default ๊ทธ ์ฌ์ด ์ด๋๊ฐ..โ
* ์ ๊ทผ์ ์ด์๊ฐ protected๋ก ์ค์ ๋์๋ค๋ฉด protected๊ฐ ๋ถ์ ๋ณ์, ๋ฉ์๋๋ ๋์ผ ํจํค์ง์ ํด๋์ค ๋๋ ํด๋น ํด๋์ค๋ฅผ ์์๋ฐ์ ๋ค๋ฅธ ํจํค์ง์ ํด๋์ค์์๋ง ์ ๊ทผ์ด ๊ฐ๋ฅํ๋ค.

![image](https://lh3.googleusercontent.com/-UFlhzuxwShg/YPUwhoHlxiI/AAAAAAAAozM/QMBNLidwB3ISagmKKcyq1evkhdsgsMq3wCLcBGAsYHQ/w406-h268/image.png)
