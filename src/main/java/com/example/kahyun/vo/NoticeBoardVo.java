package com.example.kahyun.vo;

import lombok.Data;

@Data
public class NoticeBoardVo {
    private int rownum;

    private String seq;
    private int user_seq;       // 등록 유저 seq
    private String nickname;
    private String title;       // 공지 사항 제목
    private String content;     // 공지 내용
    private String create_dt;   // 등록 일자
    private String importance;  // 중요도 enum('A', 'B', 'C')
    private String update_dt;   // 수정일자
    private String delete_dt;   // 삭제일자
    private String board_yn;
    private String file_board_yn;
    private String delete_yn;
}
