package com.bi.billage.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Novel {
	
	private Integer novelNo; //NOVEL_NO	NUMBER
	private Integer userNo; //USER_NO	NUMBER
	private String novelTitle; //NOVEL_TITLE	VARCHAR2(1000 BYTE)
	private String novelDisplay; //NOVEL_DISPLAY	VARCHAR2(1000 BYTE)
	private Date startDate; //START_DATE	DATE
	private Integer count; //COUNT	NUMBER
	private Integer heart; //LIKE	NUMBER
	private String serialStatus; //SERIAL_STATUS	VARCHAR2(10 BYTE)
	private String chargeStatus; //CHARGE_STATUS	VARCHAR2(10 BYTE)
	private String nickName;//
	private String originName;
	private String changeName;
}
