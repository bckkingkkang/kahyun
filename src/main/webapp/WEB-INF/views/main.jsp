<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HOME</title>
</head>
<body>
<h1>home</h1>
<div>
        <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <c:choose>
                <c:when test="${isLogin eq 'true'}">
                    <button type="submit" id="logoutBtn">로그아웃</button>
                </c:when>
                <c:otherwise>
                    <button type="button" onclick="location.href='/user/login'" id="loginBtn">로그인</button>
                </c:otherwise>
            </c:choose>
        </form>
</div>
<div>
    <c:choose>
        <c:when test="${isLogin eq 'true'}">
            <h2>${user.user_id} 님 로그인 중입니다</h2>
            <h4>nickname : ${user.nickname}
            <br>권한 : ${user.auth}</h4>
        </c:when>
        <c:otherwise>
            <h3>로그인 후 게시판 이용 가능</h3>
        </c:otherwise>
    </c:choose>

</div>
<div>
    <a href="/admin/admin">관리자 페이지</a>
    <a href="/board/list">회원게시판</a>
    <a href="/user/mypage">마이페이지</a>
</div>




<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>