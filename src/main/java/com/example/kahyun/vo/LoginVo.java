package com.example.kahyun.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginVo {
    private String seq;
    private String username;
    private String user_id;
    private String password;
    private String nickname;
    private String reg_date;
    private String status;
    private String auth;
}
