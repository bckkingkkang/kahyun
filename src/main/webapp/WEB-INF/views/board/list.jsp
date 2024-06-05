<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
</head>
<%--<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>--%>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Community</h1>
            <p class="lead fw-normal text-white-50 mb-0">회원 게시판</p>
        </div>
    </div>
</header>
<div class="container">
    <p></p>
    <div class="text-end"><a class="btn btn-outline-dark mt-auto" href="/board/create">등록</a></div>
    <p></p>
</div>

    <div class="container">
        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일시</th>
                    <th>수정일시</th>
                    <th>조회 수</th>
                    <th>분류</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${notice_list}" var="notice_list">
                <tr style="background-color: #fff3cd">
                    <th>공지</th>
                    <th><a href="/notice_board/detail/${notice_list.seq}" ${notice_list.importance eq 'A' ? 'style="color: red"' : notice_list.importance eq 'B' ? 'style="color: blue"' : 'style="color: black"'}>${notice_list.title}</a>  <c:if test="${notice_list.comment_count ne null}"><i class="bi bi-chat-left-text"></i></c:if></th>
                    <th>${notice_list.nickname}</th>
                    <th>${notice_list.create_dt}</th>
                    <th>${notice_list.update_dt eq null ? '-' : notice_list.update_dt}</th>
                    <th>-</th>
                    <th>-</th>
                </tr>
            </c:forEach>

            <c:forEach items="${list}" var="list">
                <tr>
                    <td>${list.rownum}</td>
                    <td><a style="color: black" href="detail/${list.seq}">${list.title}</a> <c:if test="${list.comment_count ne null}">(${list.comment_count})</c:if></td>
                    <td>${list.nickname}</td>
                    <td>${list.create_dt}</td>
                    <td>${list.update_dt}</td>
                    <td>${list.view}</td>
                    <td><c:choose>
                        <c:when test="${list.boardOption eq 'boardOption1'}">게시판1</c:when>
                        <c:when test="${list.boardOption eq 'boardOption2'}">게시판2</c:when>
                        <c:otherwise>그냥게시판</c:otherwise>
                    </c:choose></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

<jsp:include page="/header/footer"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
</html>