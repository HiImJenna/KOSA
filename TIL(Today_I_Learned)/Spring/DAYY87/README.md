# 2022.12.21.WED 📅
----------------
<br> 

# 1. Ajax ✔
![image](https://user-images.githubusercontent.com/111114507/208802297-1a22f0e1-11f2-413a-b83d-194975a78272.png)
<br>

### [AjaxController.java]
```java
@RequestMapping("json.kosa")
public View jsonkosa(String command, String name, String [] arr, ModelMap map) {
    
    System.out.println("command: " + command);
    System.out.println("name: " + name);
    System.out.println("arr: " + arr);
    System.out.println("Arrays.toString(): " + Arrays.toString(arr));
    ArrayList<String> list = new ArrayList<String>();
    list.add("치킨");
    list.add("맥주");
    list.add("피자");
    
    map.addAttribute("menu", list); //View단에 전달
    //{:}
    //{"menu":Array}
    
    return jsonview;
    //<bean name = "jsonview" 객체와 동일한 이름
    // map.addAttribute("menu", list); 자원을 자동으로 json 객체로 변환해서 클라이언트에게 비동기로 전달
}
```
### [index.jsp]
```jsp
$('#ajaxBtn').click(function(){
    var array = new Array();
        array[0] = "a";
        array[1] = "b";
    $.ajax(
        { //json  방식
            type : "post",
            url  : "json.kosa",
            data : "command=AjaxTest&name=java&arr="+array,
            success : function(data){  //서버 {"menu",list}   //data > {}
            console.log(data);
            $('#menuView').empty();
            var opr="";
            $.each(data.menu,function(index,value){ //data.menu > ["치킨맥주","돈까스","치킨피자"]
                console.log(index + "/" + value);
                opr += index + "." + value + "<br>";
            });
            $('#menuView').append(opr);
            } 
        } 
        )    
});

```
- parameter에 ModelMap map을 적어줘서 json 으로 넘겨줄것임
- return jsonview; 만 해주면 알아서 Json으로 바꿈;;;
![image](https://user-images.githubusercontent.com/111114507/208802703-8465a64d-1275-4cf6-8543-5c37981ab03f.png)
<br>
