<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아카이브</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="${contextPath}/inc/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/inc/css/admin.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>
    <script src="${contextPath}/inc/js/admin.js"></script>
</head>

<body>
<%-- 네비게이션 바 --%>
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
    <%-- 네비게이션 바 종료 --%>

<div class="container">
    <div class="inner">
        <div class="table-cnt">
            <div class="table-type02">
                <div class="table-top">
                    <span class="table-tit">공지사항 내용 보기</span>
                    <form action="${contextPath}/notice/update/${notice.id}" method="post" onsubmit="return submitForm();">
                    <div class="btn-wrap">
                        <button type="button" class="btn w90" onclick="moveToNoticeList()">목록</button>
                        <button type="button" class="btn w90" onclick="location.href='${contextPath}/notice/update/${notice.id}'">수정</button>
                        <button type="button" class="btn w90" onclick="confirmDelete()">삭제</button>
                    </div>
                </div>

                <table>
                    <colgroup>
                        <col width="6%">
                        <col width="9%">
                        <col width="*">
                    </colgroup>

                    <tbody>
                    <tr>
                        <th colspan="2">
                            <span><em>＊</em>구분</span>
                        </th>
                        <td>
                            <c:choose>
                                <c:when test="${notice.pinned}">중요</c:when>
                                <c:otherwise>일반</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <span><em>＊</em>제목</span>
                        </th>
                        <td>${notice.title}</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <span><em>＊</em>등록일</span>
                        </th>
                        <td>${notice.registerDate}</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <span><em>＊</em>조회수</span>
                        </th>
                        <td>${notice.views}</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <span><em>＊</em>내용</span>
                        </th>
                        <td>${notice.content}</td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
    </div>
</div>

</div>


<script>
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

                    function moveToNoticeList() {
                        if(confirm('목록 페이지로 이동하시겠습니까?')) {
                            alert('목록 페이지로 이동합니다.');
                            location.href='/notice/list';
                        } else {
                            alert('취소되었습니다.');
                        }
                    }
                </script>
</body>
</html>