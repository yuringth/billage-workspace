package com.bi.billage.common.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @Builder @AllArgsConstructor
public class CertVo {
	private String who;
	private String seceret;
	private String when;
}
