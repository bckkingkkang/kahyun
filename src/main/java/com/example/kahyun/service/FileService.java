package com.example.kahyun.service;

import com.example.kahyun.mapper.FileMapper;
import com.example.kahyun.vo.FileVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FileService {
    private final FileMapper fileMapper;

    @Transactional
    public void saveFiles(final String s_board_seq, final List<FileVo> files) {
        if (CollectionUtils.isEmpty(files)) {
            return;
        }
        for (FileVo file : files) {
            file.setS_board_seq(s_board_seq);
        }
        fileMapper.saveFile(files);
    }
}
