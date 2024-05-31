<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-05-28
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Notice</h1>
            <p class="lead fw-normal text-white-50 mb-0">공지사항</p>
        </div>
    </div>
</header>
<div class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">공지사항 등록</p>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <form action="" id="saveForm" method="post">
            <%--<div class="form-floating mb-3">
                중요도 :
                <select name="importance" id="importance">
                    <option value="A" default>A 높음</option>
                    <option value="B">B 보통</option>
                    <option value="C">C 낮음</option>
                </select>
            </div>--%>
            <div class="form-floating mb-3">
                <div class="form mb-3">
                    <input type="radio" class="btn-check" name="importance" id="A" value="A" autocomplete="off" checked>
                    <label class="btn btn-outline-dark mt-auto" for="A">A 높음</label>

                    <input type="radio" class="btn-check" name="importance" id="B" value="B" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="B">B 보통</label>

                    <input type="radio" class="btn-check" name="importance" id="C" value="C" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="C">C 낮음</label>
                </div>
                <div class="form mb-3">
                    <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="options" id="option1" autocomplete="off" checked disabled hidden>
                    <label class="btn btn-outline-dark mt-auto" for="option1">Notice</label>

                    <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="board_yn" id="board_yn" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="board_yn">Community Board</label>

                    <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="file_board_yn" id="file_board_yn" autocomplete="off">
                    <label class="btn btn-outline-dark mt-auto" for="file_board_yn">Download Board</label>

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
                    <button class="btn btn-outline-dark mt-auto" type="button" id="createBtn">저장</button>
                    <button class="btn btn-outline-dark mt-auto" type="button" onclick="if(confirm('작성을 취소하시겠습니까?')) {location.href='list'} else return;">목록</button>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {}



    $(function() {
        $dom.createBtn = $("#createBtn");

        $dom.createBtn.on('click', function() {
            var importance = '';
            var board_yn = '';
            var file_board_yn = '';

            const impor = document.getElementsByName('importance');
            impor.forEach((imp)=>{
                if(imp.checked) {
                    importance = imp.value;
                }
            })

            if($("#board_yn").prop("checked")) {
                 board_yn = 'Y';
            } else {
                 board_yn = 'N';
            }
            if($("#board_yn").prop("checked")) {
                file_board_yn = 'Y';
            } else {
                file_board_yn = 'N';
            }

            if($("#title").val() == "") {
                alert("제목을 입력해주세요.");
                return;
            }
            if($("#content").val() == "") {
                alert("내용을 입력해주세요.");
                return;
            }

            if(confirm("공지사항을 등록합니다.")) {
                $.ajax({
                    url : "create_notice",
                    type : "post",
                    data : {
                        title : $("#title").val(),
                        content : $("#content").val(),
                        importance : importance,
                        board_yn : board_yn,
                        file_board_yn : file_board_yn
                    },
                    success : function(result) {
                        if(result == 1) {
                            alert("글이 저장되었습니다.");
                            location.href="/notice_board/list";
                        } else {
                            alert("잠시 후 시도해주세요");
                        }
                    }
                })
            }
        })
    })

</script>
</body>
</html>
