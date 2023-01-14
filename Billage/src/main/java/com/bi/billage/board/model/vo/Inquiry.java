package com.bi.billage.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Inquiry {
	
	private Integer inqNo; // INQ_NO	NUMBER
	private Integer userNo; // USER_NO	NUMBER
	private String inqTitle; // INQ_TITLE	VARCHAR2(1000 BYTE)
	private String inqContent; // INQ_CONTENT	VARCHAR2(4000 BYTE)
	private String inqType; // INQ_TYPE	VARCHAR2(100 BYTE)
	private Date inqDate; // INQ_DATE	DATE
	private String inqStatus; // INQ_STATUS	VARCHAR2(1 BYTE)
	private String nickname;
	private String answer;

}
