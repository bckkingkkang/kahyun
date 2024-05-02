<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 승인 대기 리스트</title>
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
<h2 class="text-center">게시글 승인 대기 리스트</h2>
<table class="table text-center">
    <thead>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>닉네임</th>
        <th>아이디</th>
        <th>파일명</th>
        <th>가격</th>
        <th>등록일</th>
        <th>삭제 여부</th>
        <th>자세히 보기</th>
        <th>공개 여부</th>
        <th>변경</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list">
        <tr>
            <th>${list.rownum}</th>
            <th>${list.title}</th>
            <th>${list.price}</th>
            <th>${list.nickname}</th>
            <th>${list.user_id}</th>
            <th>${list.orgName}</th>
            <th>${list.create_dt}</th>
            <th>${list.status}</th>
            <%--<th>${list.accept_yn}</th>--%>
            <th><a href="/special_board/detail/${list.seq}">자세히 보기</a></th>
            <c:choose>
                <c:when test="${list.accept_yn == 'Y'}">
                    <th>공개</th>
                    <th><div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<c:url value='/changePrivate/${list.seq}' />">비공개로 전환</a></div></th>
                </c:when>
                <c:otherwise>
                    <th>비공개</th>
                    <th><div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<c:url value='/changeOpen/${list.seq}' />">공개로 전환</a></div></th>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="text-center"><a class="btn btn-outline-dark mt-auto" id="listBtn" href="admin">뒤로 가기</a></div>

<jsp:include page="/header/footer"></jsp:include>
</body>
</html>