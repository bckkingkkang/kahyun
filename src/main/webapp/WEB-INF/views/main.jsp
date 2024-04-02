<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HOME</title>
</head>
<body>
<h1>HOME</h1>

<a href="/board/list">회원게시판</a>
<a href="/user/login">로그인</a>
<form action="/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit">로그아웃</button>
</form>
<script>

</script>
</body>
</html>