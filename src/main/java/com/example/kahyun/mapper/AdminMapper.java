package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.LoginVo;
import com.example.kahyun.vo.FileBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    /* 회원 리스트 */
    List<LoginVo> getUsers(LoginVo loginVo);

    /* 관리자 리스트 */
    List<LoginVo> getAdmin();

    /* 특정 회원 게시글 리스트 */
    List<BoardVo> getUserBoard(String seq);

    List<FileBoardVo> getAdminSBoardList();

    int changePublic(String seq);
    int changePrivate(String seq);
    int deleteFileBoard(String seq);
}
