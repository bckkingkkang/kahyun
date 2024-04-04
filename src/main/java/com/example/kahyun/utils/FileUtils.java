package com.example.kahyun.utils;

import com.example.kahyun.vo.FileVo;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/*
    @Bean : 개발자가 컨트롤할 수 없는 외부 라이브러리를 빈으로 등록할 때 사용
    @Component : 개발자가 직접 정의한 클래스를 빈으로 등록할 때 사용
*/

@Component
public class FileUtils {

    // 물리적으로 파일을 저장할 위치
    private final String uploadPath = Paths.get("C:/","image","upload-files").toString();


    // 파일을 업로드한 폼을 전송하면 MultipartFile 객체에 사용자가 업로드한 파일 정보가 담긴다.
    public List<FileVo> uploadFiles(final List<MultipartFile> multipartFiles) {
        List<FileVo> files = new ArrayList<>();
        for(MultipartFile multipartFile : multipartFiles) {
            if(multipartFile.isEmpty()) {
                continue;
            }
            files.add(uploadFile(multipartFile));
        }
        // uploadFile()의 결과값을 담아 return
        return files;
    }

    // 단일 파일 업로드
    public FileVo uploadFile(final MultipartFile multipartFile) {
        // 파일의 유무 체크, 업로드 된 파일이 없는 경우 null return -> 종료
        if(multipartFile.isEmpty()) {
            return null;
        }

        // 저장할 파일명
        String saveName = generateSaveFilename(multipartFile.getOriginalFilename());
        // 오늘 날짜
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        // 파일의 업로드 경로
        String uploadPath = getUploadPath(today) + File.separator + saveName;
        // 업로드할 파일 객체
        File uploadFile = new File(uploadPath);
        // 파일은 uploadPath에 해당하는 경로에 생성되며, MultipartFile의 transferTo()가 정상적으로 실행되면 파일 생성(write) 완료

        try {
            multipartFile.transferTo(uploadFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return FileVo.builder() // Builder 패턴 적용
                .original_name(multipartFile.getOriginalFilename())
                .save_name(saveName)
                .size(String.valueOf(multipartFile.getSize()))
                .build();
    }


    // 저장 파일 명 생성
    private String generateSaveFilename(final String filename) {
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        String extension = StringUtils.getFilenameExtension(filename);
        return uuid + "." + extension;
    }

    /*
        getUploadPath()
        - 변수 uploadPath에 해당되는 경로를 리턴한다.
    */

    // 업로드 경로 반환
    private String getUploadPath() {
        return makeDirectories(uploadPath);
    }

    private String getUploadPath(final String addPath) {
        // addPath 파라미터 선언
        // uploadFile()의 변수 uploadPath에서 호출하는 메소드로 기본 업로드 경로에 오늘 날짜(today)를 연결하는 용도로 사용
        return makeDirectories(uploadPath + File.separator + addPath);
    }

    // 경로에 해당하는 폴터가 없으면 path에 해당되는 모든 경로에 폴더를 생성
    private String makeDirectories(final String path) {
        File dir = new File(path);
        if(dir.exists() == false) {
            dir.mkdir();
        }
        return dir.getPath();
    }
}

