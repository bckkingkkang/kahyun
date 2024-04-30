<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-08
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>내 정보 수정</title>
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
<div>
    <h1>내 정보 수정</h1>
</div>
<div>
    <form action="" enctype="multipart/form-data">
        <div>
            <h3>프로필 이미지</h3>
            <table>
                <tr>
                    <td style="width: 120px">
                        <label for="input_image">이미지 선택</label>
                    </td>
                    <td style="width: 300px">
                        <input type="file" id="input_image" accept="image/*">
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h3>내 정보 수정</h3>
            <table>
                <tr>
                    <td style="width: 120px">이름</td>
                    <td style="width: 300px">${userInfo.username}</td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" value="${userInfo.user_id}"></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" value="${userInfo.nickname}"></td>
                </tr>
                <tr>
                    <td>비밀번호 변경</td>
                    <td><input type="text" value=""></td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div>
    <button>수정하기</button>
</div>
</body>
</html>