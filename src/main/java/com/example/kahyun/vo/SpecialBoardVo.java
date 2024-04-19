package com.example.kahyun.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

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
    private List<MultipartFile> files = new ArrayList<>();    // 첨부파일 List
}
