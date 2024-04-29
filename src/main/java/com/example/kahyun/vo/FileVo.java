package com.example.kahyun.vo;

import lombok.Builder;
import lombok.Data;

@Data
public class FileVo {
    private int rownum;
    private String seq;
    private String orgName;
    private String savedName;
    private String savedPath;
    private String s_board_seq;
    private String size;
    private String delete_yn;
    private String create_dt;

    private String nickname;
    private String title;
}
