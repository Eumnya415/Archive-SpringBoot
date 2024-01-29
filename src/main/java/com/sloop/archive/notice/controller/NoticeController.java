package com.sloop.archive.notice.controller;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;
import org.eclipse.tags.shaded.org.apache.bcel.generic.RETURN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice") // URL을 클래스 레벨에서 설정
public class NoticeController {

    private final NoticeService noticeService;

    // 공지사항 목록 조회
    @GetMapping("/list")
    public String getNoticeList(Model model) {
        List<NoticeDTO> noticeList = noticeService.getAllNotice();
        model.addAttribute("noticeList", noticeList);
        return "list";
    }

    // 공지사항 상세 조회
    @GetMapping("/{id}")
    public String getNotice(@PathVariable Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
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
        return "redirect:/notice/list"; // 공지사항 목록으로 리다이렉트
    }

    // 공지사항 삭제 처리
    @PostMapping("/delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        return "redirect:/notice/list";  // 공지사항 목록으로 리다이렉트
    }



//    @RequestMapping("/notice/list")
//    public String noticeHome(Model model){
//        List<NoticeDTO> noticeList = noticeService.getAllNoticeList();
//        model.addAttribute("noticeList", noticeList);
//        return "notice";
//    }
}
