<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
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
<h1>게시판 상세 화면</h1>

<div>
    <div>
    <table>
        <tr>
            <td style="width: 100px">제목</td>
            <td id="title" style="width: 500px">${boardDetail.title}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td id="nickname">${boardDetail.nickname}</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td id="create_dt">${boardDetail.create_dt}</td>
        </tr>
        <tr>
            <td>수정일</td>
            <td id="update_dt">${boardDetail.update_dt}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td id="content">${boardDetail.content}</td>
        </tr>
    </table>
    </div>
    <div>
        <button type="button" onclick=location.href='/board/list' id="listBtn">목록</button>
    </div>

    <div>
        <div>
            <table>
                <tr>
                    <td style="width: 100px">댓글</td>
                    <td style="width: 300px"><textarea name="" id="" cols="30" rows="5"></textarea></td>
                    <td style="width: 100px"><button>등록</button></td>
                </tr>
            </table>
        </div>
    </div>


    <div>
        <div>
            <h3>댓글</h3>
        </div>
        <div>
            <c:forEach items="${boardComment}" var="boardComment">
                <div>
                    <table>
                    <tr>
                        <td style="width: 100px">내용</td>
                        <td style="width: 500px">${boardComment.content}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${boardComment.nickname}</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td>${boardComment.create_dt}</td>
                    </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
    </div>

</div>



<script>

</script>
</body>
</html>