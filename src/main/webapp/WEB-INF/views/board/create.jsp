<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div>글쓰기화면</div>

<form action="">
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" placeholder="제목을 입력해주세요"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea></td>
        </tr>
    </table>
</form>
    <div>
        <button type="submit">저장</button>
        <button type="button" onclick="if(confirm('작성을 취소하시겠습니까?')) {location.href='list'} else return;">목록</button>
    </div>
<script>

</script>
</body>
</html>