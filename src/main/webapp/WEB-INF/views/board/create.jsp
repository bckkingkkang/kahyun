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
                <h1 class="display-4 fw-bolder">Community</h1>
                <p class="lead fw-normal text-white-50 mb-0">회원 게시판</p>
            </div>
        </div>
    </header>
</div>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">글 등록</p>
        </div>
    </div>
</header>
<div>
    <div class="container">
        <form action="" id="saveForm" method="post">
            <div class="form-floating mb-3">
                <div class="form mb-3">
                    <input type="radio" class="btn-check" name="boardOption" id="boardOption3" value="boardOption3" autocomplete="off" checked>
                    <label class="btn btn-outline-dark mt-auto" for="boardOption3">그냥 게시판</label>

                    <input type="radio" class="btn-check" name="boardOption" id="boardOption1" value="boardOption1" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="boardOption1">게시판 1</label>

                    <input type="radio" class="btn-check" name="boardOption" id="boardOption2" value="boardOption2" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="boardOption2">게시판 2</label>
                </div>

            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="title" placeholder="제목">
                <label for="title">제목</label>
            </div>
            <div style="height: 200px;" class="form-floating mb-7">
                <textarea type="text" style="height: 200px" class="form-control" id="content" placeholder="내용"></textarea>
                <label for="content">내용</label>
            </div>
            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                <div class="card-body p-2 text-center">
                    <button class="btn btn-outline-dark mt-auto" type="submit" id="createBtn">저장</button>
                    <button class="btn btn-outline-dark mt-auto" type="button" onclick="if(confirm('작성을 취소하시겠습니까?')) {location.href='javascript:history.back()'} else return;">목록</button>
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
        $dom.createBtn = $("#createBtn");

        $dom.createBtn.on('click', function () {
            var boardOption = '';
            const option = document.getElementsByName('boardOption');
            option.forEach((e)=>{
                if(e.checked) {
                    boardOption = e.value;
                }
            })

            if ($("#title").val() == "") {
                alert("제목을 입력해주세요");
                return;
            }
            if ($("#content").val() == "") {
                alert("내용을 입력해주세요");
                return;
            }
            if (confirm("글을 저장하시겠습니까?")) {
                $.ajax({
                    url: "/board/create_board",
                    type: "post",
                    data: {
                        title: $("#title").val(),
                        content: $("#content").val(),
                        boardOption: boardOption
                    },
                    success: function () {
                        location.href = "list";
                    }
                })
            }
        })
    })

</script>
</body>
</html>