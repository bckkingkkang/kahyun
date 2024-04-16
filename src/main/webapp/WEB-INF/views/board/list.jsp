<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
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
    <div>
        <h2>회원게시판</h2>
    </div>
    <div>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일시</th>
                    <th>수정일시</th>
                    <th>조회 수</th>
                    <th>분류</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list">
                <tr>
                    <th>${list.rownum}</th>
                    <th><a href="detail/${list.seq}">${list.title}</a></th>
                    <th>${list.nickname}</th>
                    <th>${list.create_dt}</th>
                    <th>${list.update_dt}</th>
                    <th>${list.view}</th>
                    <th><c:choose>
                        <c:when test="${list.boardOption eq 'boardOption1'}">게시판1</c:when>
                        <c:when test="${list.boardOption eq 'boardOption2'}">게시판2</c:when>
                        <c:otherwise>그냥게시판</c:otherwise>
                    </c:choose></th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <%--<a href="/">메인으로</a>--%>
        <a href="/board/create">글쓰기</a>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

</script>
</html>