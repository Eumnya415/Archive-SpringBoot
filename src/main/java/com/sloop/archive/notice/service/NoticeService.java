package com.sloop.archive.notice.service;

import com.sloop.archive.notice.domain.NoticeDTO;

import java.util.List;

public interface NoticeService {
    List<NoticeDTO> getAllNoticePinnedFirst();
    NoticeDTO getNoticeById(Long id);
    void createNotice(NoticeDTO notice);
    String updateNotice(Long id, NoticeDTO notice);
    void deleteNotice(Long id);
}
