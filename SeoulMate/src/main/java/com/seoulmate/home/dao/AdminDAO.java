package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.PayVO;

public interface AdminDAO {
	// 회원 목록 출력
	public List<String> memberSelect();
	
	// 결제관리 페이지 리스트 가져오기 
	public List<PayVO> payAllListSelect();
}
