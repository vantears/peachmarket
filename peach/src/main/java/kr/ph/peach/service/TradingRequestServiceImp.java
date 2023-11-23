package kr.ph.peach.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.ph.peach.dao.TradingRequestDAO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.TradingRequestVO;

@Service
public class TradingRequestServiceImp implements TradingRequestService{

	String uploadPath = "C:\\Users\\user1\\Documents\\workspace-sts-3.9.1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\peach\\resources\\image";

	@Autowired
	TradingRequestDAO tradingRequestDao;

	@Override
	public List<TradingRequestVO> getTradingRequestList(MemberVO user) {
		return tradingRequestDao.getTradingRequest(user);
	}

	@Override
	public boolean deleteTradingRequest(int tq_num, Model model, HttpSession session) {
		return tradingRequestDao.deleteTradingRequest(tq_num, model, session);
	}


	@Override
	public boolean tradePost(int tq_sb_num, int tq_me_num) {
	    List<TradingRequestVO> tradingRequestList = getTradingRequestList(); // 가정: 해당 메서드로 데이터를 가져옴
	    // 반복문을 통해 리스트 내의 객체들을 확인
	    for (TradingRequestVO request : tradingRequestList) {
	        if (request.getTq_sb_num() == tq_sb_num && request.getTq_me_num() == tq_me_num) {
	            // 두 값이 모두 일치하는 데이터가 리스트에 존재하면 false 반환
	            return false;
	        }
	    }
	    // 리스트를 모두 확인했지만 해당 데이터가 없는 경우 true 반환
	    return tradingRequestDao.tradePost(tq_sb_num, tq_me_num);
	}

	@Override
	public List<TradingRequestVO> getTradingRequestList() {
		return tradingRequestDao.getTradingRequestList();
	}

	@Override
	public void changeTradingState(int tq_num) {
		tradingRequestDao.changeTradingState(tq_num);
	}

	@Override
	public void makingTrading(int tq_num) {
		tradingRequestDao.makingTrading(tq_num);

	}

	@Override
	public List<TradingRequestVO> getTradingRequests(MemberVO user, Integer tq_num) {
		return tradingRequestDao.getTradingNow(user, tq_num);
	}

	@Override
	public void changeTradingCuState(int tq_num) {
		tradingRequestDao.changeTradingCuState(tq_num);
		tradingRequestDao.changeTrTqState(tq_num);
		/* tradingRequestDao.deleteTradingRequest(tq_num); */
	}

	@Override
	public void changeTradingSeState(int tq_num) {
		tradingRequestDao.changeTradingSeState(tq_num);
		tradingRequestDao.changeTrTqState(tq_num);
		/* tradingRequestDao.deleteTradingRequest(tq_num); */
	}

	@Override
	public boolean getTradingRequestPeach(MemberVO user, int sb_num) {
	    List<TradingRequestVO> tradingRequestList = getTradingRequestList(); // 가정: 해당 메서드로 데이터를 가져옴

	    // 반복문을 통해 리스트 내의 객체들을 확인
	    for (TradingRequestVO request : tradingRequestList) {
	        if (request.getTq_sb_num() == sb_num && request.getTq_me_num() == user.getMe_num()) {
	            // 두 값이 모두 일치하는 데이터가 리스트에 존재하면 false 반환
	            return false;
	        }
	    }

	    // 반복문을 모두 확인했는데 일치하는 값이 없으면 다른 처리를 해야할 수 있음
	    tradingRequestDao.getTradingRequestPeach(user, sb_num);

	    // 일치하는 데이터가 없으면 true 반환 또는 다른 값을 반환할 수 있음
	    return true;
	}

	@Override
	public void reducePoint(int me_num, int me_point) {
		tradingRequestDao.reducePoint(me_num, me_point);

	}

	@Override
	public void addPointToCustomer(int tq_num) {
		tradingRequestDao.addPointToCustomer(tq_num);

	}

	@Override
	public void reducePointToCustomer(int tq_num) {
		tradingRequestDao.reducePointToCustomer(tq_num);

	}

	@Override
	public void changeTradingSeStateCancel(int tq_num) {
		tradingRequestDao.changeTradingSeStateCancel(tq_num);

	}

	@Override
	public void changeTradingCuStateCancel(int tq_num) {
		tradingRequestDao.changeTradingCuStateCancel(tq_num);

	}

	@Override
	public TradingRequestVO getTradingRequestThat(int tq_num) {
		return tradingRequestDao.getTradingRequestThat(tq_num);
	}

	@Override
	public List<TradingRequestVO> getTradingRequestsList() {
		return tradingRequestDao.getTradingNowList();
	}


}