<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/main.css" rel="stylesheet">
<title>pc관리 프로그램</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 로그인 버튼 클릭 시 로그인 모달 표시
    const memberDiv = document.querySelector('.member');
    memberDiv.addEventListener('click', () => {
        const loginModal = document.getElementById('loginModal');
        loginModal.style.display = 'block'; // 로그인 모달 표시
        document.body.classList.add('modal-open'); // 스크롤 막기
    });

    // 비회원 버튼 클릭 시 회원가입 모달 표시
    const nonMembersDiv = document.querySelector('.nonMembers');
    nonMembersDiv.addEventListener('click', () => {
        const signupModal = document.getElementById('signupModal');
        signupModal.style.display = 'block'; // 회원가입 모달 표시
        document.body.classList.add('modal-open'); // 스크롤 막기
    });

    // 모달 닫기 버튼 이벤트 등록
    const closeLoginModalButtons = document.querySelectorAll('.closeLoginModal');
    closeLoginModalButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const loginModal = document.getElementById('loginModal');
            loginModal.style.display = 'none'; // 로그인 모달 숨기기
            document.body.classList.remove('modal-open'); // 스크롤 허용
        });
    });

    const closeSignUpModalButtons = document.querySelectorAll('.closeSignUpModal');
    closeSignUpModalButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const signupModal = document.getElementById('signupModal');
            signupModal.style.display = 'none'; // 회원가입 모달 숨기기
            document.body.classList.remove('modal-open'); // 스크롤 허용
        });
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', (event) => {
        const loginModal = document.getElementById('openLoginModal');
        const signupModal = document.getElementById('openSignUpModal');
        if (event.target === loginModal || event.target === signupModal) {
            loginModal.style.display = 'none'; // 로그인 모달 숨기기
            signupModal.style.display = 'none'; // 회원가입 모달 숨기기
            document.body.classList.remove('modal-open'); // 스크롤 허용
        }
    });
});

</script>
<script>
// 회원가입 양식 제출 시 처리
// AJAX 요청 보내기 (jQuery 사용)
$(document).ready(function() {
	
	$("#signupButton").click(function() {
	    
		 var data = $("#signupForm").serialize();
		 
	    $.ajax({
	        url: 'userSignup.do', // 컨트롤러 엔드포인트 URL
	        type: "POST", // HTTP 요청 메서드 (POST로 변경할 수 있음)
	        data: data, // 전송할 데이터
	        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	        dataType:'text',
	        success: function(data) {
	            // 성공적으로 응답을 받았을 때 처리
	            if(data){
	                alert("회원가입 성공: " + data);
	                location="/main.do";
	            } else {
	           	 alert("회원가입 실패 ㅠㅠ");
	            } 
	        },
	        error: function(error) {
	            // 오류 발생 시 처리
	            alert('회원가입 실패: ' + error.responseText);
	        }
	    });
	});
});

document.addEventListener('DOMContentLoaded', function() {
    const gridContainer = document.querySelector('.grid-container');

    // 그리드 아이템 생성
    for (let i = 1; i <= 60; i++) {
        const gridItem = document.createElement('div');
        gridItem.classList.add('grid-item');
        gridItem.textContent = i;
        gridContainer.appendChild(gridItem);
    }
});
</script>
	<body>
	<div id="header">
		<span style="font-size: 30px;">★</span> 오른쪽 메뉴에서 구매품목을 선택해주세요. <span
			style="font-size: 30px;">★</span>
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
			<form id="loginForm" action="/userLogin" method="post">
				<label for="userid">사용자 아이디</label> <input type="text"
					id="userid name="userid" required><br> <label
					for="password">비밀번호</label> <input type="password" id="password"
					name="password" required><br> <input type="submit"
					value="로그인">
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
	
</body>
</html>