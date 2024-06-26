<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>관리자 리스트</title>
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
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">관리자 리스트</h3>
            <p class="lead fw-normal text-black-50 mb-0">관리자 리스트 관리</p>
        </div>
    </div>
</header>
<table class="table text-center">
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
            <th><a class="btn btn-outline-dark mt-auto" href="user_detail/${list.seq}">등록 게시글</a></th>
            <th>${list.status == 'N' ? '정상' : '탈퇴'}</th>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="listBtn" href="admin">뒤로 가기</a></div>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>
</body>
</html>