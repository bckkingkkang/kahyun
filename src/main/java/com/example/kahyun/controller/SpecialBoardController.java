package com.example.kahyun.controller;

import com.example.kahyun.mapper.SBoardMapper;
import com.example.kahyun.service.BoardService;
import com.example.kahyun.service.SpecialBoardService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.SpecialBoardVo;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
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

    private final SpecialBoardService specialBoardService;

    private final BoardService boardService;

    /* 게시판 화면 */
    @RequestMapping("special_board/list")
    public ModelAndView list(ModelAndView mav) {

        File path = new File(fileDir);
        String[] fileList = path.list();
        /*mav.addObject("fileList", fileList);*/
        mav.addObject("fileList", sboardMapper.getFileList());
        mav.addObject("sboardList", sboardMapper.getSBoardList());
        mav.setViewName("special_board/list");

        return mav;
    }

    /* 게시글 상세 */
    @GetMapping("special_board/detail/{seq}")
    public ModelAndView getDetail(SpecialBoardVo specialBoardVo, FileVo fileVo, ModelAndView mav) {

        SpecialBoardVo getDetailBoard = sboardMapper.getDetailBoard(specialBoardVo.getSeq());
        FileVo getDetailFile = sboardMapper.getDetailFile(getDetailBoard.getFile());
        mav.addObject("getDetailBoard", getDetailBoard);
        mav.addObject("getDetailFile", getDetailFile);
        System.out.println(getDetailBoard);
        System.out.println(getDetailFile);
        mav.setViewName("special_board/detail");

        return mav;
    }

    /* 파일 다운로드 */
    @RequestMapping("/fileDownload/{file}")
    public void fileDownload(@PathVariable String file, HttpServletResponse response) throws IOException {
        File f = new File(fileDir, file);
        response.setContentType("application/download");
        response.setContentLength((int)f.length());
        response.setHeader("Content-disposition", "attachment;filename=\"" + file + "\"");
        // response 객체를 통해서 서버로부터 파일 다운로드
        OutputStream os = response.getOutputStream();
        // 파일 입력 객체 생성
        FileInputStream fis = new FileInputStream(f);
        FileCopyUtils.copy(fis, os);
        fis.close();
        os.close();
    }

    /* 게시판 글쓰기 */
    @RequestMapping("special_board/create")
    public String create() {
        return "special_board/create";
    }

    /* 파일 저장 */
    @RequestMapping("special_board/fileForm")
    public ModelAndView fileUploadMultiple(@RequestParam("uploadFileMulti")ArrayList<MultipartFile> files,
                                           ModelAndView mav, String title, String content, SpecialBoardVo specialBoardVo, FileVo fileVo) throws Exception {
        String savedFileName = "";
        // 파일 저장 경로 설정
        String uploadPath = fileDir;

        // 여러 개의 원본 파일을 저장할 리스트 생성
        ArrayList<String> originalFileNameList = new ArrayList<String>();
        for(MultipartFile file : files) {
            // 원본 파일 이름 알아오기
            String originalFileName = file.getOriginalFilename();
            // 파일 이름 리스트에 추가
            originalFileNameList.add(originalFileName);
            // 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
            UUID uuid = UUID.randomUUID();
            savedFileName = uuid.toString() + "_" + originalFileName;
            // 파일 생성
            File file1 = new File(uploadPath + savedFileName);
            // 서버로 전송
            file.transferTo(file1);
            fileVo.setSize(String.valueOf(file.getSize()));
        }

        fileVo.setOrgName(originalFileNameList.get(0));
        fileVo.setSavedName(savedFileName);
        fileVo.setSavedPath(fileDir);
        sboardMapper.createFile(fileVo);

        specialBoardVo.setTitle(title);
        specialBoardVo.setContent(content);
        specialBoardVo.setNickname(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getNickname());
        specialBoardVo.setUser_seq(userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq());
        specialBoardVo.setFile(savedFileName);
        sboardMapper.createsBoard(specialBoardVo);

        mav.addObject("originalFileNameList", originalFileNameList);
        mav.setView(new RedirectView("/special_board/list"));

        return mav;
    }

}