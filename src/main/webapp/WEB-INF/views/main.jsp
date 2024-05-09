<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>main</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>

<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Kahyun</h1>
            <p class="lead fw-normal text-white-50 mb-0">With this hompeage template</p>
        </div>
    </div>
</header>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="text-center text-black-50">
            <h3>높은 다운로드 순</h3>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${getMainSpecialBoardByDownload}" var="getMainSpecialBoardByDownload">
            <div class="col mb-5">
                <div class="text-center text-black-50">
                    <h3>${getMainSpecialBoardByDownload.rownum}</h3>
                </div>
                <div class="card h-100">
                    <img class="card-img-top" src="image/${getMainSpecialBoardByDownload.file}" height="150px" alt="..." />
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${getMainSpecialBoardByDownload.title}</h5>
                            ${getMainSpecialBoardByDownload.price} 원
                        </div>
                        <div class="text-center">
                            다운로드 수 : ${getMainSpecialBoardByDownload.download_count}
                        </div>
                    </div>
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="text-center text-black-50">
            <h3>최근 등록 순</h3>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${getMainSpecialBoardByCreate}" var="getMainSpecialBoardByCreate">
                <div class="col mb-5">
                    <div class="card h-100">
                        <img class="card-img-top" src="image/${getMainSpecialBoardByCreate.file}" height="150px" alt="..." />
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${getMainSpecialBoardByCreate.title}</h5>
                                    ${getMainSpecialBoardByCreate.price} 원
                            </div>
                            <div class="text-center">
                                다운로드 수 : ${getMainSpecialBoardByCreate.download_count}
                            </div>
                        </div>
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="/header/footer"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
