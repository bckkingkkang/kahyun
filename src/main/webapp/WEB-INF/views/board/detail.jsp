<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 상세</title>
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
            <h1 class="display-4 fw-bolder">Community</h1>
            <p class="lead fw-normal text-white-50 mb-0">회원게시판 <c:choose>
                <c:when test="${boardDetail.boardOption eq 'boardOption1'}">게시판1</c:when>
                <c:when test="${boardDetail.boardOption eq 'boardOption2'}">게시판2</c:when>
                <c:otherwise>그냥게시판</c:otherwise>
            </c:choose></p>
        </div>
    </div>
</header>
<div>
    <c:choose>
        <c:when test="${boardDetail.delete_yn == 'Y'}">
            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>삭제된 게시글입니다.</h3>
                    </div>
                </div>
            </div>
            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <a class="btn btn-outline-dark mt-auto" href="/board/list">목록</a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <h3>${boardDetail.title}</h3>
                    </div>
                </div>
            </div>
            <div class="container">
                <form action="">
                    <div>
                        <table class="table table-borderless">
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${boardDetail.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td>${boardDetail.create_dt}</td>
                            </tr>
                            <c:if test="${boardDetail.update_dt ne null}">
                                <tr>
                                    <th class="text-center">수정일</th>
                                    <td>${boardDetail.update_dt}</td>
                                </tr>
                            </c:if>
                            <tr>
                                <th class="text-center">내용</th>
                                <td>${boardDetail.content}</td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div class="container text-end mb-lg-3">
                    <div>
                        <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/board/list">목록</a>
                        <a class="btn btn-outline-dark mt-auto" id="editBtn" href="/board/edit/${boardDetail.seq}">수정</a>
                        <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                    </div>
                </div>
            </div>

            <div class="bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <div class="text-center text-black">
                        <p class="lead fw-normal text-black-50 mb-0">댓글</p>
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

            <div class="container bg-white py-5">
                <div class="container px-2 px-lg-3 my-3">
                    <c:forEach items="${boardComment}" var="boardComment">
                        <table style="width: 60%; margin: auto" class="table table-borderless mb-3">
                            <tr>
                                <th id="comment_content${boardComment.seq}">${boardComment.content}</th>
                                <th id="comment_editcontent${boardComment.seq}" style="display: none">
                                    <div class="container form-floating mb-3">
                                        <div style="height: 200px; width: 60%; margin: auto" class="form-floating mb-7">
                                            <textarea type="text" style="height: 200px" class="form-control" id="editContent" placeholder="댓글">${boardComment.content}</textarea>
                                            <label for="editContent">댓글</label>
                                        </div>
                                    </div>
                                </th>
                                <%-- 저장 취소 버튼 추가 --%>
                                <td class="text-end">${boardComment.nickname} ${boardComment.create_dt}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-end">
                                    <a class="btn btn-outline-dark" value="${boardComment.seq}" id="editComment${boardComment.seq}" onclick="editComment(${boardComment.seq});">수정</a> <a class="btn btn-outline-dark" id="deleteComment" onclick="deleteComment(${boardComment.seq});">삭제</a>
                                </td>
                            </tr>
                        </table>
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

    $dom.createComment = $("#createComment");
    $dom.deleteBtn = $("#deleteBtn");
    $dom.editBtn = $("#editBtn");


    // 댓글 수정
    function editComment(seq) {
        console.log(seq);
        document.getElementById('comment_content'+seq).style = 'display:none';
        document.getElementById('comment_editcontent'+seq).style = 'display';


    }

    // 댓글 삭제
    function deleteComment(seq) {
        console.log(seq);
        if(confirm("댓글을 삭제하시겠습니까?")) {
            $.ajax({
                url : "/board/delete_comment",
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

    $(function () {


        $dom.createComment.on('click', function () {
            console.log($dom);
            if (confirm("댓글을 등록하시겠습니까")) {
                /* 댓글 등록 */
                $.ajax({
                    url: "/board/create_comment",
                    type: "post",
                    data: {
                        content: $("#content").val(),
                        seq: ${boardDetail.seq}
                    },
                    success: function (result) {
                        if (result === 1) {
                            location.href = seq;
                        } else {
                            alert("다시 시도해주세요");
                        }
                    }
                })
            }

        })

        $dom.deleteBtn.on('click', function () {
            if (confirm("삭제하시겠습니까")) {
                $.ajax({
                    url: "/board/delete_board",
                    type: "post",
                    data: {
                        'seq': seq
                    },
                    success: function (result) {
                        if (result === 1) {
                            alert("삭제되었습니다.");
                            location.href = "/board/list";
                        } else {
                            alert("다시 시도해주세요");
                            return;
                        }

                    }
                })
            }


        })
    })

</script>
</body>
</html>