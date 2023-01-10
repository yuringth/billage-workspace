package com.bi.billage.common.savefile;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {

	public static String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Dat());
		
		return "";
	}
	
}
