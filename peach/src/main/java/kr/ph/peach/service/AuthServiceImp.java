package kr.ph.peach.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.AuthDAO;

@Service
public class AuthServiceImp implements AuthService {

	@Autowired
	AuthDAO authDao;

	@Override
	public void deleteCode(String code) {
		authDao.deleteCode(code);

	}

	@Override
	public void deleteCodeByAuthNum(String me_id) {
		authDao.deleteCodeByAuthNum(me_id);

	}


}