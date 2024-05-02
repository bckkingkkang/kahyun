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
    <title>마이페이지</title>
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
    <h1>마이페이지</h1>
</div>
<div>
    <form action="" enctype="multipart/form-data">
        <div>
            <h3>프로필 이미지</h3>
            <table>
                <tr>
                    <td style="width: 120px">
                        <%--<label for="input_image">이미지 선택</label>--%>
                        프로필 이미지
                    </td>
                    <td style="width: 300px">

                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h3>내 정보</h3>
            <table>
                <tr>
                    <td style="width: 120px">이름</td>
                    <td style="width: 300px">${userInfo.username}</td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td>${userInfo.user_id}</td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td>${userInfo.nickname}</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>${userInfo.email}</td>
                </tr>
                <tr>
                    <td>가입일자</td>
                    <td>${userInfo.reg_date}</td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div>
    <a href="edit">수정하기</a>
    <a  href="/admin/admin">관리자페이지</a>
</div>

<jsp:include page="/header/footer"></jsp:include>
</body>
</html>
