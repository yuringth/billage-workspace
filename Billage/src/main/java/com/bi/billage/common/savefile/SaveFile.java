package com.bi.billage.common.savefile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {

	public static String getSaveFile(MultipartFile upfile, HttpSession session) {
		
		 // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
			
			// 파일명 수정 작업 후 서버에 업로드 시키기("image.png" =. 202212123141.png)
			// "20221226103530" (년월일시분초)
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String originName = upfile.getOriginalFilename();
			
			// 12321(5자리 랜덤값)
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			// 확장자
			String ext = originName.substring(originName.lastIndexOf(".")); // 마지막 .을 기준으로 뒤에만 자르겠다
			
			String changeName = "resources/uploadFiles/"+ ranNum + ext; //변경된 파일 이름
			
			// 업로드시키고자하는 폴더의 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
			
			try {
				upfile.transferTo(new File(savePath + changeName)); //서버에 파일을 업로드 해주는 메소드 파일경로랑 이름을 적어야한다 (실질적으로 업로드 하는 녀석)
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
		}
}
