package com.example.kahyun.mapper;

import com.example.kahyun.vo.NoticeBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeBoardMapper {

    /* 공지사항 글 등록 */
    int createNoticeBoard(NoticeBoardVo noticeBoardVo);

    /* 공지사항 글 수정 */
    int editNoticeBoard(NoticeBoardVo noticeBoardVo);

    /* 공지사항 글 삭제 */
    int deleteNoticeBoard(NoticeBoardVo noticeBoardVo);

    /* 공지사항 글 리스트 */
    List<NoticeBoardVo> selectNoticeBoard();

    /* 공지사항 상세 */
    NoticeBoardVo selectNoticeBoardById(NoticeBoardVo noticeBoardVo);
}
