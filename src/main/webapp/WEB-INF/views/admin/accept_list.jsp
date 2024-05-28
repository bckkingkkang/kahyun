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
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">게시글 승인 대기 리스트</h3>
            <p class="lead fw-normal text-black-50 mb-0">게시글 승인 관리</p>
        </div>
    </div>
</header>
<%--h2 class="text-center">게시글 승인 대기 리스트</h2>--%>
<div>
    <table class="table text-center">
        <thead>
        <tr>
            <th>No</th>
            <th hidden>seq</th>
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
                <th>${list.nickname}</th>
                <th>${list.user_id}</th>
                <th>${list.orgName}</th>
                <th>${list.price}</th>
                <th>${list.create_dt}</th>
                <th>${list.status}</th>
                <th><a class="btn btn-outline-dark mt-auto" value="${list.seq}" href="/file_board/detail/${list.seq}">자세히 보기</a></th>
                <c:choose>
                    <c:when test="${list.accept_yn == 'Y'}">
                        <th>공개</th>
                        <th><div class="text-center"><a class="btn btn-outline-dark mt-auto" id="changePrivate" value="${list.seq}">비공개로 전환</a></div></th>
                    </c:when>
                    <c:otherwise>
                        <th>비공개</th>
                        <th><div class="text-center"><a class="btn btn-outline-dark mt-auto" id="changePublic" value="${list.seq}">공개로 전환</a></div></th>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="listBtn" href="admin">뒤로 가기</a></div>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    $(function() {
        $dom.seq = $("#seq").val();
        $dom.changePublic = $("#changePublic");
        $dom.changePrivate = $("#changePrivate");

        $dom.changePublic.on('click', function () {
            if(confirm('해당 파일을 공개로 전환하시겠습니까?')) {
                $.ajax({
                    url : "/admin/changeOpen",
                    type : "post",
                    data : {seq : $("#seq").val()},
                    success : function(result) {
                        if(result===1) {
                            alert("파일이 공개로 전환되었습니다.");
                            location.reload();
                        } else {
                            alert("잠시 후 다시 시도해주세요");
                        }
                    }
                })
            }
        })

        $dom.changePrivate.on('click', function () {
            if(confirm('해당 파일을 비공개로 전환하시겠습니까?')) {
                $.ajax({
                    url : "/admin/changePrivate",
                    type : "post",
                    data : {seq : $("#seq").val()},
                    success : function(result) {
                        if(result===1) {
                            alert("파일이 비공개로 전환되었습니다.");
                            location.reload();
                        } else {
                            alert("잠시 후 다시 시도해주세요");
                        }
                    }
                })
            }
        })
    })
</script>
</body>
</html>