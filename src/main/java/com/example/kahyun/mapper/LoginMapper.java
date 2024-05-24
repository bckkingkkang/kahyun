package com.example.kahyun.mapper;

import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {

    /* 회원가입 */
    int createUser(LoginVo loginVo);

    /* 계정 아이디 찾기 */
    String searchId(LoginVo loginVo);

    /* 아이디 중복체크 */
    int checkId(String user_id);

    /* id로 user 정보 select */
    LoginVo selectUser(String id);

    /* 닉네임 변경 */
    int edit_my_page(LoginVo loginVo);

    List<PaymentVo> charge_cash_list(String buyer_seq);
}