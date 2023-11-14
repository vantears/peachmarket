package kr.ph.peach.service;

import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.MemberDAO;
import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.WishVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public boolean signup(MemberVO member) {
		if (member == null) {
			return false;
		}

		// 아이디 중복 확인
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		// 가입하려는 아이디가 이미 가입된 경우
		if (dbMember != null) {
			return false;
		}
		MemberVO dbMember2 = memberDao.selectMemberByNickName(member.getMe_nick());
		if(dbMember2 != null ) {
			return false;
		}
		MemberVO dbMember3 = memberDao.selectMemberByPhoneNum(member.getMe_phone());
		if(dbMember3 != null ) {
			return false;
		}
		MemberVO dbMember4 = memberDao.selectMemberByAcc(member.getMe_acc());
		if(dbMember4 != null ) {
			return false;
		}
		// 아이디, 비번 null 체크 + 유효성 검사
		// 아이디는 이메일 형식
		String idRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\\-.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
		//비번은 영문,숫자,특수문자로 이루어지고 8~20자 
		String pwRegex = "^[a-zA-Z0-9!@#$%^&*()_+|~]{8,20}$";

		// 아이디가 유효성에 맞지 않으면
		if (!Pattern.matches(idRegex, member.getMe_id())) {
			return false;
		}
		// 비번이 유효성에 맞지 않으면
		if (!Pattern.matches(pwRegex, member.getMe_pw())) {
			return false;
		}

		// 비번 암호화
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		// 회원가입
		return memberDao.insertMember(member);
	}

	@Override
	public MemberVO login(MemberVO member) {
		
		if(!checkIdRegex(member.getMe_id()) || !checkPwRegex(member.getMe_pw())) {
			return null;
		}
		
		//아이디와 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMember(member.getMe_id());
		//아이디와 일치하는 회원 정보가 있고, 비번이 일치하면 
		if(user != null && passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return user;
		}
		
		return null;
	}

	@Override
	public void updateMemberSession(MemberVO user) {
		
		if(user == null || user.getMe_id() == null) {
			return;
		}
		
		memberDao.updateMemberSession(user);
		
	}

	@Override
	public MemberVO getMemberBySession(String session_id) {
		
		return memberDao.selectMemberBySession(session_id);
	}
	
	@Override
	public List<WishVO> getWishList(int me_num) {
		
		return memberDao.getsaleBoardWishList(me_num);
	}

	@Override
	public List<MemberVO> getMemberList(MemberCriteria cri) {
		if(cri == null) {
			cri = new MemberCriteria();
		}
		return memberDao.getMemberList(cri);
	}

	@Override
	public int getTotalCount(MemberCriteria cri) {
		if(cri == null) {
			cri = new MemberCriteria();
		}
		return memberDao.getTotalCount(cri);
	}

	

	@Override
	public boolean updateState(int me_num, int me_st_num) {
		
		return memberDao.updateState(me_num, me_st_num);
	}

	@Override
	public boolean checkId(String id) {
		return memberDao.selectMember(id) == null;
	}

	@Override
	public boolean checkNick(String nick) {
		return memberDao.selectMemberByNickName(nick) == null;
		
	}

	@Override
	public MemberVO getMemberBySessionId(String sId) {
		return memberDao.selectMemberBySessionId(sId);
	}


	@Override
	public List<CityVO> getLargeCity() {
		// TODO Auto-generated method stub
		return memberDao.selectLargeCity();
	}


	@Override
	public List<CityVO> getMediumCity(String large) {
		return memberDao.selectMediumCity(large);
	}


	@Override
	public List<CityVO> getSmall(String medium) {
		return memberDao.selectSmallCity(medium);
	}
	
	@Override
	public List<BankVO> getBank() {
		return  memberDao.selectBank();
	}

	@Override
	public MemberVO getMemberByNumber(int meNum) {
		MemberVO member = memberDao.getMemberByNumber(meNum);
		return member;
	}

	@Override
	public MemberVO selectMemberByPhoneNum(String phone) {
		return memberDao.selectMemberByPhoneNum(phone) ;
	}



	@Override
	public MemberVO selectMemberByAcc(String acc) {
		return memberDao.selectMemberByAcc(acc);
	}


	//-------------아이디 찾기------------
	@Override
	public MemberVO memberIdFind(MemberVO member) {
		return memberDao.memberIdFind(member);
	}



	@Override
	public boolean sendPw(String me_id, String me_name) {
		MemberVO member = memberDao.selectMember(me_id);
		MemberVO member2 = memberDao.selectMemberByName(me_name);
		//아이디(email)를 잘못 입력 
		if(member == null) {
			return false;
		//이름 잘못 입력
		}else if(member2 == null) {
			return false;
		//같으면 
		}else {
			
		
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		
		//인증 코드를 이메일로 전송
		String setfrom = "rlatldbs4042@gmail.com";  
		String tomail = me_id; //받는사람
		String title = "[삼삼하개] 비밀번호변경 인증 이메일 입니다"; 
		String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
				+ "삼삼하개 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
	
			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); 
			messageHelper.setSubject(title);
			messageHelper.setText(content); 
	
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}

			
		
		return true;
		}
	}

	private boolean checkIdRegex(String id) {
		//아이디는 영문,숫자,@._-로 이루어지고 8~20자 
		String regexId = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\\-.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
		
		if(id == null) {
			return false;
		}
		return Pattern.matches(regexId, id);
	}
	private boolean checkPwRegex(String pw) {
		
		//비번은 영문,숫자,특수문자로 이루어지고 8~20자 
		String regexPw = "^[a-zA-Z0-9!@#$%^&*()_+|~]{8,20}$";
		if(pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, pw);
	}

	@Override
	public CityVO selectCity(int me_ci_num) {
		if(me_ci_num == 0) {
			return null;
		}
		return memberDao.selectCity(me_ci_num);
	}
	
}