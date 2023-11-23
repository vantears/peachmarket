package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.LikesVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

public interface CommunityDAO {

	boolean insertCommunity(@Param("community")CommunityVO community,@Param("user") MemberVO user,@Param("cc_num") int cc_num);

	List<CommunityCategoryVO> selectCCategory();

	boolean insertCCnames(@Param("CCNames")String CCNames,@Param("user") MemberVO user);

	int selectCICategory(@Param("CICategory")String CICategory);

	void insertCommunityImage(@Param("communityImage")CommunityImageVO communityImageVo);

	List<CommunityVO> selectBoardList(@Param("cri")CriteriaCom cri,@Param("user") MemberVO user);

	String selectMeNick(@Param("list")CommunityVO list);

	int selectCountBoardList(@Param("cri")CriteriaCom cri,@Param("user") MemberVO user);

	CommunityVO selectDetail(@Param("co_num")int co_num);

	MemberVO selectWriter(@Param("detail")CommunityVO detail);

	void insertReply(@Param("re_info")String re_info,@Param("co_num") int co_num,@Param("user") MemberVO user);

	List<ReplyVO> selectReply(@Param("co_num")int co_num);

	List<MemberVO> selectRe(@Param("reply")List<ReplyVO> reply);

	String selectReNick(ReplyVO reply);

	CommunityImageVO getCoImg(@Param("co_num")int co_num);

	CommunityCategoryVO selectEditCC(@Param("detail")CommunityVO detail);

	boolean updateCommunity(@Param("community")CommunityVO community,@Param("co_num")int co_num,@Param("cc_num") int cc_num);

	void updateCoView(int co_num);

	void updateReply(int co_num);

	void increaseLikeCount(int coNum);

	void insertLike(@Param("co_num")int coNum,@Param("user") MemberVO user);

	LikesVO selectLkCoNum(@Param("user")MemberVO user ,@Param("coNum") int coNum);

	String getCcName(@Param("list")CommunityVO list);

	void deleteCom(Integer co_num);

	CommunityImageVO selecteditImg(int co_num);

	void updateCommunityImage(@Param("communityImageVo")CommunityImageVO communityImageVo,@Param("co_num") int co_num);

	void deleteCommunityImage(@Param("co_num")int co_num);

	boolean deleteComImg(@Param("co_num")int co_num);

	void replyDelete(Integer re_num);

	List<CommunityCategoryVO> selectCommunityCategotyList();


}