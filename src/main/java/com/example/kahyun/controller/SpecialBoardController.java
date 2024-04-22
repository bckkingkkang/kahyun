package com.example.kahyun.controller;

import com.example.kahyun.mapper.SBoardMapper;
import com.example.kahyun.service.BoardService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.SpecialBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
/*@RequestMapping("special_board/")*/
public class SpecialBoardController {

    @Autowired
    private final UserService userService;
    @Value("${file.dir}")
    private String fileDir;

    private final SBoardMapper sboardMapper;

    private final BoardService boardService;

    /* 게시판 화면 */
    @RequestMapping("special_board/list")
    public String list() {

        return "special_board/list";
    }

    /* 게시판 글쓰기 */
    @RequestMapping("special_board/create")
    public String create() {
        return "special_board/create";
    }

    /* 게시글 저장 */
    /*@ResponseBody*/
    /*@PostMapping("special_board/create_sboard")
    public String create_sboard(MultipartFile files)throws Exception {
        String fullPath = "";
        if(!files.isEmpty()) {
            fullPath = fileDir + files.getOriginalFilename();
            files.transferTo(new File(fullPath));

            System.out.println(fullPath);
        }
        return "fullPath";
    }*/

    @ResponseBody
    @PostMapping("special_board/create_sboard_detail")
    public int create_sboard_detail(SpecialBoardVo specialBoardVo) throws Exception {

        specialBoardVo.setNickname(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getNickname());
        specialBoardVo.setUser_seq(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq());

        String file = (specialBoardVo.getFiles());

        System.out.println(specialBoardVo.getFiles());
        System.out.println(file);
        System.out.println(fileDir);

        String path = fileDir + file;

        System.out.println(specialBoardVo.getFiles());
        System.out.println(file);
        System.out.println(fileDir);
        System.out.println(path);

        System.out.println(specialBoardVo);

        return sboardMapper.createsBoard(specialBoardVo);
    }
}