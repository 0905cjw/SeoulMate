<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yun.css">
<script>
// 	$(function(){
// 		$('.faqATag2').click(function(){
// 			$('.faqDiv').css("display","block");
// 		});
// 	})
// 	function expandAnswer(){
//  		$('.1').animate({
//  			height : "150px",
//  		}, 2000)
//  	};
$(function(){
	
	$('#faqSearch>input').keyup(function(){
			var value=$(this).val().toLowerCase(); // 검색어로 입력한 문자열 %('#myInput').val();

			$('#qnaUl>li>span').filter(function(){
				var idx=$(this).text().indexOf(value); // 없으면 -1
				
				//	true : 그냥 둠, false : 숨김
				$(this).parent().toggle(idx>-1);
			});
		});
})


</script>
<div class="wrap">
	<div class="member_wrap" id="faq_member_wrap">
		<p class="d_title">FAQ</p>
		<p class="s_title">자주하는 질문</p>
	<br>
		<ul>
			<li id="faqSearch"><input type="text" placeholder="검색어을 입력해주세요"></li>
			<li><button id="faqSearchBtn" class="q_btn green">검색</button></li>
			<li style="text-align:center;"><br><p>원하는 답을 못 찾았다면 <a class="faqATag" href="contact">문의하기</a>를 이용해보세요.</p></li>
		</ul>
	</div>	
	<br>
	<div class="content">
		<ul id="qnaUl">
			<li class="qnaList 1">
				<span>Q. 무엇을 찾고 싶어서 이 페이지에 오셨나이까?</span>
				<a class="faqATag2">
					<img alt="질문더보기" src="<%=request.getContextPath()%>/img/yun/fi-rr-plus-small.svg">
				</a>
				<div class="faqDiv" style="margin:0 auto 15px auto; background-color:#eee; padding: 10px 10px; text-align:center; height:85px; display: none; ">
				자주하는 질문 답변내용이 여기에 들어간다. animate를 써서 답변을 감추었다가 +가 눌리면 스르륵 커지면서 감춰진 답변이 나오는거지</div>
			</li>
			<li class="qnaList 1">
				<span>Q. 222222222222222222가</span>
				<a class="faqATag2">
					<img alt="질문더보기" src="<%=request.getContextPath()%>/img/yun/fi-rr-plus-small.svg">
				</a>
				<div class="faqDiv" style="margin:0 auto 15px auto; background-color:#eee; padding: 10px 10px; text-align:center; height:85px; display: none; ">
				자주하는 질문 답변내용이 여기에 들어간다. animate를 써서 답변을 감추었다가 +가 눌리면 스르륵 커지면서 감춰진 답변이 나오는거지</div>
			</li>
			<li class="qnaList 1">
				<span>Q. 여기</span>
				<a class="faqATag2">
					<img alt="질문더보기" src="<%=request.getContextPath()%>/img/yun/fi-rr-plus-small.svg">
				</a>
				<div class="faqDiv" style="margin:0 auto 15px auto; background-color:#eee; padding: 10px 10px; text-align:center; height:85px; display: none; ">
				자주하는 질문 답변내용이 여기에 들어간다. animate를 써서 답변을 감추었다가 +가 눌리면 스르륵 커지면서 감춰진 답변이 나오는거지</div>
			</li>
			<li class="qnaList 1">
				<span>Q. 저기</span>
				<a class="faqATag2">
					<img alt="질문더보기" src="<%=request.getContextPath()%>/img/yun/fi-rr-plus-small.svg">
				</a>
				<div class="faqDiv" style="margin:0 auto 15px auto; background-color:#eee; padding: 10px 10px; text-align:center; height:85px; display: none; ">
				자주하는 질문 답변내용이 여기에 들어간다. animate를 써서 답변을 감추었다가 +가 눌리면 스르륵 커지면서 감춰진 답변이 나오는거지</div>
			</li>
			<li class="qnaList 1">
				<span>Q. 무가</span>
				<a class="faqATag2">
					<img alt="질문더보기" src="<%=request.getContextPath()%>/img/yun/fi-rr-plus-small.svg">
				</a>
				<div class="faqDiv" style="margin:0 auto 15px auto; background-color:#eee; padding: 10px 10px; text-align:center; height:85px; display: none; ">
				자주하는 질문 답변내용이 여기에 들어간다. animate를 써서 답변을 감추었다가 +가 눌리면 스르륵 커지면서 감춰진 답변이 나오는거지</div>
			</li>
			
		</ul>
	</div>
</div>