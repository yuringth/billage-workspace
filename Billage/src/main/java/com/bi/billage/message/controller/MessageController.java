package com.bi.billage.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.message.model.service.MessageService;
import com.bi.billage.message.model.vo.Message;
import com.bi.billage.user.model.vo.User;
import com.google.gson.Gson;

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
	@ResponseBody
	@RequestMapping(value="read.ms", produces="application/json; charset=UTF-8;")
	public String updateMessage(Message message) {
		
		int result = messageService.updateMessage(message) > 0 ? 1 : 0 ;
		
		return new Gson().toJson(result);
	}
	
	
	
	@RequestMapping("sendList.ms")
	public String messageSendList() {
		return "message/messageSendListView";
	}
	@RequestMapping("sendForm.ms")
	public String messageSendForm() {
		return "message/messageSendForm";
	}
	
	
}
