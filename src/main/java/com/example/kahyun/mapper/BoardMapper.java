package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    /* 게시판 리스트 */
    List<BoardVo> getBoardList(BoardVo boardVo);

    /* 게시판 글 쓰기 */
    int createBoard(BoardVo boardVo);

    BoardVo getBoardDetail(BoardVo boardVo);
}
