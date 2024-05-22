package com.example.kahyun.controller;

import com.example.kahyun.mapper.PaymentMapper;
import com.example.kahyun.service.UserService;
import com.example.kahyun.vo.PaymentVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PaymentController {

    private IamportClient iamportClient;
    private final PaymentMapper paymentMapper;
    private final UserService userService;

    @Value("${imp.api.key}")
    private String apiKey;

    @Value("${imp.api.secretkey}")
    private String secretKey;

    @RequestMapping("payment/charge")
    public String list(Model model) {
        model.addAttribute("user",userService.selectUser((String) SecurityContextHolder.getContext().getAuthentication().getPrincipal()));
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
        System.out.println(imp_uid);
        return iamportClient.paymentByImpUid(imp_uid);
    }

    @ResponseBody
    @PostMapping("/charge_cash")
    public int charge_cash(PaymentVo paymentVo) {
        paymentVo.setBuyer_seq(userService.selectUser((String)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getSeq());
        paymentVo.setBuyer_email(userService.selectUser((String)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail());
        paymentVo.setBuyer_name(userService.selectUser((String)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
        paymentVo.setBuyer_phone(userService.selectUser((String)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getPhone());
        System.out.println(paymentVo);
        return paymentMapper.charge_cash(paymentVo);
    }




}
