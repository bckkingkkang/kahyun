<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Login</h1>
        </div>
    </div>
</header>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <div class="col mb-5">
                <div class="card h-100">
                    <form action="/user/loginForm" method="post">
                        <div class="card-body p-2">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">로그인</h5>
                            </div>
                        </div>

                        <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                        <div  class="card-body p-2 text-center">
                            <input type="text" id="user_id" name="user_id" placeholder="user id">
                        </div>
                        <div  class="card-body p-2 text-center">
                            <input type="password" id="password" name="password" placeholder="user password" autoComplete="off">
                        </div>
                        <div>
                            <c:if test="${error eq true}">
                                <script> alert("${exception}"); location.href="/user/login";</script>
                            </c:if>
                        </div>

                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="card-body p-2 text-center">
                                <button class="btn btn-outline-dark mt-auto" type="submit">로그인</button>
                            </div>
                            <%--<div class="text-center">
                                <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='search'">계정 찾기</button>
                                <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='signup'">회원 가입</button>
                            </div>--%>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    <div class="text-center">
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='search'">계정 찾기</button>
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='signup'">회원 가입</button>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="/js/scripts.js"></script>
<script>

</script>
</body>
</html>