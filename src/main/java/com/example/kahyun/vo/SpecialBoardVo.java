package com.example.kahyun.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Data
public class SpecialBoardVo {
    private String seq;
    private String title;
    private String content;
    private String nickname;
    private String create_dt;
    private String update_dt;
    private String status;
    private String view;
    private String user_seq;
    private String files;
}
