# 2022.10.07. FRI ๐
----------------
<br>

## 1. CSS โ
### ๐ padding
- ๋ฐ์ค ์!
- The CSS padding property defines a padding (space) between the text and the border.
```html
<!DOCTYPE html>
<html>
<head>
<style>
p {
  border: 2px solid powderblue;
  padding: 30px;
}
</style>
</head>
<body>

<h1>This is a heading</h1>

<p>This is a paragraph.</p>
<p>This is a paragraph.</p>
<p>This is a paragraph.</p>

</body>
</html>
```
![image](https://user-images.githubusercontent.com/111114507/194440232-64eb23fb-3c50-402d-9d33-26294fa7235b.png)
<br>


### ๐ margin
- ๋ฐ์ค ๋ฐ!
- The CSS margin property defines a margin (space) outside the border.
```html
<style>
p {
  border: 2px solid powderblue;
  margin: 50px;
}
</style>
```
![image](https://user-images.githubusercontent.com/111114507/194440357-ffcb0de8-8ad0-4cd1-ba0f-c65da445bfe2.png)
<br>

### ๐ Links
#### < ๊ฐ์ ์ ํ์ > : ์๋ฏธ๋ง ์กด์ฌ : :link, :visited, :hover, :active
- a:link - a normal, unvisited link
- a:visited - a link the user has visited
- a:hover - a link when the user mouses over it
- a:active - a link the moment it is clicked
<br>

### ๐ Selectors
#### 1) element Selector
```css
p {
  text-align: center;
  color: red;
}
```
<br>

#### 2) id
```css
/*style*/
#kglim {color: gold}
/*body*/
<p id="kglim">id๋ผ๋ ์์ฑ์ ์ด์ฉํด์ CSS์ ์ฉ</p>
```
- '#' ๋ง๋ ๊ฒ์ id์ ์ฉ page์ 1๊ฐ๋ง ์ ์ฉ
<br>

#### 3) class
```css
/*style*/
  .hong{color: blue}
/*body*/
  <p class="hong">class๋ผ๋ ์์ฑ์ ์ฌ์ฉํด์ CSS์ ์ฉ</p>
  <p class="hong">class๋ผ๋ ์์ฑ์ ์ฌ์ฉํด์ CSS์ ์ฉ</p>
  <p class="hong">class๋ผ๋ ์์ฑ์ ์ฌ์ฉํด์ CSS์ ์ฉ</p>

```
-  '.' ๋ง๋ ๊ฒ์ class์ ์ฉ, 1 page์ ์ฌ๋ฌ๊ฐ ์ ์ฉ  
<br>

[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194443695-baeba570-2215-41f1-83de-e995485b5105.png)
<br>

## 2. HTML - Table โ
<details>
<summary>์ฝ๋</summary>

```html
<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <style type="text/css">
        table {
            border-collapse: collapse;
            width: 70%;
        }

        /* ๋ถ๊ดดํ๋ค */
        th, td {
            border: 1px solid red;
            text-align: center;
            padding: 5px;
        }
        tr:nth-child(even) {/*์ง์ */
        background-color: gray;
        }
    </style>

</head>

<body>

    <h2>HTML Table</h2>

    <table>
        <tr>
            <th>Company</th>
            <th>Contact</th>
            <th>Country</th>
        </tr>
        <tr>
            <td>Alfreds Futterkiste</td>
            <td>Maria Anders</td>
            <td>Germany</td>
        </tr>
        <tr>
            <td>Centro comercial Moctezuma</td>
            <td>Francisco Chang</td>
            <td>Mexico</td>
        </tr>
        <tr>
            <td>Ernst Handel</td>
            <td>Roland Mendel</td>
            <td>Austria</td>
        </tr>
        <tr>
            <td>Island Trading</td>
            <td>Helen Bennett</td>
            <td>UK</td>
        </tr>
        <tr>
            <td>Laughing Bacchus Winecellars</td>
            <td>Yoshi Tannamuri</td>
            <td>Canada</td>
        </tr>
        <tr>
            <td>Magazzini Alimentari Riuniti</td>
            <td>Giovanni Rovelli</td>
            <td>Italy</td>
        </tr>
    </table>

</body>

</html>
```

</details>

[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194447953-9326987a-6764-40bd-97bd-ba48c9f4345a.png)
- th : header (bold์ฒด)
- td : cell
- tr : row
- border-collapse: collapse; : ์  ๋๊ฐ ๊ฒน์น๊ฒ ํ๊ธฐ (๊ฐ๊ฒฉ collapse์ํด)
<br>

### ๐ Table ๋ณํฉํ๊ธฐ
- colspan ="x" : ๊ฐ๋ก๋ฐฉํฅ์ผ๋ก ์์ด ํฉ์ณ์ง
- rowspan ="x" : ์ธ๋ก๋ฐฉํฅ์ผ๋ก ์์ด ํฉ์ณ์ง
- ํฉ์น๊ณ  ์ถ์ ์ ์ ๋งํผ x์ ๋์

<details>
<summary>์ฝ๋</summary>

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ํ์ด๋ธ ๋ณํฉํ๊ธฐ</title>

    <style type="text/css">
        table {border-collapse: collapse;}
        th, td{border: 1px solid blue;}
    </style>

</head>

<body>
    <h3>์ผ๋ฐํ์ด๋ธ</h3>
    <table>
            <tr>
                <td>๊ฐ</td><td>๋</td><td>๋ค</td>
            </tr>
            <tr>
                <td>๋ผ</td><td>๋ง</td><td>๋ฐ</td>
            </tr>
            <tr>
                <td>์ฌ</td><td>์</td><td>์</td>
            </tr>
    </table>
    <hr>

    <h3>์ผ๋ฐํ์ด๋ธ2</h3>
    <table style="height: 200x; width: 500px">
            <tr>
                <td>๊ธ๋ฒํธ</td><td>์ ๋ชฉ</td><td>์กฐํ์</td>
            </tr>
            <tr>
                <td>1</td><td>๋ฐฉ๊ฐ๋ฐฉ๊ฐ</td><td>102</td>
            </tr>
            <tr>
                <td>2</td><td>์๋</td><td>103</td>
            </tr>

    </table>
    <hr>

    <h3>์ผ๋ฐํ์ด๋ธ ๋ณํฉ</h3>
   
    <table style="height: 200x; width: 500px">
            <tr>
                <td colspan="2">๊ฐ, ๋</td><td>๋ค</td>
            </tr>
            <tr>
                <td>๋ผ</td><td>๋ง</td><td>๋ฐ</td>
            </tr>
            <tr>
                <td colspan="3">์ฌ, ์, ์</td>
            </tr>
    </table>

    <h3>์ผ๋ฐํ์ด๋ธ ๋ณํฉ2</h3>
    <table style="height: 200x; width: 500px">
            <tr>
                <td colspan="2" rowspan="2">๊ฐ, ๋, ๋ผ, ๋ง</td><td>๋ค</td>
            </tr>
            <tr>
                <td>๋ฐ</td>
            </tr>
            <tr>
                <td>์ฌ</td><td>์</td><td>์</td>
            </tr>
    </table>
</body>
</html>
```
</details>
<br>

## 3. HTML - List โ
```html
<body>
   <ul>
      <li>Coffee</li>
      <li>Tea</li>
      <li>Milk</li>
   </ul>

   <ul>
      <li>Coffee</li>
      <li>Tea
         <ul>
            <li>Black tea</li>
            <li>Green tea</li>
         </ul>
      </li>
      <li>Milk</li>
   </ul>
</body>

```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194451875-f5634743-5dba-4e30-9273-61f9a1d1d491.png)
<br>

## 4. HTML - Layout โ
![image](https://user-images.githubusercontent.com/111114507/194453856-97c5b2ca-f250-4491-bde9-a03054fe1d5f.png)
<br>

### ๐ float

<details>
<summary>์ฝ๋</summary>

```html
<!DOCTYPE html>
<html>

<head>
    <meta charset="EUR-KR">
    <title>์์ญ์ ์ ์ํ๋ div์ float</title>
</head>



<body>
    <div style="width: 100px; height:100px; background-color: yellow;"></div>
    <div style="width: 100px; height:100px; background-color: red;"></div>
    <div style="width: 100px; height:100px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 120px; height:100px; background-color: red;"></div>
    <div style="width: 100px; height:100px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 100px; height:100px; background-color: red; float: left"></div>
    <div style="width: 100px; height:220px; background-color: blue;"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 100px; height:100px; background-color: red; float: left"></div>
    <div style="width: 100px; height:100px; background-color: blue; float: left"></div>
    <hr>
    <div style="width: 100px; height:100px; background-color: yellow; float: left"></div>
    <div style="width: 100px; height:100px; background-color: red; float: left"></div>
    <div style="width: 100px; height:100px; background-color: blue; clear:both"></div>
</body>

</html>
```
</details>

### ๐ div & float
<details>
<summary>์ฝ๋</summary>

```html
<!DOCTYPE html>
<html>
<head>
   <meta charset="EUC">
   <title>Insert title here</title>
   <style type="text/css">
      #wrap {width: 600px; margin: auto;}
      #header {height: 50px; background: black;}
      #main {margin-top: 10px;}
      #left_main {
         height: 300px; 
         width: 100px; 
         background-color: gray; 
         margin-right: 10px; 
         float: left;
      }
      #right_main{
         height: 300px; 
         width: 490px; 
         background-color: gray; 
         float: left;
      }
      #m {clear: both;}
      #footer{
         height: 50px; 
         margin-top: 10px; 
         background: black;
      }
        #down{
            width: 100%;
            height: 50px;
            background-color: blue;
        }
   </style>
