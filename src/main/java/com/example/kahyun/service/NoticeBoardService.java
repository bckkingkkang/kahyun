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

    public PageInfo<NoticeBoardVo> selectNoticeBoard(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<NoticeBoardVo> notices = noticeBoardMapper.selectNoticeBoard();
        return new PageInfo<>(notices);
    }
}
