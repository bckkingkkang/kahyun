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
        /*margin-left : auto;
        margin-right: auto;*/
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<jsp:include page="/header/header"></jsp:include>

<a href="/special_board/create">글쓰기</a>

    <h2>특별회원(자료) 게시판</h2>
    <div>
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${sboardList}" var="list">
                <tr>
                    <td>${list.rownum}</td>
                    <td><a href="detail/${list.seq}">${list.title}</a></td>
                    <td>${list.nickname}</td>
                    <td>${list.create_dt}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div>
        <h2>자료만 보기</h2>
        <table>
            <thead>
            <tr>
                <th>No</th>
                <th>다운로드</th>
                <th>등록자</th>
                <th>등록일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${fileList}" var="file">
                <tr>
                    <td>${file.rownum}</td>
                    <td><a href="<c:url value='/fileDownload/${file.savedName}' /> ">${file.orgName}</a></td>
                    <td>${file.nickname}</td>
                    <td>${file.create_dt}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
