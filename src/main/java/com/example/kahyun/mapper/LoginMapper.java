package com.example.kahyun.mapper;

import com.example.kahyun.vo.LoginVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {

    int createUser(LoginVo loginVo);

    String searchId(LoginVo loginVo);
}