package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.dto.MusicScore;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.dto.Vote;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.MusicReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;

public interface MusicReviewDao {

	/**
	 * 根据id查找音乐评
	 * @param reviewId
	 * @return
	 */
	MusicReview findMusicReviewById(Integer id);	
	
	/**
	 * 向数据库添加一篇音乐评
	 * 
	 * @param musicReview
	 */
	Integer add(MusicReview musicReview);

	/**
	 * 查出音乐的评分信息
	 * 
	 * @param music
	 * @return
	 */
	MusicScore getMusicScore(Music music);


	/**
	 * 查找指定音乐的所有音乐评
	 */
	List<MusicReview> findMusicReviewByMusic(Music music);

	/**
	 * 找到音乐评的作者。 根据音乐评找到用户。
	 * 
	 * @return
	 */
	User findUserByMusicReview(MusicReview review);

	/**
	 * 根据音乐和作者找到一篇音乐评
	 * 
	 * @param loginUser
	 * @return
	 */
	MusicReview getMusicReview(@Param("music") Music music,@Param("user") User user);

	/**
	 * 获取当前音乐的音乐评总数
	 * 
	 * @param music
	 * @return
	 */
	Integer getMusicReviewCount(Music music);

	/**
	 * 根据音乐查询音乐评，根据时间从新到旧排序，需要设置起始位置和查询项数。
	 * 
	 * @return
	 */
	List<MusicReviewDetail> getMusicReviewDetailLatest(
			@Param("music") Music music, @Param("start") Integer start,
			@Param("offset") Integer offset);

	/**
	 * 获取当前音乐的最好音乐评，需要设置起始位置和查询项数
	 * 
	 * @return
	 */
	List<MusicReviewDetail> getMusicReviewDetailBest(
			@Param("music") Music music, @Param("start") Integer start,
			@Param("offset") Integer offset);
	
	/**
	 * 检查用户是否已经评论过音乐评
	 * 
	 * @param musicReview
	 * @param loginUser
	 * @return
	 */
	boolean checkMusicReviewOOXXExist(
			@Param("musicReview") MusicReview musicReview,
			@Param("user") User loginUser);

	/**
	 * 添加一个音乐评被用户评价的关系
	 * @param musicReview
	 * @param loginUser
	 * @param type
	 * @return
	 */
	boolean addMusicReviewOOXX(@Param("musicReview") MusicReview musicReview,
			@Param("user") User loginUser, @Param("type") String type);

	/**
	 * 根据音乐id获取用户投票
	 * @param musicId
	 * @return
	 */
	Vote getVoteByMusicReviewId(@Param("musicReviewId") Integer musicReviewId);

	/**
	 * 根据音乐评id查询详细音乐评数据
	 * @param reviewId
	 * @return
	 */
	MusicReviewDetail findMusicReviewDetailById(Integer reviewId);
	
	/**
	 * 随机查询出若干音乐评
	 * @param count
	 * @return
	 */
	List<MusicReviewDetail> findMusicReviewDetailRandom(Integer count);

	/**
	 * 查询音乐评回复
	 * @param review
	 * @param start
	 * @param offset
	 * @return
	 */
	List<ReplyDetail> findMusicReviewReplyDetailNatural(@Param("review")MusicReview review,
			@Param("start")Integer start,@Param("offset") Integer offset);

	void addMusicReviewReply(Reply reply);

	List<MusicReviewDetail> findMusicReviewDetailByUser(@Param("user")User user, @Param("start") Integer start,@Param("offset") Integer offset);

	

}
