package com.example.kahyun.mapper;

import com.example.kahyun.vo.FileVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {

    // 업로드된 파일의 정보를 DB에 저장, 여러 개의 파일 정보를 한 번에 저장하기 위해 List 타입 선언
    void saveAll(List<FileVo> files);
}
