# 2022.11.02. WED π
----------------
<br>

## 1. jQuery Intro β
- jQuery is a JavaScript Library.
- jQuery greatly simplifies JavaScript programming.
- jQuery is easy to learn.
- The jQuery library contains the following features : 

```
- HTML/DOM manipulation
- CSS manipulation
- HTML event methods
- Effects and animations
- AJAX
- Utilities
```

1. jquery.com κ³΅μμ¬μ΄νΈ(λ²μ  λ€μ΄λ‘λ , νμ΅(API))
2. https://www.w3schools.com/jquery/default.asp
3. Jquery
- HTML/DOM manipulation (μΆκ° , λ³κ²½ , μ­μ )
- CSS manipulation
- HTML event methods
- Effects and animations
- AJAX  (λΉλκΈ° μ²λ¦¬ ^^)
- Utilities
4. Jquery(Javascript λΌμ΄λΈλ¬λ¦¬ (ν¨μμ μ§ν©)) >> *.js λ°°ν¬
- <jquery μ¬μ©λ°©λ²> : js νμΌλ§ λ°°ν¬ .....

```
- λ€μ΄λ‘λ λ°μμ λ΄ μλ²μμ λ°°ν¬ (μμ€ μμ , μΆκ° )(281kb)  
- Download the uncompressed, development jQuery 3.5.1   
- νΈμ§νμ§ μκ³  λ°°ν¬ (88kb)  
- Download the compressed, production jQuery 3.5.1  
- CDN λ°©μ(λ§ν¬λ§ κ±Έμ΄μ μΈλΆμ¬μ΄νΈ(κΈλ‘λ²) λ°°ν¬ κΆμ₯)
- μμ μ μΈ λ€μ΄λ‘λ μ κ³΅
```

5. jquery version (μΉ λΈλΌμ°μ Έ νΈνμ± μ§μ)
1.3.x ~ 3.5.x  
1.x.x ~ 3.x.x  
3.x : νμ¬ μ¬μ© (κΈ°μ‘΄ νμμλ κ²μ μ κ±° , μλ‘μ΄ κ²μ μΆκ°)  
- νμ¬ (1.x λ²μ  κ°λ° ....... >> μ¬μ₯λ 3.x)
- λ¬Έμ λ κΈ°μ‘΄ μμ€κ° 1.x λ²μ μ μλ ν¨μ(add() ) ->> 3.x *(add() μ­μ  addOn() )
- μ½λ add() . add() >> 3.x >> ν΄κ²° >> μμ€μ μλ add() >> addOn()
- migrate : νμ λ²μ  νΈμμ± (μ¬λΌμ§ μμ) >> add()
Download the compressed, production jQuery Migrate 1.4.1
<br>

```javascript
/*
window.onload=function(){
    document.getElementById("btn").onclick=function() {
        alert("DOM Script");
    }
}
*/

$(document).ready(function() {
    $('#btn').click(function() {
        $(this).hide(); //button κ°μΆκΈ°
    });
});
```
<br>

## 2. jQuery Selector β
```javascript
//μ νμ
//https://api.jquery.com/ μ¬μ΄νΈμμ API κ²μνκ³  μ°Ύμμ μ¬μ©
$('body > *').css("color", "gold"); //μμ μ νμ
$('div > *').css('color','red'); //div μμ μμ
$('input[type=text]').css("color", "green"); //μμ± μ νμ
/*
DOM script : text, value (innerHtml,innerText)

jQuery
3κ°ν¨μ (val(), text(), html()) > κ°μ read, write > getter, setter
ex) val('νκΈΈλ') > write(setter)
ex) val() > read(getter)

jQuery id νμ©
<input type="text" id="userid" value="aaa">
>> $('#userid').val() >> aaa κ°μ λ°μ μ μλ€

<input type="text" id="userid" value="aaa">
>> $('#userid').val("bbb") >> id="userid" value="bbb">

DOM > document.getElementById("userid") value="id">

*/
```
<br>

