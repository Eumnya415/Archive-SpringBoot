<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .buttons {
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
        function confirmDelete() {
            if (confirm('삭제하시겠습니까?')) {
                alert('삭제되었습니다.');
                var form = document.createElement('form');
                form.method = 'post';
                form.action = "/notice/delete/${notice.id}";
                document.body.appendChild(form);
                form.submit();
            } else {
                alert('삭제가 취소되었습니다.');
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>공지사항 상세</h1>
    <div>
        <c:if test="${notice.pinned}">
            <h2>[중요] ${notice.title}</h2>
        </c:if>

        <c:if test="${not notice.pinned}">
            <h2>${notice.title}</h2>
        </c:if>

        <p>${notice.registerDate}</p>
        <p>${notice.content}</p>
        <p>조회수: ${notice.views}</p>
    </div>

    <div class="buttons">
        <a href="/notice/list">목록</a>
        <a href="${contextPath}/notice/update/${notice.id}">수정</a>
        <button type="button" onclick="confirmDelete()">삭제</button>
    </div>
</div>

</body>
</html>