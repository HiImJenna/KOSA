# 2022.09.14.Wed π
<br>

## 1. Map_Generic β
-----------------------------
<br>

### Q) HashMapμ μ¬μ©ν λμκ΄λ¦¬ νλ‘κ·Έλ¨
```
λμκ΄λ¦¬ νλ‘κ·Έλ¨ ... HashMap  μ¬μ©ν΄μ
λμμ λ³΄λ₯Ό μ μ₯νλ ν΄λμ€
Book  ν΄λμ€ (λμλ²νΈ , λμμ λͺ© , λμκ°κ²©)
BookManager (λμ μΆκ° , λμ μ­μ  , λμ κ²μ , λμλͺ©λ‘ )
HashMap νμ©
```
```java
public class Quiz_BookManage{
    public static void main(String[] args) {
        BookManager bookmanager = new BookManager();

        System.out.println("====================");
        System.out.println("λμ κ΄λ¦¬ νλ‘κ·Έλ¨");
        System.out.print("====================");

        bookmanager.run();

    }
}

class Book{ //isbn, μ λͺ©, κ°κ²©

    int isbn;
    String title;
    int price;

    public Book(int isbn, String title, int price) {
        this.isbn = isbn;
        this.title = title;
        this.price = price;
    } 

    @Override
    public String toString() {
        return super.toString();
    }
}

class BookManager{
    Map<Integer, Book> addBook;
    Scanner sc = new Scanner(System.in);

    BookManager() { addBook = new HashMap<Integer, Book>(); }

    void add(){

        System.out.print("μΆκ°ν  λμ ISBN : ");
        int isbn = Integer.parseInt(sc.nextLine());

        System.out.print("λμ μ λͺ© : ");
        String title = sc.nextLine();

        System.out.print("κ°κ²© : ");
        int price = Integer.parseInt(sc.nextLine());

        addBook.put(isbn, new Book(isbn, title, price));

        System.out.printf("'ISBN : %d | μ΄λ¦ : %s | κ°κ²© : %d'μ μμ±νμμ΅λλ€", isbn, title, price);
        System.out.println();
    }

    void delete(){

        System.out.print("μ­μ ν  λμ ISBN : ");
        int isbn = Integer.parseInt(sc.nextLine());
        addBook.remove(isbn);
        System.out.println("μ­μ νμμ΅λλ€.");
    }

    void search(){
        Set<Integer> keyList = addBook.keySet();

        System.out.print("κ²μν  λμ ISBN : ");
        int isbn = Integer.parseInt(sc.nextLine());

        if(addBook.containsKey(isbn) == true){
            for(Integer key : keyList){
                System.out.printf("ISBN:%d | μ΄λ¦:%s | κ°κ²©:%d", addBook.get(isbn).isbn, addBook.get(isbn).title, addBook.get(isbn).price);
                System.out.println();
            }
        } 
    }

    void list (){ //λμ μ, λμλ²νΈ, λμμ λͺ© , λμκ°κ²©
        Set<Integer> keyList = addBook.keySet();
        System.out.println("<λμ λͺ©λ‘>");
        System.out.println("λμμ :  " + keyList.size());

        for(Integer key : keyList){
            System.out.printf("ISBN:%d | μ΄λ¦:%s | κ°κ²©:%d", addBook.get(key).isbn, addBook.get(key).title, addBook.get(key).price);
            System.out.println();
        }
    }

    void isbnList(){ //λμ μ, λμλ²νΈ
        Set<Integer> keyList = addBook.keySet();
        System.out.println("<ISBN λͺ©λ‘>");
        System.out.println("λμμ :  " + keyList.size());

        for(Integer key : keyList){
            System.out.printf("ISBN : %d", addBook.get(key).isbn);
            System.out.println();
        }
    }

    void run(){
        while(true){
            System.out.println();
            System.out.print("1:μΆκ° 2:μ­μ  3:κ²μ 4:λμ λͺ©λ‘ 5:ISBN λͺ©λ‘ 0:μ’λ£ >> ");
            int choice = Integer.parseInt(sc.nextLine()); //μλΉμ€ μ ν
 
            if(choice == 1) {
                add();
            } else if(choice == 2){
                delete();
            } else if(choice == 3){
                search();
            } else if(choice == 4) {
                list();
            } else if(choice == 5) {
                isbnList();
            } else if (choice == 0) {
                System.out.println("νλ‘κ·Έλ¨μ μ’λ£ν©λλ€");
                break;
            }
        }
        

        sc.close();

        }
}
```

