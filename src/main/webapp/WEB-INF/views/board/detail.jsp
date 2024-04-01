<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<h1>게시판 상세 화면</h1>
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

<button type="button" onclick=location.href='/board/list' id="listBtn">목록</button>

<script>

</script>
</body>
</html>