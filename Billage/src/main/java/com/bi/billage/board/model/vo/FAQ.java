package com.bi.billage.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class FAQ {
	
	private int faqNo;			//	FAQ_NO	NUMBER
	private int userNo;			//	USER_NO	NUMBER
	private String faqType;		//	FAQ_TYPE	VARCHAR2(20 BYTE)
	private String faqTitle;	//	FAQ_TITLE	VARCHAR2(1000 BYTE)
	private String faqAnswer;	//	FAQ_ANSWER	VARCHAR2(4000 BYTE)
	private Date enrollDate;	//	ENROLL_DATE	DATE

}
