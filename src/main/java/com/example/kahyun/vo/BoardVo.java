package com.example.kahyun.vo;

import lombok.Data;

@Data
public class BoardVo {
    private String seq;
    private String title;
    private String content;
    private String nickname;
    private String create_dt;
    private String update_dt;
    private String status;
    private String view;
}
