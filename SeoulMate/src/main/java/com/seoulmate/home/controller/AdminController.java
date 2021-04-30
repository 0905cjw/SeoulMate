package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.AdminService;
import com.seoulmate.home.vo.MemberVO;


@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	//신고관리
	@RequestMapping("/admin/reportManagement")
	public String adminReport() {
		//DB에서 데이터 조회
		
		//페이징
		
		return "/admin/reportManagement";
	}
	///////////////////////////////////////////////////////
	//관리자-회원
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", service.memberSelect());
		mav.setViewName("admin/memberManagement");
		return mav;
	}
	
	@RequestMapping("/admin/memberInfo")
	@ResponseBody
	public MemberVO memberInfo(String userid) {
		MemberVO vo=service.memberInfo(userid);
		
		return vo;
	} 
	///////////////////////////////////////////////////////
	
	//관리자 - 쉐어하우스 
	@RequestMapping(value="/admin/houseManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView houseManagement() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/houseManagement");
		return mav;
	}
	//관리자 - 하우스메이트 
	@RequestMapping(value="/admin/mateManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mateManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/mateManagement");
		return mav;
	}
	//관리자 - 결제 
	@RequestMapping(value="/admin/payManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payManagement() {
		ModelAndView mav = new ModelAndView();
		
		// 1.결제 목록 DB에서 가져오기
		
		
		mav.setViewName("admin/payManagement");
		return mav;
	}
	//관리자 - 매출
	@RequestMapping(value="/admin/salesManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView salesManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/salesManagement");
		return mav;
	}
	//문의 관리
	@RequestMapping("/admin/contactManagement")
	public String contactManagement() {
		return "/admin/contactManagement";
	}
}
