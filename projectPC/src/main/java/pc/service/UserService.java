package pc.service;

import pc.vo.UserVo;

public interface UserService {
	boolean signup(UserVo vo) throws Exception;
	UserVo login(String userid, String password) throws Exception;
}
