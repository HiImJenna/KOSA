# 2022.12.26.MON ๐
----------------
<br> 

# 1. REACT โ
๊ฐ๋ฐํ๊ฒฝ ๊ตฌ์ฑ

- ์น๋ธ๋ผ์ฐ์ : Chrome
- ์์ํด: Visual Studio Code
- Node.js LTS Version
- React

## 1) ์ค์นํ๊ธฐ

### ๐ก Node.js

```java
1. https://nodejs.org/en/
2. ##.##.# LTS ๋ฒ์  ๋ค์ด (๋ฒ์ ์ ์ต์ ๋ฒ์ )
```

- LTS: ์์ฒด์ธก์์ ๊ณ์ ์ง์์ ํด์ฃผ๋ ๋ฒ์ 
- Node๋ฅผ ์ค์นํ๋ฉด ์๋์ผ๋ก NPM๊น์ง ์ค์น์๋ฃ

### ๐ก Visual Studio Code

```java
1. https://code.visualstudio.com/
2. OS์ ๋ง๋ ๋ฒ์  ๋ค์ด
```

### ๐ก React ํ๋ก์ ํธ ๋ง๋ค๊ธฐ

```bash
npx create-react-app [์์ฉํ๋ก๊ทธ๋จ์ด๋ฆ(ํด๋๋ช์ง์ )]
npx create-react-app .
npx create-react-app daily-blog
```
<br>

### ๐ก ํ๊ฒฝ๋ณ์ ์ค์ ํ๊ธฐ

#### ์์คํ ๋ณ์์ ํ๊ฒฝ๋ณ์ ์ค์ ํ๊ธฐ

