# 2022.08.31.Wed π
<br>

## 1. Lotto μλλ¦¬μ€β
-----------------------------
### * μλλ¦¬μ€

```
1. λ‘λ μΆμ²¨ λ°©μμ 2κ°μ§ -> μ€ν (μμ  λλ€), μΈλ―Έμ€ν (μ¬μ©μκ° μνλ λ§νΌ μ«μ μλ ₯, λλ¨Έμ§ λλ€)
2. λ‘λ λ²νΈλ μ€λ³΅λ  μ μλ€.
3. λ‘λ λ²νΈλ μ€λ¦μ°¨μμΌλ‘ μ λ ¬λλ€.
```
### * class

```java
public class Lotto {

    private int[] number;
    private boolean isAuto;

    public Lotto(int[] number) {
        this.number = number;
    }

    public void auto() {
        isAuto = true;

        for(int i = 0 ; i < number.length; i++) {
            number[i] = (int)(Math.random()*45)+1;
            for(int j = 0 ; j < i ; j++) {
                if(number[i] == number[j]) {
                    --i;
                    break;
                }
            }
        }

        sort();
    }

    public void semiAuto() {
        isAuto = false;

        int count = 0;
        Scanner sc = new Scanner(System.in);
        for(int i = 0; i < 6; ++i) {

            if (count > 0) {
                System.out.printf("νμ¬κΉμ§ %dκ° μλ ₯νμ¨μ΅λλ€. ", count);
                System.out.print("[");
                for (int j = 0; j < count; ++j) {
                    System.out.print(number[j]);
                    if (j != count - 1) {
                        System.out.print(" ");
                    }
                }
                System.out.println("]\n");
            }

            System.out.println("1 ~ 45 λ²νΈλ₯Ό μλ ₯ν΄μ£ΌμΈμ [0 : λλ¨Έμ§ μλ]\n");
            int num = sc.nextInt();
            if (num == 0) {
                break;
            }

            if (1 > num || num > 45) {
                System.out.printf("μλͺ»λ μλ ₯μλλ€ [%d]\n", num);
                --i;
                continue;
            }

            boolean isSame = false;
            for(int j = 0; j <= i ;j++) {
                if (num == number[j]) {
                    System.out.println("μ€λ³΅λλ μμλλ€ λ€μ μλ ₯ νμΈμ.");
                    i--;
                    isSame = true;
                    break;
                }
            }

            if (isSame) {
                continue;
            }

            number[i] = num;
            count++;
        }

        if (count == 0) {
            isAuto = true;
        }

        for(int i = count ; i < number.length; i++) {
            number[i] = (int)(Math.random()*45)+1;
            for(int j = 0 ; j < i ; j++) {
                if(number[i] == number[j]) {
                    --i;
                    break;
                }
            }
        }

        sort();
    }

    private void sort() {
        for(int i = 0; i < number.length;i++) {
            for(int j=i+1;j<number.length;j++){
                if(number[i] > number[j]) {
                    swap(i,j);
                }
            }
        }
    }

    private void swap(int a ,int b) {
        int temp = number[a];
        number[a] = number[b];
        number[b] = temp;
    }

    public void print() {
        String str = "μλ";
        if (isAuto) {
            str = "μλ";
        }

        System.out.print(str + " : ");
        for(int i = 0; i < 6; ++i) {
            System.out.printf("[%d] ", number[i]);
        }
    }
}
```

