# 2022.10.18. TUE π
----------------
<br>

## 1. λ°μ΄ν° λͺ¨λΈλ§ - μ κ·ν β
- 1μ°¨ μ κ·ν : λͺ¨λ  μμ±μ μμκ°μ κ°μ§, λ³΅μμ μμ±κ°μ κ°μ§λ μμ±μ λΆλ¦¬
- 2μ°¨ μ κ·ν : μ£Όμλ³μμ μ’μμ μ΄μ§ μμ μμ±μ λΆλ¦¬, λΆλΆ μ’μ μμ±μ λΆλ¦¬ - λΆλΆν¨μμ’μμ±
- 3μ°¨ μ κ·ν : μμ±μ μ’μμ μΈ μμ±μ λΆλ¦¬, μ΄μ  μ’μ μμ±μ λΆλ¦¬ - μ΄νν¨μμ’μμ±
- λ³΄μ΄μ€-μ½λ μ κ·ν : λ€μμ μ£Όμλ³μ λΆλ¦¬
- 4μ°¨ μ κ·ν : μμκ°μ λ€μ€μμ± μ κ±° - λ€μ€μ’μμ±
<br>   
      
### π Q) μ κ·ν μ‘°λ³κ³Όμ !
#### 1λ² - μΉλ³΅λ
[κΈ°μ‘΄ νμ΄λΈ]   
![image](https://user-images.githubusercontent.com/111114507/196319386-edd9a5d3-8109-4a0c-ba22-f7a74a52a3a3.png)
[μ κ·ν]  
![image](https://user-images.githubusercontent.com/111114507/196325066-a51fed8f-94b3-4f75-b4db-dcab782ee521.png)
<br>

#### 2λ² - λμ¬λ
[κΈ°μ‘΄ νμ΄λΈ]   
![image](https://user-images.githubusercontent.com/111114507/196319514-fd52f12e-b44a-4d52-b59a-8ef48517e05e.png)
[μ κ·ν]  
![image](https://user-images.githubusercontent.com/111114507/196325037-def1a905-10fb-4072-8215-6456ee062a5b.png)
- μ  3 μ κ·νκΉμ§ μͺΌκ°λ©΄ μ‘°νμ μ΄λ €μμ§ μ μλ€λ νΌλλ°±!
<br>

#### 3λ² - μλ¨λ   
[κΈ°μ‘΄ νμ΄λΈ]   
![image](https://user-images.githubusercontent.com/111114507/196319618-f660b81d-399f-4e89-ab58-f20a3f15f70e.png)
[μ κ·ν]  
![image](https://cafeptthumb-phinf.pstatic.net/MjAyMjEwMThfMjY5/MDAxNjY2MDYxOTYyODQ4.yM9Dg_YIHVO5YcL2CsR2oxsWWXD8xP5OfRBhWsUuXfIg.mFfFQpLI-KedY_1jzicJ0jVv_lOIJn4Ow6Of09eVOhgg.JPEG/h3.JPG?type=w1600)
<br>

#### 4λ² - λ
[κΈ°μ‘΄ νμ΄λΈ]   
![image](https://user-images.githubusercontent.com/111114507/196319700-7f89db82-1c60-441c-a7fe-e45910df4209.png)
[μ κ·ν]  
![image](https://user-images.githubusercontent.com/111114507/196324437-b09660e1-a7ba-4dec-a6e1-76c1e89725c4.png)
<br>

## 2. JSON β
- μλ°μ€ν¬λ¦½νΈλ‘ κ°μ²΄λ₯Ό νκΈ°νλ λ°©λ²
```js

    let product = {μ νλͺ: 'μ¬κ³Ό', λλ : '2000', μμ°μ§ : 'λκ΅¬'};
    console.log(product);
    console.log(product.μ νλͺ);
    console.log(product.μμ°μ§);
    console.log(product.toString());

    //κ°μ²΄ {} >> λ¦¬ν°λ΄ >>JSON
    let Person = {
        name:"νκΈΈλ",
        addr:"μμΈμ κ°λ¨κ΅¬ μ­μΌλ",
        eat: function(){
            document.write(this.name + "/" + this.addr + "/" + food + "λ λ ")
        }
    };

    document.write("<hr>");
    Person.eat("μ¬κ³Ό"); //eatν¨μ νΈμΆ

    //1. μμ± μ κ±° κΈ°λ₯
    delete(product.λλ);
    console.log(product);

    for (let key in product) { //λ³μλͺ key
        console.log("key : " + key);
        console.log(product[key]);
    }

    for(let key in person){
        console.log("key : " + key + "=" + Person[key]);
    }
    
```
```js
<script type="text/javascript">
    //1. λ°°μ΄ >> [] >> let arr=[]; >> push(), pop()
    //2. JSON >> {} >> let obj = {}; >>obj.μμ±λͺ, obj.ν¨μλͺ

    //μ°λ¦¬κ° μνλ λ°μ΄ν°λ λ¨μνμ§ μμμ
    //λ μ¨, μν μ λ³΄, μ§νμ²  μ λ³΄ λ°μ΄ν°, μνλ μ λ³΄λ₯Ό μΆμΆ(OPEN API) >> xml, json
    //μ΄λ° λ°μ΄ν° κ°νμ κ°μ²΄, κ°μ²΄μμ λ°°μ΄, λ°°μ΄μμ κ°μ²΄κ° νΌμ¬ ... μνλ κ°λ§ μΆμΆ

    let students = [];
    students.push({μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)
    students.push({μ΄λ¦:"μλ¬΄κ°", κ΅­μ΄:100, μμ΄: 50}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)
    students.push({μ΄λ¦:"μ΄μμ ", κ΅­μ΄:10, μμ΄: 100}); //λ°°μ΄μ 0λ²μ§Έ λ°©μ κ°μ²΄ (JSON)

    //[{}{}{}]
    //κΈ°μ‘΄μ λ§λ€μ΄μ§ κ°μ²΄μ ν¨μ μΆκ°
    for(let index in students) {
        //students[index] >> {μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60}
        students[index].getSum = function() {return this.κ΅­μ΄ + this.μμ΄}
        students[index].getAvg = function() {return this.getSum()/2}
    }

    //{μ΄λ¦:"νκΈΈλ", κ΅­μ΄:80, μμ΄: 60, getSum:function ... , getAvg:function}
    console.log(students);

    for(let index in students) {
        console.log(students[index].μ΄λ¦);
        console.log(students[index].getSum());
        console.log(students[index].getAvg());
    }

</script>
```
<br>

### π [κ°μ²΄ λ°μ΄ν°]λ₯Ό [λ¬Έμμ΄ λ°μ΄ν°]λ‘
```js
//login.jsp?name = json&age = 30 & city = seoul
let stringobj = JSON.stringify(MyObj); //POINT
console.log(stringobj); //'name:"john", age:30, city:"seoul"'
console.log(typeof(stringobj));
```
<br>

### π [λ¬Έμμ΄ λ°μ΄ν°λ₯Ό] [κ°μ²΄ λ°μ΄ν°λ‘]λ‘
```js
let stringstr = 'name:"john", age:30, city:"seoul"';
console.log(stringstr);
console.log(typeof(stringstr));

let Myjson = JSON.parse(stringstr);
console.log(Myjson);
```
<br>

### π POINT
```js
console.log(Myjson.name); //μ κ·Ό: κ°μ²΄ μμ±λͺ
console.log(Myjson["name"]); //μ κ·Ό : κ°μ²΄["μμ±λͺ"] μκΈ°
```
<br>

### Q) JSONμΌλ‘ μ΄λ―Έμ§ μ¬λΌμ΄λ λ§λ€κΈ°
[λ¬Έμ ]  
```js
"m" κ°μ κ°μ§κ³  μμ https:\/\/live.staticflickr.com\/65535\/52421936483_165a532d02_m.jpg
λ°°μ΄μ λ£μΌμΈμ
let images = [];
μ¬λΌμ΄λ λ§λ€κΈ°
```
```js
<script>
window.onload=function(){
    let images= [];

    for(let index in data.items) {
        images.push(data.items[index].media.m);
    }

    
    let index = 1;

    document.getElementById("prv").addEventListener("click", function(){
        if(index == 1) {
            index = images.length;
        }

        document.getElementById("imgs").src = images[--index];
    });

    document.getElementById("next").addEventListener("click", function(){
        if(++index == images.length){ 
            index = 0;
        }

        document.getElementById("imgs").src = images[index];
    });
}
</script>
```
</head>
<body>
    <h3>JSON API μ¬λΌμ΄λ</h3>
    <img src="anna.png" alt="μ΄λ―Έμ§λ₯Ό λ‘λνλλ°μ μ€ν¨νμ΅λλ€." id="imgs" width="300" height="300">
    <hr>
    <a href="#" id="prv">μ΄μ </a>||<a href="#" id="next">λ€μ</a>
</body>
</html>