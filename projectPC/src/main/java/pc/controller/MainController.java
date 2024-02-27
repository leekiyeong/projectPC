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
	
	@GetMapping("main.do")
	public ModelAndView main() throws Exception {
		
		ModelAndView mv = new ModelAndView("main");
		/* System.out.println(mv); */
		return mv;
	}
}
