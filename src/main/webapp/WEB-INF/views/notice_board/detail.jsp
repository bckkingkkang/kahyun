<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-05-30
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항</title>
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
<div>
    <c:choose>
        <c:when test="${selectNoticeBoard.delete_yn == 'Y'}">
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>삭제된 게시글입니다.</h3>
                    </div>
                </div>
            </header>
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <a class="btn btn-outline-dark mt-auto" href="javascript:history.back()">뒤로 가기</a>
                    </div>
                </div>
            </header>
        </c:when>
        <c:otherwise>
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>${selectNoticeBoard.title}</h3>
                    </div>
                </div>
            </header>
            <div class="container mb-3">
                <form action="">
                    <div>
                        <table class="table">
                            <tr>
                                <th class="text-center">등급</th>
                                <th>${selectNoticeBoard.importance}</th>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${selectNoticeBoard.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td>${selectNoticeBoard.create_dt}</td>
                            </tr>
                            <c:if test="${selectNoticeBoard.update_dt ne null}">
                                <tr>
                                    <th class="text-center">수정일</th>
                                    <td>${selectNoticeBoard.update_dt}</td>
                                </tr>
                            </c:if>

                            <tr>
                                <th class="text-center">내용</th>
                                <td>${selectNoticeBoard.content}</td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div class="text-center mb-3">
                    <div>
                        <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/notice_board/list">목록</a>
                        <a class="btn btn-outline-dark mt-auto" id="editBtn" href="/notice_board/edit/${selectNoticeBoard.seq}">수정</a>
                        <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

    $(function () {
        $dom.createBtn = $("#createBtn");
        $dom.deleteBtn = $("#deleteBtn");

        $dom.deleteBtn.on('click', function() {
            if(confirm("공지사항을 삭제합니다.")) {
                $.ajax({
                    url : "/notice_board/delete_notice",
                    type : "post",
                    data : {
                        seq : ${selectNoticeBoard.seq}
                    },
                    success : function(result) {
                        if(result == 1) {
                            alert("공지사항이 삭제되었습니다.");
                            location.href="/notice_board/list";
                        } else {
                            alert("잠시 후 시도해주세요");
                        }
                    }
                })
            }
        })
    })

</script>
</body>
</html>