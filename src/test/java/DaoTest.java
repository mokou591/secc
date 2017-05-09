import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.poi591.secc.dao.FilmDao;
import cn.poi591.secc.dao.FilmReviewDao;
import cn.poi591.secc.dao.UserDao;
import cn.poi591.secc.dto.FilmReviewDetail;
import cn.poi591.secc.entity.Film;
import cn.poi591.secc.entity.FilmReview;
import cn.poi591.secc.entity.User;

public class DaoTest extends BaseTest {

	@Autowired
	private UserDao userDao;

	@Autowired
	private FilmReviewDao filmReviewDao;
	
	@Autowired
	private FilmDao filmDao;

	/**
	 * 测试影评和用户的关联查询
	 */
	@Test
	public void findReviewAndUser() {
		Film film = new Film();
		film.setId(5);
		List<FilmReviewDetail> list = filmReviewDao.getFilmReviewDetailBest(film, 0, 20);
		for (FilmReviewDetail filmReviewDetail : list) {
			System.out.println(filmReviewDetail.getUser().getNickname());
		}
	}

	/**
	 * 根据电影查找影评
	 */
	@Test
	public void findReviewByFilm() {
		Film film = new Film();
		film.setId(5);
		List<FilmReview> list = filmReviewDao.findFilmReviewByFilm(film);
		System.out.println(Arrays.toString(list.toArray()));
	}

	@Test
	public void insertUserTest() {
		User user = new User();
		user.setUsername("admin");
		user.setPassword("123");
		user.setNickname("alice");
		userDao.add(user);
	}

	@Test
	public void findUserByUsernameTest() {
		User user = userDao.findByUsername("123");
		System.out.println(user);
	}

	@Test
	public void findUserByIdTest() {
		System.out.println(userDao);
		User user = userDao.findById(3);
		System.out.println(user);
	}

}
