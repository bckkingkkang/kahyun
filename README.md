## check_list
- [ ] **Filter삽입**
> 1. [x] html 태그 
> 2. [ ] multipart/form-data
> 3. [ ] json
- [ ] **AOP를 활용한 URL별 권한 체크**
- [x] **resources 파일 환경 분리**
- [ ] security 로그인 성공 핸들러
- [x] 주석 체크
- [x] 배포

### 수정사항
- [ ] null 처리
- [ ] Controller 부분 user_id로 getPrincipal() 가져오는 부분 수정
- [ ] jsp 페이지 내 _csrf token input -> header
- [ ] successHandler 추가, failureHandler 수정
- [ ] AccessDeniedHandler, AuthenticationEntryPointHandler 다른 방향으로 생각 -> 수정
- [ ] 아이디 찾기 버튼 클릭 시 "null" 로 받아오는 부분 수정
- [ ] SecurityConfig 로그아웃 부분 추가
- [x] SecurityConfig sessionManagement 에서 동시 세션 관리(중복 로그인) -> 테스트하고 수정
- [x] mapper.xml 에서 *로 select 해오는 부분 구체적으로 변경, parameterType, resultType 추가
- [x] mybatis-config.xml 사용 X
- [x] 불필요한 주석, import 제거
- [ ] 게시판 multipart/form-data 파일 업로드 부분 추가 -> XSS Filter
- [ ] Controller에서 요청방식(requestMapping, GetMapping, ...) 검토 및 수정

---------------------

## Spring Security
* 인증 (Authenticate)
   * 보호된 리소스에 접근한 대상에 대해 이 유저가 누구인지, 애플리케이션의 작업을 수행해도 되는 주체인지 확인하는 과정 (예. 로그인)
* 권한 (Authorize)
   * 인증된 사용자가 어떤 것을 할 수 있는지를 의미한다.
* 인가 (Authorization)
   * 인증된 사용자가 요청된 자원에 접근 가능한지를 결정하는 절차
> Authentication은 접근하는 주체의 정보와 권한을 담은 인터페이스로 SecurityContext에 저장된다.   
> **SecurityContext** : Authentication의 보관을 담당하며 해당 객체를 꺼내올 수 있다.   
> **SecurityContextHolder** : 보안 주체의 세부 정보를 포함하며, 현재 SecurityContext에 대한 세부 정보가 저장된다.

* username과 password를 통해 UsernamePasswordAuthenticationToken을 생성
   * 생성된 토큰의 검증을 위해 AuthenticationManager의 인스턴스로 전달
   * 인증에 성공하면 Authentication 인스턴스를 리턴하고 SecurityContextHolder에 저장

```java
@Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
    /*
        정적 자원에 대해서 인증을 하지 않도록 설정 (resources에 접근)
        permitAll은 필터를 거치지만 ignore()은 필터를 거치지 않는다. (permitAll 대신 ignore 사용 이유)
    */
        return(web) -> web.ignoring()
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }
```

```java
@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
   http
      ...
      ...
   return http.build();
}
```
### csrf (cross site request forgery)
* 웹 사이트 취약점 공격 방지를 위해 사용, 스프링 시큐리티가 CSRF 토큰 값을 세션을 통해 발행하고 웹 페이지에서는 폼 전송 시에 해당 토큰을 함께 전송하여 실제 웹 페이지에서 작성된 데이터가 전달되는지를 검증하는 기술이다.
* CSRF 토큰을 설정해주지 않으면 jsp에서 보내는 POST 요청을 전부 막기 때문에 로그인, 회원가입 기능이 동작하지 않으며 인증 과정 진행이 불가하다.
> JSP에서 POST 요청을 보낼 때 CSRF Token에 값을 넣어 함께 보내고 Spring security가 token 값을 확인하여 CSRF 공격 판단
```jsp
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
```
> 로컬에서 확인을 위해 csrf 비활성화
>> .csrf(csrf -> csrf.disable())

> 403 -> alert 표시 후 메인으로 이동   
>   * exceptionHandling(handler->handler.accessDeniedHandler(accessDeniedHandler))   
>   * ```implements AccessDeniedHandler ```

> 401 -> alert 표시 후 메인으로 이동   
>   * .exceptionHandling(handler->handler.authenticationEntryPoint(authenticationEntryPoint))   
>   * ```implements AuthenticationEntryPoint```

