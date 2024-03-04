package pc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pc.mapper.UserMapper;
import pc.vo.UserVo;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public boolean signup(UserVo vo) throws Exception {
		
		boolean result = false;
		int mapperResult = userMapper.signup(vo);
		if(mapperResult == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}

	@Override
	public UserVo login(String userid, String password) throws Exception {
		
		System.out.println("UserServiceImpl" + userid);
		System.out.println(userMapper.login(userid, password));
		return userMapper.login(userid, password);
	}
	
}

