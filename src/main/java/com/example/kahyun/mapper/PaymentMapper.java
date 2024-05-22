package com.example.kahyun.mapper;

import com.example.kahyun.vo.PaymentVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
    int charge_cash(PaymentVo paymentVo);
    int user_cash_charge(PaymentVo paymentVo);
}
