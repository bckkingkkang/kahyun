package com.example.kahyun.controller;

import com.example.kahyun.mapper.NoticeBoardMapper;
import com.example.kahyun.service.NoticeBoardService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.NoticeBoardVo;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class NoticeBoardController {

    private final UserService userService;
    private final NoticeBoardMapper noticeBoardMapper;

    @Autowired
    private NoticeBoardService noticeBoardService;

    /* 공지사항 게시판 리스트 화면 */
    @GetMapping("notice_board/list")
    public String getNoticeBoardList(@RequestParam(defaultValue = "1") int pageNum,
                                     @RequestParam(defaultValue = "10") int pageSize,
                                     Model model) {
        PageInfo<NoticeBoardVo> pageInfo = noticeBoardService.selectNoticeBoard(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        System.out.println(pageInfo);
        System.out.println(model);
        return "notice_board/list";
    }

    /* 공지사항 글 등록 화면 */
    @RequestMapping("notice_board/create")
    public String createNoticeBoard() {
        return "notice_board/create";
    }

    /* 공지사항 글 등록 ajax */
    @ResponseBody
    @PostMapping("notice_board/create_board")
    public int createBoard(NoticeBoardVo noticeBoardVo) {
        noticeBoardVo.setUser_seq(Integer.parseInt(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq()));
        int result =  noticeBoardMapper.createNoticeBoard(noticeBoardVo);
        return result;
    }
}
