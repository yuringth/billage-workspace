package com.bi.billage.common.email;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class RunEmail {

	public static JavaMailSenderImpl sender;	// 전송도구
	
	public static void main(String[] args) {
		
		JavaMailSenderImpl impl = new JavaMailSenderImpl();
		
		// - 메일을 보내는 계정을 설정
		impl.setHost("smtp.gmail.com");
		impl.setPort(587);
		impl.setUsername("toandboy@gmail.com");		// 보내는 이메일 주소
		impl.setPassword("animukgwvmiziiil");		// 메일 패스워드
		
		// 옵션 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable", true);
		
		impl.setJavaMailProperties(prop);
		
		sender = impl;
		
		// 메시지 생성
		SimpleMailMessage message = new SimpleMailMessage();
		
	}

}
