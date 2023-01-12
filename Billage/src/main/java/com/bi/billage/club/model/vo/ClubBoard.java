package com.bi.billage.club.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ClubBoard {

	private int clubBoNo; //CLUB_BO_NO	NUMBER
	private String userNo; //USER_NO	NUMBER
	private String clubNo; // CLUB_NO	NUMBER
	private String clubBoContent; //CLUB_BO_CONTENT	VARCHAR2(4000 BYTE)
	private String clubBoOriginname; //CLUB_BO_ORIGINNAME	VARCHAR2(4000 BYTE)
	private String clubBoChangname; // CLUB_BO_CHANGNAME	VARCHAR2(4000 BYTE)
	private String clubBoTitle; //CLUB_BO_TITLE	VARCHAR2(1000 BYTE)
	private String clubBoCategory; //CLUB_BO_CATEGORY	VARCHAR2(100 BYTE)
	private String clubBoFixed; //CLUB_BO_FIXED	VARCHAR2(1 BYTE)
	private Date clubBoCreatedate; //CLUB_BO_CREATEDATE	DATE
	private String clubBoStatus; //CLUB_BO_STATUS	VARCHAR2(1 BYTE)
}