### * main
```java
public class Lotto_Main {

    public static void main(String[] args) {
        //1. λλ€μΌλ‘ ν μ§ auto , μ¬μ©μκ° λ²νΈ λͺκ° μλ ₯νκ³  λλ¨Έμ§λ₯Ό λλ€μΌλ‘ ν μ§ semi-auto
        // -> λλ€, μΈλ―Έλλ€ μ νμ§ λ¬Όμ΄λ³΄κ³  μ ννκ±° νλ¦°νΈ, μ€ν, μ€νκ° μΆλ ₯
        //2. μ€νκ° μΆλ ₯, κ³μ ν μ§ λ§μ§ μ νν  μ μκ²
        boolean run = true;
        runLotto(run);
    }


    static void runLotto(boolean run) {
        Scanner sc = new Scanner (System.in);

        while (run) {
            System.out.println();
            System.out.println("**λ‘λ μΆμ²¨ λ°©μμ μ νν΄μ£ΌμΈμ.**");
            System.out.println("------------------------------");
            System.out.println(" 1. μλ  2. μ§μ  μλ ₯ 3. μ’λ£");
            System.out.println("------------------------------");

            int lotto = sc.nextInt();

            Lotto l = new Lotto(new int[6]);

            switch (lotto) {
                case 1 : lotto = 1;
                    System.out.println("'1. μλ'μ μ ννμ¨μ΅λλ€.");
                    System.out.println();
                    l.auto(); //auto λ©μλ μ€ν
                    l.print();//System.out.println("λ‘λ μΆμ²¨ κ²°κ³Ό : " + number); //6κ° λλ€ λμ μΆλ ₯
                    System.out.println();

                    break;

                case 2 : lotto = 2;
                    System.out.println("'2. μ§μ  μλ ₯'μ μ ννμ¨μ΅λλ€.");
                    System.out.println();
                    l.semiAuto(); //semiauto μ€ν
                    l.print();
                    System.out.println();

                    break;

                case 3 : lotto = 3;
                    System.out.println("νλ‘κ·Έλ¨μ μ’λ£νκ² μ΅λλ€.");
                    run = false;

                    break;

                default :
                    System.out.println("μ¬λ°λ₯Έ μ«μλ₯Ό μ νν΄μ£ΌμΈμ");
                    break;
            }
        }
    }
}
```

## 2. Cinema μλλ¦¬μ€ β
---------------------------
### * μλλ¦¬μ€
```
1. μνκ΄μ μλ§€νκΈ°, μλ§€μ‘°ν, μλ§€μ·¨μμ κΈ°λ₯μ κ°μ§λ€.
2. μλ§€μ μλ ₯ν ν΄λμ ν λ·λ²νΈ 4μλ¦¬λ‘ μ‘°νμ μ·¨μλ₯Ό ν  μ μλ€.
3. μλ§€μ μ’μ μ νμ νκ³Ό μ΄μ κ³ λ €ν΄μΌνλ€.
4. μλ§€μ μ·¨μ νν©μ΄ μ’μ νν©μ μλ°μ΄νΈ λλ€.
```
### * class

