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

<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">관리자 리스트</h3>
            <p class="lead fw-normal text-black-50 mb-0">관리자 등록 게시글 관리</p>
        </div>
    </div>
</header>
<table class="table text-center">
    <thead>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>내용</th>
        <th>등록일</th>
        <th>수정일</th>
        <th>조회 수</th>
        <th>게시글 상태</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.rownum}</th>
                    <th>${list.title}</th>
                    <th><a class="btn btn-outline-dark mt-auto" href="/board/detail/${list.seq}">자세히 보기</a></th>
                    <th>${list.create_dt}</th>
                    <th>${list.update_dt}</th>
                    <th>${list.view}</th>
                    <th>${list.status == 'N' ? '정상' : '삭제'}</th>
                    <th>
                        <c:choose>
                            <c:when test="${list.status == 'N'}">
                                <button class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제하기</button>
                            </c:when>
                            <c:otherwise>
                                삭제된 게시글입니다.
                            </c:otherwise>
                        </c:choose></th>
                </tr>
            </c:forEach>
    </tbody>

</table>
<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="listBtn" href="/admin/user_list">뒤로 가기</a></div>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    /*$(function() {
        $dom.deleteBtn = $("#deleteBtn");

        $dom.deleteBtn.on('click', function() {
            if(confirm("삭제하시겠습니까")) {
                $.ajax({
                    url:"/board/delete_board_ajax",
                    type : "post",
                    data : {
                        'seq' : seq
                    },
                    success : function(result) {
                        if(result === 1) {
                            alert("삭제되었습니다.");
                            location.href = "/board/list";
                        } else {
                            alert("다시 시도해주세요");
                            return;
                        }

                    }
                })
            }

        })

    })*/
<jsp:include page="/header/footer"></jsp:include>
</script>
</body>
</html>