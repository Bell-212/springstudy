package com.gdu.app13.util;

import java.time.LocalDate;
import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class MyFileUtil {

  // 파일이 저장될 경로 반환하기
  public String getPath() {
    /*   /storage/yyyy/MM/dd   */
    // 오늘날짜 구하기
    LocalDate today = LocalDate.now();
    //  경로 반환                                       2자리 정수 모자르면 0채움
    return "/storage/" + today.getYear() + "/" + String.format("%02d", today.getMonthValue()) + "/" + String.format("%02d", today.getDayOfMonth());
//  return "/storage/" + DateTimeFormatter.ofPattern("yyyy/MM/dd").format(today);
  }
  
  // 파일이 저장될 이름 반환하기
  public String getFilesystemName(String originalName) {
    
    /*  UUID.확장자  */
    
    String extName = null;
    if(originalName.endsWith("tar.gz")) {  // 확장자에 마침표가 포함되는 예외 경우를 처리한다.
      extName = "tar.gz";
    } else {
      String[] arr = originalName.split("\\.");  // 정규식에서 "." 는 "모든문자"이므로 [.] 또는 \\. 사용
      extName = arr[arr.length - 1];
    }
    return UUID.randomUUID().toString().replace("-", "") + "." + extName;
    
  }
}
