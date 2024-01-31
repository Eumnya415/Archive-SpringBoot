package com.sloop.archive.notice.service;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    private final NoticeMapper noticeMapper;

    public NoticeService(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    public List<NoticeDTO> getAllNoticePinnedFirst() {
        return noticeMapper.getAllNoticePinnedFirst();
    }

    public NoticeDTO getNoticeById(Long id) {
        return noticeMapper.getNoticeById(id);
    }

    public void saveNotice(NoticeDTO notice) {
        noticeMapper.saveNotice(notice);
    }

    public void updateNotice(NoticeDTO notice) {
        noticeMapper.updateNotice(notice);
    }

    public void deleteNotice(Long id) {
        noticeMapper.deleteNotice(id);
    }
}
