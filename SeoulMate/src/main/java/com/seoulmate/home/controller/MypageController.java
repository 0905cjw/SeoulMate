package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MypageService;
@Controller
public class MypageController {
	@Inject
	MypageService service;
	
	//마이페이지 하우스&메이트 관리 
	@RequestMapping("/myHouseAndMateList")
	public ModelAndView myHouseAndMateList() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("mypage/myHouseAndMateList");
		return mav;
	}
	
	//마이페이지 찜목록
	@RequestMapping("/likeMarkerList")
	public ModelAndView likeMarkerList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/likeMarkerList");
		return mav;
	}
	//마이페이지 결제내역 확인 페이지
	@RequestMapping("/payDetailList")
	public ModelAndView payDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/payDetailList");
		return mav;
	}
	//마이페이지 보낸초대 목록 
	@RequestMapping("/sendInviteList")
	public ModelAndView sendInviteList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/sendInviteList");
		return mav;
	}
	//마이페이지 받은신청 목록
	@RequestMapping("/takeRequestList")
	public ModelAndView takeRequestList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/takeRequestList");
		return mav;
	}
}
