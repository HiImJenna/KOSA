# 2022.09.16.Fri π
<br>

## 1. File List β
-----------------------------
<br>

< κ³΅λΆ ν μλ‘λ μμ μλλ€ :( >

## 2. Print Writer β
-----------------------------
<br>

< κ³΅λΆ ν μλ‘λ μμ μλλ€ :( >

## 3. String finder β
-----------------------------
<br>

< κ³΅λΆ ν μλ‘λ μμ μλλ€ :( >

## 4. DataOutputStream β
-----------------------------
<br>

< κ³΅λΆ ν μλ‘λ μμ μλλ€ :( >

## 5. Object Data I/O Stream β
-----------------------------
### π μ§λ ¬ν & μ­μ§λ ¬ν
<br>

#### - μ§λ ¬ν : κ°μ²΄λ₯Ό λΆν΄ν΄μ μ€μ μΈμ λ³΄λ΄λ κ³Όμ  
 * λͺ¨λ  μμ(class)κ° μ§λ ¬ν κ°λ₯νκ²μ μλ 

```java
public enum UserINfo implements Serializable{
}
```
<br>

[κΈ°λ³Έμμ±]
```java
FileOutputStream fos = null;
BufferedOutputStream bos = null;
ObjectOutputStream out = null; 
```
```java
FileOutputStream fos -> νΌμμλ μ°μΌ μ μμ§λ§ ... 
BufferedOutputStream bos  ->  λ³΄μ‘°, μ±λ₯κ°μ !
ObjectOutputStream out = null -> κ°μ²΄νλ₯Ό μν΄μ ... 
```
[μ§λ ¬ν1]
```java
try {
    fos = new FileOutputStream(filename, true);
    bos = new BufferedOutputStream(fos);
    //μ§λ ¬ν
    out = new ObjectOutputStream(bos);
```
```java
κΈ°μ‘΄ μ½λμ out = new ObjectOutputStream(bos);λ₯Ό μΆκ°ν΄ μ§λ ¬ν
```
[μ§λ ¬ν2]
```java
out.writeObject(u1);
out.writeObject(u2);
````
```java
λΆν΄ν΄μ νμ€λ‘ μΈμμ νμΌμ κΈ°λ‘
νμΌμ userinfo κ°μ²΄ 2κ° μ§λ ¬νν΄μ write
```
<br>

#### - μ­μ§λ ¬ν : 