</head>
<body>

   <div id="wrap">
      <div id="header"></div>

      <div id="main">
         <div id="left_main">
         
         </div>
         <div id="right_main">

         </div>
      </div>

      <div id="m"></div>
      
      <div id="footer"></div>

        <div id="down"></div>

   </div>

</body>
</html>

```
</details>
<br>

## 5. HTML - Form โ
```html
 form ํ๊ทธ๋ ์ ์ก์ ๋ด๋นํ๋ ํ๊ทธ(ํด๋ผ์ด์ธํธ๊ฐ ์๋ ฅํ ๋ฐ์ดํฐ๋ฅผ ๊ฐ์ง๊ณ  ์๋ฒ๋ก ๊ฐ๊ธฐ)
        ๋ค์ด๋ฒ > ํ์๊ฐ์ ์์ฒญ > ํ์๊ฐ์ ํ์ด์ง ์ ๋ฌ > ์ ๋ณด์๋ ฅ(id, pwd, address ... ) > ๋ค์ด๋ฒ ์๋ฒ๋ก ์ ์ก
        > ๋ค์ด๋ฒ๋ ์ ์ก๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ์ฒ๋ฆฌ > DB ์ฐ๊ฒฐ > ์๋ ฅํ ์ ๋ณด๋ฅผDB์ insert > ์ฑ๊ณต > ๊ฒฐ๊ณผ์ ๋ฌ

        form ์ ์ก์๋จ(์ด์ก) 
        1. action =" " : ๋ชฉ์ ์ง ์ฃผ์ >> JSP : action = "loginok.jsp"
                                   >> servlet : action="login.do"
        2. method ="" : ์ ์ก๋ฐฉ์
         - method ="GET" : ๋ฐฐ๋ฅผ ํ๊ณ  ๊ฐ๋ ๊ฒ > loginok.jsp
                         ex) http://193.168.0.12:8090/WebBasic/loginok.jsp?id=hong&pwd=1004
                         >> ์๋ฒ๊ฐ ์ ๋ณด๋ฅผ ๋ฐ์์ ์ฒ๋ฆฌ
                         >> ์ฃผ์์ ์๋ ฅํ ์ ๋ณด๊ฐ ๋ธ์ถ
                        **GET ์ ์ก ๋ฐฉ์์ ์ฌ์ฉ ... (๋งํฌ๋ฅผ ํ๊ณ  ๊ฐ๋ ์ ์ก)
                        >> ๊ฒ์ํ์ ๊ธ ๋ฒํธ ํด๋ฆญ(์์ธ๋ณด๊ธฐ๋ก ๊ฐ๋ ๊ฒฝ์ฐ)
                        <a href = "boardconctent.jsp?num=100&category=board">100๋ฒ๊ธ</a>

         - method ="POST" : ๋นํ๊ธฐ ํ๊ณ  ๊ฐ๋ ๊ฒ > loginok.jsp
                         ex)  http://193.168.0.12:8090/WebBasic/loginok.jsp
                              http ํ๋กํ ์ฝ ๋ด๋ถ์ (header) ์จ๊ฒจ์ ๋ฐ์ดํฐ ์ ์ก (id=hong&pwd=
```
<br>

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Form ํ๊ทธ ์์ ๊ตฌํํ๋ Input ํ๊ทธ๋ค</title>
</head>
    <body>
        <form action="">
            <fieldset>
                <legend>Text:Passord</legend>
                Text: <input type="text" name="userid" id="userid"><br>
                Password : <input type="password" name="pwd" maxlength="5"><br>
                <hr>
                Text : <input type="text" maxlength="10" value="๊ธฐ๋ณธ๊ฐ" size="100px">
                <hr>
                readonly(์ฝ๊ธฐ์ ์ฉ : ์๋ฒ๋ก ์ ์ก ๊ฐ๋ฅ)
                Text: <input type="text" name="userid" id="userid" value="hong" readonly = "readonly"><br>
                disabled(๋นํ์ฑํ : ์๋ฒ ์ ์ก ๋ถ๊ฐ๋ฅ)
                Text: <input type="text" name="userid" id="userid" value="hong" disabled = "disabled"><br>

            </fieldset>
```
<br>

#### <checkbox>
```html
            <fieldset>
                <legend>์ฒดํฌ๋ฐ์ค(๋ค์ค์ ํ)</legend>
                ๋น์ ์ ์ทจ๋ฏธ๋ <br>
                ๋๊ตฌ: <input type="checkbox" name="sports_1" value="A" checked=""checked>
                ์ผ๊ตฌ : <input type="checkbox" name="sports_2" value="B">
                ์ถ๊ตฌ : <input type="checkbox" name="sports_3" value="C">
            </fieldset>
            <!--
                get๋ฐฉ์
                register.jsp?sports_1=A&sports_2=B&sports_2=C >> ์๋ฒ๋ก ์ ์ก

                String s = request.getParameter("sports_1");
                String s2 = request.getParameter("sports_2");
                String s3 = request.getParameter("sports_3");

                String[] sportsarr = request.getParameterValues("sports")
                sportsarr[0] = "A"
                sportsarr[1] = "B"
                sportsarr[2] = "C"
            -->
        
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194483577-b248219d-6f03-4213-a234-dd62181ad6d9.png)

<br>


#### <select tag>


```html
                <fieldset>
                    <legend> select ํ๊ทธ (๋จ์ผ ์ ํ(๋์์ผ))</legend>
                    <select name = "year">
                        <option value="2022">2022๋</option>
                        <option value="2021">2021๋</option>
                        <option value="2020">2020๋</option>
                    </select>
                    <!--
                        register.jsp?year=2022 ์๋ฒ๋ก ์ ์ก
                        ์๋ฒ์์ ๋ฐ๋ ๋ฐ์ดํฐ๋ ๋ฌธ์์ด ๋ฐ์ดํฐ
                        int year = Integer.parseInt(request.getParameter("year"));
                        
                    -->
                </fieldset>
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194485091-3157e625-92f0-4a5b-a3b2-b58408134322.png) 
- muliple์ ํ๋ฉด ๋ค์ค ์ ํ์ด ๊ฐ๋ฅํ์ง๋ง ์น ์ ๊ทผ์ฑ ๋ฌธ์ ๋ก ์ฌ์ฉํ์ง ์๋๋ค.   
<br>

