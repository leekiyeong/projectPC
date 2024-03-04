package pc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import pc.service.UserService;
import pc.vo.UserVo;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/main.do")
	public ModelAndView main(HttpSession session) {
	    ModelAndView mv = new ModelAndView("main");
	    
	    // 세션에서 사용자 아이디 가져오기
	    String userid = (String) session.getAttribute("userid");
	    
	    System.out.println("MainController" + userid);
	    
	    // 사용자 아이디가 세션에 존재하는지 확인
	    if (userid != null) {
	        // 세션에 사용자 아이디가 있을 경우 메인 페이지로 이동
	        mv.addObject("userid", userid); // 메인 페이지로 사용자 아이디 전달
	    }
	    System.out.println("MainControllerMV" + mv);
	    return mv;
	}

}
