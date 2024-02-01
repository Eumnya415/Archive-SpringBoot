package com.sloop.archive.notice.service;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
public class NoticeService {

    private final NoticeMapper noticeMapper;

    @Autowired
    public NoticeService(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    public List<NoticeDTO> getNoticeList(int start, int pageSize) {
        List<NoticeDTO> pinnedNotices = noticeMapper.getNoticesPinned();
        List<NoticeDTO> notices = noticeMapper.getNoticeList(start, pageSize);
        notices.removeAll(pinnedNotices);
        pinnedNotices.addAll(notices);
        return pinnedNotices;
    }

    public List<NoticeDTO> getAllNoticePinnedFirst(int start, int pageSize) {
        List<NoticeDTO> noticeList = noticeMapper.getAllNoticePinnedFirst(start, pageSize);
        Collections.sort(noticeList); // 중요 여부에 따라 정렬
        return noticeList;
    }

    public List<NoticeDTO> getNoticePinnedFirst(int start, int pageSize) {
        List<NoticeDTO> noticeList = noticeMapper.getNoticePinnedFirst(start, pageSize);
        Collections.sort(noticeList); // 중요 여부에 따라 정렬
        return noticeList;
    }

    public int getTotalCount() {
        return noticeMapper.getTotalCount();
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

    @Transactional
    public NoticeDTO getNoticeAndUpdateViews(Long id) {
        noticeMapper.increaseViews(id);
        return noticeMapper.getNoticeById(id);
    }

}
