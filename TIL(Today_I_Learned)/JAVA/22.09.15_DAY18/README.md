# 2022.09.15.Thu ๐
<br>

## 1. Date Format โ
-----------------------------
<br>

```java
Date currdate = new Date();
		Calendar cal = Calendar.getInstance();
		System.out.println("date : " + currdate);
		//date : Thu Sep 15 09:20:31 KST 2022
		
		System.out.println("cal : " + cal); //๋ฌธ์์ด์ ์กฐํฉ
		//[time=1663201231171,areFieldsSet=true,areAllFieldsSet ... 
		
		System.out.println("cal getTime()ํจ์ : " + cal.getTime());
		//Thu Sep 15 09:21:48 KST 2022
		
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmm");
		
		String s = dateformat.format(currdate);
		String s2 = dateformat.format(cal.getTime());
		System.out.println(s);
		System.out.println(s2);
		
		//์ฌ์ดํธ ์ด๋ค ์ ๋ณด ์๋ ฅ
		//๋ฌธ์์ด >> ๋ ์งํ์์ผ๋ก
		//"202209150925"
		String StringDate = "202209150925"; //ํ์์ ๋ฌธ์  ์๋ค๋ฉด
		Date stringdate = null;
		
		try { 
			stringdate = dateformat.parse(StringDate);
			
			long datelong = stringdate.getTime();
			System.out.println(datelong);
			}
			//parse ๋ง๋  ์ค๊ณ์ (๋ฌธ์  ๋ฐ์ ๊ณ ๋ฏผ) throws .. ์ฌ์ฉ์๋ ์์ธ์ฒ๋ฆฌ
			catch (ParseException e) { e.printStackTrace();}
			finally { System.out.println(stringdate); }
		
		System.out.println();
```

### Date.getTime()
    : Date.getTime()์ Date๋ฅผ ๋ฐ๋ฆฌ์ธ์ปจ๋๋ก ๋ณํํด์ longํ ์ซ์ ๋ฐ์ดํฐ๋ก ๋ฐํํฉ๋๋ค. ์ด๋ฅผ ์ด์ฉํ๋ฉด ์ฐ์  ์ฐ์ฐ์ผ๋ก ์๊ฐ ์ฐจ์ด๋ฅผ ์ฝ๊ฒ ๊ตฌํ  ์ ์์ต๋๋ค.

```java

public class main {
    public static void main(String[] args) throws ParseException {
        String date1 = "2021/01/02"; //๋ ์ง1
        String date2 = "2021/01/01"; //๋ ์ง2
       
        Date format1 = new SimpleDateFormat("yyyy/MM/dd").parse(date1);
        Date format2 = new SimpleDateFormat("yyyy/MM/dd").parse(date2);
        
        long diffSec = (format1.getTime() - format2.getTime()) / 1000; //์ด ์ฐจ์ด
        long diffMin = (format1.getTime() - format2.getTime()) / 60000; //๋ถ ์ฐจ์ด
        long diffHor = (format1.getTime() - format2.getTime()) / 3600000; //์ ์ฐจ์ด
        long diffDays = diffSec / (24*60*60); //์ผ์์ ์ฐจ์ด
        
        System.out.println(diffSec + "์ด ์ฐจ์ด");
        System.out.println(diffMin + "๋ถ ์ฐจ์ด");
        System.out.println(diffHor + "์ ์ฐจ์ด");
        System.out.println(diffDays + "์ผ ์ฐจ์ด");
    }
}
```

## 2. Decimal Format โ
-----------------------------
<br>

