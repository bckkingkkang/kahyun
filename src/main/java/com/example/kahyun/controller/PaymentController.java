package com.example.kahyun.controller;

import com.example.kahyun.service.PaymentService;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.PaymentVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PaymentController {

    private IamportClient iamportClient;
    private final UserService userService;
    private final PaymentService paymentService;

    @Value("${imp.api.key}")
    private String apiKey;

    @Value("${imp.api.secretkey}")
    private String secretKey;

    /* 캐시 충전 화면 */
    @RequestMapping("payment/charge")
    public String Charge(Model model) {
        model.addAttribute("user",userService.selectUser());
        return "payment/charge";
    }

    // IamportClient 객체를 두 API KEY를 인자로 넘겨서 생성하면 이 객체를 통해 iamport 함수들을 사용할 수 있다.
    @PostConstruct
    public void init() {
        this.iamportClient = new IamportClient(apiKey, secretKey);
    }

    @ResponseBody
    @RequestMapping("/charge/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }

    /* 충전 */
    @ResponseBody
    @PostMapping("/payment/charge_cash")
    public void chargeCash(PaymentVo paymentVo) {
        paymentService.chargeCash(paymentVo);
    }




}
