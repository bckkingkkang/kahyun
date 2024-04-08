package com.example.kahyun.mapper;

import com.example.kahyun.vo.LoginVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

    int createUser(LoginVo loginVo);

    String searchId(LoginVo loginVo);

    int checkId(LoginVo loginVo);
    LoginVo selectUser(String id);
}