package com.example.kahyun.vo;

import lombok.Data;

@Data
public class FileBoardVo {
    private int rownum;
    private String seq;
    private String title;
    private String content;
    private String nickname;
    private String user_id;
    private String create_dt;
    private String update_dt;
    private String status;
    private String view;
    private String user_seq;
    private String file;
    private String price;
    private String accept_yn;
    private int download_count;
    private String orgName;
    private String savedName;
    private String delete_yn;

    /* 공지사항 표시 */
    private String importance;
    private String board_yn;
    private String file_board_yn;

}
