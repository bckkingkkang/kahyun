package com.example.kahyun.mapper;

import com.example.kahyun.vo.FileVo;
import com.example.kahyun.vo.FileBoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileBoardMapper {
    int createsBoard(FileBoardVo FileBoardVo);
    int createFile(FileVo fileVo);
    List<FileBoardVo> getSBoardList();
    List<FileVo> getFileList();
    FileBoardVo getDetailBoard(String seq);
    FileVo getDetailFile(String savedName);
    List<FileBoardVo> getMainFileBoardByDownload();
    List<FileBoardVo> getMainFileBoardByCreate();
    int downloadCount(String file);
}
