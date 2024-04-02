<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<style>
    table {
        border: 2px solid; border-collapse: collapse;
    }
    th, td {
        border: 1px solid; padding:10px 5px;
    }
</style>
<body>
<div>
    <button type="button" onclick=location.href='/board/list' id="listBtn">목록</button>
    <c:if test="${boardDetail.user_seq == userDetail.seq || userDetail.auth == 'ADMIN'}">
        <button type="button" id="deleteBtn">삭제</button>
    </c:if>

</div>
<div>
    <h1>게시판 상세 화면</h1>
</div>
<div>
    <form action="">
    <div>
    <table>
        <tr>
            <td style="width: 100px">제목</td>
            <td style="width: 500px">${boardDetail.title}</td>
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
        <div>
            <table>
                <tr>
                    <td style="width: 100px">댓글</td>
                    <td style="width: 300px"><textarea name="content" id="content" cols="30" rows="5"></textarea></td>
                    <td style="width: 100px"><button type="button" id="createBtn">등록</button></td>
                </tr>
            </table>
        </div>
    </div>


    <div>
        <div>
            <h3>댓글</h3>
        </div>
        <div>
            <c:forEach items="${boardComment}" var="boardComment">
                <div>
                    <table>
                    <tr>
                        <td style="width: 100px">내용</td>
                        <td style="width: 500px">${boardComment.content}</td>
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



<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    const $dom = {};
    const seq = ${boardDetail.seq};

    $(function () {
        $dom.createBtn = $("#createBtn");
        $dom.deleteBtn = $("#deleteBtn");

        $dom.createBtn.on('click', function () {
            console.log($dom);
            if(confirm("댓글을 등록하시겠습니까")) {
                /* 댓글 등록 */
                $.ajax({
                    url : "create_comment_ajax",
                    type : "post",
                    data : {
                        content : $("#content").val(),
                        seq : seq
                    },
                    success : function(result) {
                        if(result===1) {
                            location.href = seq;
                        } else {
                            alert("다시 시도해주세요");
                        }
                    }
                })
            }

        })

        $dom.deleteBtn.on('click', function() {
            if(confirm("삭제하시겠습니까")) {
                $.ajax({
                    url:"delete_board_ajax",
                    type : "post",
                    data : {
                        'seq' : seq
                    },
                    success : function(result) {
                        if(result === 1) {
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