<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 작성</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<h1>공지사항 작성</h1>
<form action="/notice/create" method="post">
    <label for="title">제목:</label>
    <input type="text" id="title" name="title"><br>
    <label for="content">내용:</label>
    <textarea id="content" name="content"></textarea><br>
    <label for="pinned">중요:</label>
    <input type="checkbox" id="pinned" name="pinned"><br>
    <input type="submit" value="공지사항 등록">
</form>
</body>
</html>