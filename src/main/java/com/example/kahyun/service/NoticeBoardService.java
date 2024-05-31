package com.example.kahyun.service;

import com.example.kahyun.mapper.NoticeBoardMapper;
import com.example.kahyun.vo.NoticeBoardVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeBoardService {
    @Autowired
    private NoticeBoardMapper noticeBoardMapper;

    /*
    페이징 처리
    public PageInfo<NoticeBoardVo> selectNoticeBoard(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<NoticeBoardVo> notices = noticeBoardMapper.selectNoticeBoard();
        return new PageInfo<>(notices);
    }*/

    /* 공지사항 글 상세 */
    public NoticeBoardVo selectNoticeBoardById(NoticeBoardVo noticeBoardVo) {
        return noticeBoardMapper.selectNoticeBoardById(noticeBoardVo);
    }

}
