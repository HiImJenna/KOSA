# 2022.11.03. TUR ๐
----------------
<br>

## 1. jQuery - DyTag_Add โ
```javascript
$(function(){
    // $('#sdata').change(function(){ //์์ ์ ์ด๋ฒคํธ ์ฐ๊ฒฐ์ด ์๋จ
    //     alert("์ด๋ฒคํธ ์ฒ๋ฆฌ");
    // });
    $(document).on('change', '#sdata', function(){
        alert("์ด๋ฒคํธ ์ฒ๋ฆฌ");
    });
    //ํน์ ์ด๋ฒคํธ๋ฅผ ์คํํ ๋ ์๊ฐ ๊ฐ์ฒด๋ฅผ ์ฐพ์์ ์ฐ๊ฒฐ ๋ฉ์๋๋ฅผ..
});
```
```javascript
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <script>
        $(function(){
            // $('#sdata').change(function(){ //์์ ์ ์ด๋ฒคํธ ์ฐ๊ฒฐ์ด ์๋จ
            //     alert("์ด๋ฒคํธ ์ฒ๋ฆฌ");
            // });
            $(document).on('change', '#sdata', function(){
                alert("์ด๋ฒคํธ ์ฒ๋ฆฌ");
            });
            //ํน์ ์ด๋ฒคํธ๋ฅผ ์คํํ ๋ ์๊ฐ ๊ฐ์ฒด๋ฅผ ์ฐพ์์ ์ฐ๊ฒฐ
        });

        function appendElement() {
            let html = "";
            html += "<select id = 'sdata'>";
                html += "<option>data_1</option>";
                html += "<option>data_2</option>";
                html += "<option>data_3</option>";
                html += "<option>data_4</option>";
            html += "</select>";

            $('#parent').empty(); //remove(์๊ธฐ ์์  ์ญ์ )
            $('#parent').append(html); 
        }

    </script>
</head>
<body>
    <div id="parent"></div>
    <button onclick="appendElement()">Append</button>
</body>
</html>
```
<br>

<hr>

## 2. jQuery - append ๊ณผ์  โ
```
๋ฒํผ ํด๋ฆญ์ ์๋ ฅํ ์นดํ๊ณ ๋ฆฌ์ ์ค๋ช์ด ํ์ด๋ธ์ ์ถ๊ฐ๋๋๋ก ํ์ธ์.
```
```javascript
function appendElement() {
    const category = $('#category').val();
    const explanation = $('#explanation').val();
    let html = `<tr id = 'ndata'>
                    <td>^^</td>
                    <td>${category}</td>
                    <td>${0}</td>
                    <td>${explanation}</td>
                    <td>์ญ์ ๋ ํ  ์ ์๋ค</td>
                </tr>`;
    $('#tbody').append(html); 
}
```
- ๋ฐฑํ๊ทธ (`)๋ฅผ ์ฌ์ฉํ๋ฉด ${category} ํํ๋ก ๊ฐ ๋ฃ๊ธฐ ๊ฐ๋ฅ

<details>
<summary>๋ฐฑํ๊ทธ (`) ์ฌ์ฉํ์ง ์๋๋ค๋ฉด</summary>

```javascript
$(function(){
    let index = 1;
    $('#btn').on('click',function(){
        let html = "";
        html += "<tr>";
        html += "<td>"+ index++ + "</td>";
        html += "<td>"+ $('#category').val() +"</td>";
        html += "<td>0</td>";
        html += "<td>"+ $('#explain').val() +"</td>";
        html += "<td>์ญ์ </td>";
        html += "</tr>";
        $(tab).append(html);
    });
});
```
</details>
<br>

<hr>

## 3. jQuery - AJAX โ
- https://api.jquery.com/category/ajax/
- https://www.w3schools.com/jquery/jquery_ajax_intro.asp
- Jquery ๋น๋๊ธฐ ํจ์๋ ๋ด๋ถ์ ์ผ๋ก XmlHttpRequest ๊ฐ์ฒด๋ฅผ ์ฌ์ฉ
<br>

### ๐ Ajax
- Global Ajax Event Handlers  (10%)
- Helper Functions (10%)
- Low-Level Interface : 30% (๋ชจ๋  ์ต์์ ๊ฐ๋ฐ์ ์ ์ด) >> $.ajax()
- Shorthand Methods   : 50% (๊ธฐ๋ณธ ์ต์์ ๊ฐ์ง๊ณ  ์๋ ํจ์) >> load() , get()
<br>

