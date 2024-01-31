package com.sloop.archive.notice.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString

/**
 * 공지사항 DTO
 */

public class NoticeDTO {
    private Long id;                   // 공지사항 아이디
    private Long userId;               // 공지사항 작성자 아이디
    private String title;              // 공지사항 제목
    private String content;            // 공지사항 내용 (text)
    private int views;                 // 공지사항 조회수
    private Timestamp registerDate;      // 공지사항 등록 일시
    private Boolean pinned;            // 공지사항 상단 고정 여부. 고정 1, 기본값 0
    private Boolean updateFlag;        // 공지사항 수정 여부. 수정 1, 수정없음 0
    private Timestamp updateDate;      // 공지사항 수정 일시
    private Long updateUserId;         // 공지사항 수정자 아이디
    private Boolean deleteFlag;        // 공지사항 삭제 여부. 삭제 1, 삭제없음 0
    private Timestamp deleteDate;      // 공지사항 삭제 일시
}
