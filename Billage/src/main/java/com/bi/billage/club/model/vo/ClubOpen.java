package com.bi.billage.club.model.vo;

import lombok.Data;

@Data
public class ClubOpen {

	private int openNo; //OPEN_NO	NUMBER
	private int clubNo; //CLUB_NO	NUMBER
	private String openTitle; //OPEN_TITLE	VARCHAR2(1000 BYTE)
	private String openLocation; //OPEN_LOCATION	VARCHAR2(500 BYTE)
	private String openDate; //OPEN_DATE	VARCHAR2(1000 BYTE)
	private String openTime; //OPEN_TIME	VARCHAR2(1000 BYTE)
	private int openLimit; //OPEN_LIMIT	NUMBER
	private String openStatus; //OPEN_STATUS	VARCHAR2(1 BYTE)
	
	private int userNo;
	private String nickname;
	private String clubName;
	private int openMemCount;
	
}


/*
 *
 * 
 * 				C.CLUB_NO
		       ,C.USER_NO
		       ,C.NICKNAME
		       ,C.CLUB_NAME
		       ,C.OPEN_NO
		       ,C.OPEN_TITLE
		       ,C.OPEN_LOCATION
		       ,C.OPEN_DATE
		       ,C.OPEN_TIME
		       ,C.OPEN_LIMIT
		       ,C.OPEN_STATUS   
		       ,COUNT(OM.OPEN_NO) "OPEN_MEM_COUNT"
 * 
 * 
 * 
 */