### π read
- μ²μ λ§λλ μμ
```javascript
console.log($('input[type=text]').val());
```
<br>

### π write
- λͺ¨λ  μμ μ μ© κ°λ₯
```javascript
$('input[type=text').val("hong");

$('input[type=password').val("11111"); //λͺ¨λ  μμμ μ μ©

$('tr:odd').css("background", "gray"); //1,3,5 //tr:odd - > νμμ μ©
$('tr:even').css("background", "pink"); //0,2,4 //tr:even -> μ§μμ μ©
```
<br>

### π jQueryνκ³  javascript κ°μ΄ μ¬μ©
```javascript
setTimeout(function(){
    let value = $('select > option:selected').val();
    alert("select tag value : " + value);
    
}, 3000) //3000 = 3μ΄
```
<br>

[νλ©΄]  
![image](https://user-images.githubusercontent.com/111114507/199448862-ff7c864a-b917-4f99-9bff-b7a83e2374d4.png)
<br>

## 3. jQuery Event β
<details>
<summary>code</summary>

```javascript
    <script>
      $(function () {
        $('#btncopy').click(function(){
         // let data= $('#txtuserid').val();
          // $('#txtcopyuserid').val(data);
          $('#txtcopyuserid').val($('#txtuserid').val());
        });
        //select νκ·Έ
        $('#select_hobby').change(function(){//κ°μ λ³νκ° μΌμ΄λλ©΄
          const text=$(':selected').text();
          console.log(text);
  
          const text2=$('#select_hobby option:selected').text();
          console.log(text2);
  
          const val=$('#select_hobby').val(); //value μλ κ²½μ° text value κ°μΌλ‘
          console.log(val);
        });

        $('#txtpwd2').keyup(function(){
            if($('#txtpwd').val() != $('#txtpwd2').val()) {
                //div p νκ·Έ : innerText, innerHTML
                $('#message').text("<h3>μνΈκ° μΌμΉνμ§ μμ΅λλ€</h3>") //νμ€νΈ κ·Έλλ‘ μ λ¬
            } else{
                $('#message').html("<h3>μνΈκ° μΌμΉν©λλ€</h3>") //μ½λ μ μ©
            }
        });
      });
  
    </script>
```
</details>

- .text()μ .html() μ°¨μ΄ 
![image](https://user-images.githubusercontent.com/111114507/199377002-eb503342-af54-4b94-a70c-0dd0900eee62.png)     
![image](https://user-images.githubusercontent.com/111114507/199377098-f8ea7419-81e2-4868-ac5b-0564f7a1578e.png)     
<br>

### π Quiz

```
- body μμ μλ λͺ¨λ  input νκ·Έ focusκ° μ€λ©΄ input νκ·Έ background-color gray
- body μμ μλ λͺ¨λ  input νκ·Έ blurκ° μ€λ©΄ input νκ·Έ background-color white
```

```javascript
$('input').focus(function(){ //μ»€μκ° λ€μ΄μμ λ
    console.log(this); //$(this).action()
    $(this).css('background-color', 'gray')
});

$('input').blur(function(){ //μ»€μκ° λκ°μ λ
    console.log(this); //$(this).action()
    $(this).css('background-color', 'pink')
});
```
- focus : μ»€μκ° μ¬λΌκ°μ λ
- blur : μ»€μ λκ°μ λ
![image](https://user-images.githubusercontent.com/111114507/199378020-ae3e223d-bdef-4684-8d84-fff7eaf559e4.png)  
<br>

## 4. jQuery method β
- addClass() - Adds one or more classes to the selected elements
- removeClass() - Removes one or more classes from the selected elements
- toggleClass() - Toggles between adding/removing classes from the selected elements
- css() - Sets or returns the style attribute
```javascript
$('#btnclick').on('mouseover',function(){
    document.getElementById("btnclick").style.backgroundColor="red";
});

$('#btnclick').on('mouseout',function(){
    document.getElementById("btnclick").style.backgroundColor="white";
});

$('#btnclick2').on('click',function(){
    $('#btnclick').off('click');
});

//jquery μ’μνλ μ½λ parameter κ°μ²΄(json)
$('#stylediv').on(
    {
        mouseover:function(){ $('#stylediv').addClass('greencolor');  },
        mouseout:function(){
            $('#stylediv').removeClass('greencolor');
            $('#stylediv').addClass('bluecolor');  
        }
    }		
)

```
<br>

## 5. jQuery content β
```javascript
$(function(){
    $('#btn1').click(function(){
        alert("text : " + $('#test').text()); //getter
    });
    
    $('#btn2').click(function(){
        alert("html : " + $('#test').html()); //getter (νκ·ΈμΈμ )
    });
    
    $('#btn3').click(function(){
        //$('#test').html("<div>AAAAA</div>");
        $('#test').html("<div>AAAAA</div>");
        $('#test').text("<div>AAAAA</div>");
    });
});

```
<br>

## 6. jQuery Form β
```javascript
<script type="text/javascript">
$(function(){
    //Form μμ μμλ€μ jQuery
    $('#txtname').val("hong");
    console.log( $('#txtname').val());

    //1. radio κΈ°λ³Έ κ° μ€μ νκΈ° (checked) μμ±
    $("input:radio").val(['F']); //F κ°μ κ°μ§ μμ checked

    console.log($('input:radio').val()); 
    console.log($('input:checked').val());

});
</script>
```
- radio nameκ°μ΄ λκ°μΌλκΉ λ°°μ΄λ‘ μκ°ν΄μ []μμ λ£μ΄μ€μΌν¨
- μ¬λ¬κ°μ radioκ° checked λμ΄μμΌλ©΄ μ²μ λ§λλ κ²μΌλ‘ λΈ
- π κ·Έλ λ€λ©΄ μ¬λ¬κ°μ radio μμλ?
```javascript
console.log($('input:radio[name=gender]:checked'))
```
<br>

### π Quiz

```
btnok ν΄λ¦­νμ λ,
isF2 νκ·Έμ μ νλ μμμ κ°λ€μ λͺ¨λ μΆλ ₯ (hint : array)
```

```javascript
console.log(data);
$('#btnok').click(function(){
    const data = $('#isF2').val();
    console.log(data);
    for(let index in data){
    console.log("value : " + data[index]);
    }
}
```
<br>

## 7. jQuery each β
### π [javascript]
1. for(let index in Arrays){Array[index]}
2. Object(JSON) : for(let key in jsonObj){jsonobj[key]}
3. array.forEach(function(value,index,array){})     μΆκ°) array.map()...
<br>

### π[jQuery] $().each() λ°λ³΅λ¬Έ //μ νλ μμλ₯Ό λ°λ©νκ² λ€.
1. $(selector).each(function(){});  >> ex) $('p').each(function(){ thisνμ© });
2. $(selector).each(function(index){ thisνμ© });
3. $(selector).each(function(index, element){ element });  <- μ μΌ λ§μ΄ μ°μ΄λκ² ^^
<br>

### π[jquery] $.each()
1. $.each(Array or Object, function(){ this νμ© });
2. $.each(Array or Object, function(index){ this νμ© });
3. $.each(Array or Object, function(index, element){ this νμ© });
<br>

### πparameter JSON κ°μ²΄λΌλ©΄
```javascript
let obj = {name :"νκΈΈλ", age : 100};
$(obj).each(function(key, value){value});
$.each(obj, function(key, value){value};  
```
<br>

## 7. jQuery Append β
- append() - Inserts content at the end of the selected elements
- prepend() - Inserts content at the beginning of the selected elements
- after() - Inserts content after the selected elements
- before() - Inserts content before the selected elements
<br>

## 8. jQuery Append β
- remove() - Removes the selected element (and its child elements) μκΈ°μμ μ­μ (μμμ κ±°)
- empty() - Removes the child elements from the selected element μμμ κ±°
