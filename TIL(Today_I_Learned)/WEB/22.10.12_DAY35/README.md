# 2022.10.12. WED ๐
----------------
<br>

## 1. Javascript โ
-  Web > ํด์ ์คํ > ์น ๋ธ๋ผ์ฐ์ ธ(ํด์๊ธฐ:์์ง) > ๋ผ์ธ๋จ์(์์) ์คํ
- ๊ฐ์ฒด์งํฅ์ธ์ด > class ๊ฐ๋ > ์์ , ๋คํ์ฑ, ์ฌ์ฌ์ฉ์ฑ ....
<br>

### ๐ Why Study JavaScriptโ
- HTML to define the content of web page
- CSS to specify the layout of web pages
- JavaScript to program the behavior of web pages
<br>

### ๐ <Javascript ์ฌ์ฉ>
- html ์ content , attribute ๋ณ๊ฒฝ , ์ญ์  , ์ถ๊ฐ [๋์ ]์ผ๋ก
- css ์์ฑ ๋ณ๊ฒฝ , ์ญ์  , ์ถ๊ฐ [๋์ ]์ผ๋ก
- ์ ํจ์ฑ ๊ฒ์ฆ (id ์๋ ฅ, ์ฃผ๋ฏผ๋ฒํธ ๋ง๋์ง , ๋ฐ์ดํฐ ์ซ์ ...๊ฒ์ฆ)
- ๋์ ์ธ ์น ํ๋ฉด ๊ตฌ์ฑ (ํ๋ฉด๊ตฌ์ฑ)
- ์  ์ธ๊ณ์ ์ผ๋ก 1์ ์ธ์ด
- ์ ๊ท : vue.js , react.js (Front) ๋จ์ : ๋ฒ์ ๋ณ๊ฒฝ .... ์ฌ๋ผ์ง ์ ๋ ์๋ค
- Front ์ต์ : vue.js ๋๋ react.js 
- ์น ๋ธ๋ผ์ฐ์ ธ ์์ด ๋ก์ปฌ ์๋ฒ์์ ๋์ (๋ง์น java ์ฒ๋ผ)
- Node.jsยฎ๋ Chrome V8 JavaScript ์์ง์ผ๋ก ๋น๋๋ JavaScript ๋ฐํ์
- back ๋จ์ ์ฝ๋ javascript ๋์ฒด >> ์๋ธ (์ฑํ ์๋ฒ, ๋ณด์กฐ ์๋ฒ) >> npm ํ์ต
<br>

### ๐ <Javascript ๋ฌธ๋ฒ> 
- ๋์๋ฌธ์๋ฅผ ์๊ฒฉํ๊ฒ ๊ตฌ๋ถ
- ์ข๊ฒฐ์ ;
- ํ์(var , const , let) : let i="A"; let s = "aaa"; const NUM=100;   
     ex) int i =10; double d = 3.14;   
- ์ฐ์ฐ์ , ์ ์ด๋ฌธ(java ๋์ผ) , ๊ฐ์ฒด 
- ์ฌ์ฉ๋ฒ (css ์ฌ์ฉ๋ฒ๊ณผ ๋์ผ)
- 1)in-line (ํ๊ทธ ์์ชฝ์ : <p onclick="<script>...")
- 2)internal(page ์์์ ์ผ๋ฐ์ ์ผ๋ก <head><script> ...์ฝ๋</head>)
- 3) external(์ธ๋ถ ํ์ผ :common.js >> link ๋ฐฉ์) ์ ํธ (์ ์ง๋ณด์ , ์ฌ์ฌ์ฉ)
<br>

### ๐ window.document
![image](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fvb9rz%2FbtraHYSvo8t%2FDqbwzXomWdckBw47UfPNmk%2Fimg.png)  

- window.document.write : ํ๋ฉด์ ์๋ ฅ
- document.write : ์์ window๋ ์๋ตํด๋ ok
```js
 //javascript ํด์ > ์น ๋ธ๋ผ์ฐ์  (ํด์ + ๋ด์ฅ๊ฐ์ฒด ์ ๊ณต)
//๋ด์ฅ๊ฐ์ฒด(์์๋ค) >> window ๊ฐ์ฒด

window.document.write("๋ฐฉ๊ฐ๋ฐฉ๊ฐ<br>");

//window ๊ฐ์ฒด ์๋ต
document.write("window๊ฐ์ฒด ์๋ต ๊ฐ๋ฅ<br>");

console.log("๋๋ฒ๊น, ๊ฒฐ๊ณผ๋ฏธ๋ฆฌ๋ณด๊ธฐ, ์ค๋ฅ๋ฉ์ธ์ง ํ์ธ");
console.log(10+10);

document.write("<b>hello world</b>");
document.write('<table border="1">');
document.write('<tr><td>aa</td></tr><tr><td>bb</td></tr>')
document.write('</table>')

```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/195234657-d10e8a9d-dea6-4ffb-84c5-3d4e51f18705.png)

