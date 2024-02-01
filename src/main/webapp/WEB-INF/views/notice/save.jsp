<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 작성</title>
</head>
<body>
<h1>공지사항 작성</h1>
<form action="/notice/save" method="post" onsubmit="return confirmSubmit();">
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" value="${notice.title}"><br>
    <label for="content">내용:</label>
    <textarea id="content" name="content">${notice.content}</textarea><br>

    <label for="pinned">중요</label>
    <input type="radio" id="pinned" name="pinned" value="true">
    <label for="normal">일반</label>
    <input type="radio" id="normal" name="pinned" value="false" checked><br>

<%--    <label for="pinned">중요</label>--%>
<%--    <input type="radio" id="pinned" name="noticeType" value="pinned" ${notice.pinned ? 'checked' : ''}>--%>
<%--    <label for="normal">일반</label>--%>
<%--    <input type="radio" id="normal" name="noticeType" value="normal" ${!notice.pinned ? 'checked' : ''}><br>--%>
    <input type="submit" value="공지사항 등록">
</form>
<script>
    function confirmSubmit() {
        if (confirm('작성 되었습니다.')) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>