## 2. Properties β
-----------------------------
<br>

```java
 μ¬μ©λͺ©μ )
 1. App μ μ²΄μ μ¬μ©λλ μμ κ΄λ¦¬
 2. νκ²½λ³μ
 3. νλ‘κ·Έλ¨ λ²μ  κ΄λ¦¬  
 4. νμΌκ²½λ‘
 5. κ³΅ν΅λ³μ

```
```java
public static void main(String[] args) {
		Properties prop = new Properties();
		prop.setProperty("admin", "kosa@or.kr");
		prop.setProperty("version", "1.x.x.x");
		prop.setProperty("downpath", "C:\\Temp\\images");
		//κ°κ°μ κ°λ° νμ΄μ§μμ
		System.out.println(prop.getProperty("admin"));
		System.out.println(prop.getProperty("version"));
		System.out.println(prop.getProperty("downpath"));
	}
```


## 3. wrapper class β
-----------------------------
<br>

![image](https://postfiles.pstatic.net/MjAxNzA5MTlfNTUg/MDAxNTA1NzQ4Nzk4MDk0.N6FWHTn6Iio08ykA0n2-pys9Zr0imo036a_g2jNJd5gg.GGD_XCziPHctpYKiN1enXpO_JCsncRQJrIlb_alcKSQg.PNG.cestlavie624/1.PNG?type=w2)

```java
8κ°μ§ κΈ°λ³Έ νμμ λν΄μ κ°μ²΄ ννλ‘ μ¬μ© κ°λ₯ νλλ‘ λ§λ  ν΄λμ€(wrapper class)
 [ μ¬μ© ]
1. λ§€κ°λ³μ κ°μ²΄ μκ΅¬λ λ
2. κΈ°λ³Έν κ°μ΄ μλ κ°μ²΄ ννλ‘ μ μ₯μ΄ νμμ
3. κ°μ²΄κ° κ° λΉκ΅
4. νμ λ³νμ μ²λ¦¬ 

>>generic μ€κ³ (κ°μ²΄ νν) > int > Integer
```

## 4. Calendar β
-----------------------------
<br>

```java
* Calendar λ₯Ό μμλ°μ μμ ν κ΅¬νν ν΄λμ€λ 
* GregorianCalendar 
* buddhisCalendar μλλ° getInstance()λ [μμ€νμ κ΅­κ°μ μ§μ­μ€μ ]μ [νμΈ]ν΄μ

νκ΅­μΈ κ²½μ° buddhisCalendar μ μΈμ€ν΄μ€λ₯Ό λ°ννκ³  κ·Έ μΈμλ GregorianCalendar
μ μΈμ€ν΄μ€λ₯Ό λ°ννλ€
GregorianCalendar λ Calendarλ₯Ό μμλ°μ μ€λλ  μ μΈκ³ κ³΅ν΅μΌλ‘ μ¬μ©νκ³  μλ 
κ·Έλ κ³ λ¦¬λ ₯μ λ§κ² κ΅¬νν κ²μΌλ‘ νκ΅­μ μ μΈν λλ¨Έμ§ κ΅­κ°μμλ GregorianCalendar μ¬μ©
κ·Έλμ μΈμ€ν΄μ€λ₯Ό μ§μ  μμ±ν΄μ μ¬μ©νμ§ μκ³  λ©μλλ₯Ό ν΅ν΄μ μΈμ€ν΄μ€λ₯Ό λ°νλ°κ²νλ
μ΄μ λ μ΅μμ λ³κ²½μΌλ‘ νλ‘κ·Έλ¨ λμμ νλλ‘ νκΈ° μν¨
class MyApp{
static void main(){
Calendar cal = new GregorianCalendar();
λ€λ₯Έ μ’λ₯μ μ­λ²μ μ¬μ©νλ κ΅­κ°μμ μ€ννλ©΄ λ³κ²½...... } }
class MyApp{
static void main(){
Calendar cal = new getInstance();
λ€λ₯Έ μ’λ₯μ μ­λ²μ μ¬μ©νλ κ΅­κ°μμ μ€ννλ©΄ λ³κ²½...... } }
API : μμ±μ Protected Calendar() 
```