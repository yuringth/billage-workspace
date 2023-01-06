package com.bi.billage.message.controller;

import org.springframework.stereotype.Controller;

@Controller
public class MessageController {
	
	@RequestMapping("list.ms")
	public String messageList() {
		return "message/messageListView";
	}
}
