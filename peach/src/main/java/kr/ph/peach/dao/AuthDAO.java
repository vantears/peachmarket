package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

public interface AuthDAO {

	void deleteCode(@Param("code")String code);

	void deleteCodeByAuthNum(@Param("me_id")String me_id);


}