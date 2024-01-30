package com.sloop.archive.notice.service;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.mapper.NoticeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;

    @Override
    public List<NoticeDTO> getAllNoticePinnedFirst() {
        return noticeMapper.getAllNoticePinnedFirst();
    }

    @Override
    public NoticeDTO getNoticeById(Long id) {
        return noticeMapper.getNoticeById(id);
    }

    @Override
    public void createNotice(NoticeDTO notice) {
        noticeMapper.insertNotice(notice);
    }

    @Override
    public String updateNotice(Long id, NoticeDTO notice) throws IllegalArgumentException {
        if (!id.equals(notice.getId())) {
            throw new IllegalArgumentException("ID가 올바르지 않습니다.");
        }
        noticeMapper.updateNotice(notice);
        return "수정이 완료되었습니다.";
    }

    @Override
    public void deleteNotice(Long id) {
        noticeMapper.deleteNotice(id);
    }

}
