# 2022.11.09.WED ๐
----------------
<br>

## 1. eXERD โ

## ๋ฆฌ๋ฒ์ค ์์ง๋์ด๋ง

- ๊ธฐ์กด DB์ ์ฐ๊ฒฐํ ํ ์๋์ผ๋ก ERD๋ฅผ ๋ง๋ค์ด ์ฃผ๋ ๊ฒ

## 2. ์นธ๋ฐ๋ณด๋ โ

[์๋ฐ ์คํฌ๋ฆฝํธ: ๋๋๊ทธ ์ค ๋๋ ์ฌ์ฉ ๊ธฐ์ ](https://www.notion.so/f2af0ea1727a4e91b35aee257f89370d) 

[์๋ฐ ์คํฌ๋ฆฝํธ : ๋๋๊ทธ ์ค ๋๋ ๊ธฐ์ด](https://www.notion.so/a681b409d73f482091f5f94173d58021) 

[์๋ฐ ์คํฌ๋ฆฝํธ : Flex](https://www.notion.so/Flex-9db8eba549b54f6d9e98553f397e985c) 

Drag ํ์ด๋๋ถ๋ถ

```jsx
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="drag2.css">

    <script>
        $(function(){ //ํ์ด์ง๊ฐ ๋ก๋ ๋๋ฉด
            action1(); //๊ธฐ์กด์ todo์ ์ด๋ฒคํธ ๊ฑธ๊ธฐ

            $(document).on('click', "#todocreate", function(){ //todo ์์ฑ ๋ฒํผ ํด๋ฆญํ  ๊ฒฝ์ฐ
                html = "<p class='draggable' draggable='true'>" + $("#todo").val() +"<br><button id='updat' type='button' class='btn btn-success btn-sm m-2'>์์ </button><button id='del' type='button' class='btn btn-success btn-sm m-2'>์ญ์ </button></p>";

                $("#todoboard").append(html);

                document.getElementById("createboard").className += " visually-hidden";

                action1(); //todo์ ์ด๋ฒคํธ ๊ฑธ๊ธฐ
            });

        });

        function action1(){
            const draggables = document.querySelectorAll(".draggable"); //nodeList ๋ฐํ
            const containers = document.querySelectorAll(".container");

            draggables.forEach(draggable => {
                draggable.addEventListener("dragstart", () => {
                    draggable.classList.add("dragging");
                });

                draggable.addEventListener("dragend", () => {
                    draggable.classList.remove("dragging");
                });
            });

            containers.forEach(container => {
                container.addEventListener("dragover", e => {
                    e.preventDefault();
                    const afterElement = getDragAfterElement(container, e.clientX);
                    const draggable = document.querySelector(".dragging");
                    if (afterElement === undefined) {
                        container.appendChild(draggable);
                    } else {
                        container.insertBefore(draggable, afterElement); //๋๋๊ทธ ํ ์ ์๋ ์์น ์ค ์ฎ๊ฒจ์ง ์์น์ ์ฝ์
                    }
                });
            });

            function getDragAfterElement(container, x) {
                const draggableElements = [
                    ...container.querySelectorAll(".draggable:not(.dragging)"),
                ];

                return draggableElements.reduce(
                    (closest, child) => {
                        const box = child.getBoundingClientRect();
                        const offset = x - box.left - box.width / 2;
                        // console.log("offset: " + offset);
                        // console.log("closest: " + closest.offset);
                        if (offset < 0 && offset > closest.offset) {
                            return { offset: offset, element: child };
                        } else {
                            return closest;
                        }
                    },
                    { offset: Number.NEGATIVE_INFINITY },
                ).element;
            }

        }

        $(document).on('click', '#del', function(){
            console.log($(this).parent("p"));
            $(this).parent("p").remove();
        });

        let block = "";

        //todo ๋ธ๋ญ์ ์์ ์ ๋๋ฅผ ๊ฒฝ์ฐ
        $(document).on('click', '#updat', function(){

            $('#todo1').empty(); //๊ธฐ์กด ๋ฌธ์ฅ ์ง์ฐ๊ธฐ

            //๋ณด์ด๊ฒํ๊ธฐ ์จ๊ธฐ๊ธฐ
            if(document.getElementById("createboard1").classList.item(2) == null){
                document.getElementById("createboard1").className += " visually-hidden";
            }else{
                document.getElementById("createboard1").classList.remove("visually-hidden");
            }

            //์ ํํ todo์ ๋ฌธ์์ด ๊ฐ์ ธ์์ textarea์ ๋ฃ๊ธฐ
            $('#todo1').val($(this).parent('p').html().trim().split('<',1));

            block = $(this).parent('p');
        });

        //์์ ํ๊ธฐ์ ์์  ๋ฒํผ์ ๋๋ฅผ ๊ฒฝ์ฐ
        $(document).on('click', '#todoupdate', function(){
            block.empty();

            html2 = $("#todo1").val() +"<br><button id='updat' type='button' class='btn btn-success btn-sm m-2'>์์ </button><button id='del' type='button' class='btn btn-success btn-sm m-2'>์ญ์ </button>"

            block.append(html2);

            document.getElementById("createboard1").className += " visually-hidden";

            action1();

        });

    </script>

</head>

<body>

    <div class="text-center my-5 header">
        <h2>1์กฐ Board</h2>
        <button id="create" type="button" class="btn btn-success" >todo ์ถ๊ฐํ๊ธฐ</button>
    </div>

    <div class="board">
        <div class="container text-center" id="todoboard">
            <h3>ToDo</h3>
            <p class="draggable" draggable="true">
                ๊ณผ์  ๋๋ด๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
            <p class="draggable" draggable="true">
                ์ ์ฌ ๋จน๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
        </div>
        <div class="container text-center" id="successboard">
            <h3>์๋ฃ</h3>
            <p class="draggable" draggable="true">
                ์์นจ ๋จน๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
            <p class="draggable" draggable="true">
                ์ ๋ ๊ณต๋ถํ๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
        </div>
        <div class="container text-center" id="falseboard">
            <h3>์คํจ</h3>
            <p class="draggable" draggable="true">
                ์์นจ ๋จน๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
            <p class="draggable" draggable="true">
                ์ ๋ ๊ณต๋ถํ๊ธฐ<br>
                <button id="updat" type="button" class="btn btn-success btn-sm m-1">์์ </button>
                <button id="del" type="button" class="btn btn-success btn-sm m-1">์ญ์ </button>
            </p>
        </div>
    </div>

    <div id="createboard" class="text-center my-5 visually-hidden">
        <label for="exampleDataList" class="form-label">ToDo ๋ง๋ค๊ธฐ</label>
        <textarea class="form-control" id="todo" placeholder="ํ ์ผ์ ์์ฑํด์ฃผ์ธ์"></textarea>
        <button id="todocreate" type="button" class="mt-2 btn btn-success" >์ถ๊ฐ</button>
    </div>

    <div id="createboard1" class="text-center my-5 visually-hidden">
        <label for="exampleDataList" class="form-label">ToDo ์์ ํ๊ธฐ</label>
        <textarea class="form-control" id="todo1"></textarea>
        <button id="todoupdate" type="button" class="mt-2 btn btn-success" >์์ </button>
    </div>

    <script>
        //ํ ์ผ ๋ณด๋ ์์ฑ
        document.getElementById("create").addEventListener('click', function(){
            
            if(document.getElementById("createboard").classList.item(2) == null){
                document.getElementById("createboard").className += " visually-hidden";
            }else{
                document.getElementById("createboard").classList.remove("visually-hidden");
            }
        })

        //ํ ์ผ ์ถ๊ฐ
        document.getElementById("todocreate").addEventListener('click', function(){
            let todo = document.getElementById("todo").value;
            console.log(todo);
        })

        document.getElementById("todo").addEventListener('click', function(){
            let todoboard = document.getElementById("todoboard");
            let p = document.createElement("p");
        })

    </script>

</body>

</html>
```