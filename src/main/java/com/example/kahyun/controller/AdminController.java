package com.example.kahyun.controller;

import com.example.kahyun.mapper.AdminMapper;
import com.example.kahyun.mapper.FileBoardMapper;
import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.LoginVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminMapper adminMapper;
    private final FileBoardMapper sBoardMapper;

    /* 관리자 페이지 */
    @RequestMapping("admin/admin")
    public String helloTest() {
        return "admin/admin";
    }

    /* 회원 리스트 */
    @GetMapping("admin/user_list")
    public String getUsers(Model model, LoginVo loginVo) {
        List<LoginVo> list = adminMapper.getUsers(loginVo);
        model.addAttribute("list", list);
        return "admin/user_list";
    }

    /* 특정 회원 게시글 리스트 화면 */
    @GetMapping("admin/user_detail/{seq}")
    public ModelAndView getUserBoard(ModelAndView mav, LoginVo loginVo) {
        List<BoardVo> getUserBoard = adminMapper.getUserBoard(loginVo.getSeq());
        mav.addObject("list", getUserBoard);
        mav.setViewName("admin/user_detail");
        System.out.println(getUserBoard);
        return mav;
    }

    /* 관리자 리스트 */
    @GetMapping("admin/admin_list")
    public String getAdmin(Model model) {
        model.addAttribute("list", adminMapper.getAdmin());
        return "admin/admin_list";
    }

    /* 관리자 게시글 승인 대기 리스트 */
    @GetMapping("admin/accept_list")
    public String getAccept(Model model) {
        model.addAttribute("list", adminMapper.getAdminSBoardList());
        return "admin/accept_list";
    }

    /* 관리자 > 게시글 승인 대기 리스트 > 공개로 변경 */
    @ResponseBody
    @PostMapping("admin/accept_list/change_public")
    public int changePublic(String seq) {
        int result = adminMapper.changePublic(seq);
        return result;
    }

    /* 관리자 > 게시글 승인 대기 리스트 > 비공개로 변경 */
    @ResponseBody
    @PostMapping("admin/accept_list/change_private")
    public int changePrivate(String seq) {
        int result = adminMapper.changePrivate(seq);
        return result;
    }

    @ResponseBody
    @PostMapping("admin/accept_list/delete")
    public int deleteFileBoard(String seq) {
        int result = adminMapper.deleteFileBoard(seq);
        return result;
    }
}

