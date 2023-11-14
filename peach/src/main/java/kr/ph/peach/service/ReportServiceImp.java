package kr.ph.peach.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ph.peach.dao.ReportDAO;
import kr.ph.peach.vo.ReportVO;
@Service
public class ReportServiceImp implements ReportService {

	@Autowired
	ReportDAO reportDao;

	@Override
	public boolean insertReport(ReportVO reportVo) {
		if(reportVo == null) {
			return false;
		}
		LocalDateTime now = LocalDateTime.now();
		String formattedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		reportVo.setDate(formattedNow);
		reportDao.insertReport(reportVo);
		return true;
	}

}
