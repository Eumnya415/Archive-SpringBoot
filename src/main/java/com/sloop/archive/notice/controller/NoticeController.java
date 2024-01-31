/**
 * 공지사항 컨트롤러
 */

package com.sloop.archive.notice.controller;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    //공지사항 목록 조회
    /**
     * 공지사항 목록을 가져와서 Spring MVC Model에 추가한 뒤, 공지사항 목록 페이지에 반환한다.
     * 중요 공지사항은 목록 상단에 먼저 표시된다.
     * @param model 공지사항 목록이 추가되는 Spring MVC Model
     * @return /notice/list
     */
    @GetMapping("/list")
    public String getAllNoticePinnedFirst(Model model, @RequestParam(defaultValue = "1") int page) {
        int pageSize = 10; // 페이지 당 게시글 수
        int totalCount = noticeService.getTotalCount(); // 전체 게시글 수

        // 페이징 처리를 위한 계산
        int start = (page - 1) * pageSize;
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        List<NoticeDTO> noticeList = noticeService.getAllNoticePinnedFirst(start, pageSize);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("totalPages", totalPages);

        log.info("공지사항 목록 조회"); // 로그 기록 추가
        return "notice/list";

//        model.addAttribute("noticeList", noticeService.getNoticePinnedFirst());

    }


    // 공지사항 상세 조회
    /**
     * 특정 ID의 공지사항을 조회하고, 이를 모델에 추가한 뒤 상세 페이지를 반환한다.
     * @param id 조회할 공지사항의 ID
     * @param model 공지사항이 추가되는 모델
     * @return /notice/detail
     */
    @GetMapping("/view/{id}")
    public String getNoticeById(@PathVariable Long id, Model model) {
        model.addAttribute("notice", noticeService.getNoticeById(id));
        log.info("공지사항 상세 조회"); // 로그 기록 추가
        return "notice/view";
    }

    // 공지사항 등록 페이지
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

    // 공지사항 수정 페이지
    @GetMapping("/update/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("notice", noticeService.getNoticeById(id));
        return "notice/update";
    }

    @PostMapping("/update")
    public String updateNotice(@ModelAttribute NoticeDTO noticeDTO) {
        noticeService.updateNotice(noticeDTO);
        log.info("공지사항 수정"); // 로그 기록 추가
        return "redirect:/notice/view/" + noticeDTO.getId();
    }

    @PostMapping("/delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        log.info("공지사항 삭제"); // 로그 기록 추가
        return "redirect:/notice/list";
    }
}
