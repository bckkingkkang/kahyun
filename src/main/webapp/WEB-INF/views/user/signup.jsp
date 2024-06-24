<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
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
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">정보 입력</p>
        </div>
    </div>
</header>
<div>
    <div class="container-sm">
        <form action="">
            <table class="table table-borderless text-center">
                <tr>
                    <th>이름</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" id="username" placeholder="이름">
                            <label for="username">이름</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="email" id="email" placeholder="이메일">
                            <label for="email">이메일</label>
                        </div>
                    </td>
                    <td class="text-start">
                        <button class="btn btn-outline-dark mt-auto" type="button" id="sendBtn" name="sendBtn">인증번호 발송</button>
                    </td>
                </tr>
                <tr>
                    <th>인증 번호</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" name="number" id="number" placeholder="인증번호 입력">
                            <label for="number">인증번호</label>
                            <input type="text" name="number" id="numberOk" hidden>
                        </div>
                    </td>
                    <td class="text-start">
                        <button class="btn btn-outline-dark mt-auto" type="button" name="confirmBtn" id="confirmBtn">이메일 인증</button>
                    </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input placeholder="아이디" class="form-control" type="text" id="user_id_check">
                            <label for="user_id">아이디</label>
                            <input class="form-control" type="text" id="user_id" style="display:none" readonly>
                        </div>
                    </td>
                    <td class="text-start">
                        <button class="btn btn-outline-dark mt-auto" type="button" id="idCheckBtn">중복확인</button>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="password" id="password" placeholder="비밀번호">
                            <label for="password">비밀번호</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="password" id="password_check" placeholder="비밀번호 확인">
                            <label for="password_check">비밀번호 확인</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" id="nickname" placeholder="닉네임">
                            <label for="nickname">닉네임</label>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="text-center">
                <button class="btn btn-outline-dark mt-auto" type="button" id="signupBtn">회원가입</button>
            </div>
        </form>
    </div>
</div>
<div>
    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        <div class="card-body p-2 text-center">
            <a class="btn btn-outline-dark mt-auto" href="login">로그인</a>
            <a class="btn btn-outline-dark mt-auto" href="/">메인으로</a>
        </div>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};
    let num = "";

    $(function () {
        $dom.signupBtn = $("#signupBtn");
        $dom.username = $("#username").val();
        $dom.user_id = $("#user_id").val();
        $dom.email = $("#email").val();
        $dom.user_id_check = $("#user_id_check").val();
        $dom.password = $("#password").val();
        $dom.password_check = $("#password_check").val();
        $dom.nickname = $("#nickname").val();
        $dom.auth = $("#auth").val();
        $dom.idCheckBtn = $("#idCheckBtn");
        $dom.sendBtn = $("#sendBtn");
        $dom.confirmBtn = $("#confirmBtn");



        $dom.signupBtn.on('click', function () {
            console.log($dom);
            if($("#numberOk").val() != "ok") {
                alert("이메일 인증을 진행해주세요");
                return;
            }
            if($("#user_id").val()=="") {
                alert("아이디 중복 체크를 진행해주세요");
                return;
            }
            if($("#user_id_check").val()=="") {
                alert("아이디를 입력해주세요");
                return;
            }
            if($("#password").val() != $("#password_check").val()) {
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }
            if(confirm("가입하시겠습니까")) {
                $.ajax({
                    url:"/user/signup",
                    type : "post",
                    data : {
                        username : $("#username").val(),
                        user_id : $("#user_id").val(),
                        password : $("#password").val(),
                        password_check : $("#password_check").val(),
                        nickname : $("#nickname").val(),
                        auth : $("#auth").val(),
                        email : $("#email").val()
                    },
                    success : function() {
                        location.href="complete";
                    }
                })
            }
        })

        $dom.idCheckBtn.on('click', function() {
            $.ajax({
                url:"check_id_ajax",
                type : "post",
                data : {
                    user_id : $("#user_id_check").val()
                },
                success : function(count) {
                    if(count == 0) {
                        if($("#user_id_check").val() == "") {
                            alert("아이디를 입력 후 진행해주세요");
                            return;
                        }
                        alert("사용 가능한 아이디입니다.");
                        $("#user_id").val($("#user_id_check").val());
                    } else {
                        alert("사용 불가능한 아이디입니다.");
                        $("#user_id").val("");
                    }

                }
            })

        })


        $dom.sendBtn.on('click', function() {
             $.ajax({
                 url:"/mail",
                 type:"post",
                 data:{ mail : $("#email").val()
                 },
                 success : function(data) {
                     alert("인증번호가 발송되었습니다.");
                     console.log(data);
                     num = data;
                 }
             })
        })

        $dom.confirmBtn.on('click', function() {
            const number1 = $("#number").val();

            if(number1 == num) {
                alert("인증되었습니다.");
                document.getElementById("number").readOnly = true;
                $("#numberOk").val("ok");
                document.getElementById("number").type = "password";
                document.getElementById("confirmBtn").hidden = true;
            } else {
                alert("인증번호가 일치하지 않습니다.");
            }
        })

    })


</script>
</body>
</html>