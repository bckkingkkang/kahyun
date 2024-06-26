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

<jsp:include page="/header/header"></jsp:include>

<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Special Board</h1>
            <p class="lead fw-normal text-white-50 mb-0">특별회원(자료 등록) 게시판</p>
        </div>
    </div>
</header>
<div class="container">
    <p></p>
    <div class="text-end">
        <a class="btn btn-outline-dark mt-auto" href="/file_board/create">등록</a>
    </div>
    <p></p>
</div>
    <div class="container">
        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>수정일</th>
                    <th>공개여부</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${notice_list}" var="notice_list">
                <tr style="background-color: #fff3cd"}>
                    <th>공지</th>
                    <th><a href="/notice_board/detail/${notice_list.seq}" ${notice_list.importance eq 'A' ? 'style="color: red"' : notice_list.importance eq 'B' ? 'style="color: blue"' : 'style="color: black"'}>${notice_list.title}</a></th>
                    <th>${notice_list.nickname}</th>
                    <th>${notice_list.create_dt}</th>
                    <th>${notice_list.update_dt eq null ? '-' : notice_list.update_dt}</th>
                    <th>-</th>
                </tr>
            </c:forEach>
            <c:forEach items="${sboardList}" var="list">
                <tr>
                    <td>${list.rownum}</td>
                    <th><a href="detail/${list.seq}" style="color: black">${list.title}</a></th>
                    <td>${list.nickname}</td>
                    <td>${list.create_dt}</td>
                    <td>-</td>
                    <td>${list.accept_yn == 'Y' ? '공개' : '비공개'}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <%--<div>
        <h2>자료만 보기</h2>
        <table class="table table-hover">
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
    </div>--%>
<jsp:include page="/header/footer"></jsp:include>
</body>
</html>
