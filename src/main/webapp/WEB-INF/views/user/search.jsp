<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 찾기</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
계정찾기
<div>
    <form action="">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div>
        이름을 입력하세요
        <label for="username"></label>
        <input type="text" id="username">
    </div>
    <div>
        nickname을 입력하세요
        <label for="nickname"></label>
        <input type="text" id="nickname">
    </div>
    <button id="searchBtn">아이디 찾기</button>
    <div>
        검색 결과 :
        <label for="user_id"></label>
        <input type="text" id="user_id" readonly>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button id="copyBtn" hidden>아이디 복사하기</button>
    </div>
    <div>
        <a href="login">로그인</a>
        <a href="signup">회원가입</a>
        <a href="/">메인으로</a>
    </div>
    </form>
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
</body>
</html>