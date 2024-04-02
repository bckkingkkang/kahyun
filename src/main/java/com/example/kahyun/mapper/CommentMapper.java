package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.CommentVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    List<CommentVo> getComment(BoardVo boardVo);

    int createComment(CommentVo commentVo);

}
