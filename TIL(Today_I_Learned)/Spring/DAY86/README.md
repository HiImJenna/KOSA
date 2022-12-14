# 2022.12.20.TUE ๐
----------------
<br> 

# 1. ์ํธํ โ
![image](https://user-images.githubusercontent.com/111114507/208563884-b62edd28-1e9d-41ac-8424-2f6b4de440aa.png)
- ํ์๊ฐ์ ์ ๋น๋ฐ๋ฒํธ๋ฅผ 1์ผ๋ก ์๋ ฅํ๋๋ฐ DB ์ ์ฅ์ ์ด๋ ๊ฒ ์ํธํ๊ฐ ๋์ด์ ์ ์ฅ๋๋ค.
<br>

### ๐ก ์ค์ 
#### [root-context.xml]
```xml
  <bean id="bCryptPasswordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder">
  </bean>
```
<br>

#### [security-context.xml]
```xml
<security:authentication-manager>
    <security:authentication-provider><!-- ์ธ์ฆ์ ๋ํ ์ ๊ณต์ -->
        <security:jdbc-user-service
        data-source-ref="driverManagerDataSource"
        users-by-username-query="SELECT USERID, pwd AS PASSWORD, 1 enabled FROM member where userid=?"

        authorities-by-username-query="select m.USERID , r.ROLE_NAME  
                                            from member m join roll r 
                                            on m.userid = r.userid 
                                            where m.userid=?" />
  ***  <security:password-encoder ref="bCryptPasswordEncoder"/>
    </security:authentication-provider> *** >> ์ถ๊ฐํด์ฃผ๊ธฐ
</security:authentication-manager>
```
- ์ด ๋ถ๋ถ์ด ๋ก๊ทธ์ธ ๋ก์ง์ ๋์  ํด์ค๋ค๊ณ  ์๊ฐํ๋ฉด ๋  ๋ฏ
<br>

#### [ํจํค์ง ๊ตฌ์กฐ]
![image](https://user-images.githubusercontent.com/111114507/208645731-7364e3ea-f5a8-4ec4-bd6e-39355e9593c2.png)
- ๊ธฐ์กด NewMemberController๋ฅผ ์ง์ฐ๊ณ  MemberController & MemberDao.xml ์์ฑ -> MyBatis ์ ์ฉ์ ์ํด์
<br>

### ๐ก ํ์๊ฐ์
#### [header.jsp]
```jsp
<se:authorize access="!hasRole('ROLE_USER')">		
    <li>
        <a href="${pageContext.request.contextPath}/joinus/join.htm">ํ์๊ฐ์</a>
    </li>
</se:authorize>
```
- se:authorize๋ก ๋ก๊ทธ์ธ ๋ ํ์์๊ฒ๋ ํ์๊ฐ์ ๋ฒํผ์ด ๋ณด์ด์ง ์๋๋ก ์ฒ๋ฆฌ
<br>

#### [JoinController.java]
```java
@Controller
@RequestMapping("/joinus/")
public class JoinController {
	private MemberDao memberdao;

	@Autowired
	private MemberSerivce memberservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("join.htm")
	public String join() {
		return "joinus/join";		
	}

	@PostMapping("join.htm")
	public String join(Member member) {
		System.out.println(member.toString());
		try {
			member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
			memberservice.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/index.htm";
    }
}
```
- BCryptPasswordEncoder : ๋น๋ฐ๋ฒํธ ์ํธํํ๊ธฐ ์ํด์  ์ถ๊ฐํด์ค์ผ ํจ
- Controller์ ์๋ ๋ฉ์๋๋ Dao๋ Service์ ์๋ ๋ฉ์๋์ ๊ฐ์ ํ์ X, ๊ทธ๋ฅ ๋ณด๊ธฐ ํธํ๋๋ก ํ๊ธฐ
- Parameter ๊ฐ์๋ ๊ทธ ๋ฉ์๋๋ฅผ ์คํํ  ๋ ์ด๋ค ๊ฐ์ด ๋์ด์ค๋์ ๋ฐ๋ผ ๋ฌ๋ฆผ, ์์ ๊ฐ์ ์ํฉ์์๋ ํ์๊ฐ์ ์ ํ์ ์ ๋ณด๊ฐ ๋์ด์ฌ ๊ฒ์ด๋ ํ์์ ๋ณด๋ฅผ ๊ฐ์ง๊ณ  ์๋ Dto๋ฅผ Parameter๋ก ๋ฐ์์ค์ผ ํ๋ค.
- member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd())) : ๊ณต์์ด๋ผ ์๊ฐํ๊ธฐ~
<br>

