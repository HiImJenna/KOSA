# 2022.12.30.FRI ๐
----------------
<br> 

# 1. Redux
- ์ปดํฌ๋ํธ๋ค์ด props์์ด state ๊ณต์  ๊ฐ๋ฅ
- ์ปดํฌ๋ํธ ์๋ฐ์ดํธ ๊ด๋ จ ๋ก์ง์ ๋ค๋ฅธ ํ์ผ๋ก ๋ถ๋ฆฌ์์ผ์ ๋์ฑ ํจ์จ์ ์ผ๋ก ๊ด๋ฆฌํ  ์ ์๋ค.
- ์ปดํฌ๋ํธ๋ผ๋ฆฌ ๋๊ฐ์ ์ํ๋ฅผ ๊ณต์ ํด์ผํ  ๋๋ ์ฌ๋ฌ ์ปดํฌ๋ํธ๋ฅผ ๊ฑฐ์น์ง ์๊ณ  ์์ฝ๊ฒ ์ํ ๊ฐ์ ์ ๋ฌํ๊ฑฐ๋ ์๋ฐ์ดํธ ํ  ์ ์์
```
npm install    @reduxjs/toolkit    react-redux 
```
<br>

### [App.js]
```js
root.render(
 // <React.StrictMode>
  <Provider store={store}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>
 // </React.StrictMode>
);
```
<br>

### [store.js]
- ํ ๊ฐ์ ํ๋ก์ ํธ๋ ํ๊ฐ์ ์คํ ์ด๋ง ๊ฐ์ง ์ ์๋ค.
```js
let user =  createSlice( {  
        name :  'user',
        initialState : 'yuna',
        reducers: {
            changeName(state){
                return 'doteon ' + state;
            }
        }
})
```
<br>

### [Cart.js]
```js
  let value = useSelector((state)=>{return state})
```
- useSelector : State์ ์๋ ๊ฐ์ ์ ๋ถ ๊ฐ์ ธ์จ๋ค.
- ๊ทธ ๊ฐ๋ค์ ๋ณ์ value์ ๋ฃ์ด์ค๋ค.
```js
<button className="btn btn-dark" onClick={() => dispatch(changeCnt())}>+</button>

```