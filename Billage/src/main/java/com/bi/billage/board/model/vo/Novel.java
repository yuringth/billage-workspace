package com.bi.billage.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Novel {
	
	private int novelNo; //NOVEL_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private String novelTitle; //NOVEL_TITLE	VARCHAR2(1000 BYTE)
	private String novelDisplay; //NOVEL_DISPLAY	VARCHAR2(1000 BYTE)
	private Date startDate; //START_DATE	DATE
	private int count; //COUNT	NUMBER
	private int heart; //LIKE	NUMBER
	private String serialStatus; //SERIAL_STATUS	VARCHAR2(10 BYTE)
	private String chargeStatus; //CHARGE_STATUS	VARCHAR2(10 BYTE)
	private String nickName;//
	private String originName;
	private String changeName;
}
