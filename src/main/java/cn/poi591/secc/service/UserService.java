package cn.poi591.secc.service;

import java.io.IOException;
import java.util.List;

import cn.poi591.secc.dto.ActivityNoteDetail;
import cn.poi591.secc.dto.BookReviewDetail;
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.dto.MusicReviewDetail;
import cn.poi591.secc.entity.User;

public interface UserService {

	public User login(String username, String password);

	public boolean register(User regUser);

	public User findByUsername(String username);

	public User findById(Integer id);

	public boolean updateProfile(User user);

	/**
	 * 使用网页提交的图像字符串更新用户头像文件和数据库字段。
	 * @param user 用户
	 * @param imgStr 网页提交的图像字符串
	 * @param path 保存目录(末尾没有文件分隔符)
	 * @return
	 * @throws IOException
	 */
	public User updateAvatar(User user, String imgStr, String path)
			throws IOException;


	public String findUserAuthority(User user);

	public List<FilmReviewDetail> findFilmReviewDetailByUser(User user, Integer start, Integer offset);

	public List<MusicReviewDetail> findMusicReviewDetailByUser(User user, Integer start, Integer offset);

	public List<BookReviewDetail> findBookReviewDetailByUser(User user, Integer start, Integer offset);

	public List<ActivityNoteDetail> findActivityNoteDetailByUser(User user, Integer start, Integer offset);

}