package com.example.kahyun.mapper;

import com.example.kahyun.vo.BoardVo;
import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.SpecialBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SBoardMapper {
    int createsBoard(SpecialBoardVo specialBoardVo);
    int createFile(FileVo fileVo);
    List<SpecialBoardVo> getSBoardList();
    List<FileVo> getFileList();
    SpecialBoardVo getDetailBoard(String seq);
    FileVo getDetailFile(String savedName);
    List<SpecialBoardVo> getMainSpecialBoardByDownload();
    List<SpecialBoardVo> getMainSpecialBoardByCreate();
    int downloadCount(String file);
}
