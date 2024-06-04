<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시글 상세</title>
</head>
<%--<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>--%>
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
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <h3>${boardDetail.title}</h3>
                </div>
            </div>
        </header>
        <div class="container">
            <form action="">
                <div>
                    <table class="table">
                        <tr>
                            <th class="text-center">작성자</th>
                            <td>${boardDetail.nickname}</td>
                        </tr>
                        <tr>
                            <th class="text-center">작성일</th>
                            <td>${boardDetail.create_dt}</td>
                        </tr>
                        <tr>
                            <th class="text-center">수정일</th>
                            <td>${boardDetail.update_dt}</td>
                        </tr>
                        <tr>
                            <th class="text-center">내용</th>
                            <td>${boardDetail.content}</td>
                        </tr>
                    </table>
                </div>
            </form>

            <div class="text-center">
                <div>
                    <a class="btn btn-outline-dark mt-auto" id="listBtn" href="/board/list">목록</a>
                    <a class="btn btn-outline-dark mt-auto" id="editBtn" href="/board/edit/${boardDetail.seq}">수정</a>
                    <a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a>
                </div>
            </div>
        </div>
        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <p class="lead fw-normal text-black-50 mb-0">댓글 등록</p>
                </div>
            </div>
        </header>
        <div class="container">
            <div>
                <div>
                    <div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="content" placeholder="댓글">
                            <label for="content">댓글</label>
                        </div>
                        <div class="text-center">
                            <div>
                                <a class="btn btn-outline-dark mt-auto" id="createBtn">등록</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <header class="bg-white py-5">
            <div class="container px-2 px-lg-3 my-3">
                <div class="text-center text-black">
                    <p class="lead fw-normal text-black-50 mb-0">댓글</p>
                </div>
            </div>
        </header>
        <div class="container">
            <div>
                <c:forEach items="${boardComment}" var="boardComment">
                    <div>
                        <table class="table table-borderless">
                            <tr>
                                <th class="text-center"<%-- style="width: 100px"--%>>내용</th>
                                <td<%-- style="width: 500px"--%>>${boardComment.content}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성자</th>
                                <td>${boardComment.nickname}</td>
                            </tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td>${boardComment.create_dt}</td>
                            </tr>
                        </table>
                        <br>
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
    const seq = ${boardDetail.seq};

    $(function () {
        $dom.createBtn = $("#createBtn");
        $dom.deleteBtn = $("#deleteBtn");
        $dom.editBtn = $("#editBtn");

        $dom.createBtn.on('click', function () {
            console.log($dom);
            if (confirm("댓글을 등록하시겠습니까")) {
                /* 댓글 등록 */
                $.ajax({
                    url: "/board/create_comment",
                    type: "post",
                    data: {
                        content: $("#content").val(),
                        seq: seq
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