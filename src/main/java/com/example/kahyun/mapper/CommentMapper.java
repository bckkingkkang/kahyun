package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.CommentVo;
import com.example.kahyun.vo.NoticeBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {

    /* 회원게시판 댓글 리스트 */
    List<CommentVo> selectBoardComment(BoardVo boardVo);
    /* 회원게시판 댓글 등록 */
    int createBoardComment(CommentVo commentVo);
    /* 회원게시판 댓글 수정 */
    int editBoardComment(CommentVo commentVo);
    /* 회원게시판 댓글 삭제 */
    int deleteBoardComment(CommentVo commentVo);

    /* 공지사항 게시판 댓글 리스트 */
    List<CommentVo> selectNoticeBoardComment(NoticeBoardVo noticeBoardVo);
    /* 공지사항 게시판 댓글 등록 */
    int createNoticeBoardComment(CommentVo commentVo);
    /* 공지사항 게시판 댓글 수정 */
    int editNoticeBoardComment(CommentVo commentVo);
    /* 공지사항 게시판 댓글 삭제 */
    int deleteNoticeBoardComment(CommentVo commentVo);
}
