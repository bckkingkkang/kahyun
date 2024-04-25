<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-09
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>특별회원 전용</title>
</head>
<body>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<jsp:include page="/header/header"></jsp:include>
    <h2>특별회원 게시판입니다.</h2>
<table>
    <thead>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>자료</th>
        <th>작성자</th>
        <th>등록일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${fileList}" var="file">
        <tr>
            <td>번호칸</td>
            <td>제목칸</td>
            <td><a href="<c:url value='/fileDownload/${file}' /> ">${file} 파일 다운로드</a></td>
            <td>작성자칸</td>
            <td>등록일시</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

    <%--<a href="/">메인으로</a>--%>
    <a href="/special_board/create">글쓰기</a>
</body>
</html>
