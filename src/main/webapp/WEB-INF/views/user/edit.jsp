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
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <h3 class="display-4 fw-bolder">내 정보 수정</h3>
        </div>
    </div>
</header>
<div>
    <form action="" enctype="multipart/form-data">
        <div>
            <table class="table text-center">
                <tr>
                    <td rowspan="5" width="35%">
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
                    <td><input type="text" value="${userInfo.nickname}"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${userInfo.email}</td>
                </tr>
                <tr>
                    <td rowspan="3">
                        <input type="file" name="uploadProfileImage" multiple="multiple" id="uploadProfileImage"/>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><a class="btn btn-outline-dark mt-auto">비밀번호 변경하기</a></td>
                </tr>
            </table>
        </div>
    </form>
</div>

<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center">
            <a class="btn btn-outline-dark mt-auto" href="mypage">뒤로 가기</a>
            <a type="submit" class="btn btn-outline-dark mt-auto">수정하기</a>
        </div>
    </div>
</div>

<jsp:include page="/header/footer"></jsp:include>
</body>
</html>
