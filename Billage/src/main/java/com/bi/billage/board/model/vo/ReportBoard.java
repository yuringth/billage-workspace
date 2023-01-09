package com.bi.billage.board.model.vo;

import lombok.Data;

@Data
public class ReportBoard {
	
	private int ReportNo;//REPORT_NO
	private int userNo;//USER_NO
	private String reportTitle;//REPORT_TITLE
	private String reportCategory;//REPORT_CATEGORY
	private String reportContent;//REPORT_CONTENT
	private String reportDate;//REPORT_DATE
	private String reportStatus;//REPORT_STATUS
	private int boardNo;
	private String nickName;
}
