<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
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
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Community</h1>
            <p class="lead fw-normal text-white-50 mb-0">회원 게시판</p>
        </div>
    </div>
</header>
<div>
    <p></p>
</div>
<div>
    <p></p>
    <div class="text-start"><a class="btn btn-outline-dark mt-auto" href="/board/create">등록</a></div>
    <p></p>
</div>

    <div>
        <table class="table table-hover">
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
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.rownum}</th>
                    <th><a href="detail/${list.seq}">${list.title}</a></th>
                    <th>${list.nickname}</th>
                    <th>${list.create_dt}</th>
                    <th>${list.update_dt}</th>
                    <th>${list.view}</th>
                    <th><c:choose>
                        <c:when test="${list.boardOption eq 'boardOption1'}">게시판1</c:when>
                        <c:when test="${list.boardOption eq 'boardOption2'}">게시판2</c:when>
                        <c:otherwise>그냥게시판</c:otherwise>
                    </c:choose></th>
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