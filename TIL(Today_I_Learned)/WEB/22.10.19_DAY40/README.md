# 2022.10.19. WED ๐
----------------
<br>

## 1. ์ค์  ์กฐ๋ณ ๊ณผ์  โ
- ์ํ์งํฅ์์์ ์ผ์ผ ์ํ ๋ฐ์ค์คํผ์ค api๋ฅผ ๊ฐ์ ธ์์ ํ์ด๋ธ์ ๋ฃ์ด๋ณด๊ธฐ
```js
<body>

    <table class="table" id="table">

        <thead class = "thead-light">
            <tr>
                <th>์์</th>
                <th>์ํ์ ๋ชฉ</th>
                <th>๊ฐ๋ด์ผ</th>
                <th>๊ด๊ฐ์ ์ฆ๊ฐ ๋น์จ</th>
                <th>์ผ์ผ ๊ด๊ฐ์</th>
            </tr>
        </thead>
    </tbody id="table">
    </table>
</body>


<script>

    let data = (์ฌ์ดํธ์์ ๊ฐ์ ธ์จ๊ฑฐ ๋ฃ๊ธฐ)

    
window.onload = function(){

    let table = document.getElementById('table'); 


    let list = data.boxOfficeResult.dailyBoxOfficeList;

    for( let i = 0; i < 10; i++ ) {
        // let resultBody = document.createElement('resultBody');
        let tr = document.createElement("tr");
        let td = [document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td')];

        td[0].appendChild(document.element.rank);
        td[1].appendChild(document.element.movieNm);
        td[2].appendChild(document.element.openDt);
        td[3].appendChild(document.element.audiChange);
        td[4].appendChild(document.element.audiInten);

        tr.appendChild(td[0]);
        tr.appendChild(td[1]);
        tr.appendChild(td[2]);
        tr.appendChild(td[3]);
        tr.appendChild(td[4]);
        
        console.log(tr);
        console.log(table);
        table.appendChild(tr);
    }
 }
   
</script>

```
![images](https://cafeptthumb-phinf.pstatic.net/MjAyMjEwMTlfMjI4/MDAxNjY2MTcxMDQ4Mjc5.fDvQzWHTJ_LnfbPLIM9CUVQ7WmN2eIrf5Y-AB280F2gg.bvbemAPQ4XjsU3dFz1QvAOxJwfSMBxuACIRcu01d2Gwg.PNG/image.png?type=w1600)


## 2. ETC Try โ
```js
<body>
	<!-- <p id="demo"></p> -->
	<input type="text" id="demo">
	<button onclick="myFunc()">TEST INPUT</button>
	<p id="p01"></p>
</body>
<script type="text/javascript">
		/*
		try{
			add("welcome!!");
		}catch(err){
			document.getElementById("demo").innerHTML = err.message;
		}
		*/
		function myFunc(){
			let message , x;
			message = document.getElementById("p01");
			message.innerHTML="";
			
			x = document.getElementById("demo").value;
			
			try{
				if(x == "") throw "empty";	
				if(isNaN(x)) throw "not a number";
				X = Number(x);
				if(x < 5) throw "too low";
				if(x > 10) throw "too high";
			}catch(err){ //๋ด๋ถ์ ์ผ๋ก ์์ฑ๋ ์์ธ ๊ฐ์ฒด์ ์ฃผ์๋ฅผ ๋ฐ๋๋ค 
				message.innerHTML = "input is " + err;
			}finally{
				document.getElementById("demo").value="";
			}
		}
	</script>
</html>
```
<br>

## 3. Arrow Function โ
- https://www.w3schools.com/js/js_arrow_function.asp
<br>

#### ๐ ๋งค๊ฐ๋ณ์๊ฐ ์๋ ํจ์ ๊ตฌํ
```js
let bar = () => console.log("bar....");
bar();
```
<br>

#### ๐ ๋งค๊ฐ๋ณ์ 1๊ฐ  return ํจ์
```js
//let foo2 = function(x) { return x}
let foo2 = x => x;
let data = foo2(100);
console.log(data);

let hello;
//hello = function(val){return "hello" + val}
//hello = (val)=> "hello" + val;
hello = val => "hello" + val;
let v = hello("aaaa");
console.log(v);
document.getElementById("demo").innerHTML = hello("๋ฐฉ๊ฐ๋ฐฉ๊ฐ");
```
<br>

#### ๐ ๋งค๊ฐ๋ณ์๊ฐ 2๊ฐ ์ด์์ธ ๊ฒฝ์ฐ
```js
//function call(a,b){}
//let foo3 = (a,b) => {return a + b};
let foo3 = (a,b) => a + b;
let v2 = foo3(10,20);
console.log(v2)
```
<br>

#### ๐ ํจ์์ ์ฌ๋ฌ๊ฐ์ ๋ผ๋ฆฌ๊ฐ ํฌํจ๋๋ค๋ฉด { ๊ตฌํ  }
```js
let foo4 = (a,b) => {let c = 100; return a+b+c};
let v3 = foo4(100,100);
console.log(v3)
```
<br>

#### ๐ ์ฆ์ ์คํ ํจ์
```js
(
    function(){
        console.log("์ฆ์ ์คํ ํจ์ ....");
        //ํจ์๋ ํธ์ถ์ ์ํด์ ์คํ
    }()		
);
//์ ์ฝ๋๋ฅผ
//ํ์ดํ ํํ์์ผ๋ก ๋ฐ๊พธ์ด ๋ณด์ธ์
(
    ()=>{console.log("์ฆ์ ์คํ ํจ์ ....")}
        //ํจ์๋ ํธ์ถ์ ์ํด์ ์คํ
    )();

```
<br>

#### ๐ 1.๋ฒ์์ ํ ๊ณผ์ ๋ฅผ forEach๋ฅผ ์ฌ์ฉํด ๋ฐ๊ฟ๋ณด๊ธฐ
```js
let list = data.boxOfficeResult.dailyBoxOfficeList;

list.forEach(element => {
console.log(element);

let tr = document.createElement("tr");
let td = [document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td'), document.createElement('td')];

td[0].appendChild(document.createTextNode(element.rank));
td[1].appendChild(document.createTextNode(element.movieNm));
td[2].appendChild(document.createTextNode(element.openDt));
td[3].appendChild(document.createTextNode(element.audiChange));
td[4].appendChild(document.createTextNode(element.audiInten));

tr.appendChild(td[0]);
tr.appendChild(td[1]);
tr.appendChild(td[2]);
tr.appendChild(td[3]);
tr.appendChild(td[4]);

console.log(tr);
console.log(table);
table.appendChild(tr);
    })
```