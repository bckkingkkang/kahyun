<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>
<body>
<jsp:include page="/template/header"></jsp:include>
    <div>
        <h2>로그인 화면</h2>
    </div>
        <form action="/user/loginForm" method="post">
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
            <div>
            <div>
                <input type="text" id="user_id" name="user_id" placeholder="user id">
            </div>
            <div>
                <input type="password" id="password" name="password" placeholder="user password" autoComplete="off">
            </div>
                <div>
                    <c:if test="${error eq true}">
                        <script> alert("${exception}"); location.href="/";</script>
                    </c:if>
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