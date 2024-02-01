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
                var form = document.createElement('form');
                form.method = 'post';
                form.action = '/notice/delete/${noticeDTO.id}';
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>공지사항 상세</h1>
    <div>
        <c:if test="${noticeDTO.pinned}">
            <h2>[중요] ${noticeDTO.title}</h2>
        </c:if>

        <c:if test="${not noticeDTO.pinned}">
            <h2>${noticeDTO.title}</h2>
        </c:if>

        <p>${noticeDTO.registerDate}</p>
        <p>${noticeDTO.content}</p>
        <p>조회수: ${noticeDTO.views}</p>
    </div>

    <div class="buttons">
        <a href="/notice/list">목록</a>
        <a href="${contextPath}/notice/update/${notice.id}">수정</a>
        <button type="button" onclick="confirmDelete()">삭제</button>
    </div>
</div>

</body>
</html>