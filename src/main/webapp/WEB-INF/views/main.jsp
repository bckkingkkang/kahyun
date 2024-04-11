<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>main</title>
</head>
<body>
<div>
    <form action="/logout" method="post">
        <div>
            <nav>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <ul>
                    <li><a href="/">메인</a></li>
                    <c:choose>
                        <c:when test="${isLogin eq 'true'}">
                            <li><a href="/board/list">회원게시판</a></li>
                            <li><a href="/special_board/list">특별회원 게시판</a></li>
                            <li><a href="/user/mypage">마이페이지</a></li>
                            <c:if test="${user.auth == 'ADMIN'}">
                                <li><a href="/admin/admin">관리자 페이지</a></li>
                            </c:if>
                            <li><a type="submit" href="/logout">로그아웃</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/user/login" id="loginBtn">로그인</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </form>
</div>
<div>

</div>
<div>
    <c:choose>
        <c:when test="${isLogin eq 'true'}">
            <h2>${user.auth} 권한, ${user.nickname} 님 로그인 중입니다</h2>
        </c:when>
        <c:otherwise>
            <h3>로그인 후 게시판 이용 가능</h3>
        </c:otherwise>
    </c:choose>

</div>





<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>