package com.example.kahyun.mapper;

import com.example.kahyun.vo.FileVo;
import org.apache.ibatis.annotations.Mapper;

import java.io.File;
import java.util.List;

@Mapper
public interface FileMapper {

    void saveFile(List<FileVo> files);
}

