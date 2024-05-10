<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입 완료</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">회원가입</h1>
        </div>
    </div>
</header>

<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    <div class="text-center">
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <h3>회원가입이 완료되었습니다.</h3>
                </div>
            </div>
        </header>
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='/main'">메인으로</button>
        <button type="button" class="btn btn-outline-dark mt-auto" onclick="location.href='/user/login'">로그인하기</button>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>
<script>

</script>
</body>
</html>