### ๐ .load() ๋ฐฉ์ (Shorthand Methods)
```javascript
$( "#x" ).load( "y.html");
```
- #x์ y.html์ ๋น๋๊ธฐ๋ก ๋ถ๋ฌ์ค๊ฒ ๋ค
<br>

```javascript
$( "#x" ).load( "y.html"), function() {
}
```
- callback ํจ์
<br>

```javascript
$(function(){
    $('btn').click(function(){
        //๋น๋๊ธฐ ์๋ฒ์ ์์ฒญ
        //Jquery > .loadํจ์
        //Ex01_Server_Date.jsp?msg=hello
        $('#display').load("Ex01_Server_Date.jsp", {"msg":$('#msg2').val()},
                function(responceText, textStatus, xhr){
                //ํจ์๋ ์๋ต์ด ์ค๋ฉด ์๋ ํธ์ถ > readyState > 4๋ฒ์ด๋ผ๋ฉด
                //responseText > ์๋ฒ๊ฐ ์๋ตํ ๊ฒฐ๊ณผ๋ฌผ (html or text)
                // textStatus (์ฑ๊ณต(success), ์คํจ(fail))
        });
    });
});
```
- msg2์ ์๋ ฅํ ๊ฐ์ .val()์ผ๋ก read ํด์ msg์ ๋ฃ์ด์ค๋ค.
<br>

### ๐ $.ajax() ๋ฐฉ์ (Low-Level Interface)
```javascript
$(function(){
    $('#message').click(function(){
        //๋น๋๊ธฐ ํจ์ ํธ์ถ
        $.ajax(
            {
                url:"Ex02_Server_menu.html",
                dataType:"html", //์๋ฒ๊ฐ ํด๋ผ์ด์ธํธ์ ์๋ตํ๋ ๋ฐ์ดํฐ๋ ์์ํ htmlํ์
                success:function(responsetext){//์๋ต์ด ์๊ณ  .. ๊ทธ ์๋ต์ด ์ ์๊ฑด์ด๋ผ๋ฉด ์๋ํธ์ถ ์ฝ๋ฐฑ
                    $('#menudiv').html($(responsetext).find('li'));   
                }
            }         
        );
    });
});
```
- message ํด๋ฆญ์
- ๋ถ๋ฌ์ฌ ํ์ผ url์ผ๋ก ์ ๊ณ 
- ๊ทธ ํ์ผ์ ํ์ฅ์๋ฅผ dataType
- responseText์ ๊ทธ ํ์ผ์ ์๋ ๊ฐ๋ค์ ๋ฃ์ด์, find('li')๋ก li๋ง ๊ณจ๋ผ์ menudiv์ ๋ฃ์ด์ค๋ค.

<br>

