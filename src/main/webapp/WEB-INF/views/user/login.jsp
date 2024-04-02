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

        <form action="/auth" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div>
            <div>
                <input type="text" id="user_id" name="user_id" placeholder="user id">
            </div>
            <div>
                <input type="password" id="password" name="password" placeholder="user password" autoComplete="off">
            </div>

    </div>
    <div>
        <button type="button" onclick="location.href='search'">계정 찾기</button>
        <button type="submit">로그인하기</button>
        <button type="button" onclick="location.href='signup'">회원 가입</button>
    </div>
    </form>
<script>

</script>
</body>
</html>