package com.example.kahyun.mapper;

import com.example.kahyun.vo.NoticeBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeBoardMapper {
    int createNoticeBoard(NoticeBoardVo noticeBoardVo);
    List<NoticeBoardVo> selectNoticeBoard();
}
