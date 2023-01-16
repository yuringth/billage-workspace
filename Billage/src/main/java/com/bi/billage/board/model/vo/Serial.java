package com.bi.billage.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Serial {
	
	private String serialNo; // SERIAL_NO	NUMBER
	private Integer novelNo; // NOVEL_NO	NUMBER
	private String serialTitle; // SERIAL_TITLE	VARCHAR2(30 BYTE)
	private String serialContent; // SERIAL_CONTENT	VARCHAR2(4000 BYTE)
	private Date uploadDate; // UPLOAD_DATE	DATE
	private Integer starRating; // STAR_RATING	NUMBER
	private String authorComment; // AUTHOR_COMMENT	VARCHAR2(200 BYTE)
	private Integer userNo; // USER_NO	NUMBER
	private String novelTitle;
	private String nickName;
	private String novelDisplay;
	private String novelImg;
	private Integer count;
	private int rownum;

}
