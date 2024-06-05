<%--
  Created by IntelliJ IDEA.
  User: 고가현
  Date: 2024-05-30
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항</title>
</head>
<style>
    tr, td {
        white-space : pre;
    }
</style>
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
                        <a class="btn btn-outline-dark mt-auto" href="/notice_board/list">목록</a>
                    </div>
                </div>
            </header>
        </c:when>
        <c:otherwise>
            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>${selectNoticeBoard.title}</h3>
                    </div>
                </div>
            </div>
            <div class="container form-floating" style="width: 60%; margin: auto">
                <form action="">
                    <div>
                        <table class="table table-borderless">
                            <tr>
                                <th class="text-center">등급</th>
                                <th>${selectNoticeBoard.importance}</th>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${selectNoticeBoard.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
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
                                <td>${selectNoticeBoard.content}</td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div class="container text-end mb-lg-3">
                    <div>
                        <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/notice_board/list">목록</a>
                        <a class="btn btn-outline-dark mt-auto" id="editBtn" href="/notice_board/edit/${selectNoticeBoard.seq}">수정</a>
                        <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                    </div>
                </div>
            </div>

            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <p class="lead fw-normal text-black-50 mb-0">댓글 등록</p>
                    </div>
                </div>
            </div>

            <div class="container mt-lg-5">
                <div>
                    <div>
                        <div>
                            <div class="container form-floating mb-3">
                                <div style="height: 200px; width: 60%; margin: auto" class="form-floating mb-7">
                                    <textarea type="text" style="height: 200px" class="form-control" id="content" placeholder="댓글"></textarea>
                                    <label for="content">댓글</label>
                                </div>
                            </div>

                            <div class="text-center">
                                <div>
                                    <a class="btn btn-outline-dark mt-auto" id="createComment">등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <p class="lead fw-normal text-black-50 mb-0">댓글 목록</p>
                    </div>
                </div>
            </div>

            <div class="container bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <c:forEach items="${NoticeBoardComment}" var="NoticeBoardComment">
                        <div id="NoticeBoardComment${NoticeBoardComment.seq}">
                            <table style="width: 60%; margin: auto" class="table table-borderless mb-3">
                                <tr>
                                    <th id="comment_content${NoticeBoardComment.seq}">${NoticeBoardComment.content}</th>
                                    <c:choose>
                                        <c:when test="${NoticeBoardComment.update_dt eq null}">
                                            <td class="text-end">${NoticeBoardComment.nickname} ${NoticeBoardComment.create_dt}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-end">${eNoticeBoardComment.nickname} 수정됨 ${NoticeBoardComment.update_dt}</td>
                                        </c:otherwise>
                                    </c:choose>

                                </tr>
                                <tr>
                                    <td colspan="2" class="text-end">
                                        <a class="btn btn-outline-dark" value="${NoticeBoardComment.seq}" id="editComment${NoticeBoardComment.seq}" onclick="editComment(${NoticeBoardComment.seq});">수정</a> <a class="btn btn-outline-dark" id="deleteComment" onclick="deleteComment(${NoticeBoardComment.seq});">삭제</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="editNoticeBoardComment${NoticeBoardComment.seq}" style="display: none">
                            <table style="width: 60%; margin: auto" class="table table-borderless">
                                <tr>
                                    <th id="comment_editcontent${NoticeBoardComment.seq}">
                                        <div class="container mb-3">
                                            <div style="height: 200px;" class="form-floating">
                                                <textarea type="text" style="height: 200px" class="form-control" id="editContent${NoticeBoardComment.seq}" placeholder="댓글">${NoticeBoardComment.content}</textarea>
                                                <label for="editContent${NoticeBoardComment.seq}">댓글 수정</label>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <td class="text-end">
                                        <a class="btn btn-outline-dark" onclick="saveEditComment(${NoticeBoardComment.seq});">저장</a> <a class="btn btn-outline-dark" onclick="cancelEdit(${NoticeBoardComment.seq});">취소</a> <a class="btn btn-outline-dark" id="editDeleteComment" onclick="deleteComment(${NoticeBoardComment.seq});">삭제</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/header/footer"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};
    $dom.createBtn = $("#createBtn");
    $dom.deleteBtn = $("#deleteBtn");
    $dom.createComment = $("#createComment");

    // 댓글 수정
    function editComment(seq) {
        document.getElementById('NoticeBoardComment'+seq).style = 'display:none';
        document.getElementById('editNoticeBoardComment'+seq).style = 'display';
    }
    // 댓글 수정 취소
    function cancelEdit(seq) {
        document.getElementById('NoticeBoardComment'+seq).style = 'display';
        document.getElementById('editNoticeBoardComment'+seq).style = 'display:none';
    }

    // 댓글 삭제
    function deleteComment(seq) {
        console.log(seq);
        if(confirm("댓글을 삭제하시겠습니까?")) {
            $.ajax({
                url : "/notice_board/delete_comment",
                type : "post",
                data : { seq : seq},
                success : function (result) {
                    if(result===1) {
                        alert("댓글이 삭제되었습니다.");
                        location.reload();
                    } else {
                        alert("잠시 후 시도해주세요.");
                    }
                }
            })
        }
    }

    /* 수정 댓글 저장 */
    function saveEditComment(seq) {
        if(confirm("댓글을 수정하시겠습니까?")) {
            $.ajax({
                url:"/notice_board/edit_comment",
                type:"post",
                data : {
                    content : document.getElementById('editContent'+seq).value,
                    seq : seq
                },
                success : function(result) {
                    if(result===1) {
                        alert("댓글이 수정되었습니다.");
                        location.reload();
                    } else {
                        alert("잠시 후 시도해주세요.");
                    }
                }
            })
        }
    }

    $(function () {

        $dom.createComment.on('click', function () {
            if($("#content").val() == "") {
                alert("댓글 내용을 입력해주세요.");
                return;
            }
            if (confirm("댓글을 등록하시겠습니까")) {
                /* 댓글 등록 */
                $.ajax({
                    url: "/notice_board/create_comment",
                    type: "post",
                    data: {
                        content: $("#content").val(),
                        seq: ${selectNoticeBoard.seq}
                    },
                    success: function (result) {
                        if (result === 1) {
                            alert("댓글이 등록되었습니다.");
                            location.reload();
                        } else {
                            alert("다시 시도해주세요");
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