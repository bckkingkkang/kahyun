<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 리스트</title>
</head>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<body>
<jsp:include page="/header/header"></jsp:include>

<h3>회원 리스트</h3>
<table>
    <thead>
    <tr>
        <th>No</th>
        <th>이름</th>
        <th>아이디</th>
        <th>닉네임</th>
        <th>가입일자</th>
        <th>게시글 관리</th>
        <th>회원 상태</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list">
        <tr>
            <th>${list.rownum}</th>
            <th>${list.username}</th>
            <th>${list.user_id}</th>
            <th>${list.nickname}</th>
            <th>${list.reg_date}</th>
            <th><a href="user_detail/${list.seq}">등록 게시글</a></th>
            <th>${list.status == 'N' ? '정상' : '탈퇴'}</th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="admin">뒤로가기</a>


</body>
</html>