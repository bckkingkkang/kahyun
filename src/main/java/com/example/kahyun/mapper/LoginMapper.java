package com.example.kahyun.mapper;

import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {

    /* 회원가입 */
    int userSignup(LoginVo loginVo);

    /* 계정 아이디 찾기 */
    String searchId(LoginVo loginVo);

    /* 아이디 중복체크 */
    int checkId(String user_id);

    /* id로 user 정보 select - 로그인 시 */
    LoginVo selectUser(String id);

}