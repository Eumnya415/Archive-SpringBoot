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

<form action="/notice/update/${notice.id}" method="post">
    <input type="hidden" name="_method" value="put" /> <!-- Spring에서 PUT 메소드 사용 -->
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}"><br>
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea><br>
    <label for="pinned">중요</label>
    <input type="checkbox" id="pinned" name="pinned" ${notice.pinned ? 'checked' : ''}><br>
    <input type="submit" value="공지사항 수정">
</form>
</body>
</html>