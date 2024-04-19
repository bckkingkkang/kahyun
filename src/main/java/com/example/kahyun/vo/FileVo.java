package com.example.kahyun.vo;

import lombok.Builder;
import lombok.Data;

@Data
public class FileVo {
    private String seq;
    private String orgName;
    private String savedName;
    private String savedPath;
    private String s_board_seq;
    private String size;
    private String delete_yn;
    private String create_dt;

    @Builder
    public FileVo(String orgName, String savedName, String size) {
        this.orgName = orgName;
        this.savedName = savedName;
        this.size = size;
    }

    public void setS_board_seq(String s_board_seq) {this.s_board_seq = s_board_seq;}
}