## 2. Javascript ๋ณ์ โ
### 1) ๋ณ์ ์์ฑ
- var a; ์ ์ ๋์ง x
- let b; ์ ์ ๋์ง x
- a = 10; ํ์์ค์  (num)
- b = "A" ํ์์ค์  (String)
- Es5 ์ด์  ๋ฌธ๋ฒ (var) >> 2015 Es6(ECMA) let, const
- let name = "kglim"; ํ์ด์ง ์ ์ฒด(global : ์ ์ญ)
- ํจ์ ์์ ์๋ let age=20; ํจ์ ์์ ์ ํจ (local : ์ง์ญ)
```js
let n; //์ด๊ธฐํ๊ฐ ๋์ด์์ง ์์์ (ํ์์ด ์์ด์)
console.log(n); //undefined
n = 100;
//****javascript๋ ์ ์ญ, ์ง์ญ๋ณ์๋ฅผ ์ด๊ธฐํํ๊ณ  ์ฌ์ฉํ์ ****//
let i,j;
i = 200;
j = 300;
let result = i + j;


console.log(result);

let intnum = 100; //์ ์
let dnum = 12.345 //์ค์
let flag = true; //boolean
let str = null; //๊ฐ์ด ์๋ค
let str2 = "ABC"; //๋ฌธ์์ด

console.log(typeof(intnum));
console.log(typeof(dnum));
console.log(typeof(flag));
console.log(typeof(str));
console.log(typeof(str2));

```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/195242058-d4bdcaa1-a956-4b60-83cb-7b59123b03e4.png)

```js
var num; //ํ์์ด ์ ํด์ง์ง ์์์ (์ ์, ๋ฌธ์, ๋ ์ง ์ฌ ์ ์์)
console.log(num); //undefined ์ ์ ์ถ๋ ฅ ... ์ ์๋์ง ์์์
num = 10; //๊ฐ์ ๊ฐ์ง๋ ์๊ฐ ๋ด๋ถ์ ์ผ๋ก ํ์ ๊ฒฐ์ 
console.log("num : " + num);

let num2 = 100;
console.log(num2);
console.log(typeof(num)); //number
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/195233200-a5da9ecd-8dbc-403f-8190-67d3e833e964.png)  
<br>


## 3. Javascript - DOM script  โ
![image](http://www.tcpschool.com/lectures/img_js_htmldom.png)
```js
๋ฌธ์๊ฐ ์คํ๋๋ฉด ... ์น ๋ธ๋ผ์ฐ์  ๋ฉ๋ชจ๋ฆฌ์ body ์์ ์์๊ฐ ๋ก๋ฉ ...
๋ฉ๋ชจ๋ฆฌ์ DOM tree ํํ๋ก... ํ์์ ๋ฐ๋ผ์ ์ ๊ทผ
DOM
html
|
head - body

DOM script : getElementById
```
<br>

## 4. JavaScript - ์ฐ์ฐ์
#### 1) ์ฐ์  (+,-,/,%)
```js
 let num1=10;
let num2=3;
document.write(num1/num2+"<br>");//์ค์
document.write(num1%num2+"<br>");//๋๋จธ์ง
```
#### 2) ๊ด๊ณ == (===(๊ฐ๊ณผ ํ์ ๋น๊ต), !=, >= ... )
```js
let a = 3;
let b = 5;
console.log(a==b)
console.log(a!=b)
console.log(a>b)
```
#### 3) ๋ผ๋ฆฌ (&&, ||)
```js
console.log((10>5)&&(1!=3));
console.log((10>5)||(1!=3));
```
#### 4) ์ผํญ
```js
let result2 = (4%2 == 0) ? "์ง์" : "ํ์";
console.log(result2);
```
#### 5) ๋์ ์ฐ์ฐ์ (+=, -=, *=, /=)
```js
let p = 10;
let k = 5;
p += k;
console.log(p);

