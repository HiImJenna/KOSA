# 2022.12.27.TUE 📅
----------------
<br> 

# 1. 버튼 클릭 시 Title 변경 ✔
```js
<button onClick={()=>{ 
    (title[0] === '혜화 서커스')
    ? setTitle(["부천 서커스", "삼산 서커스", "부평 서커스", "중동 서커스"])
    : setTitle(["부천 고범종 서커스", "삼산 고범종 서커스", "부평 고범종 서커스", "중동 고범종 서커스"])
}}
class='btn btn-primary' >title chage</button>
```