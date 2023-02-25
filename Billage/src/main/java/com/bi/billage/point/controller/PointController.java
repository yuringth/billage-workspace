package com.bi.billage.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;

@Controller
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	@RequestMapping("addpoint")
	public String addPoint(Point p, ModelAndView mv) {
		
		if(p.getPointAdd() != 0) { // add포인트가 0이 아닐 경우에만 실행
			if(pointService.addPoint(p) > 0) {// 성공 
				return "main";
			} else { // 실패
				mv.addObject("errorMsg", "포인트 등록 실패했어용 ㅠ");
				return "common/errorPage";
			}
		} 
		return "main";
	}
	
	@RequestMapping("selectPoint")
	public int selectPoint(int userNo) {
		return pointService.selectPoint(userNo);
	}
	
	
	/*
	//유림 리뷰 등록시 10포인트 적립되게 하고싶은디
	@RequestMapping("addBookPoint")
	public String addBookPoint(Point p, ModelAndView mv) {
		return piontService.addBookPoint
		
	}
	*/
	
	
	
	
	
	
	
	
}
