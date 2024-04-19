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

<table>
<form id="saveForm" enctype="multipart/form-data">
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
                    <input type="hidden" id="removeFileIds" name="removeFileIds" />
                    <div>
                        <div class="file_input">
                            <input type="text" readonly />
                            <label>
                                <input type="file" name="files" id="selectFile" />
                            </label>
                            <button type="button" id="removeFileBtn"><span>삭제</span></button>
                            <button type="button" id="addFileBtn"><span>파일 추가</span></button>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
</form>
</table>
<button type="button" id="saveBtn" class="btns btn_st3 btn_mid">저장</button>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    $(function () {

        $dom.addFileBtn = $("#addFileBtn");
        $dom.removeFileBtn = $("#removeFileBtn");
        $dom.selectFile = $("#selectFile");
        $dom.removeFileIds = $("#removeFileIds");
        $dom.saveBtn = $("#saveBtn");

        // 게시글 저장
        $dom.saveBtn.on('click', function() {
            if(confirm("자료를 등록하시겠습니까?")) {
                $.ajax({
                    url : "create_sboard",
                    type : "post",
                    data : {
                        title : $("#title").val(),
                        content : $("#content").val()
                    },
                    success : function() {
                        location.href = "list";
                    }
                })

                const form = document.getElementById('saveForm');
                const fields = [form.title, form.writer, form.content];
                const fieldNames = ['제목', '이름', '내용'];

                for (let i = 0, len = fields.length; i < len; i++) {
                    isValid(fields[i], fieldNames[i]);
                }

                new URLSearchParams(location.search).forEach((value, key) => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = key;
                    input.value = value;
                    form.append(input);
                })

                document.getElementById('saveBtn').disabled = true;
                form.action = [[ ${post == null} ]] ? '/post/save.do' : '/post/update.do';
                form.submit();
            }

        });


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

        // 파일 선택
        $dom.selectFile.on('click', function(element, id) {
            const file = element.files[0];
            const filename = element.closest('.file_input').firstElementChild;

            // 파일 선택 창에서 취소 버튼이 클릭된 경우
            if(!file) {
                filename.value = '';
                return false;
            }

            // 파일 크기가 10MB를 초과하는 경우
            const fileSize = Math.floor(file.size / 1024 / 1024);
            if(fileSize > 10) {
                alert('10MB 이하의 파일만 업로드 가능합니다.');
                filename.value = '';
                element.value = '';
                return false;
            }

            // 파일명 지정
            filename.value = file.name;
        })


    })


</script>
</html>
