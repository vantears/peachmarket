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
		// 비번이 유효성에 맞지 않으면
		if (!Pattern.matches(idRegex, member.getMe_id()) || !Pattern.matches(pwRegex, member.getMe_pw())) {
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

		if (user == null || user.getMe_id() == null) {
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

	    // 아이디(email)를 잘못 입력
	    // 이름 잘못 입력
	    if ((member == null) || !member.getMe_name().equals(me_name)) {
	        return false;
	    }

	    Random r = new Random();
	    int num = r.nextInt(999999); // 랜덤난수설정

	    // 이메일 내용을 HTML 형식으로 구성
	    String setfrom = "rlatldbs4042@gmail.com";
	    String tomail = me_id;

	    String title = "[피치마켓] 비밀번호 변경 인증 이메일";
	    String content = "<html>"
	    		 + "<body>"
	             + "<table width='100%' bgcolor='#76076' style='margin: 0; padding: 0; font-family: Arial, sans-serif;'>"
	             + "  <tr>"
	             + "    <td align='center'>"
	             + "      <img src='http://localhost:8080/peach/img/피치.png' style='display: block; margin: 0 auto;'>"
	             + "      <h1 style='text-align: center; color: #ffffff;'>비밀번호 변경</h1>"
	             + "      <p style='text-align: center; color: #ffffff;'>안녕하세요 " + me_name + " 님,</p>"
	             + "      <p style='text-align: center; color: #ffffff;'>비밀번호를 재설정하기 위해 아래 링크를 클릭하세요.</p>"
	             + "      <p style='text-align: center; color: #ffffff;'><a href='http://localhost:8080/peach/member/pw_auth/check?num=" + member.getMe_num() + "&code=" + num + "' style='color: #cee13a; text-decoration: underline;'>비밀번호 변경하기</a></p>"
	             + "    </td>"
	             + "  </tr>"
	             + "</table>"
	             + "</body>"
	             + "</html>";

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

	        messageHelper.setFrom(setfrom);
	        messageHelper.setTo(tomail);
	        messageHelper.setSubject(title);
	        messageHelper.setText(content, true);

	        mailSender.send(message);
	    } catch (Exception e) {
	        return false;
	    }

	    memberDao.insertAuthCode(member.getMe_num(), num);

	    return true;
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

		String regexPw = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+|]).{8,20}$";

		if(pw == null) {
			return false;
		}
		return Pattern.matches(regexPw, pw);
	}

	@Override
	public void addPoints(int me_num, int paidAmount) {
		memberDao.addPoints(me_num, paidAmount);

	}

	@Override
	public MemberVO getMemberById(int me_num) {
		return memberDao.getMemberById(me_num);
	}

	@Override
	public CityVO selectCity(int me_ci_num) {
		if(me_ci_num == 0) {
			return null;
		}
		return memberDao.selectCity(me_ci_num);
	}


	@Override
	public void withdrawMember(MemberVO user) {
		if (user == null || user.getMe_id() == null) {
			return;
		}

		memberDao.deleteMember(user);

	}

	@Override
	public MemberVO kakaologin(String kakaoname) {
		// 아이디와 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMemberID(kakaoname);
		return user;
	}

	@Override
	public boolean signupforkakao(MemberVO member) {
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
		if (dbMember2 != null) {
			return false;
		}
		MemberVO dbMember3 = memberDao.selectMemberByPhoneNum(member.getMe_phone());
		if (dbMember3 != null) {
			return false;
		}
		MemberVO dbMember4 = memberDao.selectMemberByAcc(member.getMe_acc());
		if (dbMember4 != null) {
			return false;
		}
		// 아이디, 비번 null 체크 + 유효성 검사
		// 아이디는 이메일 형식
		String idRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\\-.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$";
		// 비번은 영문,숫자,특수문자로 이루어지고 8~20자
		String pwRegex = "^[a-zA-Z0-9!@#$%^&*()_+|~]{8,20}$";

		// 아이디가 유효성에 맞지 않으면
		// 비번이 유효성에 맞지 않으면
		if (!Pattern.matches(idRegex, member.getMe_id()) || !Pattern.matches(pwRegex, member.getMe_pw())) {
			return false;
		}

		// 비번 암호화
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		// 회원가입
		return memberDao.insertMemberForKakao(member);
	}

	@Override
	public boolean checkcode(String code, int num) {

		return memberDao.checkcode(code,num) != 0;
	}

	@Override
    public boolean updatePassword(String code, String pw) {
		String encPw = passwordEncoder.encode(pw);
        return memberDao.pwUpdate(code, encPw) > 0;
    }

	@Override
	public MemberVO getMemberByCode(String code) {
		return memberDao.getMemberByCode(code);
	}

	@Override
	public boolean checkMeIdAndMeName(String me_id, String me_name) {
	    List<MemberVO> MemberList = getMemberLists(); // 가정: 해당 메서드로 데이터를 가져옴

	    // 반복문을 통해 리스트 내의 객체들을 확인
	    for (MemberVO request : MemberList) {
	        if (request.getMe_id().equals(me_id) && request.getMe_name().equals(me_name)) {

	            return true;
	        }
	    }
	    // 리스트를 모두 확인했지만 해당 데이터가 없는 경우 true 반환
	    return false;
	}

	@Override
	public List<MemberVO> getMemberLists() {
		return memberDao.getMemberLists();
	}

	@Override
	public void addPointHistory(int me_num, int paidAmount) {
		memberDao.addPointHistory(me_num, paidAmount);

	}

	@Override
	public void reducePointHistory(int me_num, int pp_point) {
		memberDao.reducePointHistory(me_num, pp_point);

	}

	@Override
	public void deleteReducePointHistory(int tq_num) {
		memberDao.deleteReducePointHistory(tq_num);

	}

	//-----------------------삭제

	@Override
	public boolean deleteMember(MemberVO member) {
		if(!checkIdRegex(member.getMe_id()) || !checkPwRegex(member.getMe_pw())) {
			return false;
		}

		//아이디와 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMember(member.getMe_id());
		//아이디와 일치하는 회원 정보가 있고, 비번이 일치하면 
		if(user == null || !passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return false;
		}
		if(!user.getMe_phone().equals(member.getMe_phone())) {
			return false;
		}
		return memberDao.deleteMember(member);

	}
	
	

}