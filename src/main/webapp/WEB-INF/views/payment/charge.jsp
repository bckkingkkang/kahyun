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
<body>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">CASH</h3>
            <p class="lead fw-normal text-black-50 mb-0">캐시 충전</p>
        </div>
    </div>
</header>
<div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/cash_image/5000.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">5,000원</h5>
                        <input class="btn-check" type="radio" id="price_5000" name="price" value="5000">
                        <label for="price_5000" class="btn btn-outline-dark">5,000원</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/cash_image/10000.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">10,000원</h5>
                        <input class="btn-check" type="radio" id="price_10000" name="price" value="10000" checked>
                        <label for="price_10000" class="btn btn-outline-dark">10,000원</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/cash_image/30000.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">30,000원</h5>
                        <input class="btn-check" type="radio" id="price_30000" name="price" value="30000">
                        <label for="price_30000" class="btn btn-outline-dark">30,000원</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col mb-5">
            <div class="card h-100">
                <img class="card-img-top" src="/cash_image/50000.jpg" height="150px" alt="..." />
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">50,000</h5>
                        <input class="btn-check" type="radio" id="price_50000" name="price" value="50000">
                        <label for="price_50000" class="btn btn-outline-dark">50,000원</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <button class="btn btn-outline-dark mt-auto scroll_move" onclick="choiceBtn()" id="choiceBtn">선택</button>
        </div>
    </div>
</div>
<div id="charge_info" style="display: none">
    <div class="bg-white py-5" >
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-center text-black">
                <h3>충전 정보</h3>
            </div>
        </div>
    </div>
    <div id="chargeInfo" class="container" >
        <div>
            <div>
                <table class="table table-borderless">
                    <tr>
                        <th class="text-center">이름</th>
                        <td id="user_name">${user.username}</td>
                    </tr>
                    <tr>
                        <th class="text-center">전화번호</th>
                        <td id="user_phone">${user.phone} </td>
                    </tr>
                    <tr>
                        <th class="text-center">이메일</th>
                        <td id="user_email">${user.email}</td>
                    </tr>
                    <tr>
                        <th class="text-center">충전 금액</th>
                        <th id="price_info"></th>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="bg-white py-5">
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-black">
                <p class="text-center lead fw-normal">서비스 이용 약관</p>
                <p class="text-black-50 mb-0">
                    01 (목적) <br>
                    이 약관은 주식회사 케이지이니시스(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가
                    이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.<br>
                    회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.<br>
                    회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.<br>
                    회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.<br><br>
                    02 (전자지급결제대행서비스의 종류)<br>
                    회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.<br>
                    신용카드결제대행서비스 : 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.<br>
                    계좌이체대행서비스 : 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록 정산을 대행하거나 매개하는 서비스를 말합니다.<br> 한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.<br>
                    가상계좌서비스 : 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.<br>
                    기타 : 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스'등이 있습니다.<br><br>
                    03 (결제대금예치서비스의 내용)<br>
                    이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다.<br> 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.<br>
                    회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.<br>
                    회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급 받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이 통신판매업자에게 결제대금을 지급할 수 있습니다.<br>
                    회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.<br>
                    회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.<br>
                    </p>
            </div>
        </div>
    </div>
    <div class="bg-white py-5" >
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-center text-black">
                <p>서비스 이용 약관에 동의합니다. <input name="acceptBtn" id="acceptBtn" type="checkbox"></p>
            </div>
        </div>
    </div>
    <div class="bg-white py-5" >
        <div class="container px-2 px-lg-3 my-3">
            <div class="text-center text-black">
                <button class="btn btn-outline-dark mt-auto" onclick="requestPay()" id="payBtn">결제하기</button>
            </div>
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
    const make_merchant_uid = () => {
        const current_time = new Date();
        const year = current_time.getFullYear().toString();
        const month = (current_time.getMonth()+1).toString();
        const day = current_time.getDate().toString();
        const hour = current_time.getHours().toString();
        const minute = current_time.getMinutes().toString();
        const second = current_time.getSeconds().toString();
        const merchant_uid = 'KAHYUN' + year + month + day + hour + minute + second;
        return merchant_uid;
    };
    const merchant_uid = make_merchant_uid();

    function choiceBtn() {
        document.getElementById('charge_info').style = 'display';
        document.getElementById('price_info').innerText = $('input[name="price"]:checked').val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";

        location.href="#charge_info";
        document.getElementById('charge_info').animate({scrollTop:$(this.hash).offset()},500);

    }

    function requestPay() {
        if($('input[name="acceptBtn"]:checked').val() != 'on') {
            alert('서비스 이용 약관에 동의해주십시오.');
            return;
        };
        /*
            https://developers.portone.io/docs/ko/sdk/javascript-sdk/payrq?v=v1
        */
        var price = $('input[name="price"]:checked').val();
        console.log(price);

        IMP.request_pay({
            pg: "html5_inicis",                     // PG사 구분 코드
            /*pay_method: "card", */                    // 결제수단 구분 코드
            merchant_uid: merchant_uid,    // 고객사 주문번호
            name: price + "원 권",                 // 결제 대상 제품명
            amount: price,                          // 결제 금액
            buyer_email: document.getElementById('user_email').innerText,
            buyer_name: document.getElementById('user_name').innerText,
            buyer_tel: document.getElementById('user_phone').innerText,
        }, function (rsp) { // callback
            $.ajax({
                type: 'POST',
                url: '/charge/' + rsp.imp_uid
            }).done(function(data) {
                if(rsp.paid_amount === data.response.amount){
                    console.log(data.response.cardCode);
                    alert("결제되었습니다.");

                    $.ajax({
                        url : "/charge_cash",
                        type : "post",
                        data : {
                            price : data.response.amount,
                            card_name : data.response.cardName,
                            emb_pg_provider : data.response.embPgProvider,
                            apply_num : data.response.applyNum,
                            card_code : data.response.cardCode,
                            imp_uid : rsp.imp_uid,
                            merchant_uid : rsp.merchant_uid,
                            pay_method : rsp.pay_method,
                        },
                        success: function() {
                            location.href = "/user/mypage";
                        }
                    })
                } else {
                    alert("결제 실패했습니다. " + rsp.error_msg);
                }
            });
        });
    }



</script>

</body>
</html>
