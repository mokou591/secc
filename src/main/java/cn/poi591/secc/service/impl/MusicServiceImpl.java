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

	@Override
	public void addMusic(Music music) {
		musicDao.add(music);
	}

	@Override
	public Music findMusicById(Integer id) {
		return musicDao.findById(id);
	}

	/**
	 * 添加一篇音乐评
	 * 
	 * @param musicReview
	 */
	@Override
	public Integer addMusicReview(MusicReview musicReview) {
		return	musicReviewDao.add(musicReview);
	}

	/**
	 * 获取音乐的评分信息
	 * 
	 * @param mainMusic
	 * @return
	 */
	@Override
	public MusicScore getMusicScore(Music music) {
		return musicReviewDao.getMusicScore(music);
	}

	/**
	 * 查询音乐的所有音乐评，返回的集合包含的对象有音乐评信息和作者引用。
	 * 
	 * @param mainMusic
	 * @return 一个 集合
	 */
	@Override
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
	@Override
	public MusicReview getMusicReview(Music music, User user) {
		return musicReviewDao.getMusicReview(music ,user);
	}

	/**
	 * 获取当前音乐的音乐评总数
	 * 
	 * @param music
	 * @return
	 */
	@Override
	public Integer getMusicReviewCount(Music music) {
		return musicReviewDao.getMusicReviewCount(music);
	}

	@Override
	public List<MusicReviewDetail> getMusicReviewDetailLatest(Music music,
			Integer start, Integer offset) {
		return musicReviewDao.getMusicReviewDetailLatest(music, start, offset);
	}

	@Override
	public boolean checkMusicReviewOOXXExist(MusicReview musicReview,
			User loginUser) {
		return musicReviewDao.checkMusicReviewOOXXExist(musicReview, loginUser);
	}

	@Override
	public boolean addMusicReviewOOXX(MusicReview musicReview, User loginUser,
			String type) {
		return musicReviewDao.addMusicReviewOOXX(musicReview, loginUser, type);
	}
	
	@Override
	public MusicReviewDetail findMusicReviewDetailById(Integer reviewId) {
		return musicReviewDao.findMusicReviewDetailById(reviewId);
	}
	
	@Override
	public Music findMusicByOriginalName(String originalName) {
		return musicDao.findByOriginalName(originalName);
	}

	@Override
	public List<Music> findMusicListByGenre(String genre,Integer start,Integer offset) {
		return musicDao.findMusicListByGenre(genre,start ,offset);
	}

	@Override
	public List<Music> findMusicRandom(Integer count) {
		return musicDao.findMusicRandom(count);
	}

	@Override
	public List<MusicReviewDetail> findMusicReviewDetailRandom(Integer count) {
		return musicReviewDao.findMusicReviewDetailRandom(count);
	}
	
	@Override
	public List<ReplyDetail> findReviewReplyDetailNatural(
			MusicReview review,Integer start, Integer offset) {
		return musicReviewDao.findMusicReviewReplyDetailNatural(review,start,offset);
	}

	@Override
	public void addMusicReviewReply(Reply reply) {
		musicReviewDao.addMusicReviewReply(reply);
	}

	@Override
	public MusicReview findMusicReviewById(Integer id) {
		return musicReviewDao.findMusicReviewById(id);
	}

}
