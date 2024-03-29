<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
    <div>
        로그인화면
        <a href="/">메인으로</a>
    </div>
    <div>
        <form action="">
            <div>
                <input type="text" id="id" name="id" placeholder="user id">
            </div>
            <div>
                <input type="password" id="password" name="password" placeholder="user password">
            </div>
        </form>
    </div>
    <div>
        <button type="submit" onclick="location.href='search'">계정 찾기</button>
        <button type="submit" onclick="location.href=''">로그인하기</button>
    </div>
    <div>
        <a href="signup">회원가입</a>
    </div>

<script>

</script>
</body>
</html>