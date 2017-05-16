package cn.poi591.secc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.poi591.secc.entity.Book;

public interface BookDao {

	/**
	 * 向数据库添加新的书
	 * @param book
	 */
	void add(Book book);

	
	/**
	 * 根据id查找书
	 * @param id
	 * @return
	 */
	Book findById(Integer id);
	
	/**
	 * 根据影片原名查找书
	 * @param originalName
	 * @return
	 */
	Book findByOriginalName(String originalName);

	/**
	 * 根据类型查找书
	 * @param genre
	 * @return
	 */
	List<Book> findBookListByGenre(@Param("genre") String genre,@Param("start") Integer start,@Param("offset") Integer offset);


	List<Book> findBookRandom(@Param("count")Integer count);


	List<Book> findByStatus(@Param("status")String status, @Param("start") Integer start,@Param("offset") Integer offset);
	
	void replaceBookStatus(@Param("bookId")Integer bookId ,@Param("oldStr")String oldStr, @Param("newStr")String newStr);

	void deleteBookById(Integer bookId);
}
