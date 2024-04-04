package com.example.kahyun.vo;

import lombok.Builder;
import lombok.Data;

@Data
public class FileVo {

    private String seq;
    private String board_seq;
    private String original_name;
    private String save_name;
    private String size;
    private String delete_yn;
    private String create_dt;
    private String delete_dt;

    /*
        Builder pattern 객체 생성 가능
        -> 생성자 파라미터가 많은 경우에 가독성을 높여준다.
        -> 변수에 값을 넣어주는 순서를 달리하거나, 원하는 변수에만 값을 넣어 객체를 생성할 수 있다.
    */
    @Builder
    public FileVo(String original_name, String save_name, String size) {
        this.original_name = original_name;
        this.save_name = save_name;
        this.size = size;
    }

    public void setBoard_seq(String board_seq) {
        this.board_seq = board_seq;
    }
}
