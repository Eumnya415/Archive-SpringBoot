<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script type="text/javascript">
        function confirmDelete() {
            if (confirm('삭제하시겠습니까?')) {
                // 삭제 로직을 수행하는 서버 사이드 URL로 POST 요청을 보내야 함
                // JavaScript를 사용하여 폼을 생성하고 제출하는 방식
                var form = document.createElement('form');
                form.method = 'post';
                form.action = '/notice/delete/${notice.id}';
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</head>
<body>
<h1>공지사항 상세</h1>
<div>
    <c:if test="${notice.pinned}">
        <h2>[중요] ${notice.title}</h2>
    </c:if>
    <c:if test="${not notice.pinned}">
        <h2>${notice.title}</h2>
    </c:if>
    <p><fmt:formatDate value="${notice.registDate}" pattern="yyyy.MM.dd." /></p>
    <p>${notice.content}</p>
    <p>조회수: ${notice.views}</p>
</div>

<div style="text-align: center;">
    <a href="/notice/list">목록</a>
    <c:if test="${isAdmin}">
        <a href="/notice/update/${notice.id}">수정</a>
        <button type="button" onclick="confirmDelete()">삭제</button>
    </c:if>
</div>

</body>
</html>