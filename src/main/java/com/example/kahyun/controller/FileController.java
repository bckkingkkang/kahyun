package com.example.kahyun.controller;

import com.example.kahyun.mapper.FileBoardMapper;
import com.example.kahyun.service.LoginService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@RequiredArgsConstructor
public class FileController {

    @Value("${file.dir}")
    private String fileDir;
    private final FileBoardMapper fileBoardMapper;
    private final LoginService loginService;

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
        System.out.println(file);
        fileBoardMapper.downloadCount(file);
    }

}