#### [MemberDao.xml]
```xml
<insert id="insertMember" parameterType="vo.Member">
    insert into member(userid, pwd, name,regdate)
    values(#{userid}, #{pwd}, #{name},sysdate)
</insert>
```
<br>

#### [MemberService.java]
```java
public void insertMember(Member member) {
    MemberDao dao = sqlsession.getMapper(MemberDao.class);
    dao.insertMember(member);
}
```
<br>

### ๐ก ๋ก๊ทธ์ธ
#### [header.jsp]
```jsp
<se:authorize access="!hasRole('ROLE_USER')"> 
        <li><a href="${pageContext.request.contextPath}/joinus/login.htm">๋ก๊ทธ์ธ</a></li>
</se:authorize>
```
- se:authorize : ๋ก๊ทธ์ธ ๋์ด์๋ ์ ์ ์๊ฒ๋ ๋ก๊ทธ์ธ ๋ฒํผ์ด ๋ณด์ด์ง ์๋๋ก
<br>

#### [JoinController.java]
```java
//๋ก๊ทธ์ธ ์์ฒญ
@GetMapping(value="login.htm")
public String login() {
    return "joinus/login";
}
```
<br>

#### [login.jsp]
```jsp
<form action="${pageContext.request.contextPath}/login" method="post">                            
<fieldset>
        <legend class="hidden">๋ก๊ทธ์ธ ํผ</legend>
        <h3><img src="images/txtTitle.png" /></h3>
        <ul id="loginBox">
            <li><label for="uid">์์ด๋</label>
                        <input type="text"        name="username" class="text" /></li>
            <li><label for="pwd">๋น๋ฐ๋ฒํธ</label>
                        <input type="password" name="password" class="text" /></li>
        </ul>
        <p><input type="submit" id="btnLogin" value="" /></p>
        <ul id="loginOption">
            <li><span>์์ด๋ ๋๋ ๋น๋ฐ๋ฒํธ๋ฅผ ๋ถ์คํ์จ๋์?</span><a href="/Member/FindID"><img alt="ID/PWD ์ฐพ๊ธฐ" src="images/btnFind.png" /></a></li>
            <li><span>์์ด๋๊ฐ ์์ผ์  ๋ถ์ ํ์๊ฐ์์ ํด์ฃผ์ธ์.</span><a href="/Member/Agree"><img alt="ํ์๊ฐ์" src="images/btnJoin.png" /></a></li>
        </ul>
    </fieldset>
</form>
```
- form์์ /login์ผ๋ก ๋๊ธฐ๋ฉด ์๋์ผ๋ก security-context.xml์์ login ๋ก์ง์ ์ฒ๋ฆฌํจ!
<br>

### ๐ก ๋ง์ดํ์ด์ง - ํ์์ ๋ณด ์์ 
#### [header.jsp]
```jsp
<se:authorize access="hasRole('ROLE_USER')">
    <li>
        <a href="${pageContext.request.contextPath}/customer/mypage.htm"><img src="${pageContext.request.contextPath}/images/menuMyPage.png" alt="๋ง์ดํ์ด์ง" /></a>
    </li>
</se:authorize>
```
<br>

