package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MypageDAO;
import com.seoulmate.home.vo.ApplyInviteVO;
import com.seoulmate.home.vo.ChatRoomVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;
@Service
public class MypageServiceImp implements MypageService {
	@Inject
	MypageDAO dao;

	@Override
	public int likemarkInsert(int no, String userid, String category) {
		// 찜 등록
		return dao.likemarkInsert(no, userid, category);
	}

	@Override
	public int likemarkDelete(int no, String userid) {
		// 찜 삭제하기
		return dao.likemarkDelete(no, userid);
	}

	@Override
	public List<LikeMarkVO> likemarkAllRecord(String category, String userid) {
		// 찜 목록 출력
		return dao.likemarkAllRecord(category, userid);
	}

	@Override
	public String[] getLikedNumber(String userid) {
		// 사용자의 찜목록
		return dao.getLikedNumber(userid);
	}

	@Override
	public HouseWriteVO getHousedetails(int no) {
		// 하우스
		return dao.getHousedetails(no);
	}

	@Override
	public HouseRoomVO getMinRentDeposit(int no) {
		// min rent, min deposit
		return dao.getMinRentDeposit(no);
	}

	@Override
	public MateWriteVO getMatedetails(int no) {
		// 메이트
		return dao.getMatedetails(no);
	}

	public int houseConfirm(String userid) {
		return dao.houseConfirm(userid);
	}
	@Override
	public List<HouseWriteVO> myPageHouseWriteSelect(String userid) {
		return dao.myPageHouseWriteSelect(userid);
	}
	@Override
	public int mateConfirm(String userid) {
		return dao.mateConfirm(userid);
	}
	@Override
	public MateWriteVO myPageMateWriteSelect(String userid) {
		return dao.myPageMateWriteSelect(userid);
	}
	@Override
	public int likeMarkConfirm(String userid) {
		return dao.likeMarkConfirm(userid);
	}
	@Override
	public List<LikeMarkVO> likeMarkSelect(String userid) {
		return dao.likeMarkSelect(userid);
	}
	@Override
	public HouseWriteVO houseLikeSelect(int no) {
		return dao.houseLikeSelect(no);
	}

	@Override
	public MateWriteVO mateLikeSelect(int no) {
		return dao.mateLikeSelect(no);
	}



	//팝업
	@Override
	public List<ApplyInviteVO> applyInviteSelect(ApplyInviteVO aiVO) {
		// 메이트확인. 받은초대, 보낸신청 (userid)
		// 하우스확인. 받은신청, 보낸초대 (no)
		return dao.applyInviteSelect(aiVO);
	}
	// 메이트 글 vo받아오는거는 myPageMateWriteSelect사용하여 받기,
	// 하우스 글 vo받아오기
	@Override
	public HouseWriteVO oneHouseWriteSelect(int no) {
		return dao.oneHouseWriteSelect(no);
	}
	//보낸신청, 보낸초대 삭제.
	@Override
	public int mypageApplyInviteCancel(ApplyInviteVO aiVO) {
		return dao.mypageApplyInviteCancel(aiVO);
	}
	//받은신청, 받은초대 - 승인
	@Override
	public int applyInviteApproveUpdate(ApplyInviteVO aiVO) {
		return dao.applyInviteApproveUpdate(aiVO);
	}
	// 승인 후 housename, userid 가져오기.
	@Override
	public HouseWriteVO chatHouseSelect(int no) {
		return dao.chatHouseSelect(no);
	}
	// 채팅 DB 데이터 확인.
	@Override
	public ChatRoomVO chatCheck(String chatuser1, String chatuser2) {
		return dao.chatCheck(chatuser1, chatuser2);
	}
	// 승인 후 채팅 insert
	@Override
	public int chatInsert(String name, String chatuser1, String chatuser2) {
		return dao.chatInsert(name, chatuser1, chatuser2);
	}
	// 채팅 name update
	@Override
	public int chatUpdate(ChatRoomVO crVO) {
		return dao.chatUpdate(crVO);
	}
	//하우스명이 채팅방 네임에 있는지 확인.
	@Override
	public int chatCheckName(String name, String chatuser1, String chatuser2) {
		return dao.chatCheckName(name, chatuser1, chatuser2);
	}
	//하우스인지, 메이트인지 확인.
	@Override
	public int noConfirmHouseOrMate(int no, String msg) {
		return dao.noConfirmHouseOrMate(no, msg);
	}
	//pno확인
	@Override
	public int pnoConfirm(String userid, String pcase) {
		return dao.pnoConfirm(userid, pcase);
	}
	//매칭완료로 변경
	@Override
	public int stateCompleteUpdate(String tableName, String stateName, String no, String userid) {
		return dao.stateCompleteUpdate(tableName, stateName, no, userid);
	}

	@Override
	public String[] getUsersHouseWriteNum(String userid) {
		// 로그인 사용자 하우스 글 번호 가져오기
		return dao.getUsersHouseWriteNum(userid);
	}

	@Override
	public String[] getUsersMateWriteNum(String userid) {
		// 로그인 사용자 메이트 글 번호 가져오기
		return null;
	}


}
