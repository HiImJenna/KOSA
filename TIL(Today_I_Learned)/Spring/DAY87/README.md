# 2022.12.21.WED ๐
----------------
<br> 

# 1. Ajax โ
![image](https://user-images.githubusercontent.com/111114507/208802297-1a22f0e1-11f2-413a-b83d-194975a78272.png)
- json.kosa  / json2.kosa  / json3.kosa  / json4.kosa
<br>

### ๐ก json.kosa
#### [AjaxController.java]
```java
@RequestMapping("json.kosa")
public View jsonkosa(String command, String name, String [] arr, ModelMap map) {
    
    System.out.println("command: " + command);
    System.out.println("name: " + name);
    System.out.println("arr: " + arr);
    System.out.println("Arrays.toString(): " + Arrays.toString(arr));
    ArrayList<String> list = new ArrayList<String>();
    list.add("์นํจ");
    list.add("๋งฅ์ฃผ");
    list.add("ํผ์");
    
    map.addAttribute("menu", list); //View๋จ์ ์ ๋ฌ
    //{:}
    //{"menu":Array}
    
    return jsonview;
    //<bean name = "jsonview" ๊ฐ์ฒด์ ๋์ผํ ์ด๋ฆ
    // map.addAttribute("menu", list); ์์์ ์๋์ผ๋ก json ๊ฐ์ฒด๋ก ๋ณํํด์ ํด๋ผ์ด์ธํธ์๊ฒ ๋น๋๊ธฐ๋ก ์ ๋ฌ
}
```
#### [index.jsp]
```jsp
$('#ajaxBtn').click(function(){
    var array = new Array();
        array[0] = "a";
        array[1] = "b";
    $.ajax(
        { //json  ๋ฐฉ์
            type : "post",
            url  : "json.kosa",
            data : "command=AjaxTest&name=java&arr="+array,
            success : function(data){  //์๋ฒ {"menu",list}   //data > {}
            console.log(data);
            $('#menuView').empty();
            var opr="";
            $.each(data.menu,function(index,value){ //data.menu > ["์นํจ๋งฅ์ฃผ","๋๊น์ค","์นํจํผ์"]
                console.log(index + "/" + value);
                opr += index + "." + value + "<br>";
            });
            $('#menuView').append(opr);
            } 
        } 
        )    
});

```
- parameter์ ModelMap map์ ์ ์ด์ค์ json ์ผ๋ก ๋๊ฒจ์ค๊ฒ์
- return jsonview; ๋ง ํด์ฃผ๋ฉด ์์์ Json์ผ๋ก ๋ฐ๊ฟ;;;
![image](https://user-images.githubusercontent.com/111114507/208802703-8465a64d-1275-4cf6-8543-5c37981ab03f.png)
<br>

### ๐ก json3.kosa - Q) Employee ๊ฐ์ฒด 2๊ฐ ๋ง๋ค์ด์ List ํํ๋ก ๋ฐํํ๋ ๋น๋๊ธฐ ์ฒ๋ฆฌ ํจ์ ์์ฑํด์ ํ์คํธ
#### [AjaxController.java]
```java
   @RequestMapping("json3.kosa")
   public View jsonkosa(HttpServletRequest request, HttpServletResponse response, ModelMap map) {

      Employee emp = new Employee(); //๊ฐ์ฒด๋ฐฐ์ด
      
      emp.setFirstname("์");
      emp.setLastname("์ ์");
      emp.setEmail("skygarden");
      
      List<Employee> list = new ArrayList<>();      
      list.add(emp);
      
      
      Employee emp2 = new Employee(); //๊ฐ์ฒด๋ฐฐ์ด
      
      emp2.setFirstname("๊น");
      emp2.setLastname("์ฐฌ์");
      emp2.setEmail("coldbrew");
      
      list.add(emp2);

      map.addAttribute("data", list);
      //{"menu":{"beer":๋ผ๊ฑฐ},{"food":"๊ณจ๋ฑ์ด"}}
	  return jsonview;
   }
```
![image](https://user-images.githubusercontent.com/111114507/208804699-e4d8a04d-b18b-45ae-8773-f275c05b0db4.png)
<br>

# 2. Ajax - ResponseBody โ
#### [AjaxController.java]
```java
@RequestMapping("response3.kosa")
public @ResponseBody Map<String, Object> add() {
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("result", "data");
    map.put("hello", "world");
    
    return map;
}
```
- 1 ๋ฐฉ์์์๋ jsonview๋ฅผ ๋ฆฌํดํ๋ฉด ์์์ json๊ฐ์ฒด๋ก ๋ฐ๊ฟ์คฌ๋ค๋ฉด, 2 ๋ฐฉ์์์๋ @ResponseBody๋ฅผ ๊ฑธ์ด์ฃผ๊ณ  ๊ฐ์ฒด๋ฅผ return ํ๋ฉด ๊ทธ return ๊ฐ์ ์์์ json์ผ๋ก ๋ฐ๊ฟ์ค
- ๋ค๋ฅธ ๋ฐฉ์์ด๋ผ๊ณ  ์๊ฐํ์
<br>

# 3. Ajax - RestController โ
#### [AjaxController.java]
```java

@RestController   //์๊ฐ ๊ฐ์ง ๋ชจ๋  ํจ์๋ ๋น๋๊ธฐ ResponseBody์ธ ๊ฑฐ์ผ
public class AjaxController {
	@RequestMapping("restcon.ajax")
	public List<Emp> ajaxResponseBody(){
		
		List<Emp> list = new ArrayList<Emp>();
		
		Emp e = new Emp();
		e.setEmpno(9999);
		e.setEname("์์ ์");
		e.setJob("IT");
		e.setSal(10000);
		list.add(e);
		
		return list;
	}
	
	@RequestMapping("view.ajax")
	public String ViewPage() {
		System.out.println("view.ajax");
		return "view.ajax ๋ฌธ์์ด์ ๋ฐํ";
	}
} 
```
- @RestController ๊ฑธ์ด์ฃผ๋ฉด ๊ทธ ์ปจํธ๋กค๋ฌ์ ์๋ ๋ชจ๋  ๋ฉ์๋๋ฅผ Ajax๋ก ์ฒ๋ฆฌํ๊ฒ ๋ค๋ ๋ป!