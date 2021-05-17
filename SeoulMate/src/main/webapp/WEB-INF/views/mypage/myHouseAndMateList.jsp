<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/hyun.css">
<script>
	function myPage_Popup(popupId){
		//팝업 클릭시에 popup id를 받아와서 해당 popup div 띄워주기
		$('#myPage_popup_FullScreen').removeClass('popup_hidden');
		$('body').addClass('popup_Stop_Scroll');
		console.log(popupId);
		if(popupId=='popup_TakeApply'){
			$("#popup_TakeApply").removeClass('popup_hidden');
		}if(popupId=='popup_SendApply'){
			$("#popup_SendApply").removeClass('popup_hidden');
		}if(popupId=='popup_TakeInvite'){
			$("#popup_TakeInvite").removeClass('popup_hidden');
		}if(popupId=='popup_SendInvite'){
			$("#popup_SendInvite").removeClass('popup_hidden');
		}
	}
	$(function(){
		$(document).on('click', '.popup_Close', function(){
			$('#myPage_popup_FullScreen').addClass('popup_hidden');
			$(".myPage_HouseAndMate_Popup").addClass('popup_hidden');
			$('body').removeClass('popup_Stop_Scroll');
		});
		// house => 받은신청, 보낸초대  ///  mate => 받은초대, 보낸신청 
		$(document).on('click', '.mypage_Popup', function(){
			var no = $(this).parent().children().eq(0).val();
			var msg = '';
			// 하우스 기준.
			if($(this).hasClass("takeApply")){ // 받은 신청을 누른 경우
				msg = 'takeApply';
			}else if($(this).hasClass("sendInvite")){ // 보낸 초대를 누른경우
				msg='sendInvite';
			}// 메이트 기준 
			else if($(this).hasClass("takeInvite")){ // 받은 초대를 누른 경우
				msg='takeInvite';
			}else if($(this).hasClass("sendApply")){ // 보낸 신청을 누른경우
				msg='sendApply';
			}
			var url = '/home/mypagePopup'
			var data = {'no':no, 'msg':msg};
			
			$.ajax({
				url:url,
				data : data,
				success : function(result){
					console.log(result);
					$mwVOList = $(result.pop_mwVO);
					
					var tag = '';
					if(msg == 'takeApply'){
						//받은 신청 (리턴값 mate정보 리스트)
						//1.  #popup_TakeApply 자식 eq1안에있는 거 지우기.. 
						$('#popup_TakeApply').children().eq(1).empty();
						//2. 포문돌려서 tag 만들어 넣기. 
						
						//1. #popup_TakeApply 의 popup_hidden 클래스 지워서 띄우기. 
					}else if(msg=='sendInvite'){
						//보낸 초대 (리턴값 mate정보 리스트)
						
					}else if(msg=='takeInvite'){
						//받은 초대 (리턴값 house정보 리스트)
						
					}else if(msg=='sendApply'){
						//보낸 신청 (리턴값 house정보 리스트)
						
					}
				}, error : function(){
					console.log('마이페이지 팝업 데이터 불러오기 실패');
				}
			});
		});
	});
	function viewMyHouseAndMateList(msg){
		// msg = house, mate, likemark
		if(msg=='house'){
			$('.mypage_HouseList').addClass('on');
			$('.mypage_Mate').removeClass('on');
			$('.mypage_likeMarkList').removeClass('on');
			
			$('#myPage_HouseList').removeClass('objectHidden');
			$('#myPage_MateList').addClass('objectHidden');
			$('#myPage_LikeMarkerList').addClass('objectHidden');
		}else if(msg=='mate'){
			$('.mypage_HouseList').removeClass('on');
			$('.myPage_MateList').addClass('on');
			$('.mypage_likeMarkList').removeClass('on');
			
			$('#myPage_HouseList').addClass('objectHidden');
			$('#myPage_MateList').removeClass('objectHidden');
			$('#myPage_LikeMarkerList').addClass('objectHidden');
		}else if(msg=='likemark'){
			$('.mypage_HouseList').removeClass('on');
			$('.mypage_Mate').removeClass('on');
			$('.mypage_likeMarkList').addClass('on');
			
			$('#myPage_HouseList').addClass('objectHidden');
			$('#myPage_MateList').addClass('objectHidden');
			$('#myPage_LikeMarkerList').removeClass('objectHidden');
		}
	}
	
	</script>
	<div class="wrap">
		<section class="content" > <!-- id="myPage_HouseAndMate_Content" -->
			<p class="m_title">하우스&메이트 관리</p>
			<ul class="content_menu" id="myPage_HouseAndMate_menu">
			<c:choose>
				<c:when test="${msg=='house'}">
					<li><a href="javascript:viewMyHouseAndMateList('house')" class="mypage_HouseList on">쉐어하우스</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:viewMyHouseAndMateList('house')" class="mypage_HouseList">쉐어하우스</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${msg=='mate'}">
					<li><a href="javascript:viewMyHouseAndMateList('mate')" class="mypage_Mate on">하우스메이트</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:viewMyHouseAndMateList('mate')" class="mypage_Mate">하우스메이트</a></li>
				</c:otherwise>
			</c:choose>
				<li><a href="javascript:viewMyHouseAndMateList('likemark')" class="mypage_likeMarkList">찜목록</a></li>
			</ul>
			<!-- 쉐어 하우스 글을 작성했을 경우 및 클릭 시 -->
			<c:choose>
				<c:when test="${not empty hwList }">
					<div class="myHouseMateList <c:if test="${msg!='house' }">objectHidden</c:if>" id="myPage_HouseList">
					<c:forEach var="hwVO" items="${hwList }">
							<div class="myPage_HouseAndMate_oneBlock" >
								<div class="myPage_HouseAndMate_Img">
									<!-- 글내용보기로 이동시켜야함. -->
									<a href=""><img alt="" src="/home/housePic/${hwVO.housepic1 }"/></a>
								</div>
								<ul class="myPage_HouseAndMate_Info">
									<li>${hwVO.housename }</li>
									<li>보증금 : ${hwVO.deposit }만원 | 월세 : ${hwVO.rent }만원</li>
									<li>${hwVO.addr }</li>
									<li>
										<ul class="myPage_HouseAndMate_House">
											<li><p>${hwVO.room }</p></li>
											<li><p>${hwVO.bathroom }</p></li>
											<li><p>${hwVO.searchpeople }</p></li>
										</ul>
									</li>
								</ul>
								<div class="myPage_HouseAndMate_Btn">
									<input type="hidden" name="no" value="${hwVO.no }" />
									<a href="#" class="b_btn white takeApply mypage_Popup">받은신청</a>
									<a href="#" class="b_btn white sendInvite mypage_Popup">보낸초대</a>
									<a href="" class="b_btn white">수정</a>
									<a href="" class="b_btn white">삭제</a>
									<a href="" class="b_btn green">매칭완료</a>
								</div>
							</div>
					</c:forEach>
					</div>
				</c:when>
				<c:when test="${empty hwList}">
					<div class="myHouseMateList <c:if test="${msg!='house' }">objectHidden</c:if>" id="myPage_HouseList">
						<div>houseWrite 데이터 없습니다. </div>
					</div>
				</c:when>
			</c:choose>
			<!-- 하우스메이트 글을 작성했을 경우 및 클릭시  -->
			<c:choose>
				<c:when test="${mwVO.no!=null }">
					<div class="myHouseMateList <c:if test="${msg=='house' }">objectHidden</c:if>" id="myPage_MateList">
						<div class="myPage_HouseAndMate_oneBlock" >
							<div class="myPage_HouseAndMate_Img">
								<a href=""><img alt="" src="/home/matePic/${mwVO.matePic1 }"/></a>
							</div>
							<ul class="myPage_HouseAndMate_Info">
								<li>${mwVO.userid }</li>
								<li>보증금 : ${mwVO.deposit }만원 | 월세 : ${mwVO.rent }만원</li>
								<li>
									<c:if test="${mwVO.area1 != null && mwVO.area1 != ''}">${mwVO.area1 } </c:if>
									<c:if test="${mwVO.area2 != null && mwVO.area2 != ''}">| ${mwVO.area2 } </c:if>
									<c:if test="${mwVO.area3 != null && mwVO.area3 != ''}">| ${mwVO.area3 } </c:if>
								</li>
								<li>
									<ul class="myPage_HouseAndMate_Mate">
										<li><p>
											<c:choose>
												<c:when test="${mwVO.gender == 1 }">여</c:when>
												<c:when test="${mwVO.gender == 2 }">남</c:when>
											</c:choose>
										</p></li>
										<li><p>${mwVO.age }세</p></li>
										<li><p>
											<c:choose>
												<c:when test="${mwVO.m_now == 1 }">즉시</c:when>
												<c:when test="${mwVO.m_now == 2 }">${mwVO.enterdate }</c:when>
											</c:choose>
										</p></li>
									</ul>
								</li>
							</ul>
							<div class="myPage_HouseAndMate_Btn">
								<input type="hidden" name="no" value="${mwVO.no }" />
								<a href="#" class="b_btn white takeInvite mypage_Popup">받은초대</a>
								<a href="#" class="b_btn white sendApply mypage_Popup">보낸신청</a>
								<a href="" class="b_btn white">수정</a>
								<a href="" class="b_btn white">삭제</a>
								<a href="" class="b_btn green">매칭완료</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${mwVO.no==null}">
					<div class="myHouseMateList <c:if test="${msg=='house' }">objectHidden</c:if>" id="myPage_MateList">
						<div>mateWrite 데이터 없습니다. </div>
					</div>
				</c:when>
			</c:choose>
			
			<!-- 찜목록  -->
			<div class="myHouseMateList objectHidden " id="myPage_LikeMarkerList">
				<c:if test="${not empty houseLikeList }">
					<c:forEach var="like_hwVO" items="${houseLikeList }">
					<div class="myPage_HouseAndMate_oneBlock" >
						<div class="myPage_HouseAndMate_Img">
							<div>매칭 <br /><span>89</span> %</div>
							<a href=""><img alt="" src="/home/housePic/${like_hwVO.housepic1 }"/></a>
						</div>
						<ul class="myPage_HouseAndMate_Info">
							<li>${like_hwVO.housename }</li>
							<li>보증금 : ${like_hwVO.deposit }만원 | 월세 : ${like_hwVO.rent }만원</li>
							<li>${like_hwVO.addr }</li>
							<li>
								<ul class="myPage_HouseAndMate_House">
									<li><p>${like_hwVO.room }</p></li>
									<li><p>${like_hwVO.bathroom }</p></li>
									<li><p>${like_hwVO.searchpeople }</p></li>
								</ul>
							</li>
						</ul>
						<div class="myPage_HouseAndMate_LikeMarker_Btn">
							<a href="" class="b_btn white">찜 삭제</a>
							<a href="" class="b_btn white">신청하기</a>
						</div>
					</div>
					</c:forEach>
				</c:if>
				<c:if test="${not empty mateLikeList }">
					<c:forEach var="like_mwVO" items="${mateLikeList }"></c:forEach>
					<div class="myPage_HouseAndMate_oneBlock">
						<div class="myPage_HouseAndMate_Img">
							<div>매칭 <br /><span>90</span> %</div>
							<a href=""><img alt="" src="/home/matePic/${like_mwVO.matePic1 }"/></a>
						</div>
						<ul class="myPage_HouseAndMate_Info">
							<li>${like_mwVO.userid }</li>
							<li>보증금 : ${like_mwVO.deposit }만원 | 월세 : ${like_mwVO.rent }만원</li>
							<li>
								<c:if test="${like_mwVO.area1 != null && like_mwVO.area1 != ''}">${mwlike_mwVOVO.area1 } </c:if>
								<c:if test="${like_mwVO.area2 != null && like_mwVO.area2 != ''}">| ${like_mwVO.area2 } </c:if>
								<c:if test="${like_mwVO.area3 != null && like_mwVO.area3 != ''}">| ${like_mwVO.area3 } </c:if>
							</li>
							<li>
								<ul class="myPage_HouseAndMate_Mate">
									<li><p>
										<c:choose>
											<c:when test="${like_mwVO.gender == 1 }">여</c:when>
											<c:when test="${like_mwVO.gender == 2 }">남</c:when>
										</c:choose>
									</p></li>
									<li><p>${like_mwVO.age }세</p></li>
									<li><p>
										<c:choose>
											<c:when test="${like_mwVO.m_now == 1 }">즉시</c:when>
											<c:when test="${like_mwVO.m_now == 2 }">${mwVO.enterdate }</c:when>
										</c:choose>
									</p></li>
								</ul>
							</li>
						</ul>
						<div class="myPage_HouseAndMate_LikeMarker_Btn">
							<a href="" class="b_btn white">찜 삭제</a>
							<a href="" class="b_btn white">초대하기</a>
						</div>
					</div>
				</c:if>
				<c:if test="${empty houseLikeList && empty mateLikeList}">
					<div>찜목록 리스트 없습니다.</div>
				</c:if>
			</div>
		</section>
		
		<!--받은신청 -  팝업 (하우스에서 클릭 할 경우/ 띄우는건 신청을 한 메이트의 정보-->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_TakeApply">
			<div class="myPage_HouseAndMate_Popup_Title" >받은신청<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate03.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		<!--보낸초대 -  팝업 (하우스에서 클릭 할 경우 / 띄우는건 내가 초대를 보낸 메이트의 정보-->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_SendInvite">
			<div class="myPage_HouseAndMate_Popup_Title">보낸초대<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_mate02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">user1</span><span class="s_title">남성</span><span class="s_title">31세</span></li>
						<li>대흥동 | 공덕동 | 북아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
							<a href="" class="b_btn green">메세지</a>
							<a href="" class="b_btn green">취소</a>
						</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		<!-- 받은초대  (메이트일 경우에 나옴)집의 정보  -->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_TakeInvite">
			<div class="myPage_HouseAndMate_Popup_Title">받은초대<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house01.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 아현동</li>
						<li>보증금 : 300만원 | 월세 : 25만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 대흥동</li>
						<li>보증금 : 300만원 | 월세 : 30만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
						<a href="" class="b_btn green">승인</a>
						<a href="" class="b_btn green">메세지</a>
						<a href="" class="b_btn green">거절</a>
					</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
		
		
		<!-- 보낸신청 -->
		<div class="myPage_HouseAndMate_Popup popup_hidden" id="popup_SendApply">
			<div class="myPage_HouseAndMate_Popup_Title">보낸신청<span class="popup_Close">✕</span></div>
			<div class="myPage_HouseAndMate_Popup_Content">
				<div class="myPage_HouseAndMate_Popup_OneBlock">
					<div class="myPage_HouseAndMate_Popup_Img">
						<a href=""><img alt="" src="<%=request.getContextPath()%>/img/comm/sample_house02.png"/></a>
					</div>
					<ul class="myPage_HouseAndMate_Popup_Info">
						<li><span class="s_title">집이름</span></li>
						<li>서울시 마포구 대흥동</li>
						<li>보증금 : 300만원 | 월세 : 30만원</li>
					</ul>
					<div class="myPage_HouseAndMate_Popup_Btn">
							<a href="" class="b_btn green">메세지</a>
							<a href="" class="b_btn green">취소</a>
						</div>
				</div>
			</div>
			<div class="myPage_HouseAndMate_Popup_footer">
				<p class="b_btn white popup_Close" >닫기</p>
			</div>
		</div>
	</div>	
	<div class="myPage_HouseAndMate_Popup_FullScreen popup_Close popup_hidden" id="myPage_popup_FullScreen"></div>
	