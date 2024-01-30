/**
 * 공지사항 컨트롤러
 */

package com.sloop.archive.notice.controller;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/notice") // URL을 클래스 레벨에서 설정
public class NoticeController {

    private final NoticeService noticeService;

    // 공지사항 목록 조회
    @GetMapping("/list")
    public String getNoticeList(Model model) {
        List<NoticeDTO> noticeList = noticeService.getAllNoticePinnedFirst();
        model.addAttribute("noticeList", noticeList);
        log.info("Notice list with pinned items viewed"); // 로그 기록 추가
        return "list";
    }

    // 공지사항 상세 조회
    @GetMapping("/{id}")
    public String getNotice(@PathVariable Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        log.info("Viewing notice with id: {}", id); // 로그 기록 추가
        return "detail";
    }

    // 공지사항 등록 페이지
    @GetMapping("/create")
    public String createNoticeForm() {
        return "create";
    }

    // 공지사항 등록 처리
    @PostMapping("/create")
    public String createNotice(@ModelAttribute NoticeDTO noticeDTO) {
        noticeService.createNotice(noticeDTO);
        log.info("New notice created: {}", noticeDTO.getTitle()); // 로그 기록 추가
        return "redirect:/notice/list";  // 공지사항 목록으로 리다이렉트
    }

    // 공지사항 수정 페이지
    @GetMapping("/update/{id}")
    public String updateNoticeForm(@PathVariable Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        return "update";
    }

    // 공지사항 수정 처리
    @PostMapping("/update/{id}")
    public String updateNotice(@PathVariable Long id, @ModelAttribute NoticeDTO noticeDTO) {
        noticeService.updateNotice(id, noticeDTO);
        log.info("Notice with id {} updated", id); // 로그 기록 추가
        return "redirect:/notice/list"; // 공지사항 목록으로 리다이렉트
    }

    // 공지사항 삭제 처리
    @PostMapping("/delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        log.info("Notice with id {} deleted", id); // 로그 기록 추가
        return "redirect:/notice/list";  // 공지사항 목록으로 리다이렉트
    }

}
