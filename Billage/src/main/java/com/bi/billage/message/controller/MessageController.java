package com.bi.billage.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.message.model.service.MessageService;
import com.bi.billage.message.model.vo.Message;
import com.bi.billage.user.model.vo.User;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("list.ms")
	public ModelAndView messageList(HttpSession session, ModelAndView mv) {
		
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Message> messageList = messageService.selectMessageList(userNo);
		
		mv.addObject("msgList", messageList);
		mv.setViewName("message/messageListView");
		return mv;
		
	}
	
	/*
	 * 메세지 상세보기 버튼 클릭 시 읽음 표시로 messageStatus 상태값 1로 update 해야 함 
	 */
	
	@RequestMapping("sendList.ms")
	public String messageSendList() {
		return "message/messageSendListView";
	}
	@RequestMapping("sendForm.ms")
	public String messageSendForm() {
		return "message/messageSendForm";
	}
	
	
}
