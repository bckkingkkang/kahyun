package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.SpecialBoardVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SBoardMapper {
    int createsBoard(SpecialBoardVo specialBoardVo);
}
