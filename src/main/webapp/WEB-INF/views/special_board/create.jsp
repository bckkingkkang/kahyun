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
<body>
<jsp:include page="/header/header"></jsp:include>
<div>
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Special Board</h1>
                <p class="lead fw-normal text-white-50 mb-0">특별회원(자료 등록) 게시판</p>
            </div>
        </div>
    </header>
</div>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">자료 등록</p>
        </div>
    </div>
</header>
<div>
    <div class="container">
        <form id="fileUploadFormMulti" action="/special_board/fileForm" method="post" enctype="multipart/form-data">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목">
                <label for="title">제목</label>
            </div>
            <div style="height: 200px;" class="form-floating mb-3">
                <textarea type="text" style="height: 200px" class="form-control" name="content" id="content" placeholder="내용"></textarea>
                <label for="content">내용</label>
            </div>

            <div class="form-floating mb-3 file_list">
                <div>
                    <div class="form-control file_input">
                        <label>
                            <input class="form-control" type="file" name="uploadFileMulti" multiple="multiple" id="uploadFileMulti"/>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="number" min="1000" step="1000" class="form-control" id="price" name="price" placeholder="가격">
                <label for="price">가격 (원)</label>
            </div>

            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="card-body p-2 text-center">
                    <button class="btn btn-outline-dark mt-auto" type="submit" id="saveBtn">저장</button>
                    <button class="btn btn-outline-dark mt-auto" type="button" onclick="if(confirm('작성을 취소하시겠습니까?')) {location.href='/special_board/list'} else return;">목록</button>
                </div>
            </div>

        </form>
    </div>
</div>

<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    $(function () {

        $dom.addFileBtn = $("#addFileBtn");
        $dom.removeFileBtn = $("#removeFileBtn");
        $dom.selectFile = $("#selectFile");
        $dom.saveBtn = $("#saveBtn");

        /*$dom.saveBtn.on('click', function() {
            if(confirm('글을 저장')) {
                $.ajax({
                    url : "/special_board/fileUploadMultiple",
                    type : "post",
                    enctype : "multipart/form-data",
                    success : function () {
                        location.href = "list"
                    }
                })
            }
        })*/

        // 파일 추가 버튼 클릭 시 function
        $dom.addFileBtn.on('click', function() {
            const fileDiv = document.createElement('div');
            fileDiv.innerHTML = `
            <div class="file_input">
                <input type="text" readonly />
                <label>
                    <input type="file" name="uploadFileMulti" multiple="multiple" id="uploadFileMulti"/>
                </label>
                <button type="button" id="removeFileBtn"><span>삭제</span></button>
        `;
            document.querySelector('.file_list').appendChild(fileDiv);
        })



    })


</script>
</body>
</html>
