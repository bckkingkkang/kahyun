<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>자료게시글 상세</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Special Board</h1>
            <p class="lead fw-normal text-white-50 mb-0">특별회원(자료) 게시판 상세</p>
        </div>
    </div>
</header>
<c:choose>
    <c:when test="${getDetailBoard.status == 'D'}">
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <h3>삭제된 게시글입니다.</h3>
                </div>
            </div>
        </header>
        <div class="text-center">
            <a class="btn btn-outline-dark mt-auto" href="/special_board/list">목록</a>
            <p></p>
        </div>
    </c:when>
    <c:otherwise>
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <h3>${getDetailBoard.title}</h3>
                </div>
            </div>
        </header>
        <div class="container">
            <form action="">
                <div>
                    <table class="table">
                        <tr>
                            <th width="30%" class="text-center">작성자</th>
                            <td>${getDetailBoard.nickname}</td>
                        </tr>
                        <tr>
                            <th class="text-center">작성일</th>
                            <td>${getDetailBoard.create_dt}</td>
                        </tr>
                        <tr>
                            <th class="text-center">내용</th>
                            <td>${getDetailBoard.content}</td>
                        </tr>
                        <tr>
                            <th class="text-center">파일명</th>
                            <td>${getDetailFile.orgName}</td>
                        </tr>
                        <tr>
                            <th class="text-center">파일</th>
                            <c:choose>
                                <c:when test="${getDetailFile.accept_yn == 'Y' }">
                                    <td><a class="btn btn-outline-dark mt-auto" href="<c:url value='/fileDownload/${getDetailFile.savedName}'/>"}>다운로드</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a class="btn btn-outline-dark mt-auto disabled"}>다운로드</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th class="text-center">가격</th>
                            <th>${getDetailBoard.price} 원</th>
                        </tr>
                        <tr>
                            <th class="text-center">보기</th>
                            <td><img width="70%" src="/image/${getDetailFile.savedName}" alt=""></td>
                        </tr>
                    </table>
                </div>
            </form>
            <div class="text-center">
                <div>
                    <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/special_board/list">목록</a>
                    <%--<c:if test="${getDetailBoard.user_seq == (getDetailBoard.seq || getDetailBoard.auth == 'ADMIN') && getDetailBoard.status != 'D'}">
                        <a class="btn btn-outline-dark mt-auto" id="editBtn" href="#">수정</a>
                        <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                    </c:if>--%>
                    <p></p>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
<jsp:include page="/header/footer"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

</script>
</body>
</html>