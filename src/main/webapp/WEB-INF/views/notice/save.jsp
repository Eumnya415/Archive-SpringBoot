<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 작성</title>
</head>
<body>
<h1>공지사항 작성</h1>
<form action="/notice/save" method="post">
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}"><br>
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea><br>
    <c:if test="${isAdmin}">
        <label for="pinned">중요</label>
        <input type="checkbox" id="pinned" name="pinned" ${notice.pinned ? 'checked' : ''}><br>
    </c:if>
    <input type="submit" value="공지사항 등록">
</form>
</body>
</html>