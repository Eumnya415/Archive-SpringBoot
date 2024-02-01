/**
 * 공지사항 컨트롤러
 */

package com.sloop.archive.notice.controller;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/notice") // URL을 클래스 레벨에서 설정
public class NoticeController {

    private final NoticeService noticeService;

    @GetMapping("/list")
    public String getAllNoticePinnedFirst(Model model, @RequestParam(defaultValue = "1") int page) {
        int pageSize = 10; // 페이지 당 게시글 수
        int totalCount = noticeService.getTotalCount(); // 전체 게시글 수

        // 페이징 처리를 위한 계산
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }
        int start = (page - 1) * pageSize;

        List<NoticeDTO> noticeList = noticeService.getNoticeList(start, pageSize);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPostCount", totalCount); // 총 게시물 수 추가

        log.info("공지사항 목록 조회"); // 로그 기록 추가
        return "notice/list";
    }
    @GetMapping("/get/{id}")
    public String getNoticeById(@PathVariable("id") Long id, Model model) {
        model.addAttribute("notice", noticeService.getNoticeById(id));
        log.info("공지사항 상세 조회"); // 로그 기록 추가
        return "notice/view";
    }
    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeAndUpdateViews(id);
        model.addAttribute("notice", notice);
        return "notice/view";
    }
    @GetMapping("/saveForm")
    public String showNoticeForm(Model model) {
        model.addAttribute("notice", new NoticeDTO());
        return "notice/save";
    }

    @PostMapping("/save")
    public String saveNotice(@ModelAttribute NoticeDTO noticeDTO) {
        noticeService.saveNotice(noticeDTO);
        log.info("공지사항 등록"); // 로그 기록 추가
        return "redirect:/notice/list";
    }

    @GetMapping("/update/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("notice", noticeService.getNoticeById(id));
        return "notice/update";
    }

    @PostMapping("/update/{id}")
    public String updateNotice(@ModelAttribute NoticeDTO noticeDTO, @PathVariable("id") Long id) {
        noticeDTO.setId(id);
        noticeService.updateNotice(noticeDTO);
        log.info("공지사항 수정"); // 로그 기록 추가
        return "redirect:/notice/view/" + id;
    }

    @PostMapping("/delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        log.info("공지사항 삭제"); // 로그 기록 추가
        return "redirect:/notice/list";
    }
}
