<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
            <h1 class="display-4 fw-bolder">KAHYUN</h1>
        </div>
    </div>
</header>
<img src="" alt="">

<section class="py-5">
    <div class="text-center text-black-50">
        <h3>높은 다운로드 순</h3>
    </div>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${getMainFileBoardByDownload}" var="getMainFileBoardByDownload">
            <div class="col mb-5">
                <div class="text-center text-black-50">
                    <h3>${getMainFileBoardByDownload.rownum}</h3>
                </div>
                <div class="card h-100">
                    <img class="card-img-top" src="image/${getMainFileBoardByDownload.file}" height="150px" alt="..." />
                    <div class="card-body p-2">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${getMainFileBoardByDownload.title}</h5>
                            <i class="bi bi-tag"></i> <fmt:formatNumber value="${getMainFileBoardByDownload.price}"/> KRW
                        </div>
                        <div class="text-center">
                            <i class="bi bi-download"></i> ${getMainFileBoardByDownload.download_count}
                        </div>
                    </div>
                    <div class="text-center card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div>
                            <a class="btn btn-outline-dark mt-auto" href="/file_board/detail/${getMainFileBoardByDownload.seq}"><i class="bi bi-search"></i> details</a>
                        </div>
                    </div>
                    <div class="text-center card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div>
                            <a class="btn btn-outline-dark mt-auto" href="#"><i class="bi bi-cart-check"></i></a>
                            <a class="btn btn-outline-dark mt-auto" href="<c:url value='/fileDownload/${getMainFileBoardByDownload.savedName}'/>"}><i class="bi bi-box-arrow-down"></i> download</a>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<br>
<section class="py-5">
    <div class="text-center text-black-50">
        <h3>최근 등록 순</h3>
    </div>
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach items="${getMainFileBoardByCreate}" var="getMainFileBoardByCreate">
                <div class="col mb-5">
                    <div class="card h-100">
                        <img class="card-img-top" src="image/${getMainFileBoardByCreate.file}" height="150px" alt="..." />
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">${getMainFileBoardByCreate.title}</h5>
                                <i class="bi bi-tag"></i> <fmt:formatNumber value="${getMainFileBoardByCreate.price}"/> KRW
                            </div>
                            <div class="text-center">
                                <i class="bi bi-download"></i> ${getMainFileBoardByCreate.download_count}
                            </div>
                        </div>
                        <div class="text-center card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div>
                                <a class="btn btn-outline-dark mt-auto" href="/file_board/detail/${getMainFileBoardByCreate.seq}"><i class="bi bi-search"></i> details</a>
                            </div>
                        </div>
                        <div class="text-center card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div>
                                <a class="btn btn-outline-dark mt-auto" href="#"><i class="bi bi-cart-check"></i></a>
                                <a class="btn btn-outline-dark mt-auto" href="<c:url value='/fileDownload/${getMainFileBoardByCreate.savedName}'/>"}><i class="bi bi-box-arrow-down"></i> download</a>
                            </div>
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
