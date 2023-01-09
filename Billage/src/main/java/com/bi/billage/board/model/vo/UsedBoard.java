package com.bi.billage.board.model.vo;

import lombok.Data;

@Data
public class UsedBoard {

	private int usedNo; // 중고글 번호 USED_NO	NUMBER
	private int userNo; // 회원 번호 USER_NO	NUMBER
	private String usedTitle; // USED_TITLE	VARCHAR2(50 BYTE)
	private String usedContent; //USED_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private String usedStatus; //USED_STATUS	VARCHAR2(2 BYTE)
	private int count; //COUNT	NUMBER
	private int point; //POINT	NUMBER
	private String stockStatus; // STOCK_STATUS	VARCHAR2(2 BYTE)
	private String bookGenre; //BOOK_GENRE	VARCHAR2(50 BYTE)
	private String bookAuthor; //BOOK_AUTHOR	VARCHAR2(50 BYTE)
	private String bookTitle; //BOOK_TITLE	VARCHAR2(50 BYTE)
	private String originName; //ORIGIN_NAME	VARCHAR2(4000 BYTE)
	private String changeName; //CHANGE_NAME	VARCHAR2(4000 BYTE)
	
}
