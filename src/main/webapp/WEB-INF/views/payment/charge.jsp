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
    <title>충전하기</title>
</head>
<jsp:include page="/header/header"></jsp:include>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<body>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">CASH</h3>
            <p class="lead fw-normal text-black-50 mb-0">캐시 충전</p>
        </div>
    </div>
</header>
<%--<div class="form-floating mb-3">
    <input type="number" min="5000" step="5000" class="form-control" id="price" name="price" placeholder="충전 금액">
    <label for="price">충전 금액 (원)</label>
</div>--%>
<div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <div class="col mb-5">
                <div class="card h-100">
                    <img class="card-img-top" src="/image/281f392a-0ce1-4a04-9852-900c2f3e11d4_photo_2024-05-09_15-35-10.jpg" height="150px" alt="..." />
                    <div class="card-body p-4">
                        <div class="text-center">
                            <h5 class="fw-bolder">5000원</h5>
                            <input type="radio" id="price_5000" name="price" value="5000">
                        </div>
                    </div>
                </div>
            </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/image/281f392a-0ce1-4a04-9852-900c2f3e11d4_photo_2024-05-09_15-35-10.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">10000원</h5>
                        <input type="radio" id="price_10000" name="price" value="10000">
                    </div>
                </div>
            </div>
        </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/image/281f392a-0ce1-4a04-9852-900c2f3e11d4_photo_2024-05-09_15-35-10.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">30000원</h5>
                        <input type="radio" id="price_30000" name="price" value="30000">
                    </div>
                </div>
            </div>
        </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/image/281f392a-0ce1-4a04-9852-900c2f3e11d4_photo_2024-05-09_15-35-10.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">50000원</h5>
                        <input type="radio" id="price_50000" name="price" value="50000">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    <div class="text-center">
        <button class="btn btn-outline-dark mt-auto" onclick="requestPay()">결제하기</button>
    </div>
</div>
</div>


<jsp:include page="/header/footer"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>



    // IMP 객체 초기화
    const IMP = window.IMP; // 생략 가능
    IMP.init("imp85686561"); // 예: imp00000000a
    /*
        고객사 식별 코드 imp85686561
        : 결체창 연동 시 사용되며, 객체 호출 시 객체 초기화에 사용
    */
    function requestPay() {
        /*
            https://developers.portone.io/docs/ko/sdk/javascript-sdk/payrq?v=v1
        */

        var price = $('input[name="price"]:checked').val();
        console.log(price);

        IMP.request_pay({
            pg: "html5_inicis",                     // PG사 구분 코드
            pay_method: "card",                     // 결제수단 구분 코드
            merchant_uid: "ORD20180131-0000012",    // 주문번호
            name: "결제 대상 제품명",                 // 결제 대상 제품명
            amount: price,                          // 결제 금액
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
        }, function (rsp) { // callback
            $.ajax({
                type: 'POST',
                url: '/charge/' + rsp.imp_uid
            }).done(function(data) {
                if(rsp.paid_amount === data.response.amount){
                    alert("결제되었습니다.");
                    console.log(data);
                } else {
                    // 결제 금액
                    console.log(data.response.amount);
                    alert("결제 실패했습니다. " + rsp.error_msg);
                }
            });
        });
    }


</script>

</body>
</html>
