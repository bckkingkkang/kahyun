<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-08
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>마이페이지</title>
</head>
<jsp:include page="/header/header"></jsp:include>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<body>
<h2>마이페이지</h2>
<table>
    <tr>
        <td>이름</td>
        <td>${userInfo.username}</td>
    </tr>
    <tr>
        <td>아이디</td>
        <td>${userInfo.user_id}</td>
    </tr>
    <tr>
        <td>닉네임</td>
        <td>${userInfo.nickname}</td>
    </tr>
    <tr>
        <td>가입일자</td>
        <td>${userInfo.reg_date}</td>
    </tr>
</table>

<%--<a href="/">메인으로</a>--%>
</body>
</html>
