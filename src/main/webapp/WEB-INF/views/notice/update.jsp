<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<h1>공지사항 수정</h1>

<!-- 오류 메시지 출력 -->
<c:if test="${not empty errorMessage}">
    <div class="alert alert-warning">
            ${errorMessage}
    </div>
</c:if>

<form action="/notice/update/${notice.id}" method="post" onsubmit="return confirmSubmit();">
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}"><br>
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea><br>
    <label for="pinned">중요</label>
    <input type="radio" id="pinned" name="pinned" value="true" ${notice.pinned ? 'checked' : ''}>
    <label for="normal">일반</label>
    <input type="radio" id="normal" name="pinned" value="false" ${!notice.pinned ? 'checked' : ''}><br>
    <input type="submit" value="공지사항 수정">
</form>

<script>
    function confirmSubmit() {
        var title = document.getElementById('title').value;
        var content = document.getElementById('content').value;

        if (title.trim() === "" || content.trim() === "") {
            alert('제목과 내용은 모두 작성해야 합니다.');
            return false;
        }

        if (confirm('수정하시겠습니까?')) {
            alert('수정되었습니다.');
            return true;
        } else {
            alert('수정이 취소되었습니다.');
            return false;
        }
    }
</script>

</body>
</html>