package com.bi.billage.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@RequestMapping("list.ms")
	public String messageList() {
		return "message/messageListView";
	}
}
