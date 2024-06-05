<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-05-27
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>notice</title>
</head>
<body>

<jsp:include page="/header/header"></jsp:include>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">NOTICE</h1>
            <p class="lead fw-normal text-white-50 mb-0">공지사항</p>
        </div>
    </div>
</header>

<div class="container">
    <p></p>
    <div class="text-end">
        <a class="btn btn-outline-dark mt-auto" href="/notice_board/create">등록</a>
    </div>
    <p></p>
</div>
<div class="container">

    <table class="table table-hover text-center">
        <thead>
        <tr>
            <th>NO</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>수정일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${noticeBoardList}" var="noticeBoardList">
            <tr ${noticeBoardList.importance eq 'A' ? 'style="background-color: #fff3cd"' : ''}>
                <td>${noticeBoardList.rownum}</td>
                <c:choose>
                    <c:when test="${noticeBoardList.importance eq 'C'}">
                        <td><a href="detail/${noticeBoardList.seq}" style="color:#000;">${noticeBoardList.title}</a>  <c:if test="${noticeBoardList.comment_count ne null}"><i class="bi bi-chat-left-text"></i></c:if></td>
                    </c:when>
                    <c:otherwise>
                        <th><a href="detail/${noticeBoardList.seq}" ${noticeBoardList.importance eq 'A' ? 'style="color: red"' : ''}>${noticeBoardList.title}</a>  <c:if test="${noticeBoardList.comment_count ne null}"><i class="bi bi-chat-left-text"></i></c:if></th>
                    </c:otherwise>
                </c:choose>
                <td>${noticeBoardList.nickname}</td>
                <td>${noticeBoardList.create_dt}</td>
                <td>${noticeBoardList.update_dt eq null ? '-' : noticeBoardList.update_dt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<jsp:include page="/header/footer"></jsp:include>
</body>
<script>
</script>
</html>