let x = 5+5;
let y ="5" + 5; //+ (์ฐ์ , ๊ฒฐํฉ)
console.log(x);
console.log(y);

let v = "5";
let v2 = 5;
let v3 = 5;
console.log(v==v2) //== : ๊ฐ์ ๋น๊ตํ๋ ์ฐ์ฐ์
console.log(v===v2) //=== : ๊ฐ๋ง ๊ฐ์ ๊ฒ์ด ์๋๋ผ ํ์๋ ๋์ผ
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/195259378-05694a44-9f38-4693-b8ba-3a6087d8cd91.png)
<br>

## 5. JavaScript - function โ
```js
/*
< JAVA >
public void print(){}
public String print() {return ""}
public int print(int num, int num2){return num + num2}

< JS >
function ํจ์๋ช () {}
void(x), return type(x)
*/
function callConfirm(){ //์ฌ์ฉ์ ์ ์ํจ์
    if(window.confirm("์ญ์ ํ์๊ฒ ์ต๋๊น")){ //confirm() ๋ด์ฅํจ์ return true or false
        alert("๋ค");
    } else {
        alert("์๋์ค")
    }
    }
</script>
</head>
<body>
<hr3>๋ด์ฅํจ์, ์ฌ์ฉ์ ์ ์ ํจ์</hr3>
<button onclick="">ํด๋ฆญ ์ฌ๊ฑด ๋ฐ์(ํจ์(ํ์))ํธ์ถ</button>
<br>
```
- onclick"" : "" ์์ ๋ค์ด์ค๋ ๋ฉ์๋ ์คํ -> ๋ฒํผ ๋๋ฅด๋ฉด ๊ทธ ๋ฉ์๋ ์คํ!
<br>

## 6. JavaScript - pop up โ
- ํ์์ฐฝ ๋์์ธ Sweetalert : https://sweetalert.js.org/guides/
- window.open(URL, name, specs, replace)
```js
function showPopup() {
window.open("Ex06_popup.html", "zipcode", "width=200, height=200") //๋ด์ฅํจ์
}

function myFunc(){
let popupwindow = window.open("Ex06_popup.html", "zipcode", "width=200, height=200")
//popupwindow๊ฐ ํ์์ฐฝ์ด์์
popupwindow.document.write("<p>this is zipcode window</p>");
//์ ์ฐฝ์ ๋ํ ์ ์ด ๊ฐ๋ฅ
//JAVA: public void goUrlTime(String url){}
function goUrlTime(url){
window.setTimeout("location.href='" + url + "'", 3000);
//setTimeout ๋ด์ฅํจ์
//3์ด๊ฐ ์ง๋๋ฉด ... "location.href='"+ url + "'" ์คํํด๋ผ
//location.href ์ด๋
//location.href'httl://www.daum.net'
}

//JAVA: public int myFunc(int i, int j, int k) {return i+j+k;}
function myFunc(i,j,k){
return i+j+k;
}

let result = myFunc(10,20,30);
console.log("result: " + result);
}

</script>
</head>
<body>
<hr3>๋ด์ฅํจ์, ์ฌ์ฉ์ ์ ์ ํจ์</hr3>
<br>
<button onclick="">ํด๋ฆญ ์ฌ๊ฑด ๋ฐ์(ํจ์(ํ์))ํธ์ถ</button>
<br>
<button onclick="showPopup()">ํ์์ฐฝ</button>
<br>
<button onclick="">ํ์ Object</button>
<br>
<button onclick="goUrlTime('http://www.daum.net')">3์ดํ ์ด๋</button>
</body>
```
<br>

### ๐ ์ต๋ชํจ์
- ์ผํ์ฑ ํจ์
- function(){}
- callbackํจ์(ํ๋ก๊ทธ๋จ ๋ผ๋ฆฌ(ํ๋ฆ)์ ์ํด์ ์๋์ผ๋ก ํธ์ถ๋๋ ํจ์) -> 1์ด๋ง๋ค, ์ฌํธ์ถ, ์ต๋ชํจ์๊ฐ ... 
```js
let mytime = window.setInterval(function(){  //์ต๋ช(์ฝ๋ฐฑ)ํจ์
    let d = new Data(); //JAVA: Date d = new Date();
    let t = d.toLacaleTimeString();
    document.getElementById("time").innerHTML=t;
}, 1000);

//mytime == setInterval
function myTimeStop(){
    window.clearInterval(mytime);
}
```





