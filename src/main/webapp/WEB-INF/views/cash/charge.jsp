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
<div class="second" align="center">
    <p style="font-weight: bold">카카오페이 현재 사용가능</p>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label><br/>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label><br/>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
    <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
    <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
    <button type="button" class="btn btn-outline-dark" id="charge_kakao">충 전 하 기</button>

    <button onclick="requestPay()">결제하기</button>
</div>


<jsp:include page="/header/footer"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>
    // IMP 객체 초기화
    const IMP = window.IMP; // 생략 가능
    IMP.init("imp85686561"); // 예: imp00000000a
    /*
        고객사 식별 코드 imp85686561
        : 결체창 연동 시 사용되며, 객체 호출 시 객체 초기화에 사용
    */

    const response = await PortOne.requestPayment({
        // Store ID 설정
        storeId: "store-4ff4af41-85e3-4559-8eb8-0d08a2c6ceec",
        // 채널 키 설정
        channelKey: "channel-key-893597d6-e62d-410f-83f9-119f530b4b11",
        paymentId: `payment-${crypto.randomUUID()}`,
        orderName: "나이키 와플 트레이너 2 SD",
        totalAmount: 1000,
        currency: "CURRENCY_KRW",
        payMethod: "CARD",
    });


    var today = new Date();
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;

    function requestPay() {
        IMP.request_pay({
            pg : 'kcp',
            pay_method : 'card',
            merchant_uid: "IMP"+makeMerchantUid,
            name : '당근 10kg',
            amount : 1004,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '아임포트 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456',
            card: {
                direct: {
                    code: "367", //현대카드 모듈 직접호출
                    quota: 3
                }
            }
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
            } else {
                console.log(rsp);
            }
        });
    }

</script>

</body>
</html>