#### < radio >

```html
<fieldset>
    <legend>๋ผ๋์ค๋ฒํผ(๋จ์ผ์ ํ : ๋จ, ์ฌ) : name ๊ฐ์ผ๋ฉด ํ๋์ ๊ทธ๋ฃน</legend>
    ๋จ<input type="radio" name="gender" value="1"><br>

    ์ฌ<input type="radio" name="gender" value="2"><br>
    <br>

    ๋<input type="radio" name="product" value="1"><br>
    ์ค<input type="radio" name="product" value="2"><br>
    ์<input type="radio" name="product" value="3"><br>
</fieldset>
```
- name = "x"์์ x๊ฐ ๋ค๋ฅด๋ฉด ๋ค๋ฅธ ๊ทธ๋ฃน์ผ๋ก ๋ถ๋ฅ๋์ด ๋ค ์ ํ์ด ๊ฐ๋ฅํ๊ฒ ๋๋ค.
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194486192-9880cf60-5705-42c7-87a2-dab0801fc8cd.png)
<br>

#### < Etc ... >
```html
<fieldset>
<legend>๊ธฐํ ๋ฑ๋ฑ</legend>
1. ํ๋ฉด์ ์ถ๋ ฅ๋์ง ์์ (์์ค๋ ๊ฐ์ง๊ณ  ์์)
<input type="hidden" value = "1000" name = "๋ฐ์ดํฐ">
<hr>

2. ํ์ผ ์๋ก๋(ํด๋ผ์ด์ธํธ ํ์ผ ์ ํ ๊ฐ๋ฅ
<input type="file" name="imgup">
<hr>

3. ๊ฒ์ํ ๊ธ ์ฐ๊ธฐ (์ฌ๋ฌ์ค) : ์ด๊ธฐ ํ๋ฉด์ ํฌ๊ธฐ (rows, cols-> ๋ช์ค์ ๋ช์นธ)
<textarea rows="10" cols="50">๊ธฐ๋ณธํฌ๊ธฐ</textarea>
<hr>

4. ๊ฐ์ข ๋ฒํผ๋ค
<input type="button" value="๋ ๋๋ฌ๋ด" onclick="alert('์ฌ๋์๊ฐ')">
<hr>

<!--
    type = "image"
    type = "submit"
    type = "reset"
-->

</fieldset>
```
[์ถ๋ ฅ๊ฐ]  
![image](https://user-images.githubusercontent.com/111114507/194487342-21862254-a14b-42f2-b4fd-3d064988f57d.png)
<br>

#### < HTML 5 >

- Input Type Color
```html
<input type="color" id="favcolor" name="favcolor" value="#ff0000">
```
<br>

- Input Type Date
```html
<input type="date" id="birthday" name="birthday">
```
<br>

- Input Type Datetime-local
```html
<input type="datetime-local" id="birthdaytime" name="birthdaytime">
```
<br>

- Input Type Number
```html
<input type="number" id="quantity" name="quantity" min="1" max="5">
```
<br>

- Input Type Range
```html
 <input type="range" id="vol" name="vol" min="0" max="50">
 ```
<br>

- The list Attribute
```html
<input list="browsers" name="browser">
<datalist id="browsers">
<option value="Internet Explorer">
<option value="Firefox">
<option value="Chrome">
<option value="Opera">
<option value="Safari">
```

์ถ์ฒ : https://www.w3schools.com/html/html_form_attributes.asp