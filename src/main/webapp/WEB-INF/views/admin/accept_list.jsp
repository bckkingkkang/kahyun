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
        border: 1px solid; border-collapse: collapse;
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
<div style="width: 80%; margin: auto" >
    <table class="table text-center table-borderless">
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
            <th>공개 여부</th>
            <th>변경</th>
            <th>자세히 보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list">
            <tr>
                <td>${list.rownum}</td>
                <td>${list.title}</td>
                <td>${list.nickname}</td>
                <td>${list.user_id}</td>
                <td>${list.orgName}</td>
                <td>${list.price}</td>
                <td>${list.create_dt}</td>
                <td>
                    <c:choose>
                        <c:when test="${list.delete_yn eq 'N' }">
                        <a class="btn btn-outline-dark mt-auto" onclick="deleteBtn(${list.seq})">삭제</a>
                        </c:when>
                        <c:otherwise>
                            삭제
                        </c:otherwise>
                    </c:choose>
                </td>
                <c:choose>
                    <c:when test="${list.accept_yn == 'Y'}">
                        <td>공개</td>
                        <td><div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="changePrivate(${list.seq})" value="${list.seq}">비공개로 전환</a></div></td>
                    </c:when>
                    <c:otherwise>
                        <td>비공개</td>
                        <td><div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="changePublic(${list.seq})" value="${list.seq}">공개로 전환</a></div></td>
                    </c:otherwise>
                </c:choose>
                <td><a class="btn btn-outline-dark mt-auto" value="${list.seq}" href="/file_board/detail/${list.seq}">자세히 보기</a></td>
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

   function changePublic(seq) {
        if(confirm("해당 파일 게시글을 공개로 전환하시겠습니까?")) {
            $.ajax({
                url : "/admin/accept_list/change_public",
                type : "post",
                data : {seq : seq},
                success : function(result) {
                    if(result===1) {
                        alert("해당 파일 게시글이 공개로 전환되었습니다.");
                        location.reload();
                    } else{
                        alert("잠시 후 시도해주세요");
                    }
                }
            })
        }
   }
    function changePrivate(seq) {
        if(confirm("해당 파일 게시글을 비공개로 전환하시겠습니까?")) {
            $.ajax({
                url : "/admin/accept_list/change_private",
                type : "post",
                data : {seq : seq},
                success : function(result) {
                    if(result===1) {
                        alert("해당 파일 게시글이 비공개로 전환되었습니다.");
                        location.reload();
                    } else{
                        alert("잠시 후 시도해주세요");
                    }
                }
            })
        }
    }

    function deleteBtn(seq) {
       if(confirm("해당 파일 게시글을 삭제하시겠습니까?")) {
           $.ajax({
               url : "/admin/accept_list/delete",
               type : "post",
               data : {seq : seq},
               success : function(result) {
                   if(result===1) {
                       alert("해당 파일 게시글이 삭제되었습니다.");
                       location.reload();
                   } else {
                       alert("잠시 후 시도해주세요.");
                   }
               }
           })
       }
    }

</script>
</body>
</html>