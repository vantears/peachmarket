package kr.ph.peach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.dao.CommunityDAO;
import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.util.UploadFileUtils;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.LikesVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

@Service
public class CommunityServiceImp implements CommunityService{

	@Autowired
	private CommunityDAO communityDao;

	String uploadPath = "C:\\finalImg\\img";

	@Override
	public boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList, int cc_num) {
		if(community == null ||
			community.getCo_title() == null || community.getCo_title().trim().length() == 0 ||
			community.getCo_info() == null) {
			return false;
		}
		//작성자가 없으면 안되기 때문
		if(user == null) {
			return false;
		}

		//게시글을 DB에 저장
		boolean res = communityDao.insertCommunity(community,user , cc_num);
		if(!res) {
			return false;
		}

		//첨부파일 등록
		if(fileList == null || fileList.length == 0) {
			return true;
		}

		for(MultipartFile file : fileList) {
			if(file == null || file.getOriginalFilename().length() == 0) {
				continue;
			}

			try {
				//원래 파일명
				String ci_ori_name = file.getOriginalFilename();
				//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
				String fi_name = UploadFileUtils.uploadFile(uploadPath, ci_ori_name, file.getBytes());
				//파일 객체
				CommunityImageVO CommunityImageVo = new CommunityImageVO(community.getCo_num(), fi_name, ci_ori_name);
				communityDao.insertCommunityImage(CommunityImageVo);
			}catch(Exception e) {
				e.printStackTrace();
			}

		}

		return true;
	}

	@Override
	public List<CommunityCategoryVO> selectCCategory() {
	    List<CommunityCategoryVO> CCategory = communityDao.selectCCategory();
	    return CCategory;
	}

	@Override
	public int selectCIname(String CICategory) {

		int cc_num = communityDao.selectCICategory(CICategory);
		return cc_num;
	}

	@Override
	public List<CommunityVO> getBoardList(CriteriaCom cri,MemberVO user) {
		if(cri == null) {
			cri = new CriteriaCom();
		}

		return communityDao.selectBoardList(cri,user);
	}

	@Override
	public String getMeNick(CommunityVO list) {
		return communityDao.selectMeNick(list);
	}

	@Override
	public int getTotalCount(CriteriaCom cri, MemberVO user) {
			if(cri == null) {
			cri = new CriteriaCom();
		}
		return communityDao.selectCountBoardList(cri, user);
	}

	@Override
	public CommunityVO selectDetail(int co_num) {
		CommunityVO detail = communityDao.selectDetail(co_num);
		return detail;
	}

	@Override
	public MemberVO selectWriter(CommunityVO detail) {
		MemberVO Writer = communityDao.selectWriter(detail);
		return Writer;
	}

	@Override
	public void insertReply(String re_info, int co_num, MemberVO user) {
		communityDao.insertReply(re_info,co_num, user);
	}

	@Override
	public List<ReplyVO> selectReply(int co_num) {
	    return communityDao.selectReply(co_num);

	}

	@Override
	public String getReNick(ReplyVO reply) {
		return communityDao.selectReNick(reply);
	}

	@Override
	public CommunityImageVO getCoImg(int co_num) {
		CommunityImageVO coImage = communityDao.getCoImg(co_num);
		return coImage;
	}

	@Override
	public CommunityCategoryVO selectEditCC(CommunityVO detail) {
		return communityDao.selectEditCC(detail);
	}

	@Override
	public boolean updateCommunity(CommunityVO community, int co_num, MultipartFile[] fileList, int cc_num, MemberVO user, String editImg) {
		if(community == null ||
				community.getCo_title() == null || community.getCo_title().trim().length() == 0 ||
				community.getCo_info() == null) {
				return false;
			}
			//작성자가 없으면 안되기 때문
			if(user == null) {
				return false;
			}
			//community는 co_title
			//게시글을 DB에 저장
			boolean res = communityDao.updateCommunity(community,co_num , cc_num);
			if(!res) {
				return false;
			}

			//첨부파일 등록
			if(fileList == null || fileList.length == 0) {
				return true;
			}
			//editImg가 이미 있으면 수정
			if(!editImg.isEmpty()) {
				for(MultipartFile file : fileList) {
					if(file == null || file.getOriginalFilename().length() == 0) {
						continue;
					}

					try {
						//원래 파일명
						String ci_ori_name = file.getOriginalFilename();
						//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
						String fi_name = UploadFileUtils.uploadFile(uploadPath, ci_ori_name, file.getBytes());
						//파일 객체
						CommunityImageVO CommunityImageVo = new CommunityImageVO(community.getCo_num(), fi_name, ci_ori_name);
						communityDao.updateCommunityImage(CommunityImageVo, co_num);
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			}else {
				for(MultipartFile file : fileList) {
					if(file == null || file.getOriginalFilename().length() == 0) {
						continue;
					}

					try {
						//원래 파일명
						String ci_ori_name = file.getOriginalFilename();
						//서버에 업로드 후 업로드된 경로와 uuid가 포함된 파일명
						String fi_name = UploadFileUtils.uploadFile(uploadPath, ci_ori_name, file.getBytes());
						//파일 객체
						CommunityImageVO CommunityImageVo = new CommunityImageVO(community.getCo_num(), fi_name, ci_ori_name);
						communityDao.insertCommunityImage(CommunityImageVo);
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
			return true;



		}

	@Override
	public void updateCoView(int co_num) {
		communityDao.updateCoView(co_num);
	}

	@Override
	public void updateReply(int co_num) {
		communityDao.updateReply(co_num);
	}

	@Override
	public void increaseLikeCount(int coNum) {
		communityDao.increaseLikeCount(coNum);

	}

	@Override
	public void insertLike(int coNum, MemberVO user) {
		communityDao.insertLike(coNum, user);
	}

	@Override
	public LikesVO selectLkCoNum(MemberVO user, int coNum) {
		LikesVO lk_co_num = communityDao.selectLkCoNum(user, coNum);
		return lk_co_num;
	}

	@Override
	public String getCcName(CommunityVO list) {
		return communityDao.getCcName(list);
	}

	@Override
	public boolean deleteCOM(Integer co_num) {
		if(co_num == null) {
			return false;
		}else {

		//게시글 삭제
		communityDao.deleteCom(co_num);}
		return true;
	}

	@Override
	public CommunityImageVO selecteditImg(int co_num) {
		CommunityImageVO editImg = communityDao.selecteditImg(co_num);
		return editImg;
	}

	@Override
	public boolean deleteComImg(int co_num) {

		return communityDao.deleteComImg(co_num);
	}

	@Override
	public boolean replyDelete(Integer re_num) {
		if(re_num == null) {
			return false;
		}else {

		//게시글 삭제
		communityDao.replyDelete(re_num);}
		return true;
	}

	@Override
	public List<CommunityCategoryVO> getCategoryList() {
		return communityDao.selectCommunityCategotyList();
	}





}
	
	
	
	
	
	
	
	
	
	
