<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/housemate.css">
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script>

$(function(){
	CKEDITOR.replace("mateProfile"); //설명글 name 설정 필요
	
	$("#write").on('submit', function(){
		if(CKEDITOR.instances.content.getData()==""){
			alert("내용을 입력해주세요");
			return false;
		}return true;
	});
	
});
</script>
<style>
input[type="date"] {width:200px;}
input[type="text"] {width:200px;}
.house_wrap{width:800px; margin:0 auto; }
.house_wrap ul li{word-break:keep-all;}
</style>
<div class="wrap">
	<div class="house_wrap">
	
	<div class="title_wrap">
	<p class="m_title">메이트 등록하기 </p> 
	</div>
	
	<form method="post" action="">
	
	<div id="mateWrite1">
	
	<div class="title_wrap">
	<p class="s_title">집 기본 정보 등록 </p> <br/>
	</div>
		
		<ul class="form_box">
		<li>게재 기간 <input type="date" width="100px"/> </li>
		<li>찾는지역 <input type="text"/> <input type="text"/> <input type="text"/> </li>
		<li>월세 예산 <input type="text" placeholder="만원"/> - <input type="text" placeholder="만원"/> <button class="green" >제한없음</button> </li>
		<li>입주가능일 <input type="date" > </li>
		<li>
			최소 거주 기간
				<select>
					<option>1~3 개월</option>
					<option>4~6 개월</option>
					<option>7~12 개월</option>
					<option>1년 이상</option> 
				</select> </li>
		<li>		
			최대 거주 기간
				<select>
					<option>1~3 개월</option>
					<option>4~6 개월</option>
					<option>7~12 개월</option>
					<option>1년 이상</option>
				</select> </li>
		</ul>
		
	</div>	<!-- 등록form1 종료 -->
	
	<div id="mateWrite2">
		<div class="title_wrap">
		<p class="s_title">선호하는 하우스성향 선택 </p>
		</div>	
		
		<ul class="form_box choice">
		
			<li>
				<label><span class="red_txt">*</span>생활소음</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">조용함</label>
					
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">보통</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">활발함</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio4">상관없음</label>
				</div>
			</li>
			
			<li>
				<label><span class="red_txt">*</span>생활 시간</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">야행성</label>
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">주행성</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">상관없음</label>
				</div>
			</li>
			
			<li>
				<label><span class="red_txt">*</span>반려동물</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">있음</label>
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">없음</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">상관없음</label>
				</div>
			</li>
			
			<li>
				<label><span class="red_txt">*</span>반려동물 선호도</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">가능</label>
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">불가능</label>
				</div>
			</li>
			
			<li>
				<label><span class="red_txt">*</span>흡연</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">실내흡연</label>
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">실외흡연</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">비흡연</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio4">상관없음</label>
				</div>
			</li>
			
			<li>
				<label><span class="red_txt">*</span>연령대</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">20대</label>
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">30대</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">40대</label>
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio4">상관없음</label>
				</div>
			</li>	
		</ul>
	
	</div> <!-- 등록form2 종료 -->
		
	<div id="mateWrite3">
	
	<div class="title_wrap">
	<p class="s_title">원하는 하우스 성향 등록(소통정보) </p> <br/>
	</div>
		
		<ul class="form_box choice">
		
			<li>
				<label><span class="red_txt">*</span>분위기</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">화목함</label>
					
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">보통</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">독립적</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio4">상관없음</label>
				</div>
			</li>
			
				<li>
				<label><span class="red_txt">*</span>소통방식</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">대화</label>
					
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">기타</label>
				</div>
			</li>
			
				<li>
				<label><span class="red_txt">*</span>모임빈도</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">없음</label>
					
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">가끔</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">보통</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio4">자주</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio5">상관없음</label>
				</div>
			</li>
			
				<li>
				<label><span class="red_txt">*</span>모임참가 의무</label>
				<div class="checks">
					<input type="radio" id="radio1" name="character1"> 
					<label for="radio1">있음</label>
					
					<input type="radio" id="radio2" name="character1"> 
					<label for="radio2">없음</label>
					
					<input type="radio" id="radio3" name="character1"> 
					<label for="radio3">상관없음</label>
				</div>
			</li>
		</ul>		

	</div> <!-- 등록form3 종료 -->

	<div id="mateWrite4">
	
	<div class="title_wrap">
	<p class="s_title">원하는 하우스 성향 등록(하우스지원 정보) </p> <br/>
	</div>

		<ul class="form_box choice">
		
			<li>
				<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
				<div class="checks">
					<input type="checkbox" id="check1" name="character3"> 
					<label for="check1">공용공간 청소지원</label>
								
					<input type="checkbox" id="check2" name="character3"> 
					<label for="check2">공용생필품 지원</label> <br/>
								
					<input type="checkbox" id="check3" name="character3"> 
					<label for="check3">기본 식품 지원</label>
					
					<input type="checkbox" id="check3" name="character3"> 
					<label for="check4">미지원</label> 
				</div>
			</li>
		</ul> 
	
	</div> <!-- 등록form4 종료 -->		
	
	<div id="mateWrite5">
	
	<div class="title_wrap">
	<p class="s_title">사진 등록 </p> <br/>
	</div>
	
		<ul>
			<li>사진 올리기 <input type="file" accept="image/*" id="input-image" /> </li>
			<li> <img id="inImg" src="#" alt="upload image" /> </li>
			<li> <img src="#" name="profilePic2" style="width:150px; height:150px;"/> 
				<img src="#" name="profilePic3" style="width:150px; height:150px;"/>
				<img src="#" name="" style="width:150px; height:150px;"/>
		</ul>
		
	</div> <!-- 등록form5 종료 -->
	
	<div id="mateWrite6"> 
	
	<div class="title_wrap">
	<p class="s_title">내 소개 등록 </p> <br/>
	</div>
		<textarea name="mateProfile"></textarea><br/>
	</div> <!-- 등록form6 종료 -->
		
		
		<div class="btnclass">
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite1'">이전</button>
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateWrite2'" >다음</button> 
			<button class="green" onclick="location.href='<%=request.getContextPath()%>/mateIndex'" >취소</button>
		</div>
	
	</form>
	</div> <!-- content 종료 -->

</div>