### 로그인 페이지 커스터마이징
```java
.formLogin(login -> login
   .loginPage("/user/login")
   .loginProcessingUrl("/user/loginForm")
   // username : user_id, password : password
   .usernameParameter("user_id")
   .passwordParameter("password")
   // 로그인 성공 시 defaultSuccessUrl 페이지로 이동
   .defaultSuccessUrl("/")

   /* 로그인 성공 핸들러 successHandler */
   /*.successHandler(successHandler)*/

/*
    로그인 실패 핸들러 failureHandler
    : 실패한 인증 시도를 처리하는데 사용, 일반적으로 사용자를 인증 페이지로 리디렉션한다.
      예외 유형에 따라 구현
*/
    .failureHandler(failureHandler)

)
```

### 세션 관리
```java
.sessionManagement(session -> session
   .sessionFixation().changeSessionId()
   .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)          
   .maximumSessions(1)
   .maxSessionsPreventsLogin(false)
   .expiredUrl("/")
)
```
* **세션 고정 보호** sessionFixation()
   - changeSessionId()
      - 사용자가 인증을 시도하게 되면 사용자 세션은 그대로 두고 세션 아이디만 변경 -> 세션 아이디가 변경되어서 공격자가 갖고있는 세션 아이디는 무용지물이 된다.
   - migrateSession()
     - 새로운 세션을 생성하고 세션 아이디도 새로 발급하며 migration한다.
   - newSession()
      - 새로운 세션과 아이디를 생성하며 이전의 설정 값들을 사용 불가
   - none()
      - 아무런 보호를 하지 않는다.   

```changeSessionId(), migrateSession()은 이전 세션의 설정 값들을 그대로 사용할 수 있지만 newsession()의 경우 새로운 세션을 생성하여 이전 설정 값을 사용할 수 없다.```

* **세션 정책 설정 코드** sessionCreationPolicy
  - SessionCreationPolicy.ALWAYS : 항상 세션을 생성
   - SessionCreationPolicy.IF_REQUIRED : 필요 시 세션 생성
   - SessionCreationPolicy.NEVER : 생성하진 않지만 존재 시 사용
   - SessionCreationPolicy.STATELESS : 생성하지 않고 존재해도 사용하지 않는다.(예. JWT)
 
* **동시 세션 관리**
    - maximumSessions()
        : 최대 허용 가능 세션 수 (-1을 넣으면 무제한으로 세션 생성 허용됨)
    - maxSessionsPreventsLogin()
        : maximumSessions 에서 설정한 최대 허용 세션의 수가 되었을 때 추가적인 인증 요청(세션 생성)이 있을 경우 어떻게 처리 할지를 정함
      > true : 현재 사용자 인증 실패   
      > false(default) : 기존 세션 만료
    - expiredUrl
        - 기존 세션 만료 시 이동할 페이지
   - invalidSessionUrl()
        - 세션이 유효하지 않을 때 이동할 페이지

### 선언적 방식 - URL 단위 API
|메소드|동작|
|:---:|:---:|
| authenticated() | 인증된 사용자의 접근을 허용 |
| fullyAuthenticated() | 인증된 사용자의 접근을 허용, remeberMe 인증 제외 |
| permitAll() | 무조건 접근을 허용 |
| denyAll() | 무조건 접을을 허용하지 않음 |
| anonymous() | 익명사용자의 접근을 허용 |
| rememberMe() | 기억하기를 통해 인증된 사용자의 접근을 허용 |
| access(String) | 주어진 SpEL 표현식의 평가 결과가 true면 접근을 허용 |
| hasRole(String) | 사용자가 주어진 역할이 있다면 접근을 허용 |
| hasAuthority(String) | 사용자가 주어진 권한이 있다면 접근을 허용 |
| hasAnyRole(String...) | 사용자가 권한을 하나라도 가지고 있는 경우 접근을 허용 |
| hasAnyAuthority(String...) | 사용자가 주어진 권한 중 어떤 것이라도 있다면 접근을 허용 |
| hasIpAddress(String) | 주어진 IP로부터 요청이 왔다면 접근을 허용 |




-----------------------------------------
## AuthenticationProvier
spring security의 인증 방식 : credential 기반 인증 (사용자명과 비밀번호를 이용한 방식)
   - principal : 아이디
   - credential : 비밀번호
```
AuthenticationProvider를 상속한 AuthProvider 클래스
1. UserDetailsService의 loadByUsername을 이용하지 않고 DB의 user 정보를 가져온다.
2. login.jsp 페이지의 로그인 버튼을 눌렀을 때 POST로 전송되는 user_id, password를 이용하여 사용자 인증
3. 입력받은 user_id로 회원정보 select (userService.selectUser(user_id)
4. 조회된 회원정보와 (암호화된) 비밀번호가 일치하는 경우 users 권한에 따라 SYS_ADMIN, NOR_ADMIN 권한을 부여한다.
5. 인증된 user인 경우 정보를 담아 SecurityContextHolder에 저장되는 token을 생성한다.
```
------------------------
## Filter
* 필터로 구현할 수 있는 기능
> 서블릿이 호출되기 전에 서블릿 요청을 가로채는 기능   
> 서블릿이 호출되기 전에 요청 내용을 점검하는 기능   
> 요청 헤더의 수정과 조정 기능   
> 서블릿이 호출된 후에 서블릿 응답을 가로채는 기능   
> 응답 헤더의 수정과 조정 기능   

