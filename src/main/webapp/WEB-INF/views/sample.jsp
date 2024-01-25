<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Test Code -->
<h1>Sample Test : board_table</h1>
<table>
    <tr>
        <th>id</th>
        <th>title</th>
        <th>createdTime</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardCreatedTime}</td>
        </tr>
    </c:forEach>
</table>


<!-- 김지원 - 주석 아래로 작성 -->


<!-- 이지연 - 주석 아래로 작성 -->


<!-- 이창규 - 주석 아래로 작성 -->


<!-- 차소영 - 주석 아래로 작성 -->


<!-- 최지혜 - 주석 아래로 작성 -->


</body>
</html>
