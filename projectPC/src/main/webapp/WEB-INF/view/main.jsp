<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/main.css" rel="stylesheet">
<title>pc관리 프로그램</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<script src="js/main.js"></script>
<script src="js/user.js"></script>
<body>
	<div id="header">
	    <c:choose>
		    <c:when test="${userid != null}">
		        <span style="font-size: 30px;">★</span> 
		        	오른쪽 메뉴에서 구매품목을 선택해주세요. 
		        <span style="font-size: 30px;">★사용자 아이디: ${userid}</span>
		        <input type="hidden" id="session_Id" value="${userid}">
		        <button type="button" id="chargeButton">
		            시간충전
		        </button>
		    </c:when>
			    <c:otherwise>
			         <span style="font-size: 30px;">★</span> 
			      		오른쪽 메뉴에서 구매품목을 선택해주세요. 
			        <span style="font-size: 30px;">★
			    </c:otherwise>
		</c:choose>
	</div>

	<div class="container">
	    <div class="grid-container">
	        <!-- 그리드 아이템 -->
	    </div>
	</div>
		
	<div class="grid-bottomcontainer">
		<div class="member">
			<img src="images/member-icon.jpg">회원
		</div>
		<div class="nonMembers">
			<img src="images/nonMember-icon.jpg">비회원
		</div>
		<div class="myLocation">
			<img src="images/myLocation.jpg">현위치
		</div>
	</div>

	<!-- 로그인 모달 -->
	<div id="loginModal" class="openLoginModal">
		<div class="modal-LoginContent">
			<span class="closeLoginModal">&times;</span>
			<!-- 로그인 모달 내용을 추가하세요 -->
			<h2>로그인</h2>
			<form id="loginForm">
				<label for="userid">사용자 아이디</label> 
				<input type="text" id="userid" name="userid" required><br> 
				<label for="password">비밀번호</label> 
				<input type="password" id="password" name="password" required><br> 
				<button type="button" id="loginButton">로그인</button>
			</form>
		</div>
	</div>

	<!-- 회원가입 모달 -->
	<div id="signupModal" class="openSignUpModal">
		<div class="modal-SignUpContent">
			<span class="closeSignUpModal">&times;</span>
			<h2>회원가입</h2>
			<form id="signupForm">
				<label for="signupName">이름:</label> <input type="text"
					id="signupName" name="signupName" placeholder="이름을 입력하세요" required><br>

				<label for="signupID">아이디:</label> <input type="text"
					id="signupUserID" name="signupID"
					placeholder="6~12글자의 알파벳과 숫자로 이루어진 아이디" required><br>

				<label for="signupPassword">비밀번호:</label> <input type="password"
					id="signupPassword" name="signupPassword"
					placeholder="8~20글자의 숫자와 알파벳 조합" required><br> <label
					for="signupPhone">전화번호:</label> <input type="text"
					id="signupPhone" name="signupPhone"
					placeholder="전화번호를 입력하세요 (예: 010-1234-5678)" required><br>

				<button type="button" id="signupButton">회원가입</button>
			</form>
		</div>
	</div>
	
	<div id="chargeModal" class="chargeModal">
	  <div class="chargeModal-content">
	    <span class="chargeModalClose">&times;</span>
	    <h2>시간 충전</h2>
	    <p>1시간 - 1000원</p>
	    <p>2시간 - 2000원</p>
	    <p>5시간 - 5000원</p>
	    <p>12시간 - 10000원</p>
	    <button id="charge1Hour">1시간 충전</button>
	    <button id="charge2Hours">2시간 충전</button>
	    <button id="charge5Hours">5시간 충전</button>
	    <button id="charge12Hours">12시간 충전</button>
	  </div>
	</div>
	
</body>
</html>