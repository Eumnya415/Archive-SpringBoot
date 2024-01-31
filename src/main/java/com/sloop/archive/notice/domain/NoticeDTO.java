package com.sloop.archive.notice.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class NoticeDTO implements Comparable<NoticeDTO>{
    private Long id;                   // 공지사항 아이디
    private Long userId;               // 공지사항 작성자 아이디
    private String title;              // 공지사항 제목
    private String content;            // 공지사항 내용 (text)
    private int views;                 // 공지사항 조회수
    private Date registerDate;    // 공지사항 등록 일시
    private Boolean pinned;            // 공지사항 상단 고정 여부. 고정 1, 기본값 0
    private Boolean updateFlag;        // 공지사항 수정 여부. 수정 1, 수정없음 0
    private Date update_date;      // 공지사항 수정 일시
    private Long updateUserId;         // 공지사항 수정자 아이디
    private Boolean deleteFlag;        // 공지사항 삭제 여부. 삭제 1, 삭제없음 0
    private Date deleteDate;      // 공지사항 삭제 일시

    // 중요 여부에 따라 정렬을 위한 compareTo() 메서드 구현
    public int compareTo(NoticeDTO other) {
        if (this.pinned && !other.pinned) {
            return -1; // this가 중요글, other가 중요글이 아닌 경우 this를 앞으로 정렬
        } else if (!this.pinned && other.pinned) {
            return 1; // this가 중요글이 아니고, other가 중요글인 경우 other를 앞으로 정렬
        } else {
            return 0; // 두 글 모두 중요글이거나 중요글이 아닌 경우 정렬하지 않음
        }
    }
}
