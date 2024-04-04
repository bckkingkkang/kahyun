package com.example.kahyun.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
public class BoardVo {
    private String seq;
    private String rownum;
    private String title;
    private String content;
    private String nickname;
    private String create_dt;
    private String update_dt;
    private String status;
    private String view;
    private String user_seq;
    private String boardOption;
    private String auth;

    private List<MultipartFile> files = new ArrayList<>();
}
