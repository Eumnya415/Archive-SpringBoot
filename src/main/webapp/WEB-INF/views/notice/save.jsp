<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아카이브</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../inc/css/reset.css">
    <link rel="stylesheet" href="../inc/css/admin.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js" integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A=" crossorigin="anonymous"></script>
    <script src="../inc/js/admin.js"></script>

    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/translations/ko.js"></script>

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
                        <span class="table-tit">공지사항 등록</span>
                        <form action="/notice/save" method="post" onsubmit="return submitForm();">
                        <div class="btn-wrap">
                            <button type="button" class="btn w90" onclick="resetForm()">초기화</button>
                            <button type="submit" class="btn w90">작성</button>
                            <button type="button" class="btn w90" onclick="moveToNoticeList()">목록</button>
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
                    <span>
                      <em>＊</em>구분
                    </span>
                            </th>
                            <td>
                                <input type="radio" id="pinned" name="pinned" value="true">
                                <label for="pinned">중요</label>
                                <input type="radio" id="normal" name="pinned" value="false" checked>
                                <label for="normal">일반</label>
                                <label>중요 버튼을 누르면 공지사항 게시판 목록 상단에 고정됩니다.</label>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                    <span>
                      <em>＊</em>제목
                    </span>
                            </th>
                            <td>
                                <input type="text" id="title" name="title" value="${notice.title}">
                            </td>
                        </tr>

                        <tr>
                            <th colspan="2">
                    <span>
                      <em>＊</em>내용
                    </span>
                            </th>
                            <td>
                                <textarea id="content" name="content">${notice.content}</textarea>
                            </td>
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

    ClassicEditor.create( document.querySelector( '#content' ), {

        language: "ko"
    } );

</script>

<script>
        function submitForm() {
            var title = document.getElementById('title').value;
            var content = document.getElementById('content').value;

            if (title.trim() === "" || content.trim() === "") {
                alert('제목과 내용은 모두 작성해야 합니다.');
                return false;
            }

            if (confirm('등록하시겠습니까?')) {
                alert('등록되었습니다.');
                return true;
            } else {
                alert('등록이 취소되었습니다.');
                return false;
            }
        }

    function resetForm() {
        if(confirm('내용을 초기화하시겠습니까?')) {
            document.getElementById('title').value = '';
            document.getElementById('content').value = '';
            document.getElementById('normal').checked = true;
            alert('초기화되었습니다.');
        } else {
            alert('초기화가 취소되었습니다.');
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