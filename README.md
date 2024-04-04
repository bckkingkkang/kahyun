## check_list
- [ ] **Filter삽입**
> 1. [x] html 태그 
> 2. [ ] multipart/form-data
> 3. [ ] json
- [ ] **AOP를 활용한 URL별 권한 체크**
- [ ] **resources 파일 환경 분리**
- [ ] security 로그인 성공 핸들러
- [ ] 주석 체크

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
   
 ```  
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
```

```
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
```
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

```
INSERT INTO kahyun.board 
   (title, nickname, create_dt)
   values("제목2", "nickname2", current_time())
```

```
INSERT INTO kahyun.comment
   (nickname, user_seq, content, create_dt, board_seq)
   values ('test', 6, '1번글의 댓글 2', CURRENT_TIME(), 1)
```
