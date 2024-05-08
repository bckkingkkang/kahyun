<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>자료게시글 상세</title>
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
<div>
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Special Board</h1>
                <p class="lead fw-normal text-white-50 mb-0">특별회원(자료) 게시판 상세</p>
            </div>
        </div>
    </header>
    <c:if test="${getDetailBoard.status == 'D'}">
        <h3>삭제된 게시글입니다.</h3>
    </c:if>
</div>
<div>
    <form action="">
        <div>
            <table class="table">
                <tr>
                    <th>제목</th>
                    <th>${getDetailBoard.title}</th>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${getDetailBoard.nickname}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${getDetailBoard.create_dt}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${getDetailBoard.content}</td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td><a href="<c:url value='/fileDownload/${getDetailFile.savedName}' /> ">${getDetailFile.orgName}</a></td>
                </tr>
                <tr>
                    <th>가격</th>
                    <th>${getDetailBoard.price} 원</th>
                </tr>
                <tr>
                    <th>보기</th>
                    <td><img src="/image/${getDetailFile.savedName}" alt=""></td>
                </tr>

            </table>
        </div>
    </form>

</div>
<jsp:include page="/header/footer"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

</script>
</body>
</html>