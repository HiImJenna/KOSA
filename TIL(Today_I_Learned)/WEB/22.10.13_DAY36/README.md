# 2022.10.13. THU π
----------------
<br>

## 1. Javascript - Function β
### π eval ()
- λ¬Έμν μμ > κ³μ°μμΌλ‘ >> "10+20+30" >> eval() >> 10+20+30 >> κ³μ°
- "10+20+30" >> Error
- λ¬Έμν μ«μ -> μ«μ
```js
document.write("eval()" + eval(str) + "<br>");
```
<br>

### π isNaN ()
- Not a Number
- λ μ«μ μλλ > true > false(μ«μ)
```js
document.write(isNaN("12345") + "<br>"); //false
document.write(isNaN("12345A") + "<br>"); //true
document.write(isNaN("λνλ―Όκ΅­") + "<br>"); //true
document.write(isNaN('12345') + "<br>"); //false
```
<br>

### π λ¬Έμμ΄ ν¨μ refer
- https://www.w3schools.com/js/js_string_methods.asp
<br>

### π μ«μ ν¨μ(Number)
- https://www.w3schools.com/js/js_number_methods.asp
<br>

## 2. Event β
- onchange : An HTML element has been changed
- onclick : The user clicks an HTML element
- onmouseover : The user moves the mouse over an HTML element
- onmouseout : The user moves the mouse away from an HTML element
- onkeydown : The user pushes a keyboard key
- onload : The browser has finished loading the page
```js
      function bodyload(){
         console.log("load");
         //λ³΄μ₯μ λ°λλ€
         //******bodyμμ μλ λͺ¨λ  μμλ₯Ό κ°μ§κ³  λ μ μλ€.
         let data = document.myform.money.value;
         console.log(isNaN(data));         
      }
      
      function focusFunc(){
         document.getElementById("myinput").style.background="gold";
      }
      
      function blurFunc(){
         document.getElementById("myinput").style.background="white";
      }
      
      function selectTag(){
         let value = document.myform.sel.value;
         alert(value);
      }

      function changeColor(obj){
        //JAVA : this (κ°μ²΄μμ )
        //JavaScript : this (POINT) (μμ :μμμμ )
        console.log(obj); //<input type="text" onmouseover="changeColor(this)"
        obj.style.backgroundColor="gold";

      }

      function changeColor2(obj){
        //JAVA : this (κ°μ²΄μμ )
        //JavaScript : this (POINT) (μμ :μμμμ )
        console.log(obj); //<input type="text" onmouseover="changeColor(this)"
        obj.style.backgroundColor="white";
        
      }

   </script>
</head>
<body onload="bodyload()">
   <form action="#" name="myform">
      <input type="text" id="myinput" name="myinput" onfocus="focusFunc()" onblur="blurFunc()">
      <br>
      <select name="sel" onchange="selectTag()">
         <option value="A">AA</option>
         <option value="B">BB</option>
         <option value="C">CC</option>
         <option value="D">DD</option>
      </select>
      <br>
      <input type="text" onmouseover="changeColor(this)" onmouseout="changeColor2(this)">
      <br>
      <input type="text">
      <br>
      <input type="text" value="1000" name="money">
   </form>
</body>
```
<br>

## 3. Javascript - λ΄μ₯ κ°μ²΄ β
### π Date()
```js
 let today = new Date();
console.log(today);
console.log(today.getFullYear());
console.log(today.getMonth() + 1);
console.log(today.getDate());
console.log(today.getHours());
console.log(today.getMinutes());
console.log(today.getSeconds());
```
<br>

```js
console.log(Math.random()); //0<=λ²μ<1
console.log(parseInt(Math.random)*45 + 1);
```
<br>

```js
console.log(Math.random(3.5678)); //4 λ°μ¬λ¦Ό
console.log(Math.max(3, 8, 99, 55, 10));
```
<br>

### π write()
```js
with(document){
write(str + "<br>");
write(str.lenth+"<br>");
write(str.charAt(2)+"<br>");
write(str.indexOf("D")+"<br>");
write(str.concat("νκΈΈλ")+"<br>")
}
```
<br>

#### - λ¬Έμμ΄ν¨μ
- substring(start, end)
```js
//str="ABCDE"
write(Str.substring(2,4)+"<br>"); //CD
write(Str.substring(1,1)+"<br>"); //
write(Str.substring(1,2)+"<br>"); //μκΈ°μμ  B
write(Str.substring(2,4)+"<br>"); //BCDEF
```
-  split(" ")
```js
let strarr = "A B C D";
let arr = strarr.split(" ");
write(arr); //toString() μ¬μ μ -> javascript Arrayκ°
```