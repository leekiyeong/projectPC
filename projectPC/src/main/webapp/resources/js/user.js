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
	           	 alert("회원가입 실패");
	            } 
	        },
	        error: function(error) {
	            // 오류 발생 시 처리
	            alert('회원가입 에러발생: ' + error.responseText);
	        }
	    });
	});
});

//로그인 양식 제출 시 처리
//AJAX 요청 보내기 (jQuery 사용)
$(document).ready(function() {
   
	$("#loginButton").click(function() {
    	
    	var data = $("#loginForm").serialize();
        
        $.ajax({
            url: 'userLogin.do',
            type: "POST",
            data: data,
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType: 'text',
            success: function(data) {
                if (data) {
                    alert("로그인 성공");
                    window.location.href = "/main.do"; // 로그인 성공 시 메인 페이지로 이동
                } else {
                    alert("로그인 실패");
                }
            },
            error: function(error) {
                alert('로그인 에러발생: ' + error.responseText);
            }
        });
    });
});

 // 시간 충전
$(document).ready(function() {
	$(function() {
		$("#chargeButton").click(function() {
		    $(".chargeModal").css("display", "block");
		});
	});
});
 
$(document).ready(function() {
	$(function() {
		$(".chargeModalClose").click(function() {
		    $(".chargeModal").css("display", "none");
		});
	});
});
//각 시간 충전 버튼 클릭 이벤트 처리
$(document).ready(function() {
    $("#charge1Hour").click(function() {
        sendChargeRequest(1);
    });

    $("#charge2Hours").click(function() {
        sendChargeRequest(2);
    });

    $("#charge5Hours").click(function() {
        sendChargeRequest(5);
    });

    $("#charge12Hours").click(function() {
        sendChargeRequest(12);
    });

    function sendChargeRequest(hours) {
        // 세션 아이디 가져오기
        var session_id = document.getElementById("session_Id").value;
        var data = {
            session_id: session_id,
            hours: hours
        };

        $.ajax({
            url: 'chargeUpdate.do',
            type: "POST",
            data: data,
            success: function(str) {
                if(str){
					alert("시간추가 성공" + str); // 성공 또는 실패 메시지를 표시
					window.location.href = "/main.do"; // 시간충전 성공 시 메인 페이지로 이동
				} else{
					alert("시간추가 실패" + str);
				}
			},
            error: function(error) {
                alert('에러 발생: ' + error.responseText); // 오류 발생 시 알림 표시
            }
        });
    }
});