<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<section>
			<div class="m_title managementTitle">메이트 관리</div>
			<form method="post" action="/home/admin/houseManagement" class="managementSearchForm">
				<div class="managementRadio">
					<div class="checks">
						<span class="managementSpan">상태</span>
						<input type="radio" name="matestate" id="mateWriteState1" checked/>
						<label for="mateWriteState1" >전체</label>
						<input type="radio" name="matestate" id="mateWriteState2"/>
						<label  for="mateWriteState2">모집중</label>
						<input type="radio" name="matestate" id="mateWriteState3"/>
						<label for="mateWriteState3">매칭완료</label>
						<input type="radio" name="matestate" id="mateWriteState4"/>
						<label for="mateWriteState4">기간만료</label>
						<input type="radio" name="matestate" id="mateWriteState5"/>
						<label for="mateWriteState5">비공개</label>
					</div>
					<div class="checks">
						<span class="managementSpan">일반/프리미엄</span>
						<input type="radio" name="state" id="mateMemberState1" checked/>
						<label for="mateMemberState1">전체</label>
						<input type="radio" name="state" id="mateMemberState2"/>
						<label for="mateMemberState2">일반</label>
						<input type="radio" name="state" id="mateMemberState3"/>
						<label for="mateMemberState3">프리미엄</label>
					</div>
				</div>
				<div class="managementSearch">
					<select name="searchKey" class="custom-select">
						<option value="userid" selected>아이디</option>
						<option value="area">희망지역</option>
					</select>
					<input type="text" name="searchWord" class="form-control"/>
					<input type="submit" value="Search" class="btn btn-custom"/>
				</div>
			</form>
			<div class="table-responsive, managementList">
				<table class="table table-hover table-sm table-bordered">
					<thead class="thead-light">
						<tr>
							<th>No.</th>
							<th>이름</th>
							<th>아이디</th>
							<th>희망지역</th>
							<th>등급</th>
							<th>신고누적수</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" begin="1" end="15" step="1">
						<tr>
							<td>${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }${i }</td>
							<td>${i }${i }${i }${i }${i }${i }</td>
							<td>${i }</td>
							<td>${i }${i }${i }${i }${i }${i }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination justify-content-center managementPaging">
					<li class="page-item"><a href="" class="page-link">Prev</a></li>
					<li class="page-item"><a href="" class="page-link">1</a></li>
					<li class="page-item"><a href="" class="page-link">2</a></li>
					<li class="page-item"><a href="" class="page-link">3</a></li>
					<li class="page-item"><a href="" class="page-link">4</a></li>
					<li class="page-item"><a href="" class="page-link">5</a></li>
					<li class="page-item"><a href="" class="page-link">Next</a></li>
				</ul>
			</div>
		</section>
	</body>
</html>