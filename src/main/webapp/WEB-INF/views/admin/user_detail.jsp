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

<h3>회원 리스트</h3>
<table>
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
                    <th><a href="/board/detail/${list.seq}">자세히 보기</a></th>
                    <th>${list.create_dt}</th>
                    <th>${list.update_dt}</th>
                    <th>${list.view}</th>
                    <th>${list.status == 'N' ? '정상' : '삭제'}</th>
                    <th>
                        <c:choose>
                            <c:when test="${list.status == 'N'}">
                                <button id="deleteBtn">삭제하기</button>
                            </c:when>
                            <c:otherwise>
                                삭제된 게시글입니다.
                            </c:otherwise>
                        </c:choose></th>
                </tr>
            </c:forEach>
    </tbody>

</table>
<a href="/admin/user_list">뒤로가기</a>

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
</script>
</body>
</html>