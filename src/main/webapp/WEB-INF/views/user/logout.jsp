<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-09
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그아웃</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Logout</h1>
        </div>
    </div>
</header>

<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    <div class="text-center">
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <h3>로그아웃되었습니다.</h3>
                </div>
            </div>
        </header>
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='/main'">메인으로</button>
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='/user/login'">로그인하기</button>
    </div>
</div>

<jsp:include page="/header/footer"></jsp:include>
</body>
</html>
