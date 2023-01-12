package com.bi.billage.board.model.vo;

import lombok.Data;

@Data
public class ReviewBoard {

	private int reviewNo; //REVIEW_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private int reviewStar; // REVIEW_STAR	NUMBER
	private String reviewTitle; //REVIEW_TITLE	VARCHAR2(50 BYTE)
	private String reviewContent; // REVIEW_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private int count; //COUNT	NUMBER
	private String reviewStatus; //REVIEW_STATUS	VARCHAR2(1 BYTE)
	private String bookTitle; // BOOK_TITLE	VARCHAR2(1000 BYTE)
	private String bookAuthor; // BOOK_AUTHOR	VARCHAR2(1000 BYTE)
	private String bookGenre; //BOOK_GENRE	VARCHAR2(50 BYTE)
	private String bookImag; //BOOK_IMAG	VARCHAR2(4000 BYTE)
	private int bookPoint; //BOOK_POINT	NUMBER
	private int bookNo; //BOOK_NO	NUMBER
	private String bookPublisher; // 출판사
	
}
