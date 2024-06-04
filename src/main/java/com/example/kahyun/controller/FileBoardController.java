package com.example.kahyun.controller;

import com.example.kahyun.mapper.FileBoardMapper;
import com.example.kahyun.service.LoginService;
import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.FileBoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class FileBoardController {

    @Autowired
    private final LoginService loginService;
    @Value("${file.dir}")
    private String fileDir;
    private final FileBoardMapper fileBoardMapper;

    /* 게시판 리스트 화면 */
    @RequestMapping("file_board/list")
    public ModelAndView FileBoardList(ModelAndView mav) {

        File path = new File(fileDir);
        String[] fileList = path.list();
        /*mav.addObject("fileList", fileList);*/
        mav.addObject("fileList", fileBoardMapper.getFileList());
        mav.addObject("sboardList", fileBoardMapper.getSBoardList());
        mav.addObject("notice_list", fileBoardMapper.selectBoardNotice());
        mav.setViewName("file_board/list");

        return mav;
    }

    /* 자료게시판 상세 화면 */
    @GetMapping("file_board/detail/{seq}")
    public ModelAndView DetailFileBoard(FileBoardVo fileBoardVo, ModelAndView mav) {

        FileBoardVo getDetailBoard = fileBoardMapper.getDetailBoard(fileBoardVo.getSeq());
        FileVo getDetailFile = fileBoardMapper.getDetailFile(getDetailBoard.getFile());
        mav.addObject("getDetailBoard", getDetailBoard);
        mav.addObject("getDetailFile", getDetailFile);
        System.out.println(getDetailBoard);
        System.out.println(getDetailFile);
        mav.setViewName("file_board/detail");

        return mav;
    }

    /* 자료게시판 글 등록 */
    @RequestMapping("file_board/create")
    public String CreateFileBoard() {
        return "file_board/create";
    }

    /* 자료게시판 글 등록 및 파일 등록 */
    @RequestMapping("file_board/fileForm")
    public ModelAndView fileUploadMultiple(@RequestParam("uploadFileMulti") ArrayList<MultipartFile> files,
                                           ModelAndView mav, String title, String content, FileBoardVo fileBoardVo, FileVo fileVo) throws Exception {
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
        fileBoardMapper.createFile(fileVo);

        fileBoardVo.setTitle(title);
        fileBoardVo.setContent(content);
        fileBoardVo.setNickname(loginService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getNickname());
        fileBoardVo.setUser_seq(loginService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq());
        fileBoardVo.setFile(savedFileName);
        fileBoardMapper.createsBoard(fileBoardVo);

        mav.addObject("originalFileNameList", originalFileNameList);
        mav.setView(new RedirectView("/file_board/list"));

        return mav;
    }


}