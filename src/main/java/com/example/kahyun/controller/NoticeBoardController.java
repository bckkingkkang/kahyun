package com.example.kahyun.controller;

import com.example.kahyun.mapper.CommentMapper;
import com.example.kahyun.mapper.NoticeBoardMapper;
import com.example.kahyun.service.NoticeBoardService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.NoticeBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class NoticeBoardController {

    private final UserService userService;
    private final NoticeBoardMapper noticeBoardMapper;
    private final NoticeBoardService noticeBoardService;
    private final CommentMapper commentMapper;

    /* 공지사항 게시판 리스트 화면 */
    @GetMapping("notice_board/list")
    public String NoticeBoardList(Model model) {
        model.addAttribute("noticeBoardList", noticeBoardMapper.selectNoticeBoard());

        return "notice_board/list";
    }

    /* 공지사항 글 등록 화면 */
    @RequestMapping("notice_board/create")
    public String CreateNoticeBoard() {
        return "notice_board/create";
    }

    /* 공지사항 상세 화면 */
    @GetMapping("notice_board/detail/{seq}")
    public String DetailNoticeBoard(NoticeBoardVo noticeBoardVo, Model model) {

        model.addAttribute("userDetail", userService.selectUser());
        model.addAttribute("selectNoticeBoard", noticeBoardService.selectNoticeBoardById(noticeBoardVo));
        model.addAttribute("NoticeBoardComment", commentMapper.selectNoticeBoardComment(noticeBoardVo));

        return "notice_board/detail";
    }

    /* 공지사항 글 수정 화면 */
    @GetMapping("/notice_board/edit/{seq}")
    public String EditNoticeBoard(NoticeBoardVo noticeBoardVo, Model model) {
        model.addAttribute("selectNoticeBoard", noticeBoardService.selectNoticeBoardById(noticeBoardVo));
        return "notice_board/edit";
    }

    /* 공지사항 글 등록 ajax */
    @ResponseBody
    @PostMapping("notice_board/create_notice")
    public int createNoticeBoard(NoticeBoardVo noticeBoardVo) {
        noticeBoardVo.setUser_seq(Integer.parseInt(userService.selectUser().getSeq()));
        int result =  noticeBoardMapper.createNoticeBoard(noticeBoardVo);
        return result;
    }

    /* 공지사항 글 수정 ajax */
    @ResponseBody
    @PostMapping("notice_board/edit_notice")
    public int editNoticeBoard(NoticeBoardVo noticeBoardVo) {
        int result = noticeBoardMapper.editNoticeBoard(noticeBoardVo);
        return result;
    }

    /* 공지사항 글 삭제 */
    @ResponseBody
    @PostMapping("notice_board/delete_notice")
    public int deleteNoticeBoard(NoticeBoardVo noticeBoardVo) {
        int result = noticeBoardMapper.deleteNoticeBoard(noticeBoardVo);
        return result;
    }
}
