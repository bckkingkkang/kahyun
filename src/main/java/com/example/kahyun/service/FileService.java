package com.example.kahyun.service;

import com.example.kahyun.mapper.FileMapper;
import com.example.kahyun.vo.FileVo;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FileService {

    private final FileMapper fileMapper;

    @Transactional
    public void saveFiles(final String board_seq, final List<FileVo> files) {   // 게시글 번호와 파일 정보 받기
        if(CollectionUtils.isEmpty(files)) {
            // 파일이 없는 경우 return
            return;
        }
        for(FileVo file : files) {
            // 파일이 있는 경우 모든 요청 객체에 게시글 번호를 set
            file.setBoard_seq(board_seq);
        }
        // 테이블에 파일 정보 저장
        fileMapper.saveAll(files);
    }
}
