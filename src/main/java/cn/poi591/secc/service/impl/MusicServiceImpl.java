package cn.poi591.secc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.poi591.secc.dao.MusicDao;
import cn.poi591.secc.dao.MusicReviewDao;
import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.dto.MusicScore;
import cn.poi591.secc.dto.ReplyDetail;
import cn.poi591.secc.entity.Music;
import cn.poi591.secc.entity.MusicReview;
import cn.poi591.secc.entity.Reply;
import cn.poi591.secc.entity.User;
import cn.poi591.secc.service.MusicService;

@Service
public class MusicServiceImpl implements  MusicService {

	@Autowired
	private MusicDao musicDao;

	@Autowired
	private MusicReviewDao musicReviewDao;

	public void addMusic(Music music) {
		musicDao.add(music);
	}

	public Music findMusicById(Integer id) {
		return musicDao.findById(id);
	}

	/**
	 * 添加一篇音乐评
	 * 
	 * @param musicReview
	 */
	public Integer addMusicReview(MusicReview musicReview) {
		return	musicReviewDao.add(musicReview);
	}

	/**
	 * 获取音乐的评分信息
	 * 
	 * @param mainMusic
	 * @return
	 */
	public MusicScore getMusicScore(Music music) {
		return musicReviewDao.getMusicScore(music);
	}

	/**
	 * 查询音乐的所有音乐评，返回的集合包含的对象有音乐评信息和作者引用。
	 * 
	 * @param mainMusic
	 * @return 一个 集合
	 */
	public List<MusicReviewDetail> getMusicReviewDetailBest(Music music,Integer start,Integer offset) {
		return musicReviewDao.getMusicReviewDetailBest(music,start,offset);
	}

	/**
	 * 获取用户的一篇音乐评
	 * @param mainMusic 
	 * 
	 * @param loginUser
	 * @return
	 */
	public MusicReview getMusicReview(Music music, User user) {
		return musicReviewDao.getMusicReview(music ,user);
	}

	/**
	 * 获取当前音乐的音乐评总数
	 * 
	 * @param music
	 * @return
	 */
	public Integer getMusicReviewCount(Music music) {
		return musicReviewDao.getMusicReviewCount(music);
	}

	public List<MusicReviewDetail> getMusicReviewDetailLatest(Music music,
			Integer start, Integer offset) {
		return musicReviewDao.getMusicReviewDetailLatest(music, start, offset);
	}

	public boolean checkMusicReviewOOXXExist(MusicReview musicReview,
			User loginUser) {
		return musicReviewDao.checkMusicReviewOOXXExist(musicReview, loginUser);
	}

	public boolean addMusicReviewOOXX(MusicReview musicReview, User loginUser,
			String type) {
		return musicReviewDao.addMusicReviewOOXX(musicReview, loginUser, type);
	}
	
	public MusicReviewDetail findMusicReviewDetailById(Integer reviewId) {
		return musicReviewDao.findMusicReviewDetailById(reviewId);
	}
	
	public Music findMusicByOriginalName(String originalName) {
		return musicDao.findByOriginalName(originalName);
	}

	public List<Music> findMusicListByGenre(String genre,Integer start,Integer offset) {
		return musicDao.findMusicListByGenre(genre,start ,offset);
	}

	public List<Music> findMusicRandom(Integer count) {
		return musicDao.findMusicRandom(count);
	}

	public List<MusicReviewDetail> findMusicReviewDetailRandom(Integer count) {
		return musicReviewDao.findMusicReviewDetailRandom(count);
	}
	
	public List<ReplyDetail> findReviewReplyDetailNatural(
			MusicReview review,Integer start, Integer offset) {
		return musicReviewDao.findMusicReviewReplyDetailNatural(review,start,offset);
	}

	public void addMusicReviewReply(Reply reply) {
		musicReviewDao.addMusicReviewReply(reply);
	}

	public MusicReview findMusicReviewById(Integer id) {
		return musicReviewDao.findMusicReviewById(id);
	}

}
