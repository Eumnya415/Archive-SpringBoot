/**
 * 공지사항 컨트롤러
 */

package com.sloop.archive.notice.controller;

import com.sloop.archive.notice.domain.NoticeDTO;
import com.sloop.archive.notice.service.NoticeService;

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
    @GetMapping("list")
    public String getNoticeList(Model model) {
        List<NoticeDTO> noticeList = noticeService.getAllNoticePinnedFirst();
        model.addAttribute("noticeList", noticeList);
        log.info("Notice list with pinned items viewed"); // 로그 기록 추가
        return "notice/list";
    }


    // 공지사항 상세 조회
    /**
     * 특정 ID의 공지사항을 조회하고, 이를 모델에 추가한 뒤 상세 페이지를 반환한다.
     * @param id 조회할 공지사항의 ID
     * @param model 공지사항이 추가되는 모델
     * @return /notice/detail
     */
    @GetMapping("{id}")
    public String getNotice(@PathVariable Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        log.info("Viewing notice with id: {}", id); // 로그 기록 추가
        return "notice/detail";
    }


    // 공지사항 등록 페이지
    /**
     * 공지사항을 등록하는 폼 페이지를 반환한다.
     * @return 공지사항 등록 폼 페이지 (/notice/create)
     */
    @GetMapping("create")
    public String createNoticeForm() {
        return "notice/create";
    }


    // 공지사항 등록 처리
    /**
     * 사용자가 입력한 공지사항 정보를 등록한다.
     * @param noticeDTO 등록할 공지사항 정보
     * @return 공지사항 목록 페이지로의 리다이렉트 (/notice/list)
     */
    @PostMapping("create")
    public String createNotice(@ModelAttribute NoticeDTO noticeDTO) {
        noticeService.createNotice(noticeDTO);
        log.info("New notice created: {}", noticeDTO.getTitle()); // 로그 기록 추가
        return "redirect:/notice/list";  // 공지사항 목록으로 리다이렉트
    }


    // 공지사항 수정 페이지
    /**
     * 특정 ID의 공지사항을 조회하고, 이를 모델에 추가한 뒤 수정 폼 페이지를 반환한다.
     * @param id 수정할 공지사항의 ID
     * @param model 공지사항이 추가되는 모델
     * @return 공지사항 수정 폼 페이지 (/notice/update)
     */
    @GetMapping("update/{id}")
    public String updateNoticeForm(@PathVariable Long id, Model model) {
        NoticeDTO notice = noticeService.getNoticeById(id);
        model.addAttribute("notice", notice);
        return "notice/update";
    }


    // 공지사항 수정 처리
    /**
     * 사용자가 입력한 공지사항 정보로 특정 ID의 공지사항을 수정한다.
     * @param id 수정할 공지사항의 ID
     * @param noticeDTO 수정할 공지사항 정보
     * @param redirectAttrs 리다이렉트 시 추가할 속성
     * @return 공지사항 목록 페이지로의 리다이렉트, 또는 오류 발생 시 수정 페이지로의 리다이렉트
     */
    @PostMapping("update/{id}")
    public String updateNotice(@PathVariable Long id, @ModelAttribute NoticeDTO noticeDTO, RedirectAttributes redirectAttrs) {
        Logger log = LoggerFactory.getLogger(NoticeController.class); // Logger 인스턴스 생성
        try {
            noticeService.updateNotice(id, noticeDTO);
            log.info("공지사항 게시글 id {} 수정 완료", id); // 로그 기록 추가
            return "redirect:/notice/list";
        } catch (IllegalArgumentException e) {
            // 예외 메시지를 RedirectAttributes에 추가
            redirectAttrs.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/notice/update" + id;
        }
    }

    /**
     * noticeService.updateNotice(id, noticeDTO);
     * log.info("Notice with id {} updated", id); // 로그 기록 추가
     * return "redirect:/notice/list"; // 공지사항 목록으로 리다이렉트
     */


    // 공지사항 삭제 처리
    /**
     * 특정 ID의 공지사항을 삭제한다.
     * @param id 삭제할 공지사항의 ID
     * @return 공지사항 목록 페이지로의 리다이렉트 (/notice/list)
     */
    @PostMapping("delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        log.info("Notice with id {} deleted", id); // 로그 기록 추가
        return "redirect:/notice/list";  // 공지사항 목록으로 리다이렉트
    }

}
