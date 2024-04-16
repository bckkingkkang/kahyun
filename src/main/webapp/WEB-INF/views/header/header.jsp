<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-12
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #333;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    /* Change the link color to #111 (black) on hover */
    li a:hover {
        background-color: #111;
    }
</style>

<form action="/logout" method="post">
    <div>
        <nav>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <ul>
                <li><a href="/main">메인</a></li>
                <%--<c:choose>
                    <c:when test="${isLogin eq 'true'}">--%>
                        <li><a href="/board/list">회원게시판</a></li>
                        <li><a href="/special_board/list">특별회원 게시판</a></li>
                        <li><a href="/user/mypage">마이페이지</a></li>
                        <c:if test="${user.auth == 'ADMIN'}">
                            <li><a href="/admin/admin">관리자 페이지</a></li>
                        </c:if>
                        <li><a type="submit" href="/logout">로그아웃</a></li>
                   <%-- </c:when>
                    <c:otherwise>--%>
                        <li><a href="/user/login" id="loginBtn">로그인</a></li>
                    <%--</c:otherwise>
                </c:choose>--%>
            </ul>
        </nav>
    </div>
</form>
</body>
</html>
