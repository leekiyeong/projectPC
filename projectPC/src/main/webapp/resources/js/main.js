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

 // 그리드 아이템 생성
$(document).ready(function() {
    $('.grid-container').each(function() {
        for (let i = 1; i <= 40; i++) {
            const gridItem = $('<div class="grid-item"></div>'); // 빈 그리드 아이템 생성
            const numberText = $('<div class="number-text">' + i + '</div>'); // 숫자 텍스트 생성
            const sessionIdText = $('<div class="session-id"></div>'); // 세션 아이디 텍스트를 담을 요소 생성

            gridItem.append(numberText); // 숫자 텍스트를 그리드 아이템에 추가
            gridItem.append(sessionIdText); // 세션 아이디 텍스트를 그리드 아이템에 추가
            $(this).append(gridItem); // 그리드 컨테이너에 그리드 아이템 추가
            
            gridItem.on('click', function() {
			    if (confirm('사용하시겠습니까?')) {
					var session_id = document.getElementById("session_Id").value;
			        var data = {
						session_id: session_id
					};
					// AJAX 요청을 통해 서버에 checkRMtime 엔드포인트에 세션 아이디 전달
			        $.ajax({
			            url: 'checkRMtime.do',
			            type: 'POST',
			            data: data,
			            success: function(response) {
			                // 성공적으로 응답을 받았을 때
							console.log(response);
			                if (response.rmtime > 0) {
			                    alert('남은 시간: ' + response.rmtime + '시간');
			                    sessionIdText.text(session_id); // 세션 아이디 텍스트 업데이트
			                } else {
			                    alert('시간이 만료되었습니다.' + response);
			                }
			            },
			            error: function(error) {
			                // 오류 발생 시 처리
			                alert('오류 발생: ' + error);
			            }
			        });
			    }
			});
        }
    });
});