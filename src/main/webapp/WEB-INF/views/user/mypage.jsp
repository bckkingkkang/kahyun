<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-08
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>마이페이지</title>
</head>
<jsp:include page="/header/header"></jsp:include>
<%--<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>--%>
<body>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">마이페이지</h3>
        </div>
    </div>
</header>
<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3>내 정보</h3>
            <div class="text-end">
                <a class="btn btn-outline-dark mt-auto" href="edit">수정하기</a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <form action="" enctype="multipart/form-data">
        <div>
            <table class="table text-center table-borderless">
                <tr>
                    <td rowspan="8" width="35%">
                        <img src="/image/갸라도스2.jpg" alt="" style="width:300px;height: 300px;border-radius: 70%; overflow: hidden;">
                    </td>
                </tr>
                <tr>
                    <th width="35">이름</th>
                    <td width="30">${userInfo.username}</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>${userInfo.user_id}</td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>${userInfo.nickname}</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${userInfo.email}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>${userInfo.phone}</td>
                </tr>
                <tr>
                    <th>가입일자</th>
                    <td>${userInfo.reg_date}</td>
                </tr>
                <tr>
                    <th>보유 캐시</th>
                    <td><fmt:formatNumber value="${userInfo.cash}" /> 원
                        <a class="btn btn-outline-dark mt-auto" href="/payment/charge">충전하기</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div class="container">
    <div class="bg-white py-5">
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-center text-black">
                <h3>캐시 충전 내역</h3>
                <div class="text-end"><a class="btn btn-outline-dark mt-auto" id="chargeBtn" href="admin">자세히 보기</a></div>
            </div>
        </div>
    </div>

    <table class="table text-center">
        <thead>
        <tr>
            <th>No</th>
            <th>주문번호</th>
            <th>금액</th>
            <th>결제경로</th>
            <th>결제수단</th>
            <th>보유 잔액</th>
            <th>충전 일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${charge_cash_list}" var="charge_cash_list">
            <tr>
                <td>${charge_cash_list.rownum}</td>
                <td>${charge_cash_list.merchant_uid}</td>
                <td><fmt:formatNumber value="${charge_cash_list.price}"/></td>
                <td>${charge_cash_list.emb_pg_provider}</td>
                <td>${charge_cash_list.pay_method}</td>
                <td><fmt:formatNumber value="${charge_cash_list.user_cash}"/></td>
                <td>${charge_cash_list.charge_dt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container">
    <div class="bg-white py-5">
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-center text-black">
                <h3>캐시 사용 내역</h3>
                <div class="text-end"><a class="btn btn-outline-dark mt-auto" id="useBtn" href="admin">자세히 보기</a></div>
            </div>
        </div>
    </div>

    <table class="table text-center">
        <thead>
        <tr>
            <th>No</th>
            <th>주문번호</th>
            <th>이용 금액</th>
            <th>이용 잔액</th>
            <th>구매 상품</th>
            <th>사용 일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${charge_cash_list}" var="charge_cash_list">
            <tr>
                <td>${charge_cash_list.rownum}</td>
                <td>${charge_cash_list.merchant_uid}</td>
                <td><fmt:formatNumber value="${charge_cash_list.price}" />원</td>
                <td>${charge_cash_list.emb_pg_provider}</td>
                <td>${charge_cash_list.pay_method}</td>
                <td>${charge_cash_list.charge_dt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center">
            <a class="btn btn-outline-dark mt-auto" href="/admin/admin">관리자 페이지</a>
        </div>
    </div>
</div>

<jsp:include page="/header/footer"></jsp:include>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

</script>
</body>
</html>
