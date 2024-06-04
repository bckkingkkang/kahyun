package com.example.kahyun.vo;

import lombok.Data;

@Data
public class CommentVo {

    private String seq;
    private String nickname;
    private String user_seq;
    private String content;
    private String create_dt;
    private String board_seq;
    private String delete_yn;
    private String delete_dt;
    private String update_dt;

}
