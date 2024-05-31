<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항</title>
</head>

<body>
<jsp:include page="/header/header"></jsp:include>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">NOTICE</h1>
            <p class="lead fw-normal text-white-50 mb-0">공지사항 수정</p>
        </div>
    </div>
</header>
<div>
    <c:choose>
        <c:when test="${selectNoticeBoard.delete_yn == 'Y'}">
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
                        <a class="btn btn-outline-dark mt-auto" href="javascript:history.back()">뒤로 가기</a>
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
                                        <input type="text" class="form-control" id="title" placeholder="제목" value="${selectNoticeBoard.title}">
                                        <label for="title">제목</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">등급</th>
                                <td>
                                    <div class="form-floating mb-3">
                                        <div class="form mb-3">
                                            <input type="radio" class="btn-check" name="importance" id="A" value="A" autocomplete="off" ${selectNoticeBoard.importance eq 'A' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="A">A 높음</label>

                                            <input type="radio" class="btn-check" name="importance" id="B" value="B" autocomplete="off" ${selectNoticeBoard.importance eq 'B' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="B">B 보통</label>

                                            <input type="radio" class="btn-check" name="importance" id="C" value="C" autocomplete="off" ${selectNoticeBoard.importance eq 'C' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="C">C 낮음</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">노출 게시판</th>
                                <td>
                                    <div class="form-floating mb-3">
                                        <div class="form mb-3">
                                            <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="options" id="option1" autocomplete="off" checked disabled hidden>
                                            <label class="btn btn-outline-dark mt-auto" for="option1">Notice</label>

                                            <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="board_yn" id="board_yn" autocomplete="off" ${selectNoticeBoard.board_yn eq 'Y' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="board_yn">Community Board</label>

                                            <input type="checkbox" class="btn btn-check btn-outline-dark mt-auto" name="file_board_yn" id="file_board_yn" autocomplete="off" ${selectNoticeBoard.file_board_yn eq 'Y' ? 'checked' : ''}>
                                            <label class="btn btn-outline-dark mt-auto" for="file_board_yn">Download Board</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${selectNoticeBoard.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">최초 작성일</th>
                                <td>${selectNoticeBoard.create_dt}</td>
                            </tr>
                            <c:if test="${selectNoticeBoard.update_dt ne null}">
                                <tr>
                                    <th class="text-center">수정일</th>
                                    <td>${selectNoticeBoard.update_dt}</td>
                                </tr>
                            </c:if>
                            <tr>
                                <th class="text-center">내용</th>
                                <td>
                                    <div style="height: 200px;" class="form-floating mb-7">
                                        <textarea type="text" style="height: 200px" class="form-control" id="content" placeholder="내용">${selectNoticeBoard.content}</textarea>
                                        <label for="content">내용</label>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div class="text-center mb-3">
                    <div>
                        <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/notice_board/detail/${selectNoticeBoard.seq}">취소</a>
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

    $(function () {
        $dom.deleteBtn = $("#deleteBtn");
        $dom.editBtn = $("#editBtn");

        $dom.editBtn.on('click', function() {
            console.log(${selectNoticeBoard.seq});
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

            if(confirm("공지사항을 수정합니다.")) {
                $.ajax({
                    url : "/notice_board/edit_notice",
                    type : "post",
                    data : {
                        title : $("#title").val(),
                        content : $("#content").val(),
                        importance : importance,
                        board_yn : board_yn,
                        file_board_yn : file_board_yn,
                        seq : ${selectNoticeBoard.seq},
                    },
                    success : function(result) {
                        if(result == 1) {
                            alert("공지사항이 수정되었습니다.");
                            location.href="/notice_board/detail/${selectNoticeBoard.seq}";
                        } else {
                            alert("잠시 후 시도해주세요");
                        }
                    }
                })
            }
        })
        $dom.deleteBtn.on('click', function() {
            if(confirm("공지사항을 삭제합니다.")) {
                $.ajax({
                    url : "/notice_board/delete_notice",
                    type : "post",
                    data : {
                        seq : ${selectNoticeBoard.seq}
                    },
                    success : function(result) {
                        if(result == 1) {
                            alert("공지사항이 삭제되었습니다.");
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