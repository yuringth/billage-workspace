package com.bi.billage.rent.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RentBoard {

	private int rentNo;				// 대여게시글 번호
	private int userNo;				// 빌려주는 회원 번호(글 작성자)
	private int rentUserNo;			// 빌리는 회원 번호(책 대여를 원하는 사람)
	private String rentTitle;		// 대여게시글 제목
	private String rentContent;		// 대여게시글 내용
	private int rentPoint;			// 요구포인트(글 작성자가 원하는만큼)
	private Date createDate;		// 대여게시글 작성날
	private String rentDate;		// 대여 시작날짜
	private String dueDate;			// 반납 날짜
	private String rentStatus;		// 반납상태(디폴트 'N', 반납완료되면 'Y')
	private String rentBookTitle;	// 대여 책 이름
	private String status;			// 대여게시판에서 글 상태
	private String changeName;		// changeName
}
