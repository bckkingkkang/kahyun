package com.example.kahyun.service;

import com.example.kahyun.mapper.PaymentMapper;
import com.example.kahyun.vo.PaymentVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentService {

    private final PaymentMapper paymentMapper;
    private final UserService userService;

    public PaymentVo chargeCash(PaymentVo paymentVo) {
        paymentVo.setBuyer_seq(userService.selectUser().getSeq());
        paymentVo.setBuyer_email(userService.selectUser().getEmail());
        paymentVo.setBuyer_name(userService.selectUser().getUsername());
        paymentVo.setBuyer_phone(userService.selectUser().getPhone());

        paymentMapper.userCashCharge(paymentVo);
        paymentVo.setUser_cash(String.valueOf(paymentMapper.selectUserCash(paymentVo.getBuyer_seq())));

        paymentMapper.chargeCash(paymentVo);
        return paymentVo;
    }
}
