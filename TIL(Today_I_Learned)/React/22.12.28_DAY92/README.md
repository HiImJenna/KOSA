# 2022.12.28.WED ð
----------------
<br> 

## 1. ì»´í¬ëí¸ â
```js
function Card() {
  return(
    <>
    </>
  )
}
export default Card;
```
<br>

### [ì´ì  ë´ê° í ê²]
```js
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
```
<br>

### [Mapê³¼ íë©´ë¿ë¦¬ê¸° ëëë ë²ì ]
```js
{
shirts.map((item,i)=>{
    return <Card shirts={shirts[i]} i={i} key={i}/>
})
}
<Card shirts={shirts}/>
```
- ë¶ëª¨ìì map ì²ë¦¬
```js
//function Card()
function Card(props){
  return(
    <div className="container">
      <div className="row">
        <div className="col-md-4">
          <img src={props.shirts.img} width={'80%'}/>
            <h4>{props.shirts.title}</h4>
            <p>{props.shirts.content}</p>
            <p>{props.shirts.price}</p>
        </div>
      </div>
    </div>
  )
}
```
- ë¶ëª¨ ììì propsë¡ ê°ì ¸ìì íë©´ì ë¿ë¦¬ê¸°ë§?
<br>

# 2. Router â
- íì´ì§ ì´ë
### [Termimal]
```
 npm i react-router-dom@6
```
<br>

### [index.js]
```js
import { BrowserRouter } from 'react-router-dom';

root.render(

  <>
    <BrowserRouter>
     <App />
    </BrowserRouter>
  </>
);
```
<br>

### [App.js]
```js
<Routes>
    <Route path='/detail' element={<div>ìì¸íì´ì§</div>}/>
    <Route path='/about' element={<div>íì¬ ì ë³´ íì´ì§</div>}/>
</Routes>
```
- url ë¤ìê° path ê°ì´ë©´ ...

## ð¡ Route ìì Route & Outlet
### [App.js]
```js
<Route path='/event' element={<Event/>}>
    <Route path='one' element={<div>1+1</div>}/>
    <Route path='two' element={<div>í¬ì¸í¸</div>}/>
</Route>
```
- /event/one
- /event/two
<br>

### [components/Event.js]
```js
import { Outlet } from "react-router-dom";
function Event() {
    return(
        <>
            <h1>Event page</h1>
            <Outlet></Outlet>
        </>
    )
}
export default Event;
```
- Outlet : App.jsìì ëê²¨ì¤ element ê°ì ë°ìì£¼ë ì­í 
<br>

## 3. ìì¸íì´ì§ ë° ë¤ë¡ê°ê¸° ë²í¼ â
### [Detail.js]
```js
function Detail({shrits}){

    let {id} = useParams();
    let findId = shrits.find((item) => item.id == id); //ê²ì¦
    let navigate = useNavigate();

    console.log(findId)

    return(
        <div className="container">
            <Box>
                <YellowBtn>Detail page</YellowBtn>
            </Box>
                <ColorwBtn>Detail page</ColorwBtn>
            <div className="col-md-4">
                <img src={findId.img} width={'80%'}/>
                <h4>{findId.title}</h4>
                <p>{findId.content}</p>
                <p>{findId.price}ì</p>

                <button className="btn btn-danger">ì£¼ë¬¸íê¸°</button>
                <button onClick={() => { navigate(-1) }} className="btn btn-primary">ë¤ë¡íê¸°</button>
                <button className="btn btn-success">í</button>
                <button className="btn btn-dark"> ì¥ë°êµ¬ë</button>
            </div>
        </div>
    )
} 
```
- find í¨ìë ì¤íë  ë ìì ê°ì´ true ë¼ë©´ ê·¸ ê°ì ì ì¥í¨
- ë¤ë¡ê°ê¸° ë²í¼ì ë§ë¤ê¸° ìí´ì  navigate ì¬ì©
- navigate(-1) : í íì´ì§ ë¤ë¡
<br>

# 4. Lifecycle
![image](https://user-images.githubusercontent.com/111114507/209777361-a51bbb06-ce3d-4909-83b6-bb1d652d09f3.png)
- í¬ê² ìì± ë ë, ìë°ì´í¸ í  ë, ì ê±°í  ë ì¸ê°ì§ ì íì¼ë¡ ëë ì ìì
- ë§ì´í¸ë DOMì´ ìì±ëê³  ì¹ ë¸ë¼ì°ì  ììì ëíëë ê²ì ë»íê³ , ë°ëë¡ ì¸ë§ì´í¸ë DOMìì ì ê±°ëë ê²ì ë»í¨
```js
import { Component } from "react";

class LifeCyclecom extends Component {
    componentDidMount() {
        //ì»´í¬ëí¸ê° mount ë  ë ì½ë ì¤í
    }

    componentDidUpdate() {
        //ì»´í¬ëí¸ê° update ë  ë ì½ë ì¤í
    }

    componentWillUnmount() {
        //ì»´í¬ëí¸ê° unmount ë  ë ì½ë ì¤í
    }
}
```
<br>

### ð¡ useEffect()
- useEffect(() => {}) : ì¬ë ëë§ë§ë¤ ì½ë ì¤í
- useEffect(()=>{}, []) - ëê´í¸ ììë : mountë ë 1íë§ ì¤í
- useEffect(()=>{}, ['ìíë³ì']) : ìíë³ìê° ìëë  ë ì¤í
- useEffect(()=>{}, return) : unmount
<br>

### ð¡ ì¦ê° ë²í¼ í´ë¦­ (update)
```js   
useEffect(() => {
    //ì¬ê¸°ì ê¸°ì¬íë©´ ì´ ì½ëë ì»´í¬ëí¸ì ìì±/ìë°ì´í¸/ìë©¸ ì¤í
    console.log('react');
})

<button onClick={() => {setCount(count+1)}}>ì¦ê°</button>
{count}
```
![image](https://user-images.githubusercontent.com/111114507/209778355-a289ed60-2968-48f9-b920-a6b92b0e4bb7.png)
<br>

# 4. setTimeout â
- Function Componentìì Hookì ì´ì©íì¬ state ê´ë¦¬ë¥¼ ì§í
- ì´ ë, setTimeOutì ì¬ì©íë©´ ì¼ì  ìê° í ì½ëë¥¼ ë¹ëê¸°ì ì¼ë¡ ì¤í
```
setTimeout(function() { // Code here }, delay);
```
<br>

