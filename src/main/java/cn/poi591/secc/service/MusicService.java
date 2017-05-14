package cn.poi591.secc.service;

import java.util.List;

import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.dto.MusicScore;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.MusicReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;

public interface MusicService {

	public void addMusic(Music music);

	public Music findMusicById(Integer id);

	/**
	 * 添加一篇音乐评
	 * 
	 * @param musicReview
	 */
	public Integer addMusicReview(MusicReview musicReview);

	/**
	 * 获取音乐的评分信息
	 * 
	 * @param mainMusic
	 * @return
	 */
	public MusicScore getMusicScore(Music music);

	/**
	 * 查询音乐的所有音乐评，返回的集合包含的对象有音乐评信息和作者引用。
	 * 
	 * @param mainMusic
	 * @return 一个 集合
	 */
	public List<MusicReviewDetail> getMusicReviewDetailBest(Music music,
			Integer start, Integer offset);

	/**
	 * 获取用户的一篇音乐评
	 * @param mainMusic 
	 * 
	 * @param loginUser
	 * @return
	 */
	public MusicReview getMusicReview(Music music, User user);

	/**
	 * 获取当前音乐的音乐评总数
	 * 
	 * @param music
	 * @return
	 */
	public Integer getMusicReviewCount(Music music);

	public List<MusicReviewDetail> getMusicReviewDetailLatest(Music music,
			Integer start, Integer offset);

	public boolean checkMusicReviewOOXXExist(MusicReview musicReview,
			User loginUser);

	public boolean addMusicReviewOOXX(MusicReview musicReview, User loginUser,
			String type);

	public MusicReviewDetail findMusicReviewDetailById(Integer reviewId);

	public Music findMusicByOriginalName(String originalName);

	public List<Music> findMusicListByGenre(String genre, Integer start,
			Integer offset);

	public List<Music> findMusicRandom(Integer count);

	public List<MusicReviewDetail> findMusicReviewDetailRandom(Integer count);

	public List<ReplyDetail> findReviewReplyDetailNatural(MusicReview review,
			Integer start, Integer offset);

	public void addMusicReviewReply(Reply reply);

	public MusicReview findMusicReviewById(Integer id);

}