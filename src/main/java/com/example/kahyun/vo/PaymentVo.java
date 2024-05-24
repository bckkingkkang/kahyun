package com.example.kahyun.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVo {
    // 캐시 충전
    private int rownum;
    private int seq;
    private String buyer_seq;
    private String buyer_name;
    private String price;
    private String buyer_email;
    private String buyer_phone;
    private String card_name;
    private String emb_pg_provider;
    private String charge_dt;
    private String apply_num;
    private int card_code;
    private String imp_uid;
    private String merchant_uid;
    private String pay_method;
    private String user_cash;
}
