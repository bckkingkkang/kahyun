package com.example.kahyun.mapper;

import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    /* id로 user 정보 select - 비밀번호 제외 */
    LoginVo userInfoList(String id);

    /* 닉네임 변경 */
    int editUserInfo(LoginVo loginVo);

    /* 마이페이지 충전 내역 */
    List<PaymentVo> chargeCashList(String buyer_seq);
}
