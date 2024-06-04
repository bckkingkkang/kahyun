<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-06-04
  Time: 오후 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Community</h1>
            <p class="lead fw-normal text-white-50 mb-0">게시글 수정</p>
        </div>
    </div>
</header>
<div>
    <c:choose>
        <c:when test="${boardDetail.delete_yn == 'Y'}">
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>삭제된 게시글입니다.</h3>
                    </div>
                </div>
            </header>
            <header class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <a class="btn btn-outline-dark mt-auto" href="/board/list">목록</a>
                    </div>
                </div>
            </header>
        </c:when>
        <c:otherwise>
            <div class="container mb-3 mt-3">
                <form action="">
                    <div>
                        <table class="table mb-3">
                            <tr>
                                <th class="text-center">제목</th>
                                <td>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="title" placeholder="제목" value="${boardDetail.title}">
                                        <label for="title">제목</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">게시판 선택</th>
                                <td>
                                    <div class="form-floating mb-3">
                                        <div class="form mb-3">
                                            <input type="radio" class="btn-check" name="boardOption" id="boardOption3" value="boardOption3" autocomplete="off" ${boardDetail.boardOption eq 'boardOption3' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="boardOption3">그냥 게시판</label>

                                            <input type="radio" class="btn-check" name="boardOption" id="boardOption1" value="boardOption1" autocomplete="off" ${boardDetail.boardOption eq 'boardOption1' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="boardOption1">게시판 1</label>

                                            <input type="radio" class="btn-check" name="boardOption" id="boardOption2" value="boardOption2" autocomplete="off" ${boardDetail.boardOption eq 'boardOption2' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="boardOption2">게시판 2</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${boardDetail.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">최초 작성일</th>
                                <td>${boardDetail.create_dt}</td>
                            </tr>
                            <tr>
                                <th class="text-center">내용</th>
                                <td>
                                    <div style="height: 200px;" class="form-floating mb-7">
                                        <textarea type="text" style="height: 200px" class="form-control" id="content" placeholder="내용">${boardDetail.content}</textarea>
                                        <label for="content">내용</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div class="text-center mb-3">
                    <div>
                        <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/board/detail/${boardDetail.seq}">취소</a>
                        <a class="btn btn-outline-dark mt-auto" id="editBtn">수정</a>
                        <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                    </div>
                </div>
            </div>

        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/header/footer"></jsp:include>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};

    $dom.editBtn = $("#editBtn");
    $dom.deleteBtn = $("#deleteBtn");

    $(function() {
        $dom.editBtn.on('click', function() {
            var boardOption = '';
            const option = document.getElementsByName('boardOption');
            option.forEach((e)=>{
                if(e.checked) {
                    boardOption = e.value;
                }
            })

            if($("#title").val() == "") {
                alert("제목을 입력해주세요.");
                return;
            }
            if($("#content").val() == "") {
                alert("내용을 입력해주세요.");
                return;
            }

            if(confirm("게시글을 수정합니다.")) {
                $.ajax({
                    url : "/board/edit_board",
                    type : "post",
                    data : {
                        title : $("#title").val(),
                        content : $("#content").val(),
                        boardOption : boardOption,
                        seq : ${boardDetail.seq}
                    },
                    success : function(result) {
                        if(result===1) {
                            alert("게시글이 수정되었습니다.");
                            location.href="/board/detail/${boardDetail.seq}";
                        } else{
                            alert("잠시 후 시도해주세요.");
                        }
                    }
                })
            }
        })

        $dom.deleteBtn.on('click', function() {
            if(confirm("게시글을 삭제합니다.")) {
                $.ajax({
                    url : "/board/delete_board",
                    type : 'post',
                    data : {
                        seq : ${boardDetail.seq}
                    },
                    success : function(result) {
                        if(result===1) {
                            alert("게시글이 삭제되었습니다.");
                            location.href="/board/list";
                        } else {
                            alert("잠시 후 시도해주세요.");
                        }
                    }
                })
            }
        })
    })


</script>
</body>
</html>