```java
import java.util.Scanner;

public class Cinema {

    /**
     * λ©€λ² νλ
     */
    private String[][] theater;

    static final int row = 4;
    static final int col = 5;
    // static x 

    /**
     * μμ±μ
     */
    public Cinema_Main() {
        theater = new String[row][col];
    }

    /**
     * λ©μλ
     */
    // 0. κ·Ήμ₯ μ΄μ
    public void run() {
        while (true) {
            System.out.println("********************************");
            System.out.println("*********μν μλ§€ μμ€ν*********");
            System.out.println("********************************");
            System.out.println("1. μλ§€νκΈ°");
            System.out.println("2. μλ§€μ‘°ν");
            System.out.println("3. μλ§€ μ·¨μ");
            System.out.println("4. μ’λ£");
            Scanner sc = new Scanner(System.in);
            int op = sc.nextInt();
            switch (op) {
                case 1: reserve();
                    break;
                case 2: searchReservation();
                    break;
                case 3: cancelReservation();
                    break;
                case 4:
                    System.out.println("μ΄μ©ν΄μ£Όμμ κ°μ¬ν©λλ€. μλνκ°μΈμ~!");
                    return;
                case 5: printSeatInfo();
                    break;
                default:
                    System.out.println("1 ~ 4 λ²νΈλ§ μλ ₯ν΄μ£ΌμΈμ.");
                    break;
            }
        }
    }

    // 1. μλ§€νκΈ°
    private void reserve() {
        //1. μ’μνν© λ³΄μ¬μ£ΌκΈ°
        printSeatInfo();
        while (true) {
            System.out.println("μ’μμ μ νν΄μ£ΌμΈμ.");
            System.out.println("μ΄λ―Έ μλ§€λ μ’μμ \"μλ§€\"λΌκ³  νμλ©λλ€.");
            //2.1 μ¬μ©μ ν μλ ₯
            System.out.println("νμ μλ ₯ν΄μ£ΌμΈμ");
            Scanner sc = new Scanner(System.in);
            int r = Integer.parseInt(sc.nextLine());
            //2.2 μ¬μ©μ μ΄ μλ ₯
            System.out.println("μ΄μ μλ ₯ν΄μ£ΌμΈμ");
            sc = new Scanner(System.in);
            int c = Integer.parseInt(sc.nextLine());

            if (r <= 0 || r > row || c <= 0 || c > col) {
                System.out.println("μλͺ»λ μ’μ λ²νΈμλλ€. λ€μ μλ ₯ν΄μ£ΌμΈμ.");
                continue;
            }

            //3. μλ§€ κ°λ₯ μ λ¬΄ νμΈ
            if (theater[r - 1][c - 1] == null) {
                System.out.println("μλ§€ κ°λ₯ν μ’μμλλ€");
            } else {
                System.out.println("μ΄λ―Έ μμ½λ μ’μμλλ€");
                continue;
                //3-1 μλ§€ λμμΌλ©΄ λ€μ 1λ‘
            }

            //4.ν° λ²νΈ μλ ₯
            String phone = "";
            while (true) {
                System.out.println("ν΄λν° λ²νΈ λ·μλ¦¬ 4μλ¦¬λ₯Ό μλ ₯ν΄μ£ΌμΈμ");
                phone = sc.nextLine();

                if (phone.length() != 4) {
                    System.out.println("λ·λ²νΈ λ€ μλ¦¬λ§ μλ ₯ν΄μ£ΌμΈμ.");
                    continue;
                }
                break;
            }

            //5. ν΄λΉ νκ³Ό μ΄ λ°°μ΄μ Person κ°μ²΄ μμ±
            theater[r - 1][c - 1] = phone;
            System.out.println("μλ§€λ μ’μλ²νΈ : " + r + "ν " + c + "μ΄ \nμλ§€μ λ±λ‘ν ν΄λμ ν λ· 4μλ¦¬ : " + phone);
            break;
        }
    }

    // 2. μλ§€ μ‘°ννκΈ°
    private void searchReservation() {
        System.out.println("μ νλ²νΈλ₯Ό μλ ₯ν΄μ£ΌμΈμ.");
        Scanner sc = new Scanner(System.in);
        String phone = sc.nextLine();
        System.out.println();
        for(int i =0;i<row;i++) {
            for(int j =0;j<col;j++) {
                if(theater[i][j] == null) {
                    continue;
                }
                if(theater[i][j].equals(phone)) {
                    System.out.println("κ³ κ°λμ΄ μλ§€νμ  μ’μμ "+ (i + 1) +" - " + (j + 1) +" μλλ€.");
                    System.out.println();
                    return;
                }
            }
        }
        System.out.println("μλ§€νμ  μ’μμ΄ μμ΅λλ€.");
        System.out.println();
    }

    // 3. μλ§€ μ·¨μνκΈ°
    private void cancelReservation() {
        System.out.println("μ νλ²νΈ λ·μλ¦¬ λ€μλ¦¬λ₯Ό μλ ₯ν΄μ£ΌμΈμ.");
        Scanner sc = new Scanner(System.in);
        String phone = sc.nextLine();
        for(int i = 0; i < row; i++) {
            for(int j = 0; j < col; j++) {
                // μλ§€κ° λμ§ λμ§ μμ κ²½μ°
                if (theater[i][j] == null) {
                    continue;
                }
                if(theater[i][j].equals(phone)) {
                    String yn;
                    System.out.println("μμ½νμ  μ’μμ " + (i + 1) + " - " + (j + 1) +" μλλ€.");
                    System.out.println();
                    System.out.println("μμ½μ μ·¨μνμκ² μ΅λκΉ?(y/n)");
                    yn = sc.nextLine();
                    if(yn.equals("y")) {
                        theater[i][j] = null;
                        System.out.println("μμ½μ΄ μ·¨μ λμμ΅λλ€.");
                    } else {
                        System.out.println("λ©μΈ νλ©΄μΌλ‘ λμκ°λλ€.");
                    }
                    return;
                }
            }
        }
        System.out.println("μλ§€ λ΄μ­μ΄ μμ΅λλ€.");
    }

    private void printSeatInfo() {
        System.out.println("*******μ’μ νν©*******");
        for (int i = 0; i < row; ++i) {
            for (int j = 0; j < col; ++j) {
                if (theater[i][j] == null) {
                    System.out.print("[" + (i + 1) + "-" + (j + 1) + "]");
                } else {
                    System.out.print("[μλ§€]");
                }
            }
            System.out.println();
        }
        System.out.println("----------------------");
    }
}

```
### * main 
```java
public class Cinema {
    public static void main(String[] args) {
        Cinema_Main cinema = new Cinema_Main();
        cinema.run();
    }
}

```