## 4. jQuery - Shorthand Methods โ
### ๐ $.get()
- The $.get() method loads data from the server using a HTTP GET request.
- HTTP GET ์์ฒญ์ ํ์ฌ ์๋ฒ๋ก๋ถํฐ ๋ฐ์ดํฐ๋ฅผ ๋ก๋ ํ๋ค.
```javascript
$.get(
    "Ex04_Company.xml",
    function (data) { // ์๋ต์ด ์๊ณ .. ๊ทธ ์๋ต์ด ์ ์
        // ์ ์์ด๋ผ๋ฉด
        console.log(data);
        $('#display').empty();
        //console.log($(data).find('Company'));
        //return Array
        // ์ฌ๋ฌ๊ฐ $.each() $().each
        $(data).find('Company').each(function(){
            console.log("this : " + this);
            console.log(this);
            let entry = $(this);
            let html = "<div>" + entry.attr('CompanyType') + "</div>";
                html += "<div>" + entry.find('CompanyName').text() + "</div>";
                html += "<div>" + entry.find('CompanyNumber').text() + "</div>";
                html += "<div>" + entry.find('CompanyAddress').text() + "</div>";
                html += "<div>" + entry.find('Name').text() + "</div>";
            $('#display').append(html);
        })
    }
)
```
#### [xml]  
```xml
<Companys>
	<Company CompanyType="private">
		<CompanyName>Bit</CompanyName>
		<CompanyNumber>2019</CompanyNumber>
		<CompanyAddress>์์ธ์ ์์ด๊ตฌ</CompanyAddress>
		<Name></Name>
	</Company>
	<Company CompanyType="crop">
		<CompanyName>kakaT</CompanyName>
		<CompanyNumber>2020</CompanyNumber>
		<CompanyAddress>์ ์ฃผ ์๊ทํฌ์</CompanyAddress>
		<Name></Name>
	</Company>
</Companys>
```
- $.get( "Ex04_Company.xml", : "Ex04_Company.xml" ๊ฐ์ ์์ฒญํด์ ๋ฐ์์์ function (data)์ data์ ์ ์ฅํ๋ค.
-  $(data).find('Company').each(function(){ : ๊ทธ data์์ 'Company'๋ฅผ ์ฐพ์์ for๋ฌธ์ฒ๋ผ ๋๋ฉด์ ...
- let entry = $(this); : ์ฌ๊ธฐ์ this๋ data, ์ด ๊ฐ์ entry์ ์ ์ฅ
- let html = "div" + entry.attr('CompanyType') + "/div"; : CompanyType์ ์์ฑ์ด๊ธฐ์ attr์ผ๋ก ๊ฐ์ ธ์์ผ ์ถ๋ ฅ์ด ๋จ!!
- $('#display').append(html); : display์ let html append ํด์ค๋ค.
<br>

### ๐ $.post()
- The $.post() method loads data from the server using a HTTP POST request.
- HTTP POST ์์ฒญ์ ํ์ฌ ์๋ฒ๋ก๋ถํฐ ๋ฐ์ดํฐ๋ฅผ ๋ก๋ ํ๋ค.
- ์ ์กํ  ๋ฐ์ดํฐ๋ฅผ ์ ์ํ๋ ๋ถ๋ถ์ ์ ์ธํ๊ณ  $.get() ๋ฐฉ์๊ณผ ๋์ผํ๋ค.
```javascript
$(function(){
    $('#btn').click(function(){
    const data = {"name":$('#name').val(), "pwd":$('#pwd').val()}
    $.post("Ex05_Server.jsp", data, function(responsedata){
        //์๋ต์ด ์๊ณ  ์ ์๊ฑด์ด๋ผ๋ฉด
        $('#message').html(responsedata);
    });
    });
});
```
- const data = {"name":$('#name').val(), "pwd":$('#pwd').val()} : name๊ณผ pwd์ ๊ฐ์ ์ฝ์ด์ ๋ฃ๊ณ , ๊ทธ ๊ฐ๋ค์ data์ ์ ์ฅ
<br>

### ๐ $..getJSON()
- The getJSON() method is used to get JSON data using an AJAX HTTP GET request.
- jQuery.getJSON( url [, data ] [, success ] )
```javascript
$(selector).getJSON(url,data,success(data,status,xhr))
```
```javascript
$(function(){
    //jQuery.getJSON( url [, data ] [, success ] )
    //๊ธฐ๋ณธ ์ต์ : dataType >> JSON ์ค์ ๋์ด ์์ด์
    //dataType:"JSON", 
    $('#btn .btnload').click(function(){
        $.getJSON("Ex06_json.json",function(data){
            //์๋ต์ด ์๊ณ  ์๋ต์ด ์ ์์ด๋ผ๋ฉด
            console.log(data);
            //$.each(data,function(index ,obj){
                    //๋ง์๋๋ก ๊ฐ๊ณต
            //})
        });
    });
});
```
#### [json]  
```json
[
    {"num":"1","Name":"hong"},
    {"num":"2","Name":"kim"},
    {"num":"3","Name":"park"},
    {"num":"","Name":"you"}
 ]
```

- Ex06_json.json์ data์ ๋ฃ์ด์...
- get๊ณผ ๊ฐ์ง๋ง html์ด ์๋ json์ ๊ฐ์ ธ์ฌ๋ ์ฌ์ฉํ๋ ํจ์! ๋ผ๊ณ  ๋๋ ์ดํดํ๋ค.
<br>

<hr>

## 3. jQuery - API AJAX ๊ณผ์  โ
### ๐ Q1
```
http://api.flickr.com/services/feeds/photos_public.gne?tags=raccoon&tagmode=any&format=json&jsoncallback=?
getJSON ๋น๋๊ธฐ ์์ฒญ๋ณด๋ด์ธ์.

์์ฒญ ์ฃผ์ : http://api.flicker.com/services/feeds/photos_public.gne?jsoncallback=?

JSON๊ฐ์ฒด ๊ฐ๊ณต 		
tags=[input ํ๊ทธ์์ ๊ฐ์ ๊ฐ์ง๊ณ  ์ค์ธ์]&tagmode=any&format=json		

๋ฐ์๋ฐ์ดํฐ๋ <img> ํ๊ทธ๋ฅผ ๋์ ์ผ๋ก ์์ฑํ๊ณ  src ์์ฑ์ ์ฌ์ง์ ๋ฃ๊ณ  
id="images" ์ธ div์ append ํ์ธ์.
```
[๋ต]  
```javascript
$(function(){
    $('#btn').click(function(){
        const flickerAPI = "https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?" 
        //tags=raccoon&tagmode=any&format=json
        const data = { tags:$('#search').val(),
                    tagmode:"any",
                    format:"json"}
        console.log(data);
        $.getJSON(flickerAPI,data,function(data,textStatus,xhr){
            //console.log(data);
            //console.log(textStatus);
            //console.log(xhr.readyState);
            
            $('#images').empty();
            $.each(data.items, function(index,obj){
                $('<img>').attr("src",obj.media.m).appendTo("#images");
                //img ํ๊ทธ๋ฅผ ์์ฑํ๊ณ  src ์์ฑ์ ์ด๋ฏธ์ง ๊ฒฝ๋ก ์ค์  div append
            });
        });
    });
});	
```
- ์์์ด๊ธฐ์ ์ดํดํ๊ธฐ ์ด๋ ต๊ธด ํ์ง๋ง, api ๊ฐ์ ธ์ค๋ ์ฌ์ดํธ์์ ํ์๋ผ๊ณ  ํ๋ ๊ฒ (์ ์์์์  tags, tagmode, format)์ const data = { } ์ ๋ฃ์ด์ค
- ๋จ, api ์ ๊ณต url์ด '?'๋ก ๋๋์ด์ ธ ์์ ๊ฒฝ์ฐ์๋ง -> ์๋ Q2 ์ฐธ๊ณ 
- function(data,textStatus,xhr){ : ์ ์์ ์ผ๋ก ์๋์ด ๋๋ฉด ~...
-  $('#images').empty(); : ์ถ๋ ฅ์ ํ  ๋ถ๋ถ์ ์ด๊ธฐํ -> ๊ทธ๋์ผ ์๋ก์ด ๊ฐ์ ์ถ๋ ฅํ  ๋๋ง๋ค ์ฐฝ์ด ๊นจ๋ํด์ง 
<br>

### ๐ Q2
```
์์ ๊ฐ์ ๋ฐฉ์์ผ๋ก ๋ฐ์ดํฐ API ๋ถ๋ฌ์ค๊ธฐ๋ฅผ jQuery ์ฌ์ฉํด์ ๋ง๋ค์ด๋ณด๊ธฐ
```
[๋ด ํ์ด]  
```javascript
$(function(){
    $('#btn').click(function(){
        const url = "http://openapi.seoul.go.kr:8088/6d466751426b6b6938366d4c6d7842/json/SearchParkInfoService/1/" + $('#search').val(); 
        
        $.getJSON(url,function(data){
            //console.log(data.SearchParkInfoService.row[0].MAIN_PLANTS)

            $('#result').empty();

            $.each(data.SearchParkInfoService.row, function(){
                console.log(this.MAIN_PLANTS);
            });
        });
    });
});
```
- API ์ ๊ณต ์ฌ์ดํธ์์ key๊ฐ ๋ฐ๊ธ ๋ฐ๊ธฐ
- ํ์๋ก ํฌํจ๋์ด์ผํ๋ ํค๊ฐ๋ค ํ์ธ, ? ํฌํจ ํ์์ด๋ฉด Q1์ฒ๋ผ, ์๋๋ผ๋ฉด ๊ตฌ๋ถ์ด ๋ถ๊ฐ๋ฅํ๊ธฐ์ Q2 ํ์ด์ฒ๋ผ
- /1/ : ์ด๊ฒ ํ์๋ก ํฌํจ๋์ด์ผํ๋ START_INDEX ๊ฐ์ธ๋ฐ ์ด๊ฑธ ๋ฐ๋ก ๋งํฌ์ ์ ์ด์ค
- /" + $('#search').val(); : ๊ฒ์ํ ๊ฐ์ด END_INDEX๊ฐ ๋๋๋ก
- url๊ฐ์ data์ ์ ์ฅํ๊ณ , ๊ทธ data์ SearchParkInfoService, row๋ก
- console.log(this.MAIN_PLANTS) : this๋ ata.SearchParkInfoService.row, ์ด๊ฒ์ MAIN_PLANTS๋ฅผ ์ฝ์์ ์ถ๋ ฅํ๊ธฐ








