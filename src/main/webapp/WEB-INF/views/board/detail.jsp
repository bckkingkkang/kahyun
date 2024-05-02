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
            <p class="lead fw-normal text-white-50 mb-0">회원 게시판</p>
        </div>
    </div>
</header>

<div>

    <c:if test="${boardDetail.status == 'D'}">
        <h3>삭제된 게시글입니다.</h3>
    </c:if>
</div>
<div>
    <form action="">
    <div>
    <table class="table">
        <tr>
            <td>제목</td>
            <td>${boardDetail.title}</td>
        </tr>
        <tr>
            <td>게시판</td>
            <td><c:choose>
                <c:when test="${boardDetail.boardOption eq 'boardOption1'}">게시판1</c:when>
                <c:when test="${boardDetail.boardOption eq 'boardOption2'}">게시판2</c:when>
                <c:otherwise>그냥게시판</c:otherwise>
            </c:choose></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${boardDetail.nickname}</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td>${boardDetail.create_dt}</td>
        </tr>
        <tr>
            <td>수정일</td>
            <td>${boardDetail.update_dt}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td>${boardDetail.content}</td>
        </tr>
    </table>
    </div>
    </form>

    <div>
        <table>
            <tr>
                <div>
                    <%--<button type="button" onclick=location.href='/board/list' id="listBtn">목록</button>--%>
                    <td><div class="text-center"><a class="btn btn-outline-dark mt-auto" id="listBtn" href="/board/list">목록</a></div></td>
                </div>
                <div>
                    <c:if test="${boardDetail.user_seq == (userDetail.seq || userDetail.auth == 'ADMIN') && boardDetail.status != 'D'}">
                        <%--<button type="button" id="deleteBtn">삭제</button>--%>
                        <td><div class="text-center"><a class="btn btn-outline-dark mt-auto" id="deleteBtn">삭제</a></div></td>
                    </c:if>
                </div>
            </tr>
        </table>
    </div>
</div>
<header class="bg-white py-5">
    <div class="container px-2 px-lg-3 my-3">
        <div class="text-center text-black">
            <p class="lead fw-normal text-black-50 mb-0">댓글</p>
        </div>
    </div>
</header>
<div>
    <div>
        <div>
            <div>
                <table class="table">
                    <tr>
                        <form action="">
                            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                            <td>댓글</td>
                            <td>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="content" placeholder="댓글 남기기">
                                    <label for="content">댓글</label>
                                </div>
                            </td>
                            <%--<td><button type="button" id="createBtn" class="accordion-button">등록</button></td>--%>
                            <td><div class="text-center"><a class="btn btn-outline-dark mt-auto" id="createBtn">등록</a></div></td>
                        </form>
                    </tr>
                </table>
                <br>
            </div>
        </div>
        <div>
            <c:forEach items="${boardComment}" var="boardComment">
                <div>
                    <table class="table">
                    <tr>
                        <td<%-- style="width: 100px"--%>>내용</td>
                        <td<%-- style="width: 500px"--%>>${boardComment.content}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td>${boardComment.nickname}</td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td>${boardComment.create_dt}</td>
                    </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
    </div>

</div>
<jsp:include page="/header/footer"></jsp:include>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};
    const seq = ${boardDetail.seq};

    $(function () {
        $dom.createBtn = $("#createBtn");
        $dom.deleteBtn = $("#deleteBtn");

        $dom.createBtn.on('click', function () {
            console.log($dom);
            if (confirm("댓글을 등록하시겠습니까")) {
                /* 댓글 등록 */
                $.ajax({
                    url: "create_comment_ajax",
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
                    url: "delete_board_ajax",
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