<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>header</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/">KAHYUN</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/board/list">Community</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/special_board/list">Download</a></li>
            </ul>
            <c:choose>
                <c:when test="${isLogin == 'true'}">
                    <form action="/logout" mehtod="post" class="d-flex">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                            <li class="nav-item collapse navbar-collapse">${user.nickname} 님, 로그인 중입니다.</li>
                            <li class="nav-item"><a href="/cash/charge"><span class="badge bg-dark text-white ms-1 rounded-pill"><fmt:formatNumber value="${user.cash}"/> KRW</span></a></li>
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/user/mypage">MyPage</a></li>
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/logout" type="submit"><i class="bi bi-person-dash-fill"></i> Logout</a></li>
                        </ul>
                    </form>
                    <form>
                        <button class="btn" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="/logout" mehtod="post" class="d-flex">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="/user/login"><i class="bi bi-person-plus-fill"></i> Login</a></li>
                        </ul>
                    </form>

                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>

<!-- Footer-->
<%--<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>--%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/js/scripts.js"></script>
</body>
</html>
