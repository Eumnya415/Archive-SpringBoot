<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아카이브</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/inc/css/reset.css">
    <link rel="stylesheet" href="/inc/css/admin.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>
    <script src="/inc/js/admin.js"></script>
</head>
<body>
<div id="wrap" class="page05_1">
    <div class="header">
        <div class="inner">
            <a href="javascript:;">
                <img src="/images/admin/logo.png" alt="아카이브">
            </a>
            <div class="select-wrap">
                <button type="button" class="select-btn">고길동</button>
                <div class="select-list">
                    <a href="javascript:;">비밀번호 변경</a>
                    <a href="javascript:;">로그아웃</a>
                </div>
            </div>
        </div>
        <div class="nav">
            <div class="inner">
                <ul class="nav-list">
                    <li>
                        <a href="javascript:;">콘텐츠 관리</a>
                    </li>
                    <li>
                        <a href="javascript:;">카테고리 관리</a>
                        <div class="depth2">
                            <ul class="inner">
                                <li>
                                    <a href="javascript:;">카테고리 관리</a>
                                </li>
                                <li>
                                    <a href="javascript:;">내부용 출처 관리</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:;">통계 관리</a>
                    </li>
                    <li>
                        <a href="javascript:;">사용자 관리</a>
                    </li>
                    <li>
                        <a href="javascript:;">서비스 관리</a>
                        <div class="depth2">
                            <ul class="inner">
                                <li>
                                    <a href="javascript:;">공지사항</a>
                                </li>
                                <li>
                                    <a href="javascript:;">추천 관리</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>



    <div class="container">
        <div class="inner">
            <div class="table-cnt">
                <div class="search-wrap">
                    <form action="/notice/search" method="get">
                        <input type="text" name="keyword">
                        <button class="btn">검색</button>
                    </form>
                </div>
                <div class="table-type01">
                    <div class="table-top">
                        <div class="select-box">
                            <span>총 <em>${totalPostCount}</em>개의 게시물이 있습니다.</span>
                        </div>
                        <div class="btn-wrap">
                            <button type="button" class="pop-btn btn w90" onclick="location.href='/notice/saveForm'">등록</button>
                        </div>
                    </div>
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="70%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>

                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${noticeList}" var="notice">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${notice.pinned}">
                                            <strong>중요</strong>
                                        </c:when>
                                        <c:otherwise>
                                            ${notice.id}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:if test="${notice.pinned}">
                                        <strong>[중요]</strong>
                                    </c:if>
                                    <a href="/notice/view/${notice.id}">${notice.title}</a>
                                </td>
                                <td>${notice.registerDate}</td>
                                <td>${notice.views}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="paging-wrap">
                        <c:choose>
                            <c:when test="${not empty keyword}">
                                <a href="/notice/search?keyword=${keyword}&page=1" class="first"></a>
                                <a href="/notice/search?keyword=${keyword}&page=${currentPage - 1 > 0 ? currentPage - 1 : 1}" class="prev"></a>
                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                    <a href="/notice/search?keyword=${keyword}&page=${loop.index}" class="page ${loop.index == currentPage ? 'active' : ''}">
                                        <span>${loop.index}</span>
                                    </a>
                                </c:forEach>
                                <a href="/notice/search?keyword=${keyword}&page=${currentPage + 1 <= totalPages ? currentPage + 1 : totalPages}" class="next"></a>
                                <a href="/notice/search?keyword=${keyword}&page=${totalPages}" class="last"></a>
                            </c:when>
                            <c:otherwise>
                                <a href="/notice/list?page=1" class="first"></a>
                                <a href="/notice/list?page=${currentPage - 1 > 0 ? currentPage - 1 : 1}" class="prev"></a>
                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                    <a href="/notice/list?page=${loop.index}" class="page ${loop.index == currentPage ? 'active' : ''}">
                                        <span>${loop.index}</span>
                                    </a>
                                </c:forEach>
                                <a href="/notice/list?page=${currentPage + 1 <= totalPages ? currentPage + 1 : totalPages}" class="next"></a>
                                <a href="/notice/list?page=${totalPages}" class="last"></a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