![https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png](https://user-images.githubusercontent.com/92353613/209490823-7d8626f4-cb20-4c85-8076-3e527091dc17.png)

```bash
C:\Program Files\nodejs
```

## 2) ํด๋ ์ค๋ช

![https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png](https://user-images.githubusercontent.com/92353613/209490476-49dfcb04-f536-4453-9a6d-4a2dd8d7e1f0.png)

- package.json / package-lock.json
    - Spring Maven pom.xml ์ด๋ ๋น์ทํ๊ฒ์ด๋ค. ์ด๊ณณ์์ ํ์ํ๊ฑธ ์ ์ผ๋ฉด node_modules์ ํ์ํ ํ์ผ๋ค์ด ์ ์ฅ๋๋ค.
<br>

```
npm start
```
## 3) ๋ธ๋ก๊ทธ ์ค์ต
### 1. index.html
```html
  <!-- bootstrap css cdn -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"> <!-- reset css -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>


</head>
<body>
  <noscript>You need to enable JavaScript to run this app.</noscript>
  <div id="root"></div>
</body>
```
- ์ฌ๊ธฐ์ cdn ๊ฑธ๋ฉด ์๋์ผ๋ก ๋ค ๊ฑธ๋ฆฌ๋๋ฏ
- div id = root : root ์ฐพ์์ ์คํํ๊ฒ ๋ค.
<br>

### 2. index.js
```js
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
    {/* <Hello /> */}
  </React.StrictMode>
);

 reportWebVitals();
```
- root๋ก ์ง์ ํด์ฃผ๊ณ 
- App ์คํํ๊ฒ ๋ค
<br>

### 3. App.js
```js
function App() {
let nickName="jenna"
let [title, setTitle] = useState(["ํํ ์์ปค์ค", "๊ฐ๋จ ์์ปค์ค", "ํ๋ ์์ปค์ค", "์ข๋ก ์์ปค์ค"]);
let [like, setLike] = useState([0,0,0,0]);
let [count, setCount] = useState(0);

return (
  <div className="App">
  <div onClick={()=>{ setCount(count = count+1) 
    console.log(count); }}>์๋!!</div>
    <header className = "">
    <div className="nav"> ๋ฒ์ฏ ์์ปค์ค๋จ</div>
    <p>{nickName} ๋ ๋ฒ์ฏ ์์ปค์ค์ ์ค์  ๊ฒ์ ํ์ํฉ๋๋ค</p>
    <a href="https://www.naver.com/" rel="nooper noreferrer" target="blank">๋ค์ด๋ฒ</a>
    </header>
    <br></br>
    
    {title.map((el, i) => {
      return (
        <div className="list" key={i}>
          <h3>
            {el}
            <span
              onClick={() => {
                let likeCnt = [...like]; //[1,0,0,0]
                likeCnt[i]++;
                setLike(likeCnt);
              }}
            >
              ๐
            </span>
            {like[i]}
          </h3>
          <p>3์ 02์ผ ๋ฐํ</p>
          <hr />
        </div>
      );
    })}
)
```
![image](https://user-images.githubusercontent.com/111114507/209533484-0a6efd48-9717-4820-91c0-294a6a28800f.png)



## 4) App.js
### [์คํ์์]
```js
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
```
![image](https://user-images.githubusercontent.com/111114507/209492285-641d9ab0-2c29-48df-b189-7d73d52c7a74.png)
- ์ ์ฅ๋ง ํ๋ฉด ์๋ก๊ณ ์นจ ์์ด๋ ๋ฐ๋ก ๋ณ๊ฒฝ๋จ
<br>

## 4) ์ปดํฌ๋ํธ ๋ง๋๋ ๋ฐฉ๋ฒ
### ๐ก class
```js
class MyComponents extends Component {
    // ์ํ๋ณ์ ์ ์ธ
    state = {
        number : 0,
        message : 'th1-703',
        validate : false,
        meessages: ['AngularJS', 'React', 'Vue', 'Ember']
    }
 
    render(){
            return(
            <>
                <h3>Hello {message}</h3>
            </>
        )
    }
}
export default MyComponents;

```
<br>

### ๐ก function 
- tag๋ ๋จ ํ๋๋ง ๋ค์ด๊ฐ ์ ์์
```js
function Hello() {
    return (
        <div>Hello</div>
        <p>fdfd</p>
    )
}
```
- ํ๊ทธ ๋๊ฐ๋ผ ์ค๋ฅ๋จ~!
- ๋ฃจํธ ํ๊ทธ๋ฅผ ๋ง๋ค๊ณ , ๊ทธ ์์์ ์์ํ์ฌ ํด๊ฒฐ
```js
function Hello() {
    return (
        <div>
            <h1> Hello Component</h1>
           <p>๋ฆฌ์กํธ ์ฌ๋ฏธ์์ด์!</p>
        </div>
    )
}
export default Hello;
```
- div : ๋ฃจํธ ํ๊ทธ
- export .. : ๋ฐ์์๋ ์ฐ๊ฒ ๋ค -> ๋ค๋ฅธ ๊ณณ์์ import ํด์ ์ฌ์ฉ ๊ฐ๋ฅ
```js
import Hello from './Hello';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    {/* <App /> */}
    <Hello />
  </React.StrictMode>
);
reportWebVitals();
```
<br>

## 5) ๋ฐ๋ณต๋ฌธ
### map()
```js
function logArrayElements(1) { } // ๋ฐฐ์ด์์ ์๋ ๊ฐ๊ฐ์ ๋ฐ์ดํฐ ์ฒ๋ฆฌ
function logArrayElements(1,2) { }  // 1- ๋ฐ์ดํฐ, 2- ์ธ๋ฑ์ค๋ฒํธ
function logArrayElements(1,2,3) { }  // 3- ๋ฐฐ์ด์ ์ ์ฒด ๋ฐ์ดํฐ 
 
function logArrayElements(element,index, array) {
    console.log('a[' + index + '] =    ' + element);
}
//[2,5,9].forEach(logArrayElements);
 
let arr = [2,5,9];
arr.forEach(logArrayElements);
ํด์ผํ ์ผ
arr.map(ํ ์ผ)
arr.map(function(){  })
arr.map(()=> { return xxz  })
arr.map(()=>xxz)

```
- ๋๋ฒ ์ฐํ๋๊ฑด index.jsp์์ 'React.StrictMode' ์ฃผ์ ํด์ฃผ๊ธฐ
```js
<h1>{messages.map((item,i,arr) => (console.log(item + ',' + i + " " + arr)))}</h1>
```
- item : i ๋ฒ์งธ์ ๋ฐฐ์ด ์์ ์๋ ๋ด์ฉ
- i : index
- arr : ๋ฐฐ์ด ์ ์ฒด
