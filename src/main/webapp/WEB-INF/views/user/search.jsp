<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 찾기</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">계정 찾기</h1>
        </div>
    </div>
</header>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">이름과 닉네임을 입력하세요</p>
        </div>
    </div>
</header>
<div class="container-sm">
    <form action="">
        <table class="table table-borderless">
            <tr>
                <td>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="username" placeholder="이름을 입력하세요">
                        <label for="username">이름</label>
                    </div>
                </td>
                <td>
                    <div class="form-floating mb-3">
                        <input type="text" id="nickname" class="form-control" placeholder="닉네임ㅇ">
                        <label for="nickname">닉네임</label>
                    </div>
                </td>
            </tr>
            <tr class="text-center">
                <td colspan="2"><button class="btn btn-outline-dark mt-auto" id="searchBtn">아이디 찾기</button></td>
            </tr>
        </table>
        <table class="table table-borderless">
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <p class="lead fw-normal text-black-50 mb-0">검색 결과</p>
                    </div>
                </div>
            </header>
            <tr class="text-center">
                <td colspan="2">
                    <div>
                        아이디 :
                        <label for="user_id"></label>
                        <input type="text" id="user_id" readonly>
                        <button class="btn btn-outline-dark mt-auto" id="copyBtn" hidden>아이디 복사하기</button>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
<div>
    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        <div class="card-body p-2 text-center">
            <a class="btn btn-outline-dark mt-auto" href="login">로그인</a>
            <a class="btn btn-outline-dark mt-auto" href="signup">회원가입</a>
            <a class="btn btn-outline-dark mt-auto" href="/">메인으로</a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

    $(function() {
        $dom.searchBtn = $("#searchBtn");
        $dom.user_id = $("#user_id");
        $dom.copyBtn = $("#copyBtn");

        /* 아이디 찾기 버튼 클릭 시 */
        $dom.searchBtn.on('click', function () {
            if($("#username").val()=="" || $("#nickname").val()=="") {
                alert("아이디 또는 닉네임을 입력하세요");
                return;
            }
            $.ajax({
                    url:"search_id_ajax",
                    type : "post",
                    data : {
                        username : $("#username").val(),
                        nickname : $("#nickname").val(),
                    },
                    success : function(result) {
                        console.log(result);
                        if(result == "") {
                            $("#user_id").val("해당 정보로 가입된 아이디가 없습니다.");
                            if(confirm("해당 정보로 가입된 아이디가 없습니다.\n회원가입으로 이동하시겠습니까?")) {
                                location.href="signup";
                            }
                        } else {
                            $("#user_id").val(result);
                            $("#copyBtn").show();
                        }
                    }
            })

        })

        /* 복사하기 버튼 클릭 시 */
        $dom.copyBtn.on('click', function() {
            navigator.clipboard.writeText($("#user_id").val());
            if(confirm("아이디가 복사되었습니다. 로그인으로 이동하시겠습니까")) {
                location.href = "login";
            }
        })
    })
</script>

<jsp:include page="/header/footer"></jsp:include>
</body>
</html>