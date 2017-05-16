package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.Book;
import cn.poi591.secc.entity.Music;

public interface MusicDao {

	/**
	 * 向数据库添加新的音乐
	 * @param music
	 */
	void add(Music music);

	
	/**
	 * 根据id查找音乐
	 * @param id
	 * @return
	 */
	Music findById(Integer id);
	
	/**
	 * 根据影片原名查找音乐
	 * @param originalName
	 * @return
	 */
	Music findByOriginalName(String originalName);

	/**
	 * 根据类型查找音乐
	 * @param genre
	 * @return
	 */
	List<Music> findMusicListByGenre(@Param("genre") String genre,@Param("start") Integer start,@Param("offset") Integer offset);


	List<Music> findMusicRandom(@Param("count")Integer count);


	List<Music> findByStatus(@Param("status")String status, @Param("start") Integer start,@Param("offset") Integer offset);

	void replaceMusicStatus(@Param("musicId")Integer musicId ,@Param("oldStr")String oldStr, @Param("newStr")String newStr);


	void deleteMusicById(Integer musicId);
}
