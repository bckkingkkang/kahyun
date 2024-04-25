package com.example.kahyun.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class SpecialBoardService {

    @Value("${file.dir}")
    private String fileDir;

    public String create_sboard(MultipartFile files)throws Exception {
        String fullPath = "";
        if(!files.isEmpty()) {
            fullPath = fileDir + files.getOriginalFilename();
            files.transferTo(new File(fullPath));

            System.out.println(fullPath);
        }
        return fullPath;
    }
}
