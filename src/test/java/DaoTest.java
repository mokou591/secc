
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import cn.poi591.secc.dao.UserDao;
import cn.poi591.secc.entity.User;

public class DaoTest extends BaseTest {

	@Autowired
	private UserDao userDao;

	@Test
	public void insertUserTest() {
		User user = new User();
		user.setUsername("admin");
		user.setPassword("123");
		userDao.add(user);
	}

	@Test
	public void findUserByUsernameTest() {
		User user = userDao.findByUsername("admin");
		System.out.println(user.getPassword());
	}
}
