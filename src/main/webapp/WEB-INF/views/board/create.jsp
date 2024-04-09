<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 작성</title>
</head>
<body>
<div>글쓰기화면</div>

<form action="" enctype="multipart/form-data" id="saveForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" placeholder="제목을 입력해주세요" id="title"></td>
        </tr>
        <tr>
            <td>게시판</td>
            <td><select name="" id="boardOption">
                <option value="boardOption1" default>그냥게시판</option>
                <option value="boardOption2">게시판1</option>
                <option value="boardOption3">게시판2</option>
            </select></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="30" rows="10" placeholder="내용을 입력해주세요" id="content"></textarea></td>
        </tr>
    </table>
</form>
    <div>
        <button type="submit" id="createBtn">저장</button>
        <button type="button" onclick="if(confirm('작성을 취소하시겠습니까?')) {location.href='list'} else return;">목록</button>
    </div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    const $dom = {};

    $(function () {
        $dom.createBtn = $("#createBtn");
        /*$dom.title = $("#title").val();
        $dom.content = $("#content").val();*/


        $dom.createBtn.on('click', function() {
            if($("#title").val() == "") {
                alert("제목을 입력해주세요");
                return;
            }
            if($("#content").val() == "") {
                alert("내용을 입력해주세요");
                return;
            }
            if(confirm("글을 저장하시겠습니까?")) {
                $.ajax({
                    url : "create_board_ajax",
                    type : "post",
                    data : {
                        title : $("#title").val(),
                        content : $("#content").val(),
                        boardOption : $("#boardOption").val()
                    },
                    success : function () {
                        location.href = "list";
                    }
                })
            }
        })


    })





</script>
</body>
</html>