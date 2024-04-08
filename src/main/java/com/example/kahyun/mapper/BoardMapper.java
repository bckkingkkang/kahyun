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

    /* 게시글 삭제 */
    int deleteBoard(BoardVo boardVo);

    /* 게시글 상세보기 */
    BoardVo getBoardDetail(BoardVo boardVo);

    /* 게시글 누를 때마다 조회수 증가 */
    int upView(BoardVo boardVo);
}
