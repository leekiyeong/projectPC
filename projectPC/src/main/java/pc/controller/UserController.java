package pc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
