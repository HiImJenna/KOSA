# 2022.12.27.TUE ๐
----------------
<br> 

# 1. ๊ณผ์  1 - ๋ฒํผ ํด๋ฆญ ์ Title ๋ณ๊ฒฝ โ
```js
<button onClick={()=>{ 
    (title[0] === 'ํํ ์์ปค์ค')
    ? setTitle(["๋ถ์ฒ ์์ปค์ค", "์ผ์ฐ ์์ปค์ค", "๋ถํ ์์ปค์ค", "์ค๋ ์์ปค์ค"])
    : setTitle(["๋ถ์ฒ ๊ณ ๋ฒ์ข ์์ปค์ค", "์ผ์ฐ ๊ณ ๋ฒ์ข ์์ปค์ค", "๋ถํ ๊ณ ๋ฒ์ข ์์ปค์ค", "์ค๋ ๊ณ ๋ฒ์ข ์์ปค์ค"])
}}
class='btn btn-primary' >title chage</button>
```
<br>

# 2. ๊ณผ์  2 - Tilte์ sort ์ ์ฉ โ
```js
function titleSort() {
  let titleSort = [...title].sort();
  setTitle(titleSort);
}
```
<br>

#### [sort ์ ]
![image](https://user-images.githubusercontent.com/111114507/209604120-caa4bcfb-269c-4833-9d6f-66ebd9e1543e.png)
<br>

#### [sort ํ]
![image](https://user-images.githubusercontent.com/111114507/209604099-5093357c-186a-44fe-9af1-4b37fd64b904.png)
<br>

# 3. ๊ณผ์  3 - Modal โ
```js

```
<br>

# 4. ๊ณผ์  4 - ์ผํ๋ชฐ โ
![image](https://user-images.githubusercontent.com/111114507/209660250-2d380eef-9f96-49d1-914d-cdea30589289.png)
#### [App.js]
```js
<div className="jumbotron">
<img src={"https://www.foodandwine.com/thmb/o_G0VswYjyWy4B9epctoJ8lz9pI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/buttermilk-crumpets-FT-RECIPE0221-6975d0b31b0f469d8ebea3ae1dcf7bfd.jpg"} width={'80%'} height ={'400px'} alt="ํ์ด"/>
<h3>Fancy a crumpet?</h3>
<p className="lead">delicious crumpets</p>
</div>

<div className="container">
<div className="row">

{image.map((el, i) => {
    // let fullLink =  "https://raw.githubusercontent.com/ai-edu-pro/busan/main/t" + (i+1) + ".jpg"
    return (
    <div className='col-md-4'>
            <img src={el.image} width="80%"/>
            <h4>{el.title}</h4>
            <p>{el.content}</p>
            <p>{el.price}</p>
    </div>   
    )
})}       
</div>
```
<br>

#### [data.js]
```js
let data = [

	{
	    id : 0,
	    title : "Black and White",
  	    content : "Born in France",
	    price : 120000,
		image : "https://raw.githubusercontent.com/ai-edu-pro/busan/main/t1.jpg"
	},
	{
	    id : 1,
	    title : "Red Knit",
  	    content : "Born in Seoul",
	    price : 110000,
		image : "https://raw.githubusercontent.com/ai-edu-pro/busan/main/t2.jpg"
	},
	{
	id : 2,
	title : "Brey Yordan",
	content : "Born in the states",
	image : "https://raw.githubusercontent.com/ai-edu-pro/busan/main/t5.jpg"
	}
]
export default data;
```