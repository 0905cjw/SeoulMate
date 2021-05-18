package com.seoulmate.home.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MypageService;
import com.seoulmate.home.vo.ApplyInviteVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;
@Controller
public class MypageController {
	@Inject
	MypageService service;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//마이페이지 하우스&메이트 관리 
	@RequestMapping("/myHouseAndMateList")
	public ModelAndView myHouseAndMateList(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		//기본 하우스로 세팅.
		String msg = "";
		msg = (String)req.getAttribute("msg");
		
		//1. 세션아이디, 등급(일반 /프리미엄) 
		String userid = (String)session.getAttribute("logId");
		List<HouseWriteVO> hwList = new ArrayList<HouseWriteVO>();
		
		//1. 하우스로 등록된 성향으로 작성된 글이 있는지 확인.
		if( service.houseConfirm(userid)>0) {
			//1개이상 작성된 글이 있는 경우. 
			//1-1. 후 목록 가져오기 (모집중이 아닌것도 모두 가져온다,) 
			hwList = service.myPageHouseWriteSelect(userid);
			mav.addObject("hwList", hwList);
	System.out.println(hwList.size());
			if(msg==null || msg.equals("")) {
				msg = "house";
			}
		}
		
		//2. 메이트로 등록된 성향+글이 있는지 확인. 
		MateWriteVO mwVO = new MateWriteVO();
		if(service.mateConfirm(userid)>0) {
			//2-1. 후 목록 가져오기
			mwVO= service.myPageMateWriteSelect(userid);
			mav.addObject("mwVO", mwVO);
			// 하우스 글이 없을 경우엔 mate로 메세지 변경.
			if(msg==null || msg.equals("")) {
				msg = "mate";
			}
		}
		//3, likemark가 있는 지 확인. 
		if(service.likeMarkConfirm(userid)>0) {
			//3. likemark List 확인. (lno, no, category(하우스 or 메이트) 
			 List<LikeMarkVO> lmConfirm = service.likeMarkSelect(userid);
			int no=0;
			String category = "";
			if(lmConfirm.size()>0) {
				for(int i=0; i<lmConfirm.size(); i++) {
					no = lmConfirm.get(i).getNo();
					category = lmConfirm.get(i).getCategory();
					if(category.equals("하우스")){
						// 하우스일경우엔 houseWriteVO 를 넣는다. 
						List<HouseWriteVO> houseLikeList = new ArrayList<HouseWriteVO>();
						//하우스를 찜 했을 경우. 
						houseLikeList.add(service.houseLikeSelect(no));
						mav.addObject("houseLikeList", houseLikeList);
					}else if(category.equals("메이트")){
						// 메이트글 일경우엔 mateWriteVO를 넣는다.
						List<MateWriteVO> mateLikeList = new ArrayList<MateWriteVO>();
						//메이트를 찜 했을 경우
						mateLikeList.add(service.mateLikeSelect(no));
						mav.addObject("mateLikeList", mateLikeList);
					}
				}
			}	
		}  
		if(msg==null || msg.equals("")) {
			msg = "house";
		}
		System.out.println(msg);
		mav.addObject("msg", msg);
		mav.setViewName("mypage/myHouseAndMateList");
		return mav;
	}
	//마이페이지 팝업 
	@RequestMapping(value="/mypagePopup", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> mypagePopup(int no, String msg, HttpServletRequest req){
		Map<String, Object> result = new HashMap<String, Object>();
		ApplyInviteVO aiVO = new ApplyInviteVO();
		aiVO.setNo(no);
		aiVO.setMsg(msg);
		aiVO.setUserid((String)req.getSession().getAttribute("logId"));
		
		List<ApplyInviteVO> aiList = new ArrayList<ApplyInviteVO>();
		aiList =  service.applyInviteSelect(aiVO);
		if(aiList.size()>0) {
			result.put("aiList", aiList);
			// 하우스 기준
			if(msg.equals("takeApply") || msg.equals("sendInvite")) {
				//받은 신청  // 보낸초대 
				List<MateWriteVO> pop_mwVO = new ArrayList<MateWriteVO>();
				for(int i=0; i<aiList.size(); i++) {
					pop_mwVO.add(service.myPageMateWriteSelect(aiList.get(i).getUserid()));
				}
				result.put("pop_mwVO", pop_mwVO);
			}//메이트 기준
			else if(msg.equals("takeInvite") || msg.equals("sendApply")) {
				List<HouseWriteVO> pop_hwVO = new ArrayList<HouseWriteVO>();
				//받은초대  or 보낸 신청
				// list값 중에서 no를 사용하여 리스트를 가져온다.  
				for(int i=0; i<aiList.size(); i++) {
					pop_hwVO.add(service.oneHouseWriteSelect(aiList.get(i).getNo()));
				}
				result.put("pop_hwVO", pop_hwVO);
			}
		}
		return result;
	}
	//마이페이지 보낸신청, 보낸초대 취소 ,  받은신청, 받은초대- 거절
	@RequestMapping(value="/mypageApplyInviteCancel", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public int mypageApplyInviteCancel(int no, String msg, String userid) {
		ApplyInviteVO aiVO = new ApplyInviteVO();
		aiVO.setNo(no);
		aiVO.setMsg(msg);
		aiVO.setUserid(userid);
		//sendInvite 보낸초대 취소 (house -> mate 초대를 취소함) 
		 	// no=본인글 , userid='초대받은사람 ', state='초대 '
		// takeApply 받은 신청 거절 (mate -> house 신청을 거절 함)
			 // no=본인글 , userid='신청한사람', state='신청'
		//sendApply 보낸신청 취소  (mate -> house 신청을 취소함)
			// no=신청한 하우스글,  userid=본인아이디, state='신청'
		// takeInvite 받은초대 거절 (house->mate 초대를 거절함) 
			// no=날초대한 하우스글, userid=본인아이디, state='초대'
		
		// 신청자 본인 아이디와 글번호를 확인하여 삭제. 
		return service.mypageApplyInviteCancel(aiVO);
	}
	//마이페이지 받은신청, 받은초대 승인
	@RequestMapping(value="/applyInviteApprove", method = {RequestMethod.POST, RequestMethod.GET})
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	@ResponseBody
	public int applyInviteApprove(int no, String userid, String msg, HttpSession session) {
		ApplyInviteVO aiVO = new ApplyInviteVO();
		aiVO.setNo(no);
		aiVO.setMsg(msg);
		aiVO.setUserid(userid);
		
		int inResult = 0;
		String name = "";
		int cnt = 0;
		// 트랜잭션
		DefaultTransactionDefinition def=new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		try {
			int result = service.applyInviteApproveUpdate(aiVO);
			// 승인 완료 후 
			if(result>0) {
				//채팅방 insert 
				HouseWriteVO hwVO = service.chatHouseSelect(no);
				System.out.println("hwVO housename" + hwVO.getHousename());
				name = hwVO.getHousename() +" ("+userid+")";
		System.out.println("채팅방이름 = " + name);
				if(msg.equals("takeApply")) {
					//받은신청// 신청 승낙했다. 세션 에있는 아이디가 나 (=글쓴이) , 신청햇던사람은 현재userid
					String chatuser1 = (String)session.getAttribute("logId");
					// DB에 있는 정보인지 확인
					cnt = service.chatCheck(name, chatuser1, userid);
					if(cnt>0) {
						//받은 신청에 이미 채팅방이 있다
						inResult = 200;
						transactionManager.commit(status);
					}else {
						//채팅방이 없다 -> 개설한다. 
						//1. name 받아오기,   2.chatuser1 = 수락한사람, 3.chatuser2 = 신청한사람 (나머지 디폴트 = 0)
						//name 은 하우스글 이름
						// no를 이용해서 해당유저아이디, 해당 하우스네임 가져오기 . 
													//					 housewrite글쓴이,  신청자(메이트) 
						inResult = service.chatInsert(name, chatuser1, userid);
					}
				}else if(msg.equals("takeInvite")) {
					cnt = service.chatCheck(name, hwVO.getUserid(), userid);
		System.out.println("cnt = "+cnt +"채팅방이 있는지 확인");
					if(cnt>0) {
						//받은 초대에 이미 채팅방이 있다
						inResult = 200;
						transactionManager.commit(status);
					}else if(cnt==0){
						//채팅방이 없다 -> 개설한다. 
						//받은 초대// 초대를 승낙했다. 승낙한사람 = 현재 userid,  승낙한 글번호 = no -> no를 이용하여 해당유저아이디 셀렉트 
						//1. 글번호의 userid 가져오기     //본인 초대한하우스   	 //하우스글쓴이      메이트본인 	
						inResult = service.chatInsert(name, hwVO.getUserid(), userid);
					}
				}
			}	
		}catch (Exception e) {
			e.printStackTrace();
			//초대, 신청 승낙 및 채팅방 insert 에러 발생 
			System.out.println("초대, 신청 승낙 및 채팅방 insert 에러 발생 ");
			inResult = -1; 
		}
		return inResult;
	}
	//찜 등록
	@RequestMapping("/likemarkInsert")
	@ResponseBody
	public int likemarkInsert(int no, String userid, String category) {
		return service.likemarkInsert(no, userid, category);
	}
	//마이페이지 결제내역 확인 페이지
	@RequestMapping("/payDetailList")
	public ModelAndView payDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/payDetailList");
		return mav;
	}
}