![image](https://user-images.githubusercontent.com/111114507/190288732-914b74e3-f4b0-496d-9b49-c08460ddc5bd.png)

```java
double money = 123456.5678;
```
### <0.0>
```java
DecimalFormat df = new DecimalFormat("0.0");
System.out.println(df.format(money));

์ถ๋ ฅ๊ฐ : 123456.6 (๋ฐ์ฌ๋ฆผ)
```

### <0>
```java
DecimalFormat df2 = new DecimalFormat("0");
System.out.println(df2.format(money));

์ถ๋ ฅ๊ฐ : 123457 (๋ฐ์ฌ๋ฆผ)
```

### <0.000...>
```java
DecimalFormat df3 = new DecimalFormat("0.000000"); 
System.out.println(df3.format(money));

์ถ๋ ฅ๊ฐ : 123456.567800 ( ์๋ ์๋ฆฌ๋ 0์ผ๋ก ์ฑ์)
```
### <#.###..>
```java
DecimalFormat df4 = new DecimalFormat("#.#######"); 
System.out.println(df4.format(money));

์ถ๋ ฅ๊ฐ : 123456.5678 
```
<br>

## 3. I/O Stream โ
-----------------------------
<br>

![์ด๋ฏธ์ง](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbvH00I%2FbtqydR4e1Ju%2FDaCDExX0OKOaZquiHWzWLK%2Fimg.png)
- ์๋ฐ์์ ๋ฐ์ดํฐ๋ ์คํธ๋ฆผ์ ํตํด ์์ถ๋ ฅ๋จ

![image](https://mblogthumb-phinf.pstatic.net/MjAxNzAzMDdfMzcg/MDAxNDg4ODc1NTU1NzYz.Jh8-r-RQcxjkX0W2LKMtVT-1BDD1kHl9MwLqEflkySgg.i0cmhOjAE8R72W9oY_VuQVCpsPAndzgmFDgnIGkDvYsg.PNG.mcm1092/%EB%B0%94%EC%9D%B4%ED%8A%B8%EC%8A%A4%ED%8A%B8%EB%A6%BC_%EB%AC%B8%EC%9E%90%EC%8A%A4%ED%8A%B8%EB%A6%BC.png?type=w800)
![image](https://user-images.githubusercontent.com/111114507/190292594-a1a3c4a2-7d58-412f-a948-65a0761d5d39.png)
- byte stream : ์์ ๋นจ๋
- ๋ฌธ์ stream : ํฐ ๋นจ๋

### ๐stream
```java
 Stream(์ข๋ฃ)
 ๋ฐ์ดํฐ ์ข๋ฅ : ์ด๋ฏธ์ง, ํ์ผ(๋ฐ์ด๋๋ฆฌ) <> ๋ฌธ์
 
 JAVA API
 [Byte]๋จ์์ ๋ฐ์ดํฐ IO
 
 ์ถ์ํด๋์ค
 InputStream, OutputStream
 
 ๋น์ ์ด Byte ๋ฐ์ดํฐ ์์์ ํ  ๋
 [์๋ ฅ InputStream] ์์ ๋ฐ๋ ํด๋์ค ์ฌ์ฉํ์ธ์ : ๋์
 
 ๋์
 1. Memory : ByteArrayInputStream ...
 2. File : FileInputStream
 
  ๋น์ ์ด Byte ๋ฐ์ดํฐ ์์์ ํ  ๋
 [์ถ๋ ฅ OutputStream] ์์ ๋ฐ๋ ํด๋์ค ์ฌ์ฉํ์ธ์ : ๋์
 
 ๋์
 1. Memory : ByteArrayOutputStream ...
 2. File : FileOutputStream

```
<br>

### ๐ File Stream

```java
Byte ๋ฐ์ดํฐ๋ฅผ read, write >> ๊ทธ ๋์์ด >> File
FileInputStream
FileOutputStream

(์ด๋ฏธ์ง, ์์ํ์ผ) read, write

File >> 1.txt, data.txt (๋ฐ์ดํฐ๋ฅผ ํ์ผ์ ๊ธฐ๋ก)


FileInputStream fs = null; ๊ตณ์ด ์ด๋ ๊ฒ ํ๋ ์ด์ 

I/O ํด๋์ค๋ ์์ธ๋ฅผ ๊ฐ์  ํด์ผํ๊ธฐ ๋๋ฌธ์ ํ๋๊ฑฐ์

I/O ์์์ ๊ฐ๋ฐ์๊ฐ ์ง์ ์ ์ผ๋ก ์์์ ํด์  (์ฌ๋ฌ ์ฌ์ฉ์๋ค์ด ์ ๊ทผ ์ฌ์ฉ ๊ฐ๋ฅ)
>> close() 
```
<br>

### ๐ Buffer
```java
 File ์ฒ๋ฆฌ (DISK) : ์๋ ฅ ์ถ๋ ฅ์ Byte ๋จ์๋ก (ํ Byte) read, write
 
 ์ฌ๋ฌ ํ์์ ๋ชจ์์ ํ๋์ ๋ฒ์ค์ ํ์์ ๋ชฉ์ ์ง ... ๋๋ฉด
 ๋ฒ์ค : buffer
 1. I/O ์ฑ๋ฅ ๊ฐ์  (์ ๊ทผ ํ์ ์ค์ด๊ธฐ)
 2. Line ๋จ์ (์ํฐ)
 
 BufferedInputStream(๋ณด์กฐ ์คํธ๋ฆผ) >> ์ฃผ ํด๋์ค์ ์์กด

```
![image](https://user-images.githubusercontent.com/111114507/190366898-9cdb9209-2253-4b7d-90d2-31d4a25a276f.png)

#### - ๊ณ ์  ๊ฐ์ด ์๋๋ผ ๊ฐ๋ณ์ ์ธ ๊ฐ์ ๋ฐ์ -> 5๊ฐ์ ๊ฐ์ ๋ฐ์ผ๋ฉด 5๊ฐ์ ๊ณต๊ฐ, 10๊ฐ์ ๊ฐ์ ๋ฐ์ผ๋ฉด 10๊ฐ์ ๊ณต๊ฐ ์์ฑ  
#### - ์๋ ฅ๋ฐ์ ๊ฐ์ ๋ฒํผ์ ์ ์ฅํด๋์๋ค๊ฐ ๋ฒํผ๊ฐ ๊ฐ๋ ์ฐจ๊ฑฐ๋ ๊ฐํ ๋ฌธ์๊ฐ ๋ํ๋๋ฉด ํ๋ฒ์ ์ ๋ฌ


## 4. Reader & Writer โ
-----------------------------
<br>

### Q) Lotto Class์์ ๊ฐ์ ๋ฐ๋ ํ์ผ ์์ฑํ๊ธฐ

[๊ธฐ๋ณธ ์์ค]
```java
FileReader fr = null;
FileWriter fw = null;
BufferedReader br = null;
BufferedWriter bw = null;

=> ๊ธฐ๋ณธ์ ์ผ๋ก 4๊ฐ ํ์
```

[์ฐ๊ธฐ]
```java
fw = new FileWriter("Lotto.txt", true);
bw = new BufferedWriter(fw);
bw.write("๋ก๋๋ฒํธ : " + Arrays.toString(lotto));
SimpleDateFormat date = new SimpleDateFormat(" [yyyy๋MM์dd์ผ HH:mm]");
String time = date.format(cal.getTime());
bw.write(time);
bw.newLine();
```
```
FileWriter๋ฅผ ์์ฑํ์ฌ BufferWriter์๊ฒ ๋๊ฒจ์ค๋ค
bw.write()๋ฅผ ์์ฑํ์ฌ ์๋ ฅํ๊ณ 
bw.newLine()๋ฅผ ์์ฑํ์ฌ ์ค๋์์ฃผ๊ณ 
bw.flush()๋ฅผ ํตํด ๋ฒํผ๊ฐ ์์ฐจ๋๋ผ๋ ๋๊ฒจ์ค๋ค.
```
[์ฝ๊ธฐ]
```java
fr = new FileReader("lotto.txt");
br = new BufferedReader(fr);
String line = "";
for (int i = 0; (line = br.readLine()) != null; i++) {
	System.out.println(line);
}
```

```
br.readLine()์ ํตํด ๋ฒํผ ๋ ๋ผ์จ๊ฑธ ๋ฐ์์ฃผ๊ณ  ์จ๋ด๋ ค๊ฐ๋ค
for๋ฌธ์ while ((line=br.readLine())!=null)์ผ๋ก ๋ณ๊ฒฝํ  ์ ์๊ฒ ๋ค๊ณ ๋ ์๊ฐํ๋ค.
```
[์ ์ฒด ์์ค]
```java
	public void Write() {
		Calendar cal = Calendar.getInstance();

		FileWriter fw = null;
		BufferedWriter bw = null;

		try {
			fw = new FileWriter("Lotto.txt", true);
			bw = new BufferedWriter(fw);
			bw.write("๋ก๋๋ฒํธ : " + Arrays.toString(lotto));
			SimpleDateFormat date = new SimpleDateFormat(" [yyyy๋MM์dd์ผ HH:mm]");
			String time = date.format(cal.getTime());
			bw.write(time);
			bw.newLine();
		} catch (Exception e) {

		} finally {
			try {
				bw.close();
				fw.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	public void Read() {
		FileReader fr = null;
		BufferedReader br = null;

		try {
			fr = new FileReader("lotto.txt");
			br = new BufferedReader(fr);
			String line = "";
			for (int i = 0; (line = br.readLine()) != null; i++) {
				System.out.println(line);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

public class Lotto_Main {

	public static void main(String[] args) {
		Lotto lotto = new Lotto();
		lotto.runLotto();
		lotto.Write();
		lotto.Read();
	}
}
```

## 5. File_Dir ๊ตฌํํ๊ธฐ โ
-----------------------------

### ๐ 1)
[์์ค]
```java
public static void main(String[] args) {
    //System.out.println(args[0]);
    if(args.length != 1) {
        System.out.println("์ฌ์ฉ๋ฒ : java ํ์ผ๋ช [๋๋ ํ ๋ฆฌ๋ช]");
        System.exit(0);//๊ฐ์ ์ข๋ฃ
    }
    //java Ex08_File_Dir C:\\Temp
    File f = new File(args[0]);
    if(!f.exists() || !f.isDirectory()) {
        //๋์ค์ ํ๋๋ผ๋ ๋ง์กฑํ์ง ์์ผ๋ฉด
        //์กด์ฌํ์ง ์๊ฑฐ๋ ๋๋ ๋๋ ํ ๋ฆฌ๊ฐ ์๋๋ผ๋ฉด
        System.out.println("์ ํจํ์ง ์์ ๊ฒฝ๋ก์๋๋ค");
        System.exit(0);
    }
    
    //์ค์  ์กด์ฌํ๋ ๊ฒฝ๋ก์ด๊ณ  ์ ์ํ๊ฒ์ด ํด๋๋ผ๋ฉด
    //POINT
    File[] files = f.listFiles(); 
    //C:\\Temp ์์ ํด๋๋ ํ์ผ์ ๋ฐฐ์ด์ ๋ด์์ ....
    //[a.txt][b.txt][][]
    //System.out.println(files.length);
    for(int i = 0 ; i < files.length ;i++) {
        String name= files[i].getName();
        System.out.println(files[i].isDirectory() ? "[DIR]" + name : name);
	}
}
```
[CMD]
```java
C:\KOSA_IT\JAVA\Labs\Ex09_IO\bin>java Ex08_File_Dir ../../../../../Temp
[DIR]a
a.txt
[DIR]b
file.txt
java.jpg
new.txt
```
<br>

### ๐ 2)
[์์ค]
```java
public static void main(String[] args) {
    File dir = new File("C:\\Temp");
    File[] files = dir.listFiles();
    
    for(int i = 0 ; i < files.length ;i++) {
        File file = files[i];
        
        String name = file.getName(); //ํด๋๋ช or ํ์ผ๋ช 
        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH-mma");
        String attribute="";
        String size="";
        
        if(files[i].isDirectory()) { //ํด๋๋ ์ง๋ฌธ
            attribute="<DIR>";
        }else { //๋ค ํ์ผ( 1.jpg, data.txt ...
            size = file.length() + "byte";
            attribute = file.canRead()   ? "R" :"";
            attribute += file.canWrite() ? "W" :"";
            attribute += file.isHidden() ? "H" :"";
            
        }
        System.out.printf("%s  %3s  %10s  %s  \n",
                            dt.format(new Date(file.lastModified())),
                            attribute,
                            size,
                            name);
    }
}
```
[์ถ๋ ฅ]
```java
2022-09-15 16-58์คํ  <DIR>              a  
2022-09-15 11-10์ค์    RW       5byte  a.txt  
2022-09-15 16-58์คํ  <DIR>              b  
2022-09-15 16-29์คํ   RW       0byte  file.txt  
2022-09-15 11-50์ค์    RW  229277byte  java.jpg  
2022-09-15 12-22์คํ   RW       5byte  new.txt
```
