package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.NoticeBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    /* 게시판 리스트 */
    List<BoardVo> selectBoard(BoardVo boardVo);

    /* 게시판 글 쓰기 */
    int createBoard(BoardVo boardVo);

    /* 게시글 삭제 */
    int deleteBoard(String seq);

    /* 게시글 상세보기 */
    BoardVo selectBoardBySeq(BoardVo boardVo);

    /* 게시글 누를 때마다 조회수 증가 */
    int upView(BoardVo boardVo);

    /* 게시판 리스트 상단 공지사항 추가 */
    List<NoticeBoardVo> selectBoardNotice();

    /* 게시글 수정 */
    int editBoard(BoardVo boardVo);
}