* **init**
> 필터 객체가 생성될 때 호출되는 메소드로 초기화 기능을 구현한다.   
> 웹 서버가 시작될 때 한 번만 생성된 다음 계속 사용되므로 init() 메소드는 서버가 시작될 때 한 번만 호출된다.   
>> FilterConfig : 필터 객체 init() 메소드의 인자값으로 전달되는 객체로서 필터에 대한 정보값을 추출하는 메소드를 가지고 있다.
* **doFilter**
> 필터링을 설정한 서블릿을 실행할 때마다 호출되는 메소드로서 실제 필터링 기능을 구현하는 메소드
* **destroy**
> 필터 객체가 삭제될 때 호출되는 메소드로 자원 해제 기능을 구현한다.

---------------------------------

## Model / ModelAndView
* Model 객체   
  * Controller에서 생성한 데이터를 담아서 View로 전달할 때 사용하는 객체 (메소드에 파라미터로 넣어주고 String 형태로 반환한다.)
  * addAttribute("변수 이름", "값") 메소드를 사용하여 전달할 데이터 세팅
* ModelAndView
  * ModelAndView 객체를 생성해서 객체 형태로 변환한다.
  * 화면에 출력할 데이터(Model)을 설정할 수 있고, 어떤 화면(View)으로 넘어갈지 경로를 설정할 수 있다.
  * Model + View 값을 넣을 때는 addObject를 사용하고, 값을 보낼 View를 세팅할 때는 setViewName()을 사용한다.

---------------------
## BCrypt
* 단방향 암호화를 위해 만들어진 해시 함수
* salt를 부여하여 여러 번 해싱하므로 같은 비밀번호를 암호화하더라도 해시 값은 매번 다른 값이 도출된다.
> Hash (해싱) : 각 사용자의 일반 텍스트 암호를 가져와 단방향 수학 함수를 통해 암호화를 실행하는 것   
> Salt (솔트) : 해시 함수를 돌리기 전에 원문에 임의의 문자열을 덧붙이는 것   
``` 사용자 비밀번호 -> salt 생성 -> hashing -> 암호화된 비밀번호 DB에 저장```

---------------------
### 서비스가 필요한 이유
1. 모듈화
   - 서비스를 만들어두면 컨트롤러에서는 해당 서비스를 호출하여 사용
   - 서비스를 만들지 않고 컨트롤러에서 구현한 경우 해당 기능을 필요로 하는 모든 컨트롤러가 동일한 기능을 중복으로 구현해야 한다.
2. 보안
   - 서비스를 통해서만 데이터베이스에 접근하도록 구현하는 것이 보안 상 안전하다.
   - 해킹을 통해 컨트롤러를 제어할 수 있게 되더라도 리포지토리에 직접 접근할 수는 없게 된다.

---------------------
## Multipart
: HTTP에서 request는 header와 body 부분으로 나누어져 있다. header의 content-type은 body에 대한 데이터를 정의한다. 서버는 content-type의 값을 보고 body를 알맞은 형태로 해석한다.
multipart란 이 요청 헤더 content-type의 한 종류로서 웹 클라이언트가 요청을 보낼 때, HTTP 요청의 바디 부분을 여러 부분으로 나누어서 보내는 방식이다.   
> 두 종류의 데이터가 하나의 HTTP Request Body에 들어가야 하는 경우 하나의 Body에서 두 종류의 데이터를 구분해서 넣어주는 방법이 multipart 타입이다.       
> Body에서 데이터를 구분해야 하기 때문에 요청파라미터를 url 뒤에 문자열로 추가하는 GET 방식으로는 파일을 보낼 수 없다.
>   > POST 방식에서만 사용 가능     

---------------------
## 요구사항
**1. spring framework 사용**
   - 리스트/상세 페이지

**2. db 연동**

**3. 로그인 / 로그아웃 / 회원가입 구현**

