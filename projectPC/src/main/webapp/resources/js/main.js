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
        for (let i = 1; i <= 60; i++) {
            const gridItem = $('<div class="grid-item">' + i + '</div>');
            $(this).append(gridItem);
            
            gridItem.on('click', function() {
                if (confirm('사용하시겠습니까?')) {
                    const userid = '<%= session.getAttribute("userid") %>';
                    $(this).text(userid);
                }
            });
        }
    });
});