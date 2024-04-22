<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-04-09
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 작성</title>
</head>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<body>
<jsp:include page="/header/header"></jsp:include>
    <h2>글 쓰기 화면</h2>


<form id="saveForm" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>제목</td>
            <td><label for="title"></label>
                <input type="text" id="title"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="30" rows="10" placeholder="내용을 입력해주세요" id="content"></textarea></td>
        </tr>
        <tr>
            <td>파일</td>
            <td>
                <div class="file_list">
                    <div>
                        <div class="file_input">
                            <input type="text" readonly />
                            <label>
                                <input type="file" name="files" multiple="multiple" id="files"/>
                            </label>
                            <button type="button" id="removeFileBtn">삭제</button>
                            <button type="button" id="addFileBtn">파일 추가</button>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
</table>
<button type="button" id="saveBtn">저장</button>
</form>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    $(function () {

        $dom.addFileBtn = $("#addFileBtn");
        $dom.removeFileBtn = $("#removeFileBtn");
        $dom.selectFile = $("#selectFile");
        $dom.saveBtn = $("#saveBtn");

        $dom.saveBtn.on('click', function() {
            console.log($("#title").val());
            console.log($("#content").val());
            console.log($("#files"));
            if(confirm()) {
                $.ajax({
                    url: "create_sboard_detail",
                    type: "post",
                    data: {
                        title: $("#title").val(),
                        content: $("#content").val(),
                        files : $("#files").val()
                    },
                    success: function () {

                    }
                })
            }
        })

        // 파일 추가 버튼 클릭 시 function
        $dom.addFileBtn.on('click', function() {
            const fileDiv = document.createElement('div');
            fileDiv.innerHTML = `
            <div class="file_input">
                <input type="text" readonly />
                <label>
                    <input type="file" name="files" id="selectFileBtn" />
                </label>
                <button type="button" id="removeFileBtn"><span>삭제</span></button>
        `;
            document.querySelector('.file_list').appendChild(fileDiv);
        })



    })


</script>
</html>
