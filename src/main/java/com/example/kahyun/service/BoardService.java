package com.example.kahyun.service;

import com.example.kahyun.mapper.BoardMapper;
import com.example.kahyun.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    /*
        서비스가 필요한 이유

        1. 모듈화
        : 서비스를 만들어두면 컨트롤러에서는 해당 서비스를 호출하여 사용
        서비스를 만들지 않고 컨트롤러에서 구현한 경우 해당 기능을 필요로 하는 모든 컨트롤러가 동일한 기능을 중복으로 구현해야 한다.

        2. 보안
        : 서비스를 통해서만 데이버테이스에 접근하도록 구현하는 것이 보안 상 안전하다.
        해킹을 통해 컨트롤러를 제어할 수 있게 되더라도 리포지토리에 직접 접근할 수는 없게 된다.
    */

    public void upView(BoardVo boardVo) {
        boardMapper.upView(boardVo);
    }



}
