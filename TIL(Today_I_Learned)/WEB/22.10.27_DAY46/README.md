# 2022.10.27. THU π
----------------
<br>

## 1. JSTL β
### π fmt
```jsp
<body>
 <h3>μ«μκ΄λ ¨</h3>
 λ³μμ μΈ : <c:set var="price" value="1000000"></c:set><br>
 λ³μκ° μΆλ ₯:${price}<br>
 
 <fmt:formatNumber value="${price}" type="number" /><br>
 <fmt:formatNumber value="50000000" type="currency" currencySymbol="$" /><br>
 <fmt:formatNumber value="0.13"     type="percent"/>
 λ³μμ μ€μ  <br>
 <fmt:formatNumber value="123456789" pattern="###,###,###" var="pdata" />
 λ³μμ μ€μ ν κ° : ${pdata}<br>
 
 <hr>
 <h3>λ μ§ κ΄λ ¨ format</h3>
 λ³μμ μΈ : <c:set var="now" value="<%= new Date() %>" /><br>
 λ³μκ° : ${now}<br>
 Basic Date : <fmt:formatDate value="${now}" type="date" /><br>
 DateStyle(full) : <fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
 DateStyle(short) : <fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
 μκ°:<fmt:formatDate value="${now}" type="time"/><br>
 λ μ§ + μκ°:<fmt:formatDate value="${now}" type="both"/><br>
 νΌν©:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br>
    νΌν©2:<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /><br>
</body>

```
<br>

### π function
```jsp
<body>
<!--  
https://www.hscripts.com/tutorials/jsp/jstltags/function-tag.php
-->
<c:set var="str" value="oracle" />
λ³μκ° μΆλ ₯: ${str}<br>

<h3>ν¨μ μ μ©({μμμ})</h3>
λλ¬Έμ : ${fn:toUpperCase(str)}<br>
λ¬Έμμ΄κΈΈμ΄ : ${fn:length(str)}<br>
μΉν : ${fn:replace(str,'a','AAAA')}<br>
</body>
```
## 2. λΉλκΈ° β
- Read data from a web server - after the page has loaded
- Update a web page without reloading the page
- Send data to a web server - in the background
