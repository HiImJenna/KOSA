# 2022.10.17. MON ๐
----------------
<br>

## 1. Javascript - DOM ๊ณ์ธตํธ๋ฆฌ โ
```js
    <script>
        window.onload=function(){
            //DOM ๊ฐ์ฒด ์์ ... 
            //๋ชจ๋  ์์์ ๋ํ ์ฌ์ฉ์ด ๊ฐ๋ฅ ...

            //๊ณ์ธตํธ๋ฆฌ (node ๊ฐ๋ ์ ๊ทผ : ๋ถ๋ชจ, ์์, ํ์  ๊ฐ๋)
            let menode;
            menode = document.getElementById("me");
            menode.style.backgroundColor = "gold";

            let parentnode = menode.parentNode; //body
            parentnode.style.backgroundColor="green";

            let grandnode = parentnode.parentNode; //html
            grandnode.style.backgroundColor="blue";

            let my = document.getElementById("mychild");
            console.log(my);
            console.log(my.firstChild.nodeName);//LI
            console.log(mt.firstChild.innerText); //LI >> AA
            //innerHTML, innerText >> value ์๋ ์น๊ตฌ >> p, div, li, span
            //BB๋ผ๋ Text ๊ฐ์ ๊ฐ์ง๊ณ  ์ค๊ณ  ์ถ์ผ๋ฉด?
            console.log(my.firstElementChild.nextSibling.innerText); //BB

            console.log(my.childNodes);
            //์ง๋ฌธ : mychildNodes return type >> Array
            //[<li>AA</li>][<li>BB</li>][<li>CC</li>]
            console.log(my.childNodes[0]);
            console.log(my.childNodes.length);


        }
    </script>
</head>
<body>
    <div>A</div><div>B</div><div id="me">C</div><div>D</div><div>E</div>
    <ul id="mychild"><li>AA</li><li>BB</li><li>CC</li></ul>
</body>
```

## 2. Javascript - event โ
- ํ๋์ ์์๋ ์ฌ๋ฌ๊ฐ์ event๋ฅผ ๊ฐ์ง ์ ์๋ค.
- ์ด๋ฒคํธ๊ฐ ๋ ์ด์ ํ์ํ์ง ์๋ค๋ฉด removeEventListner() ์ ๊ฑฐ ๊ฐ๋ฅ (๋จ addEvent ์ถ๊ฐ)
```js
<body>
    <button id="mybtn">ํด๋ฆญ</button>
</body>
<script text="text/javascript">
    let x = document.getElementById("mybtn");

    x.addEventListener("mouseover", myFunc);
    x.addEventListener("mouseout", myFunc2);
    x.addEventListener("mouseclick", myFunc3);


    function myFunc(){
        document.getElementById("mybtn").innerHTML += "Mouse Over<br>";
    }
    function myFunc2(){
        document.getElementById("mybtn").innerHTML += "Mouse Out<br>";
    }

    function myFunc3(){
        document.getElementById("mybtn").innerHTML += "Click<br>";
    }

</script>

```
<br>

