package com.bi.billage.group.model.vo;

import java.sql.Date;

import lombok.Data;

@Data	
public class Group {
	
	private int groupNo; //GROUP_NO	NUMBER
	private String userNo; //USER_NO	NUMBER
	private String groupTitle; // GROUP_TITLE	VARCHAR2(300 BYTE)
	private String groupNum; // GROUP_NUM	NUMBER
	private Date groupCreatedate; //GROUP_CREATEDATE	DATE
	private String groupDescribe; //GROUP_DESCRIBE	VARCHAR2(3000 BYTE)
	private String groupDay; // GROUP_DAY	VARCHAR2(3 BYTE)
	private String groupLocation; //GROUP_LOCATION	VARCHAR2(100 BYTE)
	private String groupStatus; // GROUP_STATUS	VARCHAR2(1 BYTE)
	private String groupImg; // GROUP_IMG	VARCHAR2(3000 BYTE)
	
}
