package com.example.kahyun.controller;

import com.example.kahyun.mapper.SBoardMapper;
import com.example.kahyun.service.FileService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.util.FileUtils;
import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.SpecialBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.stylesheets.LinkStyle;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("special_board/")
public class SpecialBoardController {

    private final FileUtils fileUtils;
    private final FileService fileService;
    private final UserService userService;
    private final SBoardMapper sBoardMapper;

    /* 게시판 화면 */
    @RequestMapping("list")
    public String list() {

        return "special_board/list";
    }

    /* 게시판 글쓰기 */
    @RequestMapping("create")
    public String create() {
        return "special_board/create";
    }

    /* 게시글 저장 */
    @ResponseBody
    @PostMapping("create_sboard")
    public int create_sboard(final SpecialBoardVo specialBoardVo) {
        String id = String.valueOf(sBoardMapper.createsBoard(specialBoardVo));
        specialBoardVo.setNickname(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getNickname());
        specialBoardVo.setUser_seq(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq());

        List<FileVo> files = fileUtils.uploadFiles(specialBoardVo.getFiles());
        fileService.saveFiles(id, files);

        return sBoardMapper.createsBoard(specialBoardVo);
    }
}