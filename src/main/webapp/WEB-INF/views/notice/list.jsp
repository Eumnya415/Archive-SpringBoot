<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<h1>공지사항 목록</h1>
<c:forEach items="${noticeList}" var="notice">
    <div class="${notice.pinned ? 'pinned' : 'normal'}">
        <a href="/notice/${notice.id}">
            <c:if test="${notice.pinned}">
                [중요]
            </c:if>
                ${notice.title}
        </a> - 조회수: ${notice.views}
    </div>
</c:forEach>
</body>
</html>