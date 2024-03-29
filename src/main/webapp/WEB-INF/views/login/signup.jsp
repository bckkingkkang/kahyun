<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div>
    회원가입 화면
</div>
<div>
    <form action="">
        <table>
            <tr>
                <td><label for="username">이름</label></td>
                <td><input type="text" id="username"></td>
            </tr>
            <tr>
                <td><label for="user_id">아이디</label></td>
                <td><input type="text" id="user_id"></td>
            </tr>
            <tr>
                <td><label for="password">비밀번호</label>
                <td><input type="password" id="password"></td>
            </tr>
            <tr>
                <td><label for="password_check">비밀번호 확인</label>
                <td><input type="password" id="password_check"></td>
            </tr>
            <tr>
                <td><label for="nickname">닉네임</label></td>
                <td><input type="text" id="nickname"></td>
            </tr>
            <tr>
                <td>권한</td>
                <td>
                    <select name="auth" id="auth">
                        <option value="USER" default>사용자</option>
                        <option value="ADMIN">관리자</option>
                    </select>
                </td>
            </tr>
        </table>
        <button type="button" id="signupBtn">회원가입</button>
    </form>
</div>
<div>
    <a href="login">로그인</a>
    <a href="/">메인으로</a>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

    $(function () {
        $dom.signupBtn = $("#signupBtn");
        $dom.username = $("#username").val();
        $dom.user_id = $("#user_id").val();
        $dom.password = $("#password").val();
        $dom.password_check = $("#password_check").val();
        $dom.nickname = $("#nickname").val();
        $dom.auth = $("#auth").val();

        $dom.signupBtn.on('click', function () {
            console.log($dom);
            if(confirm("가입하시겠습니까")) {
                $.ajax({
                    url:"signup_ajax",
                    type : "post",
                    data : {
                        username : $("#username").val(),
                        user_id : $("#user_id").val(),
                        password : $("#password").val(),
                        password_check : $("#password_check").val(),
                        nickname : $("#nickname").val(),
                        auth : $("#auth").val(),
                    },
                    success : function() {
                        location.href="complete";
                    }
                })
            }
        })

    })


</script>
</body>
</html>