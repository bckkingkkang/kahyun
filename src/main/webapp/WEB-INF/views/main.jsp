<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HOME</title>
</head>
<body>
<h1>HOME</h1>
<div>
        <form action="/logout" method="post">
            <button type="button" onclick="location.href='/user/login'" id="loginBtn">로그인</button>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" id="logoutBtn">로그아웃</button>
        </form>

</div>
<div>
    <h2>${user.user_id} 님 로그인 중입니다</h2>
    <h4>nickname : ${user.nickname}
        <br>권한 : ${user.auth}</h4>

</div>
<div>
    <a href="/admin/admin">관리자 페이지</a>
    <a href="/board/list">회원게시판</a>


</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};
</script>
</body>
</html>