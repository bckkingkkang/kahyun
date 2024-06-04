package com.example.kahyun.mapper;

import com.example.kahyun.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
    int chargeCash(PaymentVo paymentVo);
    int userCashCharge(PaymentVo paymentVo);
    String selectUserCash(String buyer_seq);
}