#### [MypageController.java]
#### 1) ๋น๋ฐ๋ฒํธ ํ์ธ 
```java
@Controller
@RequestMapping("/customer/")
public class MypageController {	
	
	private MemberSerivce memberservice;
	
	@Autowired
	public void setMemberservice(MemberSerivce memberservice) {
		this.memberservice = memberservice;
	}
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("mypage.htm")
	public String memberConfirm() {
		return "customer/memberConfirm";
	}
	
	@PostMapping("mypage.htm")
	public String memberConfirm(@RequestParam("password") String rawPassword, Principal principal){
		String viewpage="";
		
		//ํ์์ ๋ณด
		Member member = memberservice.getMember(principal.getName());
		
		//DB์์ ๊ฐ์ ธ์จ ์ํธํ๋ ๋ฌธ์์ด
		String encodedPassword = member.getPwd();
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		
		if(result){
			viewpage="redirect:memberupdate.htm";
		}else{
			viewpage="redirect:mypage.htm";
		}
		return viewpage;
	}
```
- PostMapping ๋ถ๋ถ์ ๊ณต์์ด๋ผ ์๊ฐํ๊ณ  ์ฌ์ฉํ๊ธฐ
- ๋๋ต, ์ํธํ๋์ด์ DB์ ์ ์ฅ๋์ด์๋ ๋น๋ฐ๋ฒํธ์, ์๋ ฅํ ๋น๋ฐ๋ฒํธ๋ฅผ ๋์กฐํ์ฌ ๋์ผํ๋ฉด ์์  ํ์ด์ง๋ก, ๋์ผํ์ง ์์ผ๋ฉด ํ์ด์ง๊ฐ ๋์ด๊ฐ์ง ์๊ฒ
<br>

#### 2) ํ์์ ๋ณด ์์ 
```java
@GetMapping("memberupdate.htm") 
public String memberUpdate(Model model, Principal principal) {
    Member member = memberservice.getMember(principal.getName());
    model.addAttribute("member", member);
    return "customer/memberUpdate";
}

@PostMapping("memberupdate.htm")
public String memberUpdate(Model model, Member member, Principal principal) {
    Member updatemember = memberservice.getMember(principal.getName());
    updatemember.setName(member.getName());
    updatemember.setCphone(member.getCphone());
    updatemember.setEmail(member.getEmail());
    updatemember.setPwd(bCryptPasswordEncoder.encode(member.getPwd()));
    memberservice.updateMember(updatemember);
    return "redirect:/index.htm";
}
}
```
- GetMapping ๋ถ๋ถ : ๋ง์ดํ์ด์ง๋ก ์ด๋ํ  ๋ Session๊ฐ์ ์๋ ์ ๋ณด๋ ๋น๊ต ํด์ ๋ง์ดํ์ด์ง๋ก ๋ณด๋ผ์ง ๊ฒฐ์ ..
```
Principal ๊ฐ์ฒด๋ ๊ตฌํ์ฒด์ ์ต์์ ์ธํฐํ์ด์ค์ด๊ธฐ ๋๋ฌธ์ ์ด ํ์์ผ๋ก ๋ฐ์ผ๋ฉด ์ฌ์ฉํ ๋งํ ๋ฉ์๋๊ฐ 
getName() ์ ๋๋ฐ์ ์์ต๋๋ค. 
๊ทธ๋ฅ ID ์ ๋ณด๋ง ๊ฐ์ ธ๋ค ์ฌ์ฉํ  ์ ์๋ค๊ณ  ๋ณด๋ฉด ๋ฉ๋๋ค.
```
- ํ์ง๋ง ์ ์ด์ se:authorize ๋ก ๊ฑธ๋ฌ๋ฒ๋ฆฌ๋ฉด ์ฌ์ฉํ  ํ์๊ฐ ์์ง ์์๊น..?๐ค
<br>

#### [MemberDao.xml]
```xml
<update id="update" parameterType="vo.Notice">
    update notices
    set   title=#{title},
        content=#{content},
        filesrc=#{fileSrc, jdbcType = VARCHAR},
        filesrc2=#{fileSrc2,jdbcType=VARCHAR}
    where seq=#{seq}
</update>
```
<br>

#### [MemberService.java]
```java
public void updateMember(Member member){
    MemberDao dao = sqlsession.getMapper(MemberDao.class);
    int result = dao.updateMember(member);
}
```
