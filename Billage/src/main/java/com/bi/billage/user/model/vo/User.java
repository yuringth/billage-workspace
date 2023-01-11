package com.bi.billage.user.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
	
	
	private int userNo;				// 회원번호 
	private String userId;			// 회원아이디
	private String userPwd;			// 회원비밀번호
	private String nickname;		// 회원닉네임
	private String name;			// 회원이름	
	private String phone;			// 회원전화번호 
	private String address;			// 회원주소
	private String detailAddress;	// 회원상세주소 
	private String email;			// 회원이메일 
	private Date enrollDate;		// 회원가입날짜 
	private String userGrade;		// 회원등급 (1.관리자/ 2.작가/ 3,4,5 일반회원)
	private String profileImg;		// 회원프로필사진(없을 시 기본이미지)
	private String birthDate;		// 회원생년월일 
	private String gender;			// 회원성별
	private String status;			// 탈퇴여부
	private int following; 			// 팔로잉 수
	private int follower;				// 팔로워 수 
	
	private int point; 				// 포인트
}
