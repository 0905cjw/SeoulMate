<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="member_wrap">
		<p class="m_title">강조타이틀</p>
		<p class="s_title">서브타이틀</p><br>
		<div class="title_wrap">
			<p class="s_title">서브타이틀 가운데정렬</p>
		</div>
		<p class="d_title">기본텍스트</p>
		<hr>
		
		<button class="green">작은버튼</button>
		<button class="white">작은버튼</button>
		<a class="green">작은버튼</a>
		<a class="white">작은버튼</a>
		<hr>
		
		<button class="b_btn green">커어다란 버튼</button>
		<button class="b_btn white">커어다란 버튼</button>
		<a class="b_btn green">커어다란 버튼</a>
		<a class="b_btn white">커어다란 버튼</a>
		<hr>
		
		<button class="q_btn green">네모길쭉 버튼</button>
		<button class="q_btn white">네모길쭉 버튼</button>
		<a class="q_btn green">네모길쭉 버튼</a>
		<a class="q_btn white">네모길쭉 버튼</a>
		<hr>
	</div>
	
	<div class="wrap">
		<ul class="form_box">
			<li>
				<label><span class="red_txt">*</span>이메일</label>
				<input type="text" placeholder="이메일을 입력해주세요"> 
				<select>
					<option>어쩌구</option>
					<option>저쩌구</option>
					<option>이러쿵</option>
					<option>저러쿵</option>
				</select>
			</li>
		</ul>
		<ul class="form_box choice">
			<li>
				<label><span class="red_txt">*</span>생활시간</label>
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
				<label><span class="red_txt">*</span>생활시간</label>
				<div class="checks">
					<input type="radio" id="radio4" name="character2"> 
					<label for="radio4">야행성</label>
					
					<input type="radio" id="radio5" name="character2"> 
					<label for="radio5">주행성</label>
					
					<input type="radio" id="radio6" name="character2"> 
					<label for="radio6">상관없음</label>
				</div>
			</li>
			<li>
				<label><span class="red_txt">*</span>하우스 내 지원서비스</label>
				<div class="checks">
					<input type="checkbox" id="check1" name="character3"> 
					<label for="check1">공용공강 청소지원</label>
					
					<input type="checkbox" id="check2" name="character3"> 
					<label for="check2">공용생필품 지원</label>
					
					<input type="checkbox" id="check3" name="character3"> 
					<label for="check3">기본 식품 지원</label>
				</div>
			</li>
		</ul>
		<div class="btn_wrap">
			<a class="h_btn white">반반 버튼</a>
			<a class="h_btn green">반반 버튼</a>
		</div>
	</div>
</body>

</html>