### ๐ ์บ ์ณ๋ง & ๋ฒ๋ธ๋ง
- #### ์บก์ณ๋ง  
![image](https://joshua1988.github.io/images/posts/web/javascript/event/event-capture.png)
<br>
 
- #### ๋ฒ๋ธ๋ง  
![image](https://joshua1988.github.io/images/posts/web/javascript/event/event-bubble.png)
<br>

## 4. JavaScript - Object โ
### ๐ <ํด๋์ค ์ ์ 3๊ฐ์ง ๋ฐฉ๋ฒ>
#### 1) ํ๋กํ ํ์ ๋ฐฉ์ :  ์ผ๋ฐ์ ์ธ ํด๋์ค ์ ์ ๋ฐฉ๋ฒ
-  ์ธ์คํด์ค๋ง๋ค ๊ณตํต๋ ๋ฉ์๋๋ฅผ ๊ณต์ ํด์ ์ฌ์ฉํ๋ ์ฅ์  
```js
function ํด๋์ค์ด๋ฆ() {
    this.ํ๋กํผํฐ1 = ์ด๊ธฐ๊ฐ;
    this.ํ๋กํผํฐ2 = ์ด๊ธฐ๊ฐ;
}

ํด๋์ค์ด๋ฆ.prototype.๋ฉ์๋1 = function() {

}

ํด๋์ค์ด๋ฆ.prototype.๋ฉ์๋2 = function() {

}

โvar ์ธ์คํด์ค = new ํด๋์ค์ด๋ฆ(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
 ```
 <br>


#### 2) ํจ์ ๋ฐฉ์ : ๊ฐ๋จํ ํด๋์ค ์ ์ ์ ์ฌ์ฉ 
- ์ธ์คํด์ค๋ง๋ค ๋ฉ์๋๊ฐ ๋๋ฆฝ์ ์ผ๋ก ๋ง๋ค์ด์ง๋ ๋จ์ 
- ํด๋์ค :  function Car(){ this.name = , this.age=}
- ํจ์ :   function car(){}
```js
function ํด๋์ค์ด๋ฆ() {
    this.ํ๋กํผํฐ1 = ์ด๊ธฐ๊ฐ;
    this.ํ๋กํผํฐ2 = ์ด๊ธฐ๊ฐ;
        this.๋ฉ์๋1 = function() {
        }

    this.๋ฉ์๋2 = function() {

    }

}

โvar ์ธ์คํด์ค = new ํด๋์ค์ด๋ฆ(); 
var carObj = new Car();
var carObj2 = new Car();
var carObj3 = new Car();
```
<br>

#### 3) ๋ฆฌํฐ๋ด ๋ฐฉ์ : 
- ํด๋์ค ๋ง๋๋ ์ฉ๋๋ ์๋๋ฉฐ ์ฃผ๋ก ์ฌ๋ฌ๊ฐ์ ๋งค๊ฐ๋ณ์๋ฅผ ๊ทธ๋ฃน์ผ๋ก ๋ฌถ์ด ํจ์์ ๋งค๊ฐ๋ณ์๋ก ๋ณด๋ผ๋ ์ ์์ ํจ๊ป ์ธ์คํด์ค๊ฐ ๋ง๋ค์ด์ง๋ ์ฅ์ ์ด ์์           
- ๋จ ์ธ์คํด์ค๋ ์ค์ง ํ๋
```js
{"a" : ๋ฐ์ดํฐ}
```
<br>

### 4) ECMA6 ๋ฒ์ ๋ถํฐ : class ํค์๋ ์ ๊ณต
```js
class Person {
    constructor(name) {
        this._name = name;
    }

    sayHi() {

    console.log(`Hi! ${this._name}`);
    }
}
```
<br>

### ๐ <javascript ๊ฐ์ฒด ์์ฑ>
- ์ค๋ธ์ ํธ ๋ฆฌํฐ๋ด ๋ฐฉ์ (๊ฐ์ฒด๋ฅผ ๋ง๋๋ ๋ฐฉ๋ฒ): ํด๋์ค ์์ฑ๊ณผ  ๋์์ ๊ฐ์ฒด๊ฐ ๋ง๋ค์ด์ง๋ค
- -> ๋ฆฌํฐ๋ด ๋ฐฉ์ >> ์ ์ผ ๊ฐ๋จํ ๋ฐฉ๋ฒ > var obj = {}; //var objarr = [] ๋ฐฐ์ด 
- -> JSON ํ๊ธฐ : {} >> JSON: JavaScript Object Notation
-        โ        ex) var myObj = { "name":"John", "age":31, "city":"New York" };
<br>

```js
//class Product {public String ์ ํ๋ช = "์ฌ๊ณผ"}
//Product p = new Product();
//System.out.Println(p.์ ํ๋ช);

let product = {์ ํ๋ช: '์ฌ๊ณผ', ๋๋ : '2000', ์์ฐ์ง : '๋๊ตฌ'};
console.log(product);
console.log(product.์ ํ๋ช);
console.log(product.์์ฐ์ง);
console.log(product.toString());
```
