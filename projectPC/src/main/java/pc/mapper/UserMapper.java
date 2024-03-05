package pc.mapper;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import pc.vo.UserVo;

@MapperScan
public interface UserMapper {
	//회원가입
	int signup(UserVo vo) throws Exception;
	UserVo login(@Param("userid") String userid, @Param("password") String password) throws Exception;
	int chargeUpdate(@Param("session_id") String session_id, @Param("hours") String hours) throws Exception;
	
}

