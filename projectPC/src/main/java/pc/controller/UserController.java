package pc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import pc.service.UserService;
import pc.vo.UserVo;

@Controller
@Slf4j
public class UserController {
	@Autowired
	UserService userService;

	@PostMapping("/userSignup.do")
	@ResponseBody
	public boolean signup(UserVo vo) throws Exception {
		return userService.signup(vo);
	}
	
	@PostMapping("/userLogin.do")
	@ResponseBody
	public ModelAndView login(@RequestParam String userid, @RequestParam String password,
	        HttpServletRequest request, HttpServletResponse response) throws Exception {

	    ModelAndView mv = new ModelAndView("redirect:main.do");

	    UserVo vo = userService.login(userid, password);
	    
	    System.out.println("UserControllerUSERID " + userid);
	    System.out.println("UserControllerPASSWORD " + password);
	    System.out.println("UserControllerVO " + vo);
	    
	    if (vo.getUserid() != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("userid", vo.getUserid());
	    }

	    return mv;
	}
	
	@PostMapping("/chargeUpdate.do")
	@ResponseBody
    public boolean chargeUpdate(@RequestParam String session_id,
    			@RequestParam String hours) throws Exception{
       
		// 여기서 데이터베이스 작업을 수행하고 결과를 반환합니다.
       System.out.println(session_id);
       System.out.println(hours);
        
       boolean data = false;
       
       data = userService.chargeUpdate(session_id, hours);
       
        // 세션 아이디와 시간을 이용하여 데이터베이스 업데이트 수행
        // 예시로 성공적으로 충전된 경우를 반환
        return data;
    }

}