**4. Filter 삽입**
   - xssFilter 적용 ( 만들어도 되고, library 사용해도 됨 )
   - XSS공격 케이스. 1-3번째 케이스 모두 Blocking 하거나 Replace 해야합니다. 구길섭 추가

    - 첫번째, form 또는 input과 같은 html 태그에 스크립트 공격이 들어오는 경우
    - 두번째, "multipart/form-data" 스크립트 공격이 들어오는 경우
    - 세번째,  json 형식의 데이터 전송에 스크립트 공격을 하는 경우
    - 네번째, 웹소켓에서 스크립트 공격이 들어오는 경우 <- 제외. 이런케이스도 있다는 것만 알아두셈>

**5. spring security 적용**
   - 로그인 / 로그아웃 기능 적용
   - url 패턴별 권한 적용 예시)
```
-> 권한 : NOR_ADMIN, SYS_ADMIN
   1번 URL : NOR_ADMIN/SYS_ADMIN,
   2번 URL : SYS_ADMIN 권한 적용
 A계정이 로그인 시 NOR_ADMIN 권한 부여 => 1번 URL에 접속 가능 / 2번 URL은 접속 안되도록 처리
```
**6. security에 session 관리 적용**
   - 중복 로그인 가능으로 구현
   - 중복 로그인 방지로 구현

**7. security 로그인 성공/실패 핸들러 커스텀**

**8. AOP를 활용한 URL별 권한 체크 ( 5번의 URL 패턴별 권한 적용은 주석 후 무조건 인증으로 변경 )**

**9. resources 파일 환경 분리**
   - local / dev 2개의 환경으로 분리할 것
   - maven / gradle 둘중 하나 사용
   - 배포파일(.war) 생성 시 해당 profile에 대한 resource 파일만 포함 할 것
   
   
   
---------------------   
## mySQL
   
 ```mysql  
CREATE TABLE kahyun.board
   (seq int(10) NOT NULL AUTO_INCREMENT comment 'PK',
   title varchar(50) NOT NULL comment '제목',
   content varchar(100) NOT NULL comment '내용',
   nickname varchar(50) NOT NULL,
   create_dt datetime NOT NULL comment '등록일',
   update_dt datetime NULL comment '수정일',
   status enum('N','D') NOT NULL DEFAULT 'N' comment '상태',
   `view` int(10) NOT NULL DEFAULT 0 comment '조회 수',
  
   PRIMARY KEY (seq)
   ) ENGINE=INNODB DEFAULT charset=utf8

user_seq, boardOption 추가
```

```mysql
CREATE TABLE kahyun.users
   (seq int(10) NOT NULL AUTO_INCREMENT comment 'PK',
   username varchar(50) NOT NULL comment '이름',
   user_id varchar(50) NOT NULL comment '아이디',
   nickname varchar(50) NOT NULL,
   password varchar(100) NOT NULL comment '비밀번호',
   reg_date datetime NULL comment '수정일',
   status enum('N','D') NOT NULL DEFAULT 'N' comment '상태',
   auth enum('USER','ADMIN') NOT NULL DEFAULT 'USER' comment '권한',
   PRIMARY KEY (seq)
   ) ENGINE=INNODB DEFAULT charset=utf8
```
```mysql
CREATE TABLE kahyun.comment
   (seq int(10) NOT NULL AUTO_INCREMENT comment 'PK',
   nickname varchar(50) NOT NULL comment 'nickname',
   user_seq int(10) NOT NULL comment 'user seq',
   content varchar(100) NOT NULL comment '댓글 내용',
   create_dt datetime NULL comment '등록일',
   status enum('N','D') NOT NULL DEFAULT 'N' comment '상태',
   board_seq int(10) NOT NULL comment '게시글 seq',
  
   PRIMARY KEY (seq)
   ) ENGINE=INNODB DEFAULT charset=utf8
```
```mysql
 CREATE TABLE kahyun.file
   (seq int(10) NOT NULL AUTO_INCREMENT comment 'PK',
   board_seq int(10) NOT NULL comment '게시글 seq',
   original_name varchar(50) NOT NULL comment '업로드 파일 원본 이름',
   save_name varchar(50) NOT NULL comment '저장 파일 이름',
   `size` varchar(500) NOT NULL comment '파일 크기',
   delete_yn enum('N','Y') NOT NULL comment '파일 삭제 여부',
   create_dt datetime NOT NULL comment '파일 생성 일시',
   delete_dt datetime NULL comment '파일 삭제 일시',
  
   PRIMARY KEY (seq)
   ) ENGINE=INNODB DEFAULT charset=utf8 
```


```mysql
INSERT INTO kahyun.board 
   (title, nickname, create_dt)
   values("제목2", "nickname2", current_time())
```

```mysql
INSERT INTO kahyun.comment
   (nickname, user_seq, content, create_dt, board_seq)
   values ('test', 6, '1번글의 댓글 2', CURRENT_TIME(), 1)
```
