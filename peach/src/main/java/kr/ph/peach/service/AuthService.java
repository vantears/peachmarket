package kr.ph.peach.service;


public interface AuthService {

	void deleteCode(String code);

	void deleteCodeByAuthNum(String me_id);

}