# 2022.10.11. MON π
----------------
<br>

## 1. λ°μ΄ν° λͺ¨λΈλ§ β
### π μμ±
- μμ± μ μμ κ³ λ €μ¬ν­ : νμλ κ°μ μ€μ  μ±λ₯μ μν΄μ μ¬μ©λκΈ°λ νμ§λ§, μ΄λ° κ°μ μ€λ³΅μ λμ€μ μ¬κ°ν λ¬΄κ²°μ± λ¬Έμ λ₯Ό λ°μν  μ μμΌλ―λ‘ μ‘°μ¬ν΄μ μ¬μ©
<br>

### π λλ©μΈ μ§μ 
- μν°ν° λ΄ μμ±μ λν λ°μ΄ν° νμκ³Ό ν¬κΈ°, μ μ½ μ¬ν­ μ§μ 
<br>

### π μλ³μ
#### 1) μλ³μλ?  
: νλμ μν°ν° λ΄μμ κ°κ°μΌ γ£μΈμ€ν΄μ€λ₯Ό μ μΌνκ² κ΅¬λΆν΄ λΌ μ μλ μμ± λλ μμ± κ·Έλ£Ή
<br>

#### 2) λ΄λΆμλ³μ / μΈλΆ μλ³μ : μ€μ€λ‘ μμ± μ¬λΆ
- λ΄λΆ : μμ μ μν λ€μμ μ€μ€λ‘ μμ±λμ΄ μ‘΄μ¬νλ μλ³μ
- μΈλΆ : λ€λ₯Έ μν°ν°λ‘λΆν° κ΄κ³μ μν΄ μ£Όμλ³μ μμ±μ μμλ°μ μμ μ μμ±μ ν¬ν¨λλ μλ³μ (FK μλ―Έ)
<br>

#### 3) λ¨μΌμλ³μ / λ³΅ν©μλ³μ : λ¨μΌ μμ± μ¬λΆ
- λ¨μΌ : μ£Όμλ³μμ κ΅¬μ±μ΄ νκ°μ§ μμ±μΌλ‘ μ΄λ£¨μ΄μ§ κ²½μ°
- λ³΅ν© : λκ° μ΄μμ μμ±μΌλ‘ κ΅¬μ±λ κ²½μ° -> λ³΅ν©μ κ²½μ° μ°μ μμκ° λ§€μ° μ€μ
<br>

#### 4) μμ‘°μλ³μ / λλ¦¬μλ³μ : λμ²΄μ¬λΆ
- λλ¦¬ : μ£Ό μλ³μμ μμ±μ΄ λ³΅ν©μλ³μμΌ κ²½μ° μ¬λ¬κ°μ μμ±μ λ¬Άμ΄ νλμ μμ±μΌλ‘ λ§λ€μ΄ μ£Όμλ³μλ‘ νμ©νλ κ²½μ°
<br>

## 2. CSS β
### π Selector
- κΈ°λ³Έ μ νμ (κΈ°μ‘΄μ μ‘΄μ¬νλ νκ·Έ : p, div, hr, h3)
    ex) p{colour:red}

- λ€μ€μ νμ(group)
ex) p, h1, h2, h3 {colour:red}

- μ¬μ©μμ μμ νμ : (. >> class ... # >> id)

- κ²°ν©μ νμ
p{colour:red}
p.one {border:1px} >> <p class = "one"
                    >> <p class = "two"
- μμ, νμ μ νμ
div p {colour:green;}

- μμμμ
.parent > p

- μμ±μ νμ (attribute > colour, font, size)
input[type=text] {colour:red}
input[type=button] {font-size:10px}

- + μΈμ νμ  ~ μΌλ°νμ 

- κ°μμ νμ
<br>

### π Overflow
![image](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcfile8.uf.tistory.com%2Fimage%2F236ABC4555526A2B1046D2%22&type=cafe_wa740)
<br>

### π λ°μν μΉ
![image](https://www.nextree.co.kr/content/images/2021/01/jsseo-140329-CSS-01-1024x415-1.png)
- λλ°μ΄μ€ μ’λ₯μ λ°λΌ μΉνμ΄μ§μ ν¬κΈ°κ° μλμ μΌλ‘ μ¬μ‘°μ  λλ κ²
<br>

### π position
#### 1) static
- Static positioned elements are not affected by the top, bottom, left, and right properties.
<br>

#### 2) relative
- Setting the top, right, bottom, and left properties of a relatively-positioned element will cause it to be adjusted away from its normal position. Other content will not be adjusted to fit into any gap left by the element.
- μλ μμΉλ₯Ό κΈ°μ€μΌλ‘ μλμ (relative)μΌλ‘ λ°°μΉν΄μ€λ€κ³  μκ°
- top, bottom, left, right μμ±μ μ΄μ©ν΄μ, μμκ° μλ μμΉμ μμ λμ μνμ’μ°λ‘ λΆν° μΌλ§λ λ¨μ΄μ§κ² ν μ§λ₯Ό μ§μ ν  μ μμ!
<br>

#### 3) fixed
- always stays in the same place even if the page is scrolled. The top, right, bottom, and left properties are used to position the element.  
- μ€ν¬λ‘€ λ΄λ €λ κ°μ μλ¦¬μ κ³μ μμ
<br>

#### 4) absolute
- An element with position: absolute; is positioned relative to the nearest positioned ancestor (instead of positioned relative to the viewport, like fixed).

- However; if an absolute positioned element has no positioned ancestors, it uses the document body, and moves along with page scrolling.

- Note: Absolute positioned elements are removed from the normal flow, and can overlap elements.

#### 5) sticky
- A sticky element toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed).  
- μ€ν¬λ‘€ λ΄λ¦¬λ©΄ νλ©΄ λ§¨ μμ κ±Έλ €μ λμ νκ² λ¨μμμ!  
![image](https://user-images.githubusercontent.com/111114507/195031102-a45570c1-f250-41cd-a130-02ded4a3a457.png)
<br>




