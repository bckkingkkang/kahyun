package com.example.kahyun.vo;

import lombok.Data;

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
    private String delete_yn;

    /* 공지사항 표시 */
    private String importance;
    private String board_yn;
    private String file_board_